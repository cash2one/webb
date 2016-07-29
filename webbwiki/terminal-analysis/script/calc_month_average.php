<?php
defined('BASE_DIR') or define('BASE_DIR', dirname(dirname(__FILE__)));
defined('LIB_DIR') or define('LIB_DIR', BASE_DIR . '/library');
require_once LIB_DIR . '/functions.php';

// 计算月平均值，并写入本地存储
echo calculate_month_average(http_params('year'), http_params('month'));
?>
