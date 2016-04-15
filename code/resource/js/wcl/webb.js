(function() { 
   
    /* 没有必选字段则不执行 */ 
    if(!WCL || !WCL.globalLogFlag || !WCL.did || !WCL.lid){
        return;
    }
    /* 没有接收日志的服务则不执行 */
    if((!WCL.pathHTTP || !WCL.pathHTTPS) && !WCL.productID){
        return;
    } 
    var WebbBase = function () {
        this.start = null;          // 起始时间，在init()中初始化
        this.debug = false;         // 是否发送前校验日志字段
        this.dataStore = {};        // 日志结构化数据存储
        this.t = null;              // sendPack轮询句柄
        this.cycle = null;          // sendPack轮询是否开启标识
        this.MIN_SPEED = 2 * 1000;  // 最短轮询时间
        this.MAX_SPEED = 10 * 1000; // 最长轮询时间
        this.curSpeed = 5 * 1000;   // 当前轮询时间，会根据当前日志量进行动态调整
        this.stayTime = 0;          // 页面停留时间
        this.MAX_LEN = 2000;        // 单次最大日志发送量
        this.storeLen = -1;         // 日志量
        this.MAX_SEND = 100;        // 一个周期各日志业务最大发送量
        this.hostEnum = {           // send接口host选择枚举
            SESTAT : 0
        };
        this.keyMap = {             // sendPack接口key与host映射
            input: 0,
            disp: 0,
            view: 0,
            user: 0,
            heart: 0
        };
        this.hostAddr = [          // 日志服务器地址列表
            location.protocol.indexOf('https') === -1 ? (WCL.pathHTTP || 'http://sestat.baidu.com/owb.gif?') : (WCL.pathHTTPS || 'https://sp1.baidu.com/5b1ZeDe5KgQFm2e88IuM_a/owb.gif?')
        ];
        this.commLog = {};         // 公共日志字段
        this.isFirst = true;       // 首次检索标识
        this.sendNum = {};         // 日志发送数目，query粒度
        this.init();
    };
    $.extend(WebbBase.prototype, {
        setCommLog: function (qid, log, len) { // 获取当前公共日志信息
            if (!WCL) {
                return false;
            }
            if (!(qid in this.commLog)) {
                var comm = {};
                if (log && len) {
                    comm.log = log;
                    comm.len = len;
                }else {
                    comm.log = '&pid=' + (WCL.productID || 0);
                    comm.log += '&qid=' + WCL.lid +
                                '&did=' + WCL.did ;
                    comm.len = (comm.log + '&t=' + new Date().getTime()).length;
                }
                this.commLog[qid] = comm;
            }
            return true;
        },
        preInit : function() {
            // 初始化全局数据
            this.start = new Date().getTime();
            this.cycle = null;
            if (this.t !== null){
                clearTimeout(this.t);
            }
            this.t = null;
            this.storeLen = -1;
            var qid = WCL && WCL.lid ? WCL.lid : '';
            if (qid) {
                this.setCommLog(qid);
                this.sendNum[qid] = 0;
            }
        },
        flushData: function (type) {// 换query或关闭浏览器将数据立即发送出去
            if (this.t !== null) {
                clearTimeout(this.t);
                this.t = null;
            }
            var data = this.fetchData(type, true);
            this.startSend(data, true);
        },
        init : function() {
            var _this = this;
            _this.preInit();
            $(window).on('unload',function() {// 页面关闭缓冲数据发送出去，优先发送优先日志
                if (WCL && WCL.globalLogFlag === 1) {
                    _this.flushData(2);
                }
            });
        },
        send: function (data, host, qid) {
            if (!data){// 数据为空，直接返回
                return false;
            }
            if (this.debug) {
                // 线下校验代码
            }
            var v = '';
            var q = '';
            var imgsrc = '';
            if (typeof data === 'object') {// 数据是对象,对每个数据做encode处理
                for (var k in data) {
                    v = data[k];
                    if (typeof v === 'object') {
                        v = JSON.stringify(v);
                    }
                    q += k + '=' + encodeURIComponent(v) + '&';
                }
                q = q.substring(0, q.length - 1);   // 去掉末尾的&
            }else if (typeof data === 'string') {   // 数据是字符串，不做encode处理
                q = data;
            }
            if (!qid && WCL && WCL.lid) {// 没有指定qid，使用当前qid
                qid = WCL.lid;
            }
            if (qid && qid in this.commLog) {
                q += this.commLog[qid]['log'];
                q += '&t=' + new Date().getTime();
            }else {
                return false;
            }
            if (typeof host !== 'number' || host < 0 || host >= this.hostAddr.length) {
                host = 0;
            }
            imgsrc = this.hostAddr[host] + q;
            if (imgsrc.length > this.MAX_LEN) {// 分包发送
                return false;
            }else {
                var img = window["BD_PS_C" + (new Date()).getTime()] = new Image();
                img.src = this.hostAddr[host] + q;
            }
            return true;
        },
        sendNow: function (key, data, option) {
            if(!key || typeof key !== 'string' || !(key in this.keyMap) || !data){
                return;
            }
            var logInfo = 'type=3' + '&fm=' + key + '&data=' + encodeURIComponent(JSON.stringify([data]));
            if (option && option.qid && option.log && option.len) {
                this.setCommLog(option.qid, option.log, option);
                this.send(logInfo, this.keyMap[key], option.qid);
            }else {
                this.send(logInfo, this.keyMap[key]);
            }
        },
        pushData: function (key, data, option) {// 日志数据结构化存储
            var qid = WCL && WCL.lid ? WCL.lid : '';
            if (!qid) {// qid为空不进行存储，目前新首页qid为空
                return false;
            }
            if (option && option.qid && option.log && option.len) {
                this.setCommLog(option.qid, option.log, option.len);
                qid = option.qid;
            }else {
                this.setCommLog(qid);
            }
            if (!(qid in this.dataStore)) {
                this.dataStore[qid] = {}
            }
            var qidData = this.dataStore[qid];
            if (!(key in qidData)) {
                qidData[key] = [[],[]];
            }
            if (option && option.level === true) {
                qidData[key][0].push(encodeURIComponent(JSON.stringify(data)));
            }else {
                qidData[key][1].push(encodeURIComponent(JSON.stringify(data)));
            }
        },
        fetchData : function(type, level) {// 获取一个周期内的数据，合并出来数据包不超过MAX_LEN（单条日志大小超过MAX_LEN除外）
            var data = this.dataStore;
            var qidData;                                            // 每个query数据
            var businessData;                                       // 日志业务数据队列
            var readyQueue = [];                                    // 待发送日志队列
            var host = 0;                                           // 日志业务对应hostAddr地址下标
            var historyQid = false;                                 // 是否是当前query之前数据
            var curQid = WCL && WCL.lid ? WCL.lid : '';
            if (!curQid) {                                          // 当前qid为空，返回空队列
                return [];
            }
            for (var qid in data){
                if (qid !== curQid) {// 非当前query数据
                    historyQid = true;
                }else {              // 当前query数据
                    historyQid = false;
                }
                qidData = data[qid];
                for (var v in qidData) {      // 循环处理每个日志业务队列
                    if (!(v in this.keyMap)) {// 日志业务key错误
                        continue;
                    }
                    host = this.keyMap[v];
                    if (typeof host !== 'number' || this.hostAddr[host] === undefined) {// 日志业务服务器地址错误
                        continue;
                    }
                    if (qidData[v][0].length > 0){// 优先处理高优日志
                        businessData = qidData[v][0];
                    }else{
                        businessData = qidData[v][1];
                    }
                    getBusinessData.call(this);
                    // 高优日志处理完成可继续处理非高优日志
                    if ((historyQid === true || level !== true) && businessData.length === 0 && qidData[v][1].length > 0) {
                        businessData = qidData[v][1];
                        getBusinessData.call(this);
                    }
                    if (historyQid === true) {
                        delete this.dataStore[qid];// 删除历史query日志队列
                    }
                }
            }
            return readyQueue;
            function getBusinessData() {
                var dataItem;                                           // 每一条日志数据
                var count = 0;                                          // 日志数据包计数器，防止日志业务集中在某个时间点产生大量日志，发送过于集中
                var tmpData = [];                                       // 临时日志合并数据包
                var popFlag = false;                                    // 当前日志数据是否需要重新组包
                var commLen = this.commLog[qid]['len'];
                var hostLen = this.hostAddr[host].length;
                var headLen = hostLen + ('type=' + type + '&fm=' + v + '&data=').length + commLen;
                var baseLen = headLen + 6;
                var curLen = baseLen;
                while (businessData.length !== 0 && count < this.MAX_SEND) {
                    if (historyQid === false && type === 0) {// 非当前query或者在非轮询状态下发送所有日志数据
                        count++;
                    }
                    dataItem = businessData.shift();
                    tmpData.push(dataItem);
                    curLen = baseLen + dataItem.length + 3;
                    if (baseLen >= this.MAX_LEN || curLen >= this.MAX_LEN) {// 数据包超出MAX_LEN
                        if (tmpData.length >= 2) {                          // 非单个日志数据超过MAX_LEN
                            tmpData.pop();
                            popFlag = true;
                        }
                        // 当前数据包入发送队列
                        readyQueue.push({qid: qid, key: v, type: type, data: '%5B' + tmpData.join('%2C') + '%5D', host: host});
                        tmpData = [];
                        if (popFlag) {
                            tmpData[0] = dataItem;// 当前日志数据组包
                            popFlag = false;
                        }
                        if (tmpData.length > 0) {
                            curLen = headLen + 3 + dataItem.length + 3;
                        }else {
                            curLen = headLen + 6;
                        }
                    }
                    baseLen = curLen;
                }
                if (tmpData.length > 0) {// 最后一个数据包
                    readyQueue.push({qid: qid, key: v, type: type, data: '%5B' + tmpData.join('%2C') + '%5D', host: host});
                }
            }
        },
        startSend : function(q, atOnce) { // 循环发送数据
            var _this = this;
            var dataItem;
            var logInfo;
            var cycle = 100;// 正常轮询情况下，将日志数据每100ms发送一条
            if(atOnce){ //换query和关闭浏览器时遍历发送
                for(var i = 0 ; i < q.length ; i ++){
                    dataItem = q.shift();
                    if (dataItem && dataItem.qid && dataItem.qid in _this.commLog) {
                        logInfo = 'type=' + dataItem.type + '&fm=' + dataItem.key + '&data=' + dataItem.data;
                    }else{
                        return;
                    }
                    _this.send(logInfo, dataItem.host, dataItem.qid);

                };
            }
            else{
                var t = setInterval(function () {
                    if (q.length <= 0){
                        clearInterval(t);
                        return;
                    }
                    dataItem = q.shift();
                    if (dataItem && dataItem.qid && dataItem.qid in _this.commLog) {
                        logInfo = 'type=' + dataItem.type + '&fm=' + dataItem.key + '&data=' + dataItem.data;
                    }else {
                        return;
                    }
                    _this.send(logInfo, dataItem.host, dataItem.qid);
                    if (dataItem.qid in _this.sendNum) {
                        _this.sendNum[dataItem.qid] += 1;
                    }
                },cycle);
            }
        },
        startCycle : function() {// 开启一个轮询周期
            var _this = this;
            if (_this.cycle === null) {
                _this.cycle = 1;
            }
            _this.t = setTimeout(function() {
                var data = _this.fetchData(0);
                var curStore = data.length;// 这个轮询周期将要发送的数据大小
                if (_this.storeLen === -1) {
                    _this.storeLen = curStore;
                }
                // 这次发送数据是上次两倍以上，则降低1000ms轮询时间，但不低于最短轮询时间MIN_SPEED
                if (_this.storeLen !== 0 && curStore / _this.storeLen >= 2 && _this.curSpeed > _this.MIN_SPEED) {
                    _this.curSpeed -= 1000;
                }
                // 这次发送数据是上次1/2以下，则增加1000ms轮询时间，但不高于最长轮询时间MAX_SPEED
                if ((curStore === 0 || _this.storeLen/curStore >= 2) && _this.curSpeed < _this.MAX_SPEED) {
                    _this.curSpeed += 1000;
                }
                _this.startSend(data, 0);// 发送数据
                _this.startCycle();      // 开启下一次轮询
            }, _this.curSpeed);
        },
        /** 
         * @param key:string,日志业务名称,目前值有inputSug、pageDisplay、resultView、customAction
         * @param data:json,日志数据
         * @param option:json,可选,当option.level=true时，日志优先级增高
         * */
         sendPack : function(key, data, option) {
             if(!key || typeof key !== 'string' || !(key in this.keyMap) || !data){
                 return;
             }
             this.pushData(key, data, option);
             if (this.cycle === null) {
                 this.startCycle();
             }
         }
    });

    if ( typeof define === "function" && define.amd ) { 
        define(function() { 
            return WebbBase;
        }); 
    } else {
        WCL.Webb = new WebbBase;
    }
})();
