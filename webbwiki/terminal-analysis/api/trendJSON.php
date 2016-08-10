<?php
defined('BASE_DIR') or define('BASE_DIR', dirname(dirname(__FILE__)));
defined('LIB_DIR') or define('LIB_DIR', BASE_DIR . '/library');
defined('DATA_DIR') or define('DATA_DIR', BASE_DIR . '/data');
require_once LIB_DIR . '/functions.php';
header("Content-Type: application/javascript");

$params = http_params();
$cate   = $params['category'];
$name   = $params['name'];
$ver    = $params['ver'];
$start  = $params['start'];
$end    = $params['end'];

/**
 * @desc 线形图单条数据
 * @param $start string 起始日期
 * @param $end string 终止日期
 * @param $cate string 主分类
 * @param $name sting 具体分类
 * @param $ver (optional) string 具体版本号
 * @return string JSON字符串
 */
function line_chart_single_data($start, $end, $cate, $name, $ver='') {
    $json_data = array(
        "status" => false, 
        "xAxis"  => array(), 
        "series" => array(
            array(
                'name' => $name, 
                'data' => array()
            )
        )
    );

    date_default_timezone_set("Asia/Hong_Kong");
    $start     = new DateTime($start);
    $end       = new DateTime($end);
    $interval  = new DateInterval('P1D');
    $daterange = new DatePeriod($start, $interval ,$end);

    foreach($daterange as $date){
        list($y, $m, $d) = explode("/", $date->format("Y/m/d"));
        $file = DATA_DIR . '/' . $y . '/'  . $m . '/' . $y . $m . $d;

        if (is_file($file) && ($json=json_decode(file_get_contents($file), true))) {
            if (!isset($json[$cate])) {
                break;
            }
            
            $json_data['xAxis'][] = $y . '/' . $m . '/' . $d;
            $json_data['status'] = true;

            if (!isset($json[$cate][$name])) {
                $json_data['series'][0]['data'][] = 0;
                continue;
            }

            if (strlen($ver)) { // 具体版本号的占比趋势
                if (isset($json[$cate][$name][$ver])) {
                    $json_data['series'][0]['data'][] = round($json[$cate][$name][$ver]['share']*100, 2);
                } else {
                    $json_data['series'][0]['data'][] = 0;
                }
            } else {  // 具体分类的占比趋势
                $json_data['series'][0]['data'][] = round($json[$cate][$name]['share']*100, 2);
            }
        }
    }

    return $json_data;
}


/**
 * @desc 线形图多条数据
 * @param $start string 起始日期
 * @param $end string 终止日期
 * @param $cate string 主分类
 * @param $name (optional) sting 具体分类
 * @return string JSON字符串
 */
function line_chart_multi_data($start, $end, $cate, $name='') {
    $json_data = array(
        "status" => false, 
        "xAxis"  => array(), 
        "series" => array(
            //array(
            //    'name' => $name, 
            //    'data' => array()
            //)
        )
    );
    $series = array();

    date_default_timezone_set("Asia/Hong_Kong");
    $start     = new DateTime($start);
    $end       = new DateTime($end);
    $interval  = new DateInterval('P1D');
    $daterange = new DatePeriod($start, $interval ,$end);

    foreach($daterange as $date){
        list($y, $m, $d) = explode("/", $date->format("Y/m/d"));
        $file = DATA_DIR . '/' . $y . '/'  . $m . '/' . $y . $m . $d;

        if (is_file($file) && ($json=json_decode(file_get_contents($file), true))) {
            if (!isset($json[$cate])) {
                break;
            }            
            $json_data['xAxis'][] = $y . '/' . $m . '/' . $d;
            $json_data['status']  = true;

            if (empty($name)) {
                foreach ($json[$cate] as $key => $value) {
                    if ($key==='total' || $key==='share' || $key==='count') {
                        continue;
                    }

                    if (isset($series[$key])) {
                        $series[$key]['data'][] = round($value['share']*100, 2);
                    } else {
                        $series[$key] = array(
                            'name'=> $key,
                            'data'=> array(round($value['share']*100, 2))
                        );
                    }
                }                
            } elseif (isset($json[$cate][$name])) {
                foreach ($json[$cate][$name] as $ver => $value) {
                    if ($ver==='total' || $ver==='share' || $ver==='count') {
                        continue;
                    }

                    if (isset($series[$ver])) {
                        $series[$ver]['data'][] = round($value['share']*100, 2);
                    } else {
                        $series[$ver] = array(
                            'name'=> $ver,
                            'data'=> array(round($value['share']*100, 2))
                        );
                    }
                }
            }
        }
    }

    $length = count($json_data['xAxis']);
    foreach ($series as $key => $value) {
        if (count($value['data']) === $length) {
            $json_data['series'][] = $value;
        }        
    }
    return $json_data;
}


if (empty($name) && empty($ver)) {
    echo json_encode(line_chart_multi_data($start, $end, $cate));
} elseif ($name && empty($ver)) {
    echo json_encode(line_chart_multi_data($start, $end, $cate, $name));
} elseif ($name && $ver) {
    echo json_encode(line_chart_single_data($start, $end, $cate, $name, $ver));
}
?>
