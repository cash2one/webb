/**
* @file ./static/js/home.js
* @author jiangfeng01
* @mail jiangfeng01@baidu.com
* @date 2015-06-18 20:43:19
**/

    $(document).ready(function () {
        var data = [
            {content: '<p class="query">q = java</p>', time: '', type: 's'},
            {content: '用户进入搜索框', time: '开始', type: 's'},
            {content: '用户键盘输入字符"j", 展现4条sug, 内容为"京东商城", "京东", "京东网上商城", "jd"', time: '701ms', type: 'l'},
            {content: '用户键盘输入字符"a", 展现4条sug, 内容为"java", "javlibrary.com", "javascript", "japanese girl"', time: '923ms', type: 'l'},
            {content: '用户键盘输入字符"v", 展现4条sug, 内容为"java", "javlibrary.com", "javascript", "javzoo"', time: '1072ms', type: 'l'},
            {content: '用户键盘输入字符"a", 展现4条sug, 内容为"javascript", "java培训", "java教程", "java环境变量"', time: '1228ms', type: 'l'},
            {content: '用户按回车键检索, sug隐藏', time: '1574ms', type: 's'},
            {content: '结果页面完成, 确认pv, 展现<a class="disp-btn" data-q="1" href="javascript:;">详细信息</a>，左侧第1, 2条结果，右侧第1条结果在可视区域', time: '2033ms', type: 'l'},
            {content: '用户鼠标进入左侧第1条结果', time: '3483ms', type: 's'},
            {content: '用户鼠标在左侧第1条结果停留3962ms后离开', time: '7445ms', type: 'm'},
            {content: '用户滚动页面距顶部273px, 左侧第3, 4条结果进入可视区域', time: '7517ms', type: 'm'},
            {content: '用户鼠标进入左侧第3条结果', time: '7887ms', type: 's'},
            {content: '用户鼠标在左侧第3条结果停留373ms后离开', time: '8260ms', type: 'm'},
            {content: '用户滚动页面距顶部679px, 左侧第1, 2, 3条结果离开可视区域, 左侧第5, 6, 7结果进入可视区域, 右侧第2条结果进入可视区域', time: '8528ms', type: 'l'},
            {content: '用户卸载页面, 检索时长2033ms, 在结果页页面停留7001ms', time: '9034ms', type: 'm'},
            {content: '<a class="btn btn-success use-btn" href="#webb-use">我要使用</a>', time: '', type: 's'}
        ];
        var disp = [
            '结果页主模版为baidu，处在is环境，页码为1，左侧10条结果，右侧2条结果，屏幕分辨率为1280*800，文档大小为1264*2004.',
            '左侧第一条结果模版名是soft，资源号为6835，是阿拉丁结果，主链为http://rj.baidu.com/s?wd=java，结果大小为538*233，距离顶部138px，距离左侧121px，结果结果有边框，有点击后推荐，有两个子链，有一张图片.',
            '左侧第一条结果第一个链接为_tAiOWmwHuvBX6zEmvSxt9iTfinl427BBTEIGCQdCDwmjr4jQZbjI-PRE4yzxtblj51xgWl284VsEh4DayxZcq，第二个链接为...，图片大小为56*56.',
            '其他结果.....',
            '相关推荐有9条，分别是：java下载, java官网, java教程, java之父, 我的世界java下载, java环境变量设置, java jdk, java7, java api.',
            '通用提示模版名为hint_toprq_tips，资源号为28300'
        ];
        var data1 = [
            {content: '<p class="query">q = 12306</p>', time: '', type: 'm'},
            {content: '用户进入搜索框', time: '开始', type: 's'},
            {content: '用户键盘输入字符"1", 展现4条sug, 内容为"12306", "163", "163邮箱登陆", "126"', time: '598ms', type: 'l'},
            {content: '用户键盘输入字符"2", 展现4条sug, 内容为"12306", "126", "126邮箱登陆", "中国铁路客户服务中心"', time: '723ms', type: 'l'},
            {content: 'is预取"12306"', time: '732ms', type: 's'},
            {content: '用户点击结果页, sug隐藏', time: '1354ms', type: 's'},
            {content: '结果页面完成, 确认pv, 展现<a class="disp-btn" data-q="2" href="javascript:;">详细信息</a>，左侧第1, 2, 3条结果，右侧第1条结果在可视区域', time: '1543ms', type: 'l'},
            {content: '用户鼠标进入左侧第1条结果', time: '2443ms', type: 'm'},
            {content: '用户鼠标在左侧第1条结果停留962ms后离开', time: '3405ms', type: 'm'},
            {content: '页面失去焦点', time: '3408ms', type: 'm'},
            {content: '页面获得焦点', time: '39288ms', type: 'm'},
            {content: '用户卸载页面, 检索时长1543ms, 在结果页页面停留2142ms', time: '39304ms', type: 'm'},
            {content: '<a class="btn btn-success use-btn" href="#webb-use">我要使用</a>', time: '', type: 's'}
        ];
        var disp1 = [
            '结果页主模版为baidu，处在is环境，页码为1，左侧10条结果，右侧3条结果，屏幕分辨率为1920*1080，文档大小为1265*2499.',
            '左侧第一条结果模版名是sohugeneral，资源号为11353，是阿拉丁结果，主链为http://www.12306.cn，结果大小为538*114，距离顶部138px，距离左侧121px，是官方网站，有点击后推荐，有6个子链.',
            '左侧第一条结果第一个链接为LVr6TGBGnS3wL86lq1p_vdseUeX9PqLGFh6QkYS1p5NdT3zAK5tJkoKVwG9YmLOWjaWpj6XtZg-Sez20piPjrq，第二个链接为...',
            '其他结果.....',
            '相关推荐有9条，分别是：12306火车票网上订票,123,hao123,李幕慈,去哪儿,售票帝,126,携程,火车票订购网站12306.',
            '通用提示模版名为hint_toprq_tips，资源号为28300'
            ];
        var data2 = [
            {content: '<p class="query">q = 咱们结婚吧</p>', time: '', type: 'm'},
            {content: '用户进入搜索框, 展现4条历史sug, 内容为"电影", "爱情电影", "万达影院", "约会去哪儿好"', time: '开始', type: 'm'},
            {content: '用户粘贴字符"我们结婚吧", 展现4条sug, 内容为"咱们结婚吧电影", "咱们结婚吧宣传片", "咱们结婚吧电视机", "咱们结婚吧电影插曲"', time: '501ms', type: 'l'},
            {content: '用户按回车键检索', time: '654ms', type: 's'},
            {content: '结果页面渲染完成，确认pv，展现<a class="disp-btn" data-q="3" href="javascript:;">详细信息</a>，左侧第1, 2, 3, 4条结果，右侧第1, 2条结果在可视区域', time: '1239ms', type: 'l'},
            {content: '用户鼠标进入左侧第1条结果', time: '1482ms', type: 's'},
            {content: '用户鼠标在左侧第1条结果停留962ms后离开', time: '2444ms', type: 'm'},
            {content: '用户滚动页面距顶部473px，左侧第1, 2条结果离开可视区域，第5, 6, 7, 8条结果进入可视区域', time: '2876ms', type: 'l'},
            {content: '用户鼠标进入左侧第6条结果', time: '3014ms', type: 's'},
            {content: '用户鼠标在左侧第3条结果停留522ms后离开', time: '3536ms', type: 'm'},
            {content: '用户卸载页面，检索时长1239ms，在结果页页面停留3082ms', time: '4321ms', type: 'm'},
            {content: '<a class="btn btn-success use-btn" href="#webb-use">我要使用</a>', time: '', type: 's'}
        ];
        var disp2 = [
            '结果页主模版为baidu，处在非is环境，页码为1，左侧10条结果，右侧2条结果，屏幕分辨率为1920*1080，文档大小为1920*2065.',
            '左侧第一条结果模版名是zx_new_tvideo，资源号为6869，是阿拉丁结果，结果大小为538*342，距离顶部138px，距离左侧121px, 25个子链，1张图片.',
            '其他结果.....',
            '相关推荐有9条，分别是: 咱们结婚吧电影, 咱们结婚吧电影版, 咱们结婚吧歌曲, 我们结婚吧, 我们结婚了, 咱们结婚吧电影下载, 咱们结婚吧齐晨, 高圆圆, 咱们结婚吧 电视剧.',
            '通用提示模版名为hint_toprq_tips，资源号为28300'
        ];
        var data3 = [
            {content: '<p class="query">q = 刘德华</p>', time: '', type: 'm'},
            {content: '用户进入搜索框, (上一次检索词：刘德华的歌)，展现4条sug, 内容为"刘德华的歌", "刘德华的歌曲大全", "刘德华的冰雨", "刘德华的歌词"', time: '开始', type: 'l'},
            {content: '用户退格删除字符"歌", 展现4条sug, 内容为"刘德华的歌", "刘德华的老婆", "刘德华的颤音怎么练", "刘德华的女儿照片"', time: '668ms', type: 'l'},
            {content: '用户退格删除字符"的", 展现4条sug, 内容为"刘德华的歌", "刘德华", "刘德华电影全集", "刘德华电影全集国语"', time: '774ms', type: 'l'},
            {content: '用户点击了百度一下检索', time: '954ms', type: 's'},
            {content: '结果页面渲染完成，展现<a class="disp-btn" data-q="4" href="javascript:;">详细信息</a>，首屏第1, 2, 3条结果', time: '1339ms', type: 'l'},
            {content: '用户开始向下滑动', time: '1400ms', type: 's'},
            {content: '第4条结果进入可视区域', time: '1482ms', type: 's'},
            {content: '用户继续向下滑动，在第4条结果停留962ms后离开', time: '2444ms', type: 'm'},
            {content: '用户滚动页面距顶部373px，第5, 6条结果进入可视区域', time: '2876ms', type: 'l'},
            {content: '用户在第6条结果点击了一下第1个按钮', time: '3014ms', type: 's'},
            {content: '页面弹出了一个浮层', time: '3020ms', type: 's'},
            {content: '用户看了一秒半后关了浮层', time: '3536ms', type: 'm'},
            {content: '用户卸载页面，这次搜索的时长为4321ms', time: '4321ms', type: 'm'},
            {content: '<a class="btn btn-success use-btn" href="#webb-use">我要使用</a>', time: '', type: 's'}
        ];
        var disp3 = [
            '结果页主模版为baidu，处在is环境，页码为1，左侧10条结果，右侧3条结果，屏幕分辨率为1920*1080，文档大小为1920*2559.',
            '左侧第一条结果模版名是bk_polysemy，资源号为91，是阿拉丁结果，主链为http://baike.baidu.com/view/1758.htm?fr=aladdin, 结果大小为538*169, 距离顶部138px，距离左侧121px, 7个子链，1张图片.',
            '其他结果.....',
            '相关推荐有9条，分别是: 朱丽倩, 刘德华电影全集, 刘德华演唱会, 刘向蕙, 刘德华被抓, 周润发, 周星驰, 成龙, 张柏芝惹怒刘德华.',
            '通用提示模版名为hint_toprq_tips，资源号为28300'
        ];
        var data4 = [
            {content: '<p class="query">q = 跑男</p>', time: '', type: 'm'},
            {content: '(直接进入结果页)，页面渲染完成，确认pv', time: '开始', type: 'l'},
            {content: '结果展现，展现<a class="disp-btn" data-q="5" href="javascript:;">详细信息</a>，左侧第1, 2条结果，右侧第1, 2条结果在可视区域', time: '539ms', type: 'l'},
            {content: '用户鼠标进入左侧第1条结果', time: '982ms', type: 's'},
            {content: '用户鼠标在左侧第1条结果停留1912ms后离开', time: '2894ms', type: 'm'},
            {content: '用户鼠标进入左侧第2条结果', time: '3002ms', type: 's'},
            {content: '用户鼠标在左侧第1条结果停留312ms后离开', time: '3314ms', type: 'm'},
            {content: '用户滚动页面距顶部573px，左侧第1条结果离开可视区域，第3, 4, 5, 6条结果进入可视区域', time: '4876ms', type: 'l'},
            {content: '用户鼠标进入右侧第2条结果', time: '5014ms', type: 's'},
            {content: '用户鼠标在左侧第3条结果停留322ms后离开', time: '5336ms', type: 'm'},
            {content: '页面失去焦点', time: '5337ms', type: 's'},
            {content: '页面失去焦点', time: '25337ms', type: 's'},
            {content: '用户卸载页面，检索时长539ms，在结果页页面停留5583ms', time: '26123ms', type: 'm'},
            {content: '<a class="btn btn-success use-btn" href="#webb-use">我要使用</a>', time: '', type: 's'}
        ];
        var disp4 = [
            '结果页主模版为baidu，处在is环境，页码为1，左侧10条结果，右侧3条结果，屏幕分辨率为1920*1080，文档大小为1920*2541.',
            '左侧第一条结果模版名是vd_variety，资源号为6869，是阿拉丁结果，主链为http://www.iqiyi.com/zongyi/bpbxd2.html, 结果大小为538*434, 距离顶部138px，距离左侧121px, 16个子链，5张图片.',
            '其他结果.....',
            '相关推荐有9条，分别是: 奔跑吧兄弟, 跑男中国版, 跑男第二季, 跑男来, 跑男2, running man, 跑男 running man, 跑男第一季, 韩版跑男遭恐吓.',
            '通用提示模版名为hint_toprq_tips，资源号为28300'
        ];
        var useData = [
                {content: '使用调研，明确是否满足需求，接口人:刘悦', time: 'step1', type: 'm'},
                {content: '发起日志使用权限申请，邮件发送经理，总监，ssg陈一凡', time: 'step2', type: 'm'},
                {content: '经理审批', time: 'step3', type: 's'},
                {content: '总监审批', time: 'step4',  type: 's'},
                {content: 'ssg陈一凡审批', time: 'step5',  type: 's'},
                {content: 'ubs提供数据接口，接口人:ubs马皓', time: 'step6', type: 'm'}
            ];
        $('.intro-wrap').fullpage({
            scrollingSpeed: 600,
            navigation: true,
            loopHorizontal: false,
            easing: 'easeInExpo',
            anchors: ['webb', 'webb-log', 'webb-test', 'webb-psid', 'webb-demo', 'psid-stat', 'webb-use'],
            navigationTooltips: [ '概述','webb日志', '日志体验', 'psid', 'psid demo', 'psid稳定性', '使用日志'],
            afterRender: function () {
                var $points = $('#fp-nav a span');
                $points.eq(0).css('background-color', 'rgba(61, 141, 0, 1)');
                $points.eq(1).css('background-color', 'rgba(45, 150, 180, 1)');
                $points.eq(2).css('background-color', 'rgba(111, 84, 153, 1)')
                $points.eq(3).css('background-color', 'rgba(183, 29, 62, 1)');
                $points.eq(4).css('background-color', 'rgba(230, 134, 0, 1)');
                $points.eq(5).css('background-color', 'rgba(151, 187, 205, 1)');
                $points.eq(6).css('background-color', 'rgba(111, 84, 153, 1)');
                $('.fp-prev').css({left: '50px', 'border-right-color': 'rgba(151,187,205, 1)'});
                $('.fp-next').css({right: '50px', 'border-left-color': 'rgba(151,187,205, 1)'});
                $('.fp-tooltip').css('color', '#666');
            },
            onLeave: function (i, n, d) {
                if (i === 3) {
                    $('.webb-test-title').css('display', 'block');
                    $('.webb-test-nav').css('top', '25%');
                    $('.webb-test-log').css('left', '50%').addClass('bg-blink');
                    $('.webb-test-user').removeClass('webb-animate-show').addClass('bg-blink');
                    $('.webb-timeline').css('display', 'none');
                    $('.webb-timeline-line').css('width', '0');
                    if (timeline) {
                        timeline.destory();
                        timeline = null;
                    }
                }
                if (i === 5) {
                    $('.psid-before').removeClass('webb-animate-show');
                    $('.psid-after').removeClass('webb-animate-show');
                    $('.psid-line-title').removeClass('webb-animate-show');
                    $('.psid-line-arrow').css('width', '0');
                    $('.psid-line-des').removeClass('webb-animate-show');
                }
                if (i === 7) {
                    $('.webb-use').css('display', 'none');
                    $('.webb-use-line').css('width', '0');
                }
            },
            afterLoad: function (l, i) {
                if (i === 3) {
                    $('.webb-test-log').trigger('click');
                }
                if (i === 5) {
                    $('.psid-before').addClass('webb-animate-show');
                    $('.psid-line-title').addClass('webb-animate-show').addClass('bg-blink');
                    $('.psid-line-title').trigger('click');
                }
                if (i === 7) {
                    $('.webb-use').css('display', 'flex');
                    var use = new Timeline('.webb-use-list', '.webb-use-wrap', '.webb-use-item', '.webb-use-left a', '.webb-use-right a', useData);
                    use.parseData();
                    $('.webb-use-line').animate({'width': '100%'}, 1000, 'easeInExpo', function () {
                        use.show();    
                    });
                }
            }
        });
        $('.webb-test-log').on('click', function () {
            $('.webb-test-title').css('display', 'none');
            $('.webb-test-nav').css('top', '74px');
            $('.webb-test-log').css('left', '70px');
            $('.webb-test-user').addClass('webb-animate-show');
            $(this).removeClass('bg-blink');
        });
        var timeline = null;
        $('.webb-test-user').on('click', function () {
            var i = $(this).index();
            $('.webb-test-user').addClass('bg-blink');
            $(this).removeClass('bg-blink');
            if (i === 1) {
                var tmpData = data;
            }else if (i === 2) {
                var tmpData = data1;
            }else if (i === 3) {
                var tmpData = data2;
            }else if (i === 4) {
                var tmpData = data3;
            }else if (i === 5) {
                var tmpData = data4;
            }
            $('.webb-timeline').css('display', 'none');
            $('.webb-timeline-line').css('width', '0');
            if (timeline) {
                timeline.destory();
            }
            $('.webb-timeline').css('display', 'flex');
            timeline = new Timeline('.webb-timeline-list', '.webb-timeline-wrap', '.webb-timeline-item', '.webb-timeline-left a', '.webb-timeline-right a', tmpData);
            timeline.parseData();
            $('.webb-timeline-line').animate({'width': '100%'}, 1500, 'easeInExpo', function () {
                timeline.show();    
            });
        });
        $('.webb-timeline').on('click','.disp-btn', function () {
            var q = $(this).attr('data-q');
            var html = '<div class="disp-alert alert alert-success alert-dismissible fade in" role="alert">' + 
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                    '<span aria-hidden="true">&times;</span>'+
                    '</button>' +
                    '<h4>展现详细信息</h4>';
            if (q === '1') {
                var dispData = disp;
            }else if (q === '2') {
                var dispData = disp1;
            }else if (q === '3') {
                var dispData = disp2;
            }else if (q === '4') {
                var dispData = disp3;
            }else if (q === '5') {
                var dispData = disp4;
            }
            for (var i in dispData){
                html += '<p>' + dispData[i] + '</p>';
            }
            html += '</div>';
            $('body').append(html);
        });

        $('.psid-line-title').on('click', function () {
            $('.psid-line-arrow').animate({'width': '100%'}, 500, 'easeInExpo', function () {
                $('.psid-after').addClass('webb-animate-show');
                $('.psid-line-des').addClass('webb-animate-show');
            });
            $(this).removeClass('bg-blink');
        });
        $('[data-toggle="tooltip"]').tooltip();
            var chartData = {
                labels: ['4/25','4/26','4/27','4/28','4/29','4/30','5/1','5/2','5/3','5/4','5/5','5/6','5/7','5/8','5/9','5/10','5/11','5/12','5/13','5/14','5/15','5/16','5/17','5/18','5/19','5/20','5/21','5/22','5/23','5/24','5/25','5/26','5/27','5/28','5/29','5/30','5/31','6/1','6/2','6/3','6/4','6/5','6/6','6/7','6/8','6/9','6/10','6/11','6/12','6/13','6/14','6/15','6/16','6/17','6/18','6/19','6/20','6/21','6/22','6/23','6/24','6/25','6/26','6/27','6/28'],
                datasets: [
                    {
                        fillColor: 'rgba(183, 29, 45, 0.5)',
                        strokeColor : 'rgba(183, 29, 45, 1)',
                        pointColor : 'rgba(183, 29, 45, 1)',
                        pointStrokeColor: '#fff',
                        data: [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,88.09,87.98,87.92,87.09,87.42,88.24,88.40,88.30,88.16,87.97,87.20,88.17,89.34,89.31,89.12,89.19,89.01,88.35,88.57,89.25,89.35,89.37,89.27,89.31,88.94,89.25,89.75,89.47,89.48,89.52,89.28,88.86,88.94,89.52,89.05,89.12,89.75,89.80,89.77,89.61,89.25,88.53,87.92,88.92,89.53,89.58,89.55]
                    },
                    {
                        fillColor: 'rgba(151, 187, 205, 0.5)',
                        strokeColor : 'rgba(151, 187, 205, 1)',
                        pointColor : 'rgba(151, 187, 205, 1)',
                        pointStrokeColor: '#fff',
                        data: [73.54,71.10,71.41,73.29,72.31,72.18,71.04,67.85,68.62,69.53,71.61,71.44,72.08,71.57,71.17,69.31,70.09,72.23,71.76,71.80,72.06,72.76,71.20,71.88,74.25,74.50,74.68,74.36,74.04,72.12,74.27,77.33,77.72,77.70,77.81,77.53,76.15,76.81,78.40,78.54,78.41,78.27,78.40,77.41,77.91,79.02,78.86,79.29,79.73,79.52,78.65,78.85,79.91,77.48,77.31,78.31,78.24,78.46,78.89,78.34,77.53,76.78,78.27,79.21,79.79,79.99]
                    }
                ]
            }
            var ctx = $('#myChart').get(0).getContext('2d');
            var c = new Chart(ctx).Line(chartData);
            var chartData1 = {
                labels: ['4/25','4/26','4/27','4/28','4/29','4/30','5/1','5/2','5/3','5/4','5/5','5/6','5/7','5/8','5/9','5/10','5/11','5/12','5/13','5/14','5/15','5/16','5/17','5/18','5/19','5/20','5/21','5/22','5/23','5/24','5/25','5/26','5/27','5/28','5/29','5/30','5/31','6/1','6/2','6/3','6/4','6/5','6/6','6/7','6/8','6/9','6/10','6/11','6/12','6/13','6/14','6/15','6/16','6/17','6/18','6/19','6/20','6/21','6/22','6/23','6/24','6/25','6/26','6/27','6/28'],
                datasets: [
                    {
                        fillColor: 'rgba(183, 29, 45, 0.5)',
                        strokeColor : 'rgba(183, 29, 45, 1)',
                        pointColor : 'rgba(183, 29, 45, 1)',
                        pointStrokeColor: '#fff',
                        data: [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,73.14,72.63,72.89,70.19,70.58,73.42,73.96,73.78,73.31,72.91,70.27,73.58,78.03,78.06,77.34,77.66,77.49,75.55,75.97,78.11,78.14,78.23,77.97,77.83,76.19,76.55,78.32,78.06,78.55,78.53,78.29,76.69,76.53,78.57,76.39,76.55,78.34,78.27,78.21,78.33,77.01,75.87,75.25,77.78,78.28,78.36,78.41]
                    },
                    {
                        fillColor: 'rgba(151, 187, 205, 0.5)',
                        strokeColor : 'rgba(151, 187, 205, 1)',
                        pointColor : 'rgba(151, 187, 205, 1)',
                        pointStrokeColor: '#fff',
                        data: [55.8,55.99,58.66,57.54,57.30,56.42,51.77,52.65,53.78,56.98,56.62,57.60,56.62,55.98,53.01,53.74,56.86,56.55,56.78,56.75,57.39,54.94,55.64,59.32,59.74,60.21,59.78,59.52,56.59,60.04,65.02,65.01,64.75,65.21,65.02,62.77,63.45,65.79,65.72,65.51,65.56,65.73,63.76,63.96,65.95,65.89,66.69,67.03,66.95,65.21,65.03,67.27,63.32,63.12,64.68,64.46,64.95,65.58,64.20,63.23,62.62,65.44,66.45,67.24,67.36]
                    }
                ]
            }
            var ctx1 = $('#myChart1').get(0).getContext('2d');
            var c1 = new Chart(ctx1).Line(chartData1);
            var grid = $('.webb-chart-grids');
            var label = $('.webb-chart-labels');
            for (var i = 0; i < 8; i++) {
                grid.append('<div class="webb-chart-grid"></div>');
                label.append('<div class="webb-chart-label">' + i * 5 + '</div>');
            }
            label.append('<div class="webb-chart-label-last">' + 40 + '</div>');
            var width = (grid.width() - 8) / 8;
            var baiduidWidth = 23 * (grid.width() - 8) / 40;
            var bidupsidWidth = 36 * (grid.width() -8) / 40;
            $('.webb-chart-grid').css({'width': width});
            $('.webb-chart-label').css({'width': width - 1});
            $('.webb-chart-baiduid').css({'width': baiduidWidth});
            $('.webb-chart-bidupsid').css({'width': bidupsidWidth});
    });
