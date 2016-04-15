define(['wcl/webb'],function(Webb) { 
    
    var webb = new Webb();
    var start = new Date().getTime();
    var order = 0;
    var history = null;
    var flag = {};

    var IALog = function (options) {
        this.webb = webb;
        this.group = 0;
        this.start = null;          // 起始时间，在init()中初始化
        this.stayTime = 0;          // 页面停留时间
        this.heartTime = [];        // 发送斐波那契心跳间隔序列
        this.heartTimer = null;         // 心跳轮询定时器
        this.scrollTimer = null;
        this.resizeTimer = null;
        this.flag = flag;
        this.options = {
            useBase : false,
            useFocus : false,
            useBlur : false,
            useHeart : false,
            useVsb : false
        };
        this._init(options);
    };

    $.extend(IALog.prototype, {
        send: function(data) {
            if(!data.t){
                data.t = new Date().getTime();
            }
            data.o = order;
            order += 1;
            data.g = this.group;
            this._setHistory(data);
            this.webb.sendPack("view",data);
        },
        sendNow: function(data){
            if(!data.t){
                data.t = new Date().getTime();
            }
            data.o = order;
            order += 1;
            data.g = this.group;
            this._setHistory(data);
            this.webb.sendNow("view",data);
        },
        _init: function(options){
            this.start = start;
            for ( var i in options ) {
                this.options[i] = options[i];
            }
            this.group = this._getRandomNum() || 0;
            this._initEvents();
        },
        _getRandomNum: function(){
            var num = Math.random()* 89999 + 10000;
            num = parseInt(num, 10);
            return num;
        },
        // 记录日志历史,以type维度计数,用于可用性指标计算及日志完整性修正
        _setHistory: function(data){
            if(data.type){
                var type = data.type;
                var action = data.action ? data.action : "";
                //特殊逻辑:针对 type=w 类型的交互,key的形式为w-action
                //因为这部分交互需要更细粒度的计算丢失率和日志修正,故细分action维度记录历史.
                if(type == "w" && action){
                    type = "w_" + action;
                }

                if(history){
                    if(history[type]){
                        history[type] ++ ;
                    }
                    else{
                        history[type] = 1;
                    }

                }else{
                    history = {};
                    history[type] = 1;
                }
            }
        },
        _sendFocusLog: function(){
            var _this = this;
            _this.send({
                "type":"w",
                "action":"focus",
                "ext": {
                    "vsb": document.visibilityState ? document.visibilityState : 0
                }
            });
        },
        _sendBlurLog: function(){
            var _this = this;
            _this.send({
                "type":"w",
                "action":"blur",
                "ext": {
                    "vsb": document.visibilityState ? document.visibilityState : 0
                }
            });
        },
        _sendVisibilitychangeLog: function(){
            var _this = this;
            _this.send({
                "type":"w",
                "action":"vsb",
                "ext": {
                    "vsb": document.visibilityState ? document.visibilityState : 0
                }
            });
        },
        _initEvents: function(){
            var _this = this;
            var $window = $(window);
            if((_this.options.useBase || _this.options.useFocus) && !_this.flag.focus){
                $window.bind('focus.webb_ia', function (e){
                    _this._sendFocusLog();
                }); 
                _this.flag.focus = 1;
            }
            if((_this.options.useBase || _this.options.useBlur) && !_this.flag.blur){
                $window.bind('blur.webb_ia', function (e){
                    _this._sendBlurLog();
                }); 
                _this.flag.blur = 1;
            }
            // 可视切换交互实验
            if((_this.options.useBase || _this.options.useVsb) && !_this.flag.vsb){
                $(document).bind('visibilitychange.webb_ia', function (e){
                    _this._sendVisibilitychangeLog();
                }); 
                _this.flag.vsb = 1;
            }
            if((_this.options.useBase || _this.options.useResize) && !_this.flag.resize){
                $window.bind('resize.webb_ia', function (e){
                    _this.collectPoint('resize', e);
                }); 
                _this.flag.resize = 1;
            }
            if((_this.options.useBase || _this.options.useHeart) && !_this.flag.heart){
                _this.startHeart();
                _this.flag.heart = 1;
            }
            if((_this.options.useBase || _this.options.useScroll) && !_this.flag.scroll){
                $window.bind('scroll', function (e){
                    _this.collectPoint('scroll', e);
                }); 
                _this.flag.scroll = 1;
            }

        },
        destory: function(){
            $(window).unbind('.useraction');
            if (this.heartTimer !== null){
                clearTimeout(this.heartTimer);
            }
            this.heartTimer = null;
        },
        fb: function () {// 斐波那契心跳间隔
            var len = this.heartTime.length;
            var time;
            if (len === 0 || len === 1) {
                time = 3 * 1000;
            }else {
                time = this.heartTime[len - 1] + this.heartTime[len - 2];
            }
            this.heartTime.push(time);
            return time;
        },
        sendHeart: function (type) {// 发送心跳
            var t = new Date().getTime();
            var stay_time = type === 0 ? this.stayTime : t - this.start;
            var data = {type:"heart",stay_time: stay_time,t:t}
            if(history){
                data.hist = history;
            }
            this.sendNow(data);
        },
        startHeart : function() {// 开启一个轮询周期
            var _this = this;
            var fbTime = _this.fb();
            _this.stayTime += fbTime;
            _this.heartTimer = setTimeout(function() {
                _this.sendHeart(0);
                _this.startHeart(); // 开启下一次轮询
            }, fbTime);
        },
        collectPoint: function (name, e) {
            var timer = name + 'Timer';
            var _this = this;
            if (_this[timer] === null) {
                startPoint();
            }
            function startPoint() { 
                _this[timer] = setTimeout(function () {
                    _this.send(getData(name));
                    _this[timer] = null;
                },
                1000);
            }
            function getData(name) {
                if (name === 'scroll') {
                    var $window = $(window);
                    var scrollTop = $window.scrollTop();
                    var scrollLeft = $window.scrollLeft();
                    return {
                            "type":"w",
                            "action":"scroll",
                            "ext": {
                            "y": scrollTop,
                            "x": scrollLeft
                            }
                    };
                }else if (name === 'resize') {
                    return {
                            "type":"w",
                            "action":"resize",
                            "ext": {
                            "w": $(window).width(),
                            "h": $(window).height()
                            }
                    };
                }
            }
        }
    });
    return IALog;

});
