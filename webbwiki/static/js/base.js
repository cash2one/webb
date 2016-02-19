/**
* @file base.js
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-06-05 15:43:51
**/
$(document).ready(function () {
    var $navs = $('.nav_item');
    $navs.on('click', function() {
        $navs.removeClass('select-item');
        $(this).addClass('select-item');
    });
});
