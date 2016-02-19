<?php
/**
* @file ../config/classpath.php
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-10-17 15:37:04
* @brief
*
**/
if(!defined('ROOT_PATH')){
    define("ROOT_PATH", dirname(dirname(__FILE__)));
}

spl_autoload_register(function ($classname){
    $file = str_replace('\\', '/', $classname);
    $file .= '.class.php';
    if (file_exists(LIB_PATH."/$file")) {
        include_once LIB_PATH."/$file";
    }else if (file_exists(APP_PATH."/$file")) {
        include_once APP_PATH."/$file";
    }
});
