<?php
/**
* @file ../Home.class.php
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-10-17 14:38:04
* @brief
*
**/
class Home extends Base{
    // 处理静态文件请求
    public function staticfile() {
        return file_get_contents(ROOT_PATH.$_SERVER['REQUEST_URI']);
    }

    // 404
    public function err404() {
        return $this->tpl('404.tpl');
    }

    // 首页
    public function home() {
        //return $this->tpl('home.tpl', ['tpldata' => 'test']);
        return $this->tpl('home.tpl');
    }
    
    // wiki
    public function wiki() {
        return $this->tpl('wiki.tpl');
    }

    // wise-wiki
    public function wisewiki() {
        return $this->tpl('wisewiki.tpl');
    }
    
    // Wise 通用版Wiki
    public function prowiki() {
        return $this->tpl('prowiki.tpl');
    }
    
    // wise-deep
    public function wiseqa() {
        return $this->tpl('wiseqa.tpl');
    }

    // 使用流程
    public function float() {
        return $this->tpl('float.tpl');
    }

    public function test() {
        return $this->json(['test' => 'json']);
    }
}

?>
