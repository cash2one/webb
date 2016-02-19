<?php
/**
* @file route.php
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-10-16 19:45:58
* @brief
*
**/
define('ROOT_PATH', dirname(__FILE__));
require_once(ROOT_PATH.'/config/conf.php');
// echo $_SERVER['REQUEST_URI'];
$mapper = new UrlMap($_SERVER['REQUEST_URI']);
$output = $mapper->process();
print $output;
?>
