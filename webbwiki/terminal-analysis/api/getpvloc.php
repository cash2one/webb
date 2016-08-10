<?php
defined('BASE_DIR') or define('BASE_DIR', dirname(dirname(__FILE__)));
defined('LIB_DIR') or define('LIB_DIR', BASE_DIR . '/library');
defined('DATA_DIR') or define('DATA_DIR', BASE_DIR . '/data_loc_ua');
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
        $json_data["data"] = $json;
        $json_data["date"] = $y . "/" . $m . "/" . $d;
        $json_data['status'] = true;
    }
}

header("Content-Type: application/javascript");
echo json_encode($json_data);
?>
