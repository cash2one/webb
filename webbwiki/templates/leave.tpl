{% extends "base.html" %}
{%block name="title"%}Webb日志{/dblock%}
{%block name="css"%}
<style>
    .section{overflow: hidden;background-image: url(/static/img/bg.png);background-size: cover;}
    .webb-section{font-family: '方正兰亭黑', 'Microsoft YaHei', Helvetica;width: 950px;height: 550px;position: relative;margin: 80px auto;}
    .webb-record{width: 100%;height: 82px;margin-top: 100px;}
    .webb-user, .webb-query{float: left;}
    .webb-user{width: 85px;height: 82px;margin-right: 50px;background: url(/static/img/user-1.png);}
    .webb-query{width: 102px;height: 70px;margin-top: 6px;background: url(/static/img/query-1.png);color: #fff;font-size: 12px;opacity: 0;transform:translate3d(-30px, 0, 0)}
    .webb-query-1{transition: 700ms all cubic-bezier(0.25, 0.46, 0.33, 0.98);}
    .webb-query-2{transition: 700ms 700ms all cubic-bezier(0.25, 0.46, 0.33, 0.98);}
    .webb-query-3{transition: 700ms 1400ms all cubic-bezier(0.25, 0.46, 0.33, 0.98);}
    .webb-query-4{transition: 700ms 2100ms all cubic-bezier(0.25, 0.46, 0.33, 0.98);}
    .webb-query-5{transition: 700ms 2800ms all cubic-bezier(0.25, 0.46, 0.33, 0.98);}
    .webb-query-t, .webb-query-q{width: 100%;height: 35px;line-height: 35px;text-align: center;}
    .webb-query-q, .webb-query-q:hover{display: block;text-decoration: none;color: #fff;}
    .webb-replay{width: 100%;margin-top: 20px;font-size: 12px;}
    .webb-replay-area{margin-left: 135px;}
    .webb-replay-area p{height: 20px;line-height: 20px;margin: 0;}
    .webb-replay-info{color: #fff;}
    .webb-replay-comment{color: #ccc;}
</style>
<link src="/css/fullPage.css" rel="stylesheet"/>
{%/block%}
{%block name="navColor"%}#fff{%/block%}
{%block name="content"%}
<div class="intro-wrap">
    <div class="section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div class="webb-record">
                        <div class="webb-user"></div>
                        <div class="webb-query webb-query-1">
                            <div class="webb-query-t">10:21</div>
                            <a href="javascript:;" class="webb-query-q">去哪儿</a>
                        </div>
                        <div class="webb-query webb-query-2">
                            <div class="webb-query-t">10:47</div>
                            <a href="javascript:;" class="webb-query-q">上海</a>
                        </div>
                        <div class="webb-query webb-query-3">
                            <div class="webb-query-t">10:56</div>
                            <a href="javascript:;" class="webb-query-q">12306</a>
                        </div>
                        <div class="webb-query webb-query-4">
                            <div class="webb-query-t">16:01</div>
                            <a href="javascript:;" class="webb-query-q">刷票</a>
                        </div>
                        <div class="webb-query webb-query-5">
                            <div class="webb-query-t">22:01</div>
                            <a href="javascript:;" class="webb-query-q">黄牛</a>
                        </div>
                    </div>
                    <div class="webb-replay">
                        <div class="webb-replay-area">
                            <p class="webb-replay-comment">// q = 去哪儿</p>
                            <p class="webb-replay-info">进入搜索框，发送sug请求</p>
                            <p class="webb-replay-info">sug请求成功并返回数据</p>
                            <p class="webb-replay-info">空框sug展现，展现4条历史sug，内容为“javascript”，“webkit”，“好玩的城市”，“上海”</p>
                            <p class="webb-replay-info">用户输入法中输入字符“去”,发送sug请求,is预取“去哪儿网”</p>
                            <p class="webb-replay-info">sug请求成功并返回数据，空框sug隐藏</p>
                            <p class="webb-replay-info">sug展现，内容为“去哪儿网”，“去哪儿网特价机票查询”，“去哪儿特价机票”，“去哪儿”</p>
                            <p class="webb-replay-info">页面渲染完成，左侧10条结果，右侧2条结果，<a class="webb-poper" href="javascript:;" data-webb="0">每条结果详细信息</a>....</p>
                            <p class="webb-replay-info">用户可看到左侧前两条结果，右侧第一条结果</p>
                            <p class="webb-replay-info">用户将鼠标移入第一条结果，点击第一条结果</p>
                            <p class="webb-replay-info">...</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </div>
    <div class="section"></div>
</div>
{%/block%}
{%block name="js"%}
    <script src="/js/jquery.easing.js"></script>
    <script src="/js/jquery.fullPage.js"></script>
    <script>
    $(document).ready(function () {
        $('.intro-wrap').fullpage({
            scrollingSpeed: 600,
            navigation: true,
            easing: 'easeInExpo',
            navigationTooltips: ['用户日志', 'psid'],
            afterRender: function () {
                var $points = $('#fp-nav a span');
                $points.eq(0).css('background-color', 'rgba(183, 29, 62, 1)');
                $points.eq(1).css('background-color', 'rgba(45, 150, 180, 1)');
                //$points.eq(2).css('background-color', 'rgba(61, 141, 0, 1)');
                //$points.eq(3).css('background-color', 'rgba(230, 134, 0, 1)');
                $('.fp-tooltip').css('color', '#666');
            }
        });
        $('.webb-poper').popover({container: 'body',trigger: 'hover', title: '结果展现信息', content: '第一条结果是阿拉丁结果，高600px，宽425px,....'});
        $('.webb-query').css({'opacity': 1, 'transform': 'translate3d(0, 0, 0)'});
    });
    </script>
{%/block%}
