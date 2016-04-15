define(['wcl/webb'],function(Webb) { 
    
    var webb = new Webb();
    var flag = {};

    var DispLog = function () {
		var me = this;
        me.webb = webb;
        me._flag = flag;
		// 数据
		me.display = {};	// 定义display结构用于存放基础展现数据结构
		me.expand = {};		// 定义expand结构用于存放结果扩展详细展现结构
        me._init();
    };

    $.extend(DispLog.prototype, {
        send: function(data) {
            if(!data.t){
                data.t = new Date().getTime();
            }
            this.webb.sendPack("disp",data);
        },
        sendNow: function(data){
            if(!data.t){
                data.t = new Date().getTime();
            }
            this.webb.sendNow("disp",data);
        },
        _init: function(options){
            var me = this;
			// 获取页面基础信息
			me.display.base = me.getBase();
            this._initEvents();
        },
        _initEvents: function(){
            var me = this;
            if(!me._flag.disp){
                me.sendDisp();
                me._flag.disp = 1;
            }

        },
        sendDisp : function() {// 开启一个轮询周期
            var me = this;

			// 遍历基本展现日志中的每一条结果，并发送
			for(var prop in me.display) {
				var sendDisplay = {};
				sendDisplay[prop] = me.display[prop];
				// 发送日志
                me.sendNow(sendDisplay);
			};
            
        },
		// 获取页面基础信息
		getBase : function(){
			var me = this;
            var baseDisplay = {};   //页面基础展现信息
			baseDisplay.size = {};
			baseDisplay.size.doc = {
				w : $(document).width(),
				h : $(document).height()
			};
			baseDisplay.size.wind = {
				w : $(window).width(),
				h : $(window).height()
			};
			baseDisplay.size.scr = {
				w : screen.width,
				h : screen.height
			};
            baseDisplay.vsb = document.visibilityState ? document.visibilityState : 0;
			return baseDisplay;
        }
    });
    return DispLog;

});
