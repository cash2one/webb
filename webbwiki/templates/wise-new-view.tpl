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
    },
        
    // 结果阅读行为(结果进入或离开可视区域)    
    {
        type: "sight",
        action: "change",
        ext: {
            "in":[4,5],    // 代表此次操作进入可视区域的结果编号
            "out":[1,2]    // 代表此次操作离开可视区域的结果编号
        }
        t: 1425349269304,  // 时间，13位，毫秒
    },
     

    // 页面组件交互日志
    {
        type: 'wp_xxxxx',   // 必选,组件类型交互,type需要以"wp_"开头,代表wise plug-ins.
        action: 'xxxxxx',   // 必选,组件交互动作
        t: 1425349269304,   // 必选,时间，13位，毫秒
        o:9,                // order,代表第几条交互行为
        g:24650,            // group,交互日志分组,每次webb实例化分组会不同
        ext: {              // 可选,组件自定义参数,整体长度小于50字节.
            xxxxx: 'xxxx'
        }
    },

    // 以下为已备案组件:

    // superframe组件
    {
        type: 'wp_act',   
        action: 'close',  // show 展现 close 关闭
        t: 1425349269304, // 必选,时间，13位，毫秒
        o:9,              // order,代表第几条交互行为
        g:24650,          // group,交互日志分组,每次webb实例化分组会不同
        ext: {            
            name: 'wise_sf_news/feed' //superframe name
        }
    },


    //视频播放组件
    {
        type: 'wp_vd'
        action: 'start',    // start:开始. pgrs:播放过程,仅在中间打点一次. pause:暂停. cont:继续播放. end:结束
        t: 1425349269304,   // 时间，13位，毫秒
        o:9,                // order,代表第几条交互行为
        g:24650,            // group,交互日志分组,每次webb实例化分组会不同
        ext: {
           pgrs: 0.1        // 播放进度,小数形式
        }
    }

}
