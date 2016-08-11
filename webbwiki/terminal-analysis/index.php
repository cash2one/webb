<?php
error_reporting(E_ERROR);

defined('BASE_DIR') or define('BASE_DIR', dirname(__FILE__));
defined('LIB_DIR') or define('LIB_DIR', BASE_DIR . '/library');
defined('DATA_DIR') or define('DATA_DIR', BASE_DIR . '/data_ua');
defined('TPL_DIR') or define('TPL_DIR', BASE_DIR . '/template');
require_once LIB_DIR . '/functions.php';

// 更新当月均值数据
list($y, $m, $d) = explode("/", date("Y/m/d"));
$file = month_average_file($y, $m);
if (!file_exists($file) || date("Ymd", filemtime($file))!==$y.$m.$d) {
    // 计算月平均值，并写入本地存储
    calculate_month_average();
}

$tpl_name = http_params('tpl') ? http_params('tpl') : 'index';
$category = http_params('category') ? http_params('category') : 'browser';

require_once TPL_DIR . '/header.tpl';
require_once TPL_DIR . '/' . $tpl_name . '.tpl';
require_once TPL_DIR . '/footer.tpl';
?>
