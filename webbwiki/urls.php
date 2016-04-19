<?php
/**
* @file urls.php
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-10-17 13:11:27
* @brief
*
**/
$routes = [
    '/^\/$/' => 'home.home',
    '/^\/wiki$/' => 'home.wiki',
    '/^\/wise-wiki$/' => 'home.wisewiki',
    '/^\/wisepro-wiki$/' => 'home.prowiki',
    '/^\/wise-deep$/' => 'home.wiseqa',
    '/^\/float$/' => 'home.float',
    '/^\/test$/' => 'home.test',
    '/^\/static\/.*$/' => 'home.staticfile',
];
?>
