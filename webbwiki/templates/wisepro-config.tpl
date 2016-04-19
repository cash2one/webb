/* 以下为Webb基本配置 */
WCL = window.WCL || {};

/* Webb生效开关. */
WCL.globalLogFlag = 1;

/* 产品ID,若发到通用Webb日志服务,则必选.需要以邮件形式发给Webb FE /UBS 负责人申请,未注册ID会被过滤. */
// WCL.productID = 1;

/* Webb接收服务地址,需同时支持HTTP/HTTPS两个协议*/
WCL.pathHTTP = 'http://xxx.xxx.xxx/xxx.gif?';
WCL.pathHTTPS = 'https://xxx.xxx.xxx/xxx.gif?';


/* 前端计算的页面ID,必选.可以使用一下程序计算,也可以自己计算.*/
WCL.did = (function () { 
    var guid = ''; 
    for (var i = 0; i < 32; i++) {
        guid += Math.floor(Math.random() * 16).toString(16);
    }
    return guid;
})();

/* 服务端计算的页面请求ID,必选,需服务端自行计算.*/
WCL.lid = 1234567;
