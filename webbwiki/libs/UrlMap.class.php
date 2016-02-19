<?php
/**
* @file libs/UrlMap.class.php
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-10-16 19:56:09
* @brief
*
**/
class UrlMap {
    public function __construct($uri) {
        $this->uri = $uri;   
    }

    private function getProcess() {
        $r = $GLOBALS['routes'];
        foreach ($r as $route => $process) {
            if (preg_match($route, $this->uri)) {
                return $process;
            }
        }
        return 'home.err404';
    }

    public function process() {
        $process = $this->getProcess();
        $class = explode('.', $process)[0];
        $action = explode('.', $process)[1];
        $classFile =  APP_PATH.'/'.ucfirst($class).'.class.php';
        if (file_exists($classFile)) {
            require($classFile);
        }else{
            $classFile = APP_PATH.'/Home.class.php';
            require($classFile);
            $class = 'home';
            $action = 'err404';
        }
        $appClass = ucfirst($class);
        if (class_exists($appClass)) {
            $app = new $appClass();
            if (method_exists($app, $action)) {
                return $app->$action();
            }else {
                throw new Exception("class: $appClass does not have action: $action");
            }
        }else {
            throw new Exception("file: $appClass does not have class: $class");
        }
    }
}

?>
