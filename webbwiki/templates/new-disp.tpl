/*公共字段以外格式：*/
data = {
    // 页面基础信息
    base: {
        tpl: "baidu",                   // 主模版名
        async: 1,                       // 1:IS 0:HIS
        page: 1,                        // 页码
        left: 10,                       // 左侧结果个数
        right: 2,                       // 右侧结果个数
        top: 1,                         // 顶部结果个数
        size: {
            doc: {w: 1663, h: 1898},    // 文档width_height       
            wind: {w: 1663, h: 539},    // 视窗width_height
            scr: {w: 1680, h: 1050}     // 屏幕分辨率
        },
        upn: 12314353
    },
 
    T1: {
        id: 1,
        srcid: 1059,
        tpl: se_com_default,
        mu: "http://baike.baidu.com/subview/651493/8092952.htm?fr=aladdin",    // 主链
        size: {w: 500, h: 179},  // 结果尺寸
        pos: {l: 100, t: 200},   // 位置
        show: 0,                 // 不可见(可选)
        bdr: 1,                  // 是否加框 1:加框开始 3:加框结束 5:结果内样式加框
        link: 4,                 // 子链个数(可选)
        img: 1,                  // 图片个数(可选)
        app: 1,                  // 应用个数(可选)
        fm : "as",               // 结果fm，区分阿拉丁还是自然结果
 
        com: {                   // 通用小功能(均可选)
            fi: 1,               // fave-icon
            gwi: 1,              // 官网
            fxi: 1,              // 风险标
            vi: 1,               // V标
            yjji: 1,             // 药监局
            hxi: 1,              // 航协
            cr: 1                // 点击后推荐
        },
 
        // expand定义为结果的附加内容,包含子链内容、图片尺寸、app具体信息
        expand: {
            links: {
                0: "RaOLar_DoHnM51smXSYQZjxwJH7NySET65ZZU7AiKdC",    // 加密子链只发加密串
                1: "http://news.baidu.com/",
                2: "http://tieba.baidu.com/",
                3: "http://zhidao.baidu.com/"
            },
            imgs: {
                0: {
                    size: {
                        h: 75,
                        w: 121
                    }
                },
                1: {},
                2: {}
            },
            apps: {
                0: {
                    type: 1,      // app类型 1:flash 2:h5_video 3:h5_audio
                    size: {
                        w: 790,
                        h: 444
                    }
                },
                1: {},
                2: {}
            }
        }
    },
 
    L1: {},
    L2: {},
    L3: {},
    L4: {},
 
    R1: {},
    R2: {},
 
    // RS
    rs: {
        num: 9,                            // rs个数
        query: ["acfun", "a站", "a直播"]    // rs内容
    },
 
    // 通用提示
    hint: {
        result: [
            {
                id: 1010,                  // 提示id
                tpl: "hint_toprq_tips"     // 提示模版
            }
        ]
    }
}
