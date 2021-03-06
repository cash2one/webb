<?php 
class PLogger {
    //log级别 1:error 2:info 3:debug 4:print out
    private $_level;
    private $_fp;
    private $_path;
    private $_filename;

    const ERROR=1;
    const WARN=2;
    const INFO=3;
    const DEBUG=4;
    const PRINT_OUT=5;

    private function __construct($options=[]){
        $options=array_merge([
            'level'=>self::ERROR,
            'path'=>'/tmp/',
            'file_prefix'=>'',
            'in_line'=>true,///每条日志仅打一行
            ],$options);
        $this->_file_prefix=$options['file_prefix'];
        $this->_level=$options['level'];
        $this->_path=$options['path'];
        $this->_in_line=$options['in_line'];
    }
    private static $loggers=[];
    public static function get($name='root',$options=[]){
        if(!isset(self::$loggers[$name])){
            self::$loggers[$name]=new self($options);
        }
        return self::$loggers[$name];
    }

    /**
     * 设置log级别
     *
     * @param num $level
     */
    public function setLevel($level = self::ERROR) {
        $this->_level = $level;
    }
    
    public function open($path = false) {
        $this->_filename = $this->getFileName();
        $this->_path = $path ? $path : $this->_path;
        $this->_path = $path ? $path : $this->_path;
        try{
            $oldMask=umask(0000);
            $this->_fp = fopen($this->_path.$this->_filename, "a");
            umask($oldMask);
        }catch(Exception $e){
            $this->error("can't open ".$this->_path.$this->_filename." .".$e);
        }
    }
    
    public function close() {
        if (! empty($this->_fp))
            fclose($this->_fp);
    }
    
    private function put($str) {
        $newname = $this->getFileName();
        if ($newname != $this->_filename) {
            $this->close();
            $this->open();
        }
        
        $now = date('[Y-m-d H:i:s:');
        $t = gettimeofday();
        if($this->_in_line){
            $str=str_replace(["\r","\n"],'',$str);
        }
        if ($this->_fp)
            fwrite($this->_fp, $now.$t["usec"]."] ".LOG_ID." ".$str."\n");
        if ($this->_level == self::PRINT_OUT) {
            echo "<div style='color:red'>".$now.$t["usec"]."] ".$str."</div>\n";
        }
    }
    
    public function error($str) {
        if ($this->_level >= self::ERROR) {
            $this->put("[ERROR] $str".$this->backtrace());
        }
    }
    
    public function info($str) {
        if ($this->_level >= self::INFO) {
            $this->put("[INFO] $str");
        }
    }
    public function warn($str) {
        if ($this->_level >= self::WARN) {
            $this->put("[WARN] $str".$this->caller());
        }
    }
    
    public function debug($str) {
        if ($this->_level >= self::DEBUG) {
            $this->put("[DEBUG] $str".$this->caller());
        }
    }
    
    private function getFileName() {
        return $this->_file_prefix.date('YmdH').".log";
    }
    
    private function caller() {
        $bt = debug_backtrace();
        array_shift($bt);
        array_shift($bt);
        $data = '';
        $point = array_shift($bt);
        $func = isset($point['function']) ? $point['function'] : '';
        $file = isset($point['file']) ? substr($point['file'], strlen($basePath)) : '';
        $line = isset($point['line']) ? $point['line'] : '';
        $args = isset($point['args']) ? $point['args'] : '';
        $class = isset($point['class']) ? $point['class'] : '';
        if ($class) {
            $data .= "# ${class}->${func} at [$file:$line]";
        } else {
            $data .= "# $func at [$file:$line]";
        }
        
        return $data;
    }
    
    private function backtrace($basePath = "") {
        $bt = debug_backtrace();
        array_shift($bt);
        $data = '';
        foreach ($bt as $i=>$point) {
            $func = isset($point['function']) ? $point['function'] : '';
            $file = isset($point['file']) ? substr($point['file'], strlen($basePath)) : '';
            $line = isset($point['line']) ? $point['line'] : '';
            $args = isset($point['args']) ? $point['args'] : '';
            $class = isset($point['class']) ? $point['class'] : '';
            if ($class) {
                $data .= "#$i ${class}->${func} at [$file:$line]\t";
            } else {
                $data .= "#$i $func at [$file:$line]\t";
            }
        }
        
        return $data;
    }
}
