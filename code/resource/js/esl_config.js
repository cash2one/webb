/*
 * 添加require.config paths项方法
 * 抽取公共方法方便其它模块使用
 * WCL.amd.addPaths({})
 */
var WCL = window.WCL || {};
WCL.amd = {
    // 用于存储已有的组件key
    keys : {},
    // 结果页添加paths公共方法
    addPaths : function(opt) {
        // 参数必须为obj, opt={'a/b':'a/b.js','a/c':'a/c.js'}
        if (typeof opt !== "object") {
            return;
        };
        // esl config 支持二级mix,可多处配置
        require.config({
            paths: opt
        });
        // 存入keys
        $.extend(WCL.amd.keys, opt);
    },
    // 判断组件key是否存在
    exist : function(key) {
        if (key && typeof WCL.amd.keys[key] !== "undefined") {
            return true;
        };
        return false;
    }
};

// baseUrl
require.config({
    baseUrl:'./js/'
});

// webb日志
WCL.amd.addPaths({
    'wcl/webb-ia': "webb-1.0.min",
    'wcl/webb-disp': "webb-1.0.min"
});
