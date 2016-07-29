<?php
defined('BASE_DIR') or define('BASE_DIR', dirname(dirname(__FILE__)));
defined('LIB_DIR') or define('LIB_DIR', BASE_DIR . '/library');
defined('DATA_DIR') or define('DATA_DIR', BASE_DIR . '/data');
require_once LIB_DIR . '/functions.php';

$date = http_params('date');

$json_data = array(
    "status" => false, 
    "date"   => $date, 
    "data"   => array()
);

// 获取指定日期的数据
if ($date && strlen($date) == 8) {
    $y = substr($date, 0, 4);
    $m = substr($date, 4, 2);
    $d = substr($date, 6, 2);
    $file = DATA_DIR . '/' . $y . '/'  . $m . '/' . $date;
    if (is_file($file) and ($json=json_decode(file_get_contents($file), true))) {
        $json_data["data"]["day"] = $json;
        $json_data["date"] = $y . "/" . $m . "/" . $d;
        $json_data['status'] = true;

        // 指定日期所属月份的平均值
        $average_file = month_average_file($y, $m);
        if (is_file($average_file) && ($json=json_decode(file_get_contents($average_file), true))) {
            $json_data["data"]["month"] = $json;
        }

        // 指定日期上一月份的平均值
        if (intval($m)===1) {
            $m = "12";
            $y = strval(intval($y)-1);
        } else {
            $m = intval($m)-1;
            $m = $m < 10 ? "0".$m : $m;
        }
        $average_file = month_average_file($y, $m);
        if (is_file($average_file) && ($json=json_decode(file_get_contents($average_file), true))) {
            $json_data["data"]["lastMon"] = $json;
        }
    }
}

header("Content-Type: application/javascript");
echo json_encode($json_data);
?>