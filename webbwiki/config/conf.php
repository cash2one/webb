<?php
date_default_timezone_set('Asia/Shanghai');
define('LIB_PATH', ROOT_PATH.'/libs');
define('APP_PATH', ROOT_PATH.'/app');
ini_set('include_path', ini_get('include_path').':'.LIB_PATH.':'.APP_PATH);
require_once(ROOT_PATH.'/config/classpath.php');
require_once(ROOT_PATH.'/urls.php');

define('LOG_PATH', ROOT_PATH.'/log/');
define('LOG_ID', ''.time().mt_rand(1000, 10000));
//Logger::open(LOG_PATH);
//Logger::setLevel(PLogger::ERROR);
