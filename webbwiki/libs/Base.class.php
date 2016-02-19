<?php
/**
* @file Base.class.php
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-10-17 14:20:30
* @brief
*
**/
class Base{
    public function json($jsonArr) {
        header('content-type: application/json; charset=utf-8');
        return json_encode($jsonArr, true);
    }

    public function tpl($view, $data=[]) {
        $view = new DefaultView($view, $data);
        $html = $view->render();
        return $html;
    }
}
?>
