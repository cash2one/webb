/*公共字段以外格式：*/
data = {
    // 页面基础信息(只有前端可以采集的展现信息)
    base: {
        num: 10,                        // 普通结果条数
        size: {
            doc: {w: 320, h: 2490},    // 文档width_height       
            wind: {w: 320, h: 568},    // 视窗width_height
            scr: {w: 640, h: 1136}     // 屏幕分辨率
        },
        t: 1234567890000               // 采集时间
    },
    
    // 结果展现信息,Wise只采集三条结果
    results: [
        {
            order: 1,                  // 结果排序
            type: "n"                  // n:代表普通结果;ad代表商业结果
            srcid: 11453,              // 普通结果资源ID
            tpl: ticket12306,          // 普通结果展现模板
            size: {w: 308, h: 145},    // 结果尺寸
            pos: {l: 6, t: 98},        // 位置
            show: 0                    // 是否可见 1:可见;0:不可见
            }
        },
        {},
        {}
    ]
 
    // RS
    rs: {
        num: 9,                            // rs个数
        query: ["acfun", "a站", "a直播"]    // rs内容
    }
 
}
