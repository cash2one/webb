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
        vsb: "visible",               // 页面可见性 visible可见,hidden不可见,其他.
        t: 1234567890000               // 采集时间
    }
}
