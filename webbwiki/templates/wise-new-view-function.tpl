
require(['log/webb-ia'],function(Webb){

    var webb = new Webb({
        useAll:true         // useAll:true  需要使用全部全局日志,默认false
                            // enable: {    包含
                            //    heart:1,  需要单独使用心跳日志 
                            //    focus:1,  需要单独使用焦点获取日志 
                            //    blur:1,   需要单独使用焦点失去日志 
                            //    rotate:1, 需要单独使用转动屏幕日志
                            //    scroll:1, 需要单独使用页面滚动日志
                            //    read:1,   需要单独使用阅读日志
                            // }
    });
    webb.send({

        "type": "wp_act",   // 必选,字符串,组件标识,以"wp_"开头.
                            // 对于每个组件唯一,如需增加新组件,需要申请备案.联系刘悦.

        "action": "show",   // 必选,字符串,标识组件操作.必须可以枚举,使用前需要申请和备案.

        "ext": {"xxx":"xxx"}  // 可选,字符串或对象,组件自定义参数.长度需小于50字节,多余50字节会过滤.

    });

});
