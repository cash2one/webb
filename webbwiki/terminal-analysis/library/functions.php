<?php
defined('BASE_DIR') or define('BASE_DIR', dirname(dirname(__FILE__)));
defined('LIB_DIR') or define('LIB_DIR', BASE_DIR . '/library');
defined('DATA_DIR') or define('DATA_DIR', BASE_DIR . '/data_ua');
defined('TPL_DIR') or define('TPL_DIR', BASE_DIR . '/template');
defined('PVLOC_DIR') or define('PVLOC_DIR', BASE_DIR . '/data_loc');
/**
 * 获取请求参数，来源：$_GET，$_POST, $_COOKIE
 *
 * @param string $key (optional) - 参数名称
 * @return array|string - 若$key值不为空，返回$key参数对应的值; 若$key值为空，返回整个请求参数列表
 */
function http_params($key='') {
    if (!isset($GLOBALS['gpc'])) {
        $GLOBALS['gpc'] = array_merge($_GET, $_POST, $_COOKIE);
    }
    if (is_string($key) && strlen($key)) {
        return isset($GLOBALS['gpc'][$key]) ? $GLOBALS['gpc'][$key] : NULL;
    }
    return $GLOBALS['gpc'];
}

/**
 * 若指定$y, $m参数，获取指定日期对应的数据存放路径,
 * 若$y, $m为空，获取最近一个月的数据存放路径.
 *
 * @param  string $y (optional) - 指定年份
 * @param  string $m (optional) - 指定月份
 * @return string - 存放指定日期对应数据的文件夹路径
 */
function last_month_path($y='', $m='') {
    if ($y && $m) { // 获取指定日期的数据存放路径
        $path = DATA_DIR . "/" . $y . "/" . $m;
        if (file_exists($path)) {
            return $path;
        }
        return NULL;
    }

    list($y, $m) = explode("/", date("Y/m")); // 获取最近一个月的数据存放路径
    $path = DATA_DIR . "/" . $y . "/" . $m;
    if (file_exists($path)) {
        return $path;
    }

    list($y, $m) = explode("/", date("Y/m", strtotime("last month")));// 若Hadoop延迟，则返回上一个月的数据存放路径
    return DATA_DIR . "/" . $y . "/" . $m;
}

/**
 * 获取存储月平均值的文件路径
 *
 * @param  string $y - 指定年份
 * @param  string $m - 指定月份
 * @return string - 月平均值的文件路径
 */
function month_average_file($y, $m) {
    return DATA_DIR . "/" . $y . "/" . $m . "/" . $y . $m . "_average";
}

/**
 * 判断文件是否为存储月平均值的文件
 *
 * @param  string $filename - 文件名称
 * @return boolean - true: 该文件存储月均值，false: 文件存储单日数据
 */
function is_average_file($filename) {
    return strpos($filename, "_average") !== false;
}

/**
 * 计算月平均值，并存储到本地文件.
 * 若指定日期，则计算日期对应的月份均值，若没有指定日期，计算最近一月的均值
 *
 * @param  string $y (optional) - 指定年份
 * @param  string $m (optional) - 指定月份
 * @return integer - 均值文件的大小，false表明写入操作失败
 */
function calculate_month_average ($y='', $m='') {
    $path = last_month_path($y, $m);
    $json_list = array();

    if (!is_dir($path)) {
        return false;
    }

    if ($dh = opendir($path)) {
        while (($file = readdir($dh)) !== false) {
            if (is_average_file($file)) {
                continue;
            }

            $file = $path . "/" . $file;
            if (is_file($file) && ($json = json_decode(file_get_contents($file), true))) {
                $json_list[] = $json;
            }            
        }
        closedir($dh);
    }

    $length = count($json_list);
    if ($length === 0) {
        return false;
    }

    $ret = $json_list[0];

    foreach ($ret as $category => &$category_list) {
        if ($length===1) { // 只有一条数据，不需要求平均值
            break;
        }

        if ($category === "total") { // 全量pv数
            continue;
        }

        foreach ($category_list as $name => &$versions) {
            $sum = $versions['share']; // 当前分类的全量占比            
            $ave_count = 1;            // 当前分类本月截止目前出现天数

            for ($i=1; $i < $length; $i++) {
                if (isset($json_list[$i][$category][$name])) {
                    $sum += $json_list[$i][$category][$name]['share'];
                    $ave_count += 1;
                }
            }

            $versions['share'] = round($sum/$ave_count, 4); // 当前分类月平均值

            // 分类具体版本号月占比均值
            foreach ($versions as $ver => &$value) { 
                if ($ver === "total" || $ver === "share" || $ver === 'count') {
                    continue;
                }

                $sum = $value['share']; // 当前版本占比            
                $ave_count = 1;         // 当前版本本月截止目前出现天数

                for ($i=1; $i < $length; $i++) {
                    if (isset($json_list[$i][$category][$name][$ver])) {
                        $sum += $json_list[$i][$category][$name][$ver]['share'];
                        $ave_count += 1;
                    }
                }

                $value['share'] = round($sum/$ave_count, 4); // 当前版本月平均值
            }
        }
    }

    list($y, $m) = array_slice(explode("/", $path), -2);
    return file_put_contents(month_average_file($y, $m), json_encode($ret));
}

/**
 * 获取最近一天的统计数据，首页展现
 *
 * @return array - 首页展现的JSON数据
 */
function last_day_JSON() {
    $json_data = array(
        "status" => false, 
        "date"   => date('Y/m/d', strtotime('-1 days')), 
        "data"   => array()
    );

    for ($i=1; $i <= 50; $i++) { // 考虑到Hadoop计算的延迟，最多反推50天
        list($y, $m, $d) = explode("/", date('Y/m/d', strtotime('-' . $i .' days')));
        $file = DATA_DIR . '/' . $y . '/'  . $m . '/' . $y . $m . $d;
        if (is_file($file) && ($json=json_decode(file_get_contents($file), true))) {
            $json_data["data"]["day"] = $json;
            $json_data["date"] = $y . "/" . $m . "/" . $d;
            $json_data['status'] = true;

            // 当前日期所属月份均值
            $curr_month_file = month_average_file($y, $m);
            if (is_file($curr_month_file) && ($json=json_decode(file_get_contents($curr_month_file), true))) {                
                $json_data["data"]["month"] = $json;
            }

            // 当前日期上一月份均值
            if (intval($m)===1) {
                $m = "12";
                $y = strval(intval($y)-1);
            } else {
                $m = intval($m)-1;
                $m = $m < 10 ? "0".$m : strval($m);
            }
            $pre_month_file = month_average_file($y, $m);
            if (is_file($pre_month_file) && ($json=json_decode(file_get_contents($pre_month_file), true))) {
                $json_data["data"]["lastMon"] = $json;
            }
            break;
        }
    }
    return $json_data;
}

function last_day_pvloc_JSON() {
    $json_data = array(
        "status" => false, 
        "date"   => date('Y/m/d', strtotime('-1 days')), 
        "data"   => array()
    );

    for ($i=1; $i <= 50; $i++) { // 考虑到Hadoop计算的延迟，最多反推50天
        list($y, $m, $d) = explode("/", date('Y/m/d', strtotime('-' . $i .' days')));
        $file = PVLOC_DIR . '/' . $y . '/'  . $m . '/' . $y . $m . $d;
        if (is_file($file) && ($json=json_decode(file_get_contents($file), true))) {
            $json_data["data"] = $json;
            $json_data["date"] = $y . "/" . $m . "/" . $d;
            $json_data['status'] = true;
            break;
        }
    }
    return $json_data;
}
?>
