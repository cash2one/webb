/*公共字段以外格式：*/
/*页面滚动操作,以固定时间间隔持续打点记录*/
data =
    // 心跳日志 
    {
        type : "heart", 
        stay_time : 60000,// 停留时间，query粒度
        t : 1450430049142, //日志发送时间戳
        hist:{"w_scroll":1,"heart":6,"w_blur":2,"w_focus":1},// 历史记录,这次心跳前发了各类日志的条数
        o:9, // order,代表第几条交互行为
        g:24650 // group,交互日志分组,每次webb实例化分组会不同
    },

    // 页面失去焦点(切换浏览器Tab或将浏览器整体切换到后台)
    {
        type: "w", //w代表window, type=w 表示页面窗口的整体操作行为
        action: "blur",
        t: 1426055121424,
        o:9, // order,代表第几条交互行为
        g:24650 // group,交互日志分组,每次webb实例化分组会不同
        ext: {
            "vsb" : "visible",   // 页面焦点切换后的可视性状态 visible可见,hidden不可见,其他.
            "from" : "xxxxxxxxx" // 可选,代表焦点切换到页面里的iframe元素,用户焦点并没有真的变化
        }
    },
     
    // 页面重新获取焦点   
    {
        type: "w", //w代表window, type=w 表示页面窗口的整体操作行为
        action: "focus",
        t: 1426055121994,
        o:9, // order,代表第几条交互行为
        g:24650 // group,交互日志分组,每次webb实例化分组会不同
        ext: {
            "vsb" : "visible",   // 页面焦点切换后的可视性状态 visible可见,hidden不可见,其他.
            "from" : "xxxxxxxxx" // 可选,代表焦点切换到页面里的iframe元素,用户焦点并没有真的变化
        }
    },

    // 页面可视状态切换
    {
        type: "w", //w代表window, type=w 表示页面窗口的整体操作行为
        action: "vsb",
        t: 1426055121424,
        o:9, // order,代表第几条交互行为
        g:24650, // group,交互日志分组,每次webb实例化分组会不同
        ext: {"vsb" : "visible"} // 页面可视状态切换后的状态 visible可见,hidden不可见,其他.
    },

    // 页面滚动
    // 打点间隔1s.
    {
        type: "w", //w代表window, type=w 表示页面窗口的整体操作行为
        action: "scroll",
        t: 1426055121424,   // 时间，13位，毫秒
        o:9, // order,代表第几条交互行为
        g:24650 // group,交互日志分组,每次webb实例化分组会不同
        ext:{
            "y":1502, //纵向偏移量
            "x":0 //横向偏移量
        }
    },
     
    // 窗口尺寸变化
    // 如:切换横竖屏,上下翻地址栏缩放.打点间隔1s.
    {
        type: "w", //w代表window, type=w 表示页面窗口的整体操作行为
        action: "resize",
        t: 1425349269304,   // 时间，13位，毫秒
        o:9, // order,代表第几条交互行为
        g:24650 // group,交互日志分组,每次webb实例化分组会不同
        ext: {
            w: 568,         // 水平宽度
            h: 320         // 垂直高度
        }
    }
        
}
