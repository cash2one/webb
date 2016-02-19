{%extends "base.tpl"%}
{%block name="title"%}Webb日志简介{%/block%}
{%block name="css"%}
<style>
    @keyframes textOpacity{
        0% {opacity: 0.5;}
        100% {opacity: 1;}
    }
    @-webkit-keyframes textOpacity{
        0% {opacity: 0.3;}
        100% {opacity: 1;}
    }
    .text-blink{
        animation-name: textOpacity;
        animation-duration: 400ms;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        -webkit-animation-name: textOpacity;
        -webkit-animation-duration: 400ms;
        -webkit-animation-timing-function: linear;
        -webkit-animation-iteration-count: infinite;
        -webkit-animation-direction: alternate;
    }
    @keyframes bgShadow{
        0% {box-shadow: 0 0 5px 5px rgba(110, 110, 110, 0);}
        50% {box-shadow: 0 0 5px 5px rgba(110, 110, 110, 0.5)}
        100% {box-shadow: 0 0 5px 5px rgba(110, 110, 110, 1)}
    }
    @-webkit-keyframes bgShadow{
        0% {box-shadow: 0 0 5px 5px rgba(110, 110, 110, 0);}
        50% {box-shadow: 0 0 5px 5px rgba(110, 110, 110, 0.5)}
        100% {box-shadow: 0 0 5px 5px rgba(110, 110, 110, 1)}
    }
    .bg-blink{
        animation-name: bgShadow;
        animation-duration: 800ms;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        -webkit-animation-name: bgShadow;
        -webkit-animation-duration: 800ms;
        -webkit-animation-timing-function: linear;
        -webkit-animation-iteration-count: infinite;
        -webkit-animation-direction: alternate;
    }
    .query{font-size: 26px;height: 100%;line-height: 75px;}
    .section{overflow: hidden;}
    body{background-image: -webkit-radial-gradient(center,#f5f5f5 30%, #c2d3ce 100%);background-image: -moz-radial-gradient(center,#f5f5f5 30%, #c2d3ce 100%);background-image: -ms-radial-gradient(center,#f5f5f5 30%, #c2d3ce 100%);background-image: radial-gradient(center,#f5f5f5 30%, #c2d3ce 100%);}
    .webb-section{font-family: '方正兰亭黑', 'Microsoft YaHei', Helvetica;width: 950px;height: 550px;position: relative;margin: 80px auto;}
    .section1{background-image: url(/static/img/webb-p1.png);}
    .section2{background-image: url(/static/img/webb-p2.png);}
    .section3{background-image: url(/static/img/webb-p3.png);}
    .section4{background-image: url(/static/img/webb-p4.png);}
    .webb-part{position: absolute;z-index: 2;text-align: center;}
    .webb-part p{margin: 0 auto;}
    .webb-white-s{font-size: 16px;height: 20px;line-height: 20px;color: #fff;}
    .webb-white-l{font-size: 30px;height: 40px;line-height: 40px;color: #fff;font-weight: bold;}
    .webb-white-lg{font-size: 38px;height: 40px;line-height: 40px;color: #fff;font-weight: bold;}
    .webb-gray-m{font-size: 14px;height: 20px;line-height: 20px;color: #666;}
    .webb-gray-xs{font-size: 14px;height: 20px;line-height: 20px;color: #666;}
    .webb-gray-s{font-size: 16px;height: 20px;line-height: 20px;color: #666;}
    .webb-gray-lg{font-size: 38px;height: 40px;line-height: 40px;color: #666;font-weight: bold;}
    .webb-gray-l{font-size: 26px;height: 40px;line-height: 40px;color: #666;font-weight: bold;}
    .webb-p1{top: 130px;left: 290px;width: 160px;height: 60px;}
    .webb-p2{top: 258px;left: 488px;width: 180px;height: 50px;text-align:left;}
    .webb-p2 p{margin-bottom: 5px;text-align: left;}
    .webb-p2 ul{padding-left: 20px;}
    .webb-p3{top: 362px;left: 707px;width: 120px;height: 40px;}
    .webb-p4{top: 110px;left: 355px;width: 160px;height: 40px;}
    .test-btn, .test-psid{font-size: 30px;}
    .use-btn{margin: 26px 14px;}
    .disp-alert{position: absolute;width: 60%;left: 20%;height: 50%;top: 25%;z-index: 100;}
    .disp-alert p{font-size: 12px;line-height: 20px;}
    .webb-p5{top: 210px;left: 165px;width: 160px;height: 60px;}
    .webb-p6{top: 322px;left: 732px;width: 160px;height: 60px;}
    .webb-p7{top: 210px;left: 530px;width: 180px;height: 60px;}
    .webb-p8{top: 310px;left: 355px;width: 160px;height: 60px;}
    .webb-p9{top: 125px;left: 335px;width: 160px;height: 80px;}
    .webb-p10{top: 335px;left: 340px;width: 160px;height: 50px;}
    .webb-p11{top: 225px;left: 520px;width: 160px;height: 50px;}
    .webb-p12{top: 195px;left: 310px;width: 160px;height: 40px;}
    .webb-p13{top: 415px;left: 310px;width: 160px;height: 40px;}
    .webb-p14{top: 315px;left: 500px;width: 160px;height: 40px;}
    .webb-p15{top: 105px;left: 500px;width: 160px;height: 40px;}
    .webb-case1{top: 345px;left: 200px;width: 160px;height: 180px;text-align: left;display: none;}
    .webb-case2{top: 345px;left: 930px;width: 160px;height: 140px;text-align: left;display: none;}
    .webb-case3{top: 345px;left: 570px;width: 160px;height: 160px;text-align: left;display: none;}
    .webb-case4{top: 460px;left: 365px;width: 160px;height: 40px;text-align: left;}
    .webb-case5{top: 355px;left: 545px;width: 180px;height: 160px;text-align: left;}
    .webb-case6{top: 440px;left: 150px;width: 130px;height: 160px;text-align: left;}
    .webb-case7{top: 432px;left: 520px;width: 140px;height: 160px;text-align: left;}
    .webb-case7 ul{padding-left: 15px;}
    .webb-case8{top: 120px;left: 690px;width: 140px;height: 60px;text-align: left;}
    .webb-slide-point1 span{background-color: rgba(183, 29, 62, 1);}
    .webb-slide-point2 span{background-color: rgba(45, 150, 180, 1);}
    .webb-slide-point3 span{background-color: rgba(61, 141, 0, 1);}
    .webb-slide-point4 span{background-color: rgba(230, 134, 0, 1);}
    .section-wrap{width: 100%;height: 100%;}
    .section-wrap .container-fluid, .section-wrap .row, .section-wrap .col-lg-8{height: 100%;}
    .webb-test{width: 100%;height: 100%;overflow: hidden;}
    .webb-test-title, .webb-use-title{width: 100%;color: #666;font-size: 36px;height: 80px;line-height: 80px;text-align: center;font-family: '方正兰亭黑', 'Microsoft YaHei', Helvetica;}
    .webb-test-nav{width: 100%;position: relative;top: 25%;}
    .webb-use-nav{width: 100%;margin-top: 140px;}
    .webb-test-area, .webb-use-area{width: 100%;height: 140px;margin: 0 auto;text-align: center;position: relative;}
    .webb-test-log {display: block;position: absolute;z-index: 4;width: 140px;height: 140px;border-radius: 50%;background-color: #6f5499;left: 50%;margin-left: -70px;text-decoration: none;}
    .webb-test-log:hover{text-decoration: none;}
    .webb-test-log i{font-size: 60px;margin: 20px 40px 0px 40px;color: #fff;}
    .webb-test-log p{width: 100%;height: 30px;line-height: 30px;text-align: center;color: #fff;font-family: '方正兰亭黑', 'Microsoft YaHei', Helvetica;}
    .webb-test-user {display: block;opacity: 0;transform: translate3d(-30px, 0, 0);width: 90px;height: 90px;border-radius: 50%;margin: 25px 15px;position: absolute;text-decoration: none;}
    .webb-test-query {display: none;width: 360px;height: 90px;margin: 25px 15px;position: absolute;left: 540px;color: #666;font-size: 30px;line-height: 90px;}
    .webb-test-user:hover{text-decoration: none;}
    .webb-test-user i{font-size: 40px;margin: 10px 25px 0px 25px;color: #fff;}
    .webb-test-user p{width: 100%;height: 30px;line-height: 30px;text-align: center;color: #fff;}
    .webb-test-user1{left: 195px;}
    .webb-test-user2{left: 310px;}
    .webb-test-user3{left: 425px;}
    .webb-test-user4{left: 540px;}
    .webb-test-user5{left: 655px;}
    .webb-timeline, .webb-use{width: 100%;height: 300px;margin-top: 140px;display: none;}
    .webb-use{margin-top: 40px;}
    .webb-timeline-left, .webb-timeline-right, .webb-use-left, .webb-use-right{position: absolute;text-align:center;width:50px;height: 300px;}
    .webb-timeline-left a,.webb-timeline-right a, .webb-use-left a, .webb-use-right a{width: 50px;height: 50px;display: none;font-size: 30px;color: #6f5499;text-decoration: none;line-height: 50px;margin-top: 125px;}
    .webb-timeline a:hover, .webb-use a:hover{text-decoration: none;}
    .webb-timeline-left, .webb-use-left{left: -50px;}
    .webb-timeline-right, .webb-use-right{right: -50px;}
    .webb-timeline-list, .webb-use-list{width: 100%;margin: 0;height: 100%;position: relative;overflow: hidden;}
    .webb-timeline-line, .webb-use-line{position: absolute;top: 50%;left: 0;margin-top: -2px;background-color: #6f5499;width: 0;height: 4px;border-radius: 2px;display: block;}
    .webb-timeline-wrap, .webb-use-wrap{width: 100%;height: 100%;position: relative;}
    .webb-animate{transition: 350ms all cubic-bezier(0.25, 0.46, 0.33, 0.98);}
    .webb-animate-show{opacity: 1!important;transform: translate3d(0, 0, 0)!important;}
    .webb-delay1{transition-delay: 350ms;}
    .webb-delay2{transition-delay: 700ms;}
    .webb-delay3{transition-delay: 1050ms;}
    .webb-delay4{transition-delay: 1400ms;}
    .webb-timeline-item, .webb-use-item{float: left;position: relative;}
    .webb-timeline-item div, .webb-use-item div{position: absolute;z-index: 3;}
    .webb-timeline-l, .webb-use-l{width: 300px;height: 100%;}
    .webb-timeline-m, .webb-use-m{width: 220px;height: 100%;}
    .webb-timeline-s, .webb-use-s{width: 140px;height: 100%;}
    .webb-timeline-content, .webb-use-content{word-wrap: break-word;width: 100%;height: 110px;background-color: #fff;padding: 15px 15px 1px;border-radius: 3px;opacity: 0;font-family: '方正兰亭黑', 'Microsoft YaHei', Helvetica;}
    .webb-timeline-content:before, .webb-timeline-content:after, .webb-use-content:before, .webb-use-content:after{content: "";position: absolute;width: 0;height: 0;}
    .webb-timeline-t .webb-timeline-content, .webb-use-t .webb-use-content{top: 0;box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);transform:translate3d(0, -30px, 0);}
    .webb-timeline-t .webb-timeline-content:before, .webb-use-t .webb-use-content:before{left: 36px;bottom: -24px;border: 12px solid transparent;border-top: 12px solid #ddd;}
    .webb-timeline-t .webb-timeline-content:after, .webb-use-t .webb-use-content:after{left: 38px;bottom: -20px;border: 10px solid transparent;border-top: 10px solid #fff;}
    .webb-timeline-b .webb-timeline-content, .webb-use-b .webb-use-content{bottom: 0;box-shadow: 0 -1px 2px rgba(0, 0, 0, 0.1);transform:translate3d(0, 30px, 0)}
    .webb-timeline-b .webb-timeline-content:before, .webb-use-b .webb-use-content:before{left: 36px;top: -24px;border: 12px solid transparent;border-bottom: 12px solid #ddd;}
    .webb-timeline-b .webb-timeline-content:after, .webb-use-b .webb-use-content:after{left: 38px;top: -20px;border: 10px solid transparent;border-bottom: 10px solid #fff;}
    .webb-timeline-icon, .webb-use-icon{position: absolute;left: 30px;top: 50%;margin-top: -20px;width: 40px;height: 40px;border-radius: 50%;background-color: #fff;text-align: center;box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);overflow: hidden;padding: 3px;opacity: 0;}
    .webb-timeline-bg, .webb-use-bg{width: 34px;height: 34px;border-radius: 50%;line-height: 34px;font-size: 16px;}
    .webb-timeline-bg0, .webb-use-bg0, .webb-test-user1{background-color: #b71d3e;}
    .webb-timeline-bg1, .webb-use-bg1, .webb-test-user2{background-color: #2d96b4;}
    .webb-timeline-bg2, .webb-use-bg2, .webb-test-user3{background-color: #3d8d00;}
    .webb-timeline-bg3, .webb-use-bg3, .webb-test-user4{background-color: #c68600;}
    .webb-test-user5{background-color: #6f5499;}
    .webb-timeline-bg i, .webb-use-bg i{color: #fff;}
    .webb-timeline-time, .webb-use-time{width: 100px;height: 30px;color: #666;left: 30px;line-height: 30px;opacity: 0;}
    .webb-timeline-t .webb-timeline-time, .webb-use-t .webb-use-time{top: 50%;margin-top: 20px;transform:translate3d(0, 30px, 0);}
    .webb-timeline-b .webb-timeline-time, .webb-use-b .webb-use-time{bottom: 50%;margin-bottom: 20px;transform:translate3d(-30px, 0, 0);}
    .webb-section-psid{width: 100%;height: 360px;text-align: center;}
    .psid-title{width: 100%;height: 60px;line-height: 60px;font-size: 30px;color: #666;text-align: center;font-family: '方正兰亭黑', 'Microsoft YaHei', Helvetica;}
    .psid-demo-area{width: 1000px;height: 300px;margin: 0 auto;}
    .psid-before, .psid-after{opacity: 0;transform:translate3d(-30px, 0, 0);width: 300px;height: 300px;float: left;}
    .psid-user-know, .psid-user-unknow{width: 50px;height: 50px;border-radius: 50%;padding: 12px;margin: 5px;float: left;}
    .psid-user-know{background-color: rgba(230, 134, 0, 1);}
    .psid-user-unknow{background-color: rgba(111, 111, 111, 1);}
    .psid-user-know i, .psid-user-unknow i{font-size: 26px;color: #fff;}
    .psid-line{width: 400px;height: 300px;position: relative;float: left;}
    .psid-line-arrow{position: absolute;z-index: 4;top: 50%;width: 0%;height: 4px;margin-top: -2px;background-color: #6f5499;}
    .psid-line-title{opacity:  0;transform:translate3d(-30px, 0, 0);width: 70px;height: 70px;border-radius: 50%;position: absolute;z-index: 5;top: 50%;margin-top: -35px;left: 50%;margin-left: -35px;}
    .psid-line-title:hover{text-decoration: none;}
    .psid-line-inner{width: 70px;height: 70px;border-radius: 50%;line-height: 70px;background-color: #2d96b4;text-align: center;color: #fff;;}
    .psid-line-des{opacity:  0;transform:translate3d(-30px, 0, 0);width: 100%;height: 40px;line-height: 40px;text-align: center;color: #666;position: absolute;z-index: 5;top: 70%;font-family: '方正兰亭黑', 'Microsoft YaHei', Helvetica;}
    #myChart, #myChart1{width: 100%; height: 400px;}
    .webb-chart-des{width: 100%;height: 40px;margin: 10px auto;padding-left: 22px;}
    .webb-chart-des span{display: block;width: 15px;height: 21px;float: left;}
    .webb-chart-des1,.webb-chart-des2, .webb-chart-des3{width: 200px;float:left;}
    .webb-chart-des1 span{border-bottom: 2px solid rgba(183, 29, 45, 1);}
    .webb-chart-des2 span{border-bottom: 2px solid rgba(151, 187, 205, 1);}
    .webb-chart-title{height: 40px;line-height: 40px;text-indent: 1em;}
    #myChart2{width: 100%;height: 385px;border-left: #ccc solid 1px;border-bottom: #ccc solid 1px;}
    .webb-chart-area{width: 100%;height: 377px;overflow: hidden;}
    .webb-chart-baiduid{width: 0;height: 40px;line-height: 40px;margin-top: 152px;background-color: rgba(151, 187, 205, 0.7);border: rgba(151, 187, 205, 1) solid 2px;border-left-width: 0;}
    .webb-chart-bidupsid{width: 0;height: 40px;line-height: 40px;margin-top: 10px;background-color: rgba(183, 29, 45, 0.7);border: rgba(183, 29, 45, 1) solid 2px;border-left-width: 0;}
    .webb-chart-baiduid p, .webb-chart-bidupsid p{float: right;margin-right: -40px;}
    .webb-chart-grids{width: 100%;height: 8px;}
    .webb-chart-grid{width: 0;height: 100%;float: left;border-right: #ccc solid 1px;}
    .webb-chart-labels{width: 100%;height: 15px;margin-top: 5px;margin-left: 1px;}
    .webb-chart-label{width: 0;height: 100%;float: left;text-align: left;}
    .webb-chart-label-last{height: 100%;float: left;text-align: left;}
</style>
<link href="/static/css/jquery.fullPage.css" rel="stylesheet"/>
{%/block%}
{%block name="navColor"%}#666{%/block %}
{%block name="home"%}select-item{%/block%}
{%block name="content"%}
<div class="intro-wrap">
    <div class="section">
        <div class="webb-section section3">
            <div class="webb-part webb-p9">
                <p class="webb-white-lg">Webb</p>
            </div>
            <div class="webb-part webb-p10">
                <a href="#webb-psid" class="webb-gray-lg">PSID</a>
            </div>
            <div class="webb-part webb-case4">
                <p class="webb-gray-xs">准确标识访问用户</p>
            </div>
            <div class="webb-part webb-case5">
                <p class="webb-gray-xs">纪录用户真实所见</p>
                <p class="webb-gray-xs">完整回放用户检索现场</p>
                <p class="webb-gray-xs">精确纪录用户浏览操作细节</p>
            </div>
            <div class="webb-part webb-p11">
                <a href="#webb-log" class="webb-gray-lg">日志</a>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="webb-section section2">
            <div class="webb-part webb-p4">
                <p class="webb-white-l">Webb日志</p>
            </div>
            <div class="webb-part webb-p5">
                <p class="webb-gray-l">展现信息</p>
                <p class="webb-gray-xs">纪录用户真实所见</p>
            </div>
            <div class="webb-part webb-case1">
                <p class="webb-gray-xs">检索完成</p>
                <p class="webb-gray-xs">结果页呈现</p>
                <p class="webb-gray-xs">页面主模版为baidu</p>
                <p class="webb-gray-xs">处于is环境</p>
                <p class="webb-gray-xs">左侧10结果，右侧2条结果</p>
                <p class="webb-gray-xs">每条结果宽高，位置</p>
                <p class="webb-gray-xs">结果模版名，资源号</p>
                <p class="webb-gray-xs">图片、子链信息</p>
                <p class="webb-gray-xs">...</p>
            </div>
            <div class="webb-part webb-p6">
                <a role="button" class="btn btn-danger test-btn" href="#webb-test">立即体验</a>
            </div>
            <div class="webb-part webb-case2">
                <p class="webb-gray-xs">t0 进入搜索框</p>
                <p class="webb-gray-xs">t1 发送sug请求</p>
                <p class="webb-gray-xs">t2 sug请求成功</p>
                <p class="webb-gray-xs">t3 展现空框sug</p>
                <p class="webb-gray-xs">t4 键盘选择sug</p>
                <p class="webb-gray-xs">t5 继续输入若干字符</p>
                <p class="webb-gray-xs">t6 按回车检索</p>
            </div>
            <div class="webb-part webb-p7">
                <p class="webb-gray-l">浏览行为信息</p>
                <p class="webb-gray-xs">精确捕捉用户浏览操作</p>
            </div>
            <div class="webb-part webb-case3">
                <p class="webb-gray-xs">检索完成</p>
                <p class="webb-gray-xs">结果页面展现</p>
                <p class="webb-gray-xs">结果ABC在可视区域</p>
                <p class="webb-gray-xs">用户滚动、缩放页面</p>
                <p class="webb-gray-xs">结果AB移出可视区域</p>
                <p class="webb-gray-xs">结果DE进入可视区域</p>
                <p class="webb-gray-xs">用户滑动鼠标</p>
                <p class="webb-gray-xs">在结果C上停留n毫秒</p>
            </div>
            <div class="webb-part webb-p8">
                <p class="webb-gray-l">搜索框信息</p>
                <p class="webb-gray-xs">完整纪录用户检索过程</p>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="section-wrap">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="webb-test-nav webb-animate">
                            <div class="webb-test-title">产品体验</div>
                            <div class="webb-test-area">
                                <a href="javascipt:;" class="webb-test-log webb-animate webb-delay1 bg-blink">
                                    <i class="glyphicon glyphicon-cloud"></i>
                                    <p>日志体验</p>
                                </a>
                                <a class="webb-test-user webb-test-user1 webb-animate webb-delay2 bg-blink" href="javascript:;">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <p>用户A</p>
                                </a>
                                <a class="webb-test-user webb-test-user2 webb-animate webb-delay2 bg-blink" href="javascript:;">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <p>用户B</p>
                                </a>
                                <a class="webb-test-user webb-test-user3 webb-animate webb-delay2 bg-blink" href="javascript:;">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <p>用户C</p>
                                </a>
                                <a class="webb-test-user webb-test-user4 webb-animate webb-delay2 bg-blink" href="javascript:;">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <p>用户D</p>
                                </a>
                                <a class="webb-test-user webb-test-user5 webb-animate webb-delay2 bg-blink" href="javascript:;">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <p>用户E</p>
                                </a>
                                <p class="webb-test-query">q = java</p>
                            </div>
                        </div>
                        <div class="webb-timeline">
                            <div class="webb-timeline-left">
                                <a href="javascript:;" class="glyphicon glyphicon-menu-left text-blink"></a>
                            </div>
                            <div class="webb-timeline-list">
                                <div class="webb-timeline-wrap">
                                    <div class="webb-timeline-line"></div>
                                </div><!--wrap-->
                            </div>
                            <div class="webb-timeline-right">
                                <a href="javascript:;" class="glyphicon glyphicon-menu-right text-blink"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="webb-section section1">
            <div class="webb-part webb-p1">
                <p class="webb-white-l">PSID</p>
            </div>
            <div class="webb-part webb-p2">
                <p class="webb-gray-s">稳定、准确标识访问用户</p>
            </div>
            <div class="webb-part webb-p3">
                <a href="#webb-demo" role="button" class="btn btn-success test-psid">观看演示</a>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="webb-section-psid">
            <div class="psid-title">PSID演示</div>
            <div class="psid-demo-area">
                <div class="psid-before webb-animate">
                    {%foreach range(0, 24) as $i%}
                    {%if $i < 18%}
                    <div class="psid-user-know" data-toggle="tooltip" data-placement="top" title="稳定用户">
                        <i class="glyphicon glyphicon-user"></i>
                    </div>
                    {%else%}
                    <div class="psid-user-unknow" data-toggle="tooltip" data-placement="top" title="不稳定用户">
                        <i class="glyphicon glyphicon-user"></i>
                    </div>
                    {%/if%}
                    {%/foreach%}
                </div>
                <div class="psid-line">
                    <div class="psid-line-arrow"></div>
                    <a href="javascript:;" class="psid-line-title webb-animate bg-blink">
                        <div class="psid-line-inner">PSID</div>
                    </a>
                    <p class="psid-line-des webb-animate webb-delay1">大幅提高用户标识稳定性</p>
                </div>
                <div class="psid-after webb-animate webb-delay1">
                    {%foreach range(0, 24) as $i%}
                    {%if $i < 23%}
                    <div class="psid-user-know" data-toggle="tooltip" data-placement="top" title="稳定用户">
                        <i class="glyphicon glyphicon-user"></i>
                    </div>
                    {%else%}
                    <div class="psid-user-unknow" data-toggle="tooltip" data-placement="top" title="不稳定用户">
                        <i class="glyphicon glyphicon-user"></i>
                    </div>
                    {%/if%}
                    {%/foreach%}
                </div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="slide">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <h4 id="psid-attitude">老用户PV在全部PV中的占比情况</h4>
                        <canvas id="myChart"></canvas>
                        <div class="webb-chart-des">
                            <div class="webb-chart-des1">
                                <span></span>
                                <div class="webb-chart-title">以BIDUPSID识别老用户PV</div>
                            </div>
                            <div class="webb-chart-des2">
                                <span></span>
                                <div class="webb-chart-title">以BAIDUID识别老用户PV</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
            </div>
        </div>
        <div class="slide">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <h4 id="psid-attitude">baiduid、bidupsid全量uv稳定性对比</h4>
                        <canvas id="myChart1"></canvas>
                        <div class="webb-chart-des">
                            <div class="webb-chart-des1">
                                <span></span>
                                <div class="webb-chart-title">bidupsid全量uv稳定性</div>
                            </div>
                            <div class="webb-chart-des2">
                                <span></span>
                                <div class="webb-chart-title">baiduid全量uv稳定性</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
            </div>
        </div>
        <div class="slide">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <h4 id="psid-attitude">用户留存时间对比</h4>
                        <!-- <canvas id="myChart2"></canvas> -->
                        <div id="myChart2" class="webb-chart">
                            <div class="webb-chart-area">
                                <div class="webb-chart-baiduid"><p>23天</p></div>
                                <div class="webb-chart-bidupsid"><p>36天</p></div>
                            </div>
                            <div class="webb-chart-grids"></div>
                        </div>
                        <div class="webb-chart-labels"></div>
                        <div class="webb-chart-des">
                            <div class="webb-chart-des1">
                                <span></span>
                                <div class="webb-chart-title">以BIDUPSID标识用户</div>
                            </div>
                            <div class="webb-chart-des2">
                                <span></span>
                                <div class="webb-chart-title">以BAIDUID标识用户</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="section-wrap">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="webb-use-nav webb-animate">
                            <div class="webb-use-title">使用流程</div>
                        </div>
                        <div class="webb-use">
                            <div class="webb-use-left">
                                <a href="javascript:;" class="glyphicon glyphicon-menu-left text-blink"></a>
                            </div>
                            <div class="webb-use-list">
                                <div class="webb-use-wrap">
                                    <div class="webb-use-line"></div>
                                </div><!--wrap-->
                            </div>
                            <div class="webb-use-right">
                                <a href="javascript:;" class="glyphicon glyphicon-menu-right text-blink"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
        </div>
    </div>
</div>
{%/block%}
{%block name="js"%}
    <script src="/static/js/jquery.easing.js"></script>
    <script src="/static/js/jquery.fullPage.js"></script>
    <script src="/static/js/Chart.min.js"></script>
    <script src="/static/js/timeline.js"></script>
    <script src="/static/js/home.js"></script>
{%/block%}
