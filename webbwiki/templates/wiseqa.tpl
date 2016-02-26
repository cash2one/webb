{%extends "base.tpl" %}
{%block name="title"%}深入了解移动版Webb日志{%/block%}
{%block name="css"%}
    <style>
        .webb-doc-header{width: 100%;height: 120px; margin-top: 80px;background-color: #6f5499;}
        .webb-doc-des h3{color: #fff;}
        .webb-doc-des p{color: #cdbfe3;}
        .webb-demo-png{width: 100%;}
        .webb-guid{margin-top: 20px;}
        .webb-guid li {margin: 5px auto;}
        .webb-guid li ul{display: none;}
        .webb-guid li.active ul{display: block;}
        .nav li a{padding: 0 15px;color: #767676;border-left: 2px solid #fff;}
        .webb-guid li ul a{padding-left: 28px;}
        .webb-guid .active>a{color: #563d7c;border-left: 2px solid #563d7c;}
        .webb-guid .webb-back-top{margin-top: 15px;}
        .webb-guid .active .webb-back-top{color: #767676;border-left: 2px solid #fff;}
        .webb-guid.affix-top{top: 220px;}
        .webb-guid.affix{top: 0px;}
        .webb-wiki-section{width: 100%;margin: 0 auto 50px auto;}
        .webb-owner{padding: 20px;margin: 20px 0;border: 1px solid #eee;border-left-width: 5px;border-radius: 3px;}
        #owner-webb-fe{border-left-color: #1b809e;}
        #owner-webb-fe h4{color: #1b809e;}
        #owner-webb-ubs{border-left-color: #3d8d00;}
        #owner-webb-ubs h4{color: #3d8d00;}
        #owner-psid-fe{border-left-color: #ce4844;}
        #owner-psid-fe h4{color: #ce4844;}
        .webb-footer{text-align: center;border-top: 1px solid #e5e5e5;height: 80px;background-color: #f5f5f5;}
        .webb-footer p{line-height: 80px;}
        #myChart, #myChart1{width: 100%; height: 400px;}
        .webb-chart-des{width: 100%;height: 40px;margin: 10px auto;padding-left: 22px;}
        .webb-chart-des span{display: block;width: 15px;height: 21px;float: left;}
        .webb-chart-des1,.webb-chart-des2{width: 180px;float:left;}
        .webb-chart-des1 span{border-bottom: 2px solid rgba(220, 220, 220, 1);}
        .webb-chart-des2 span{border-bottom: 2px solid rgba(151, 187, 205, 1);}
        .webb-chart-title{height: 40px;line-height: 40px;text-indent: 1em;}
    </style>
    <link href="/static/code-prettify/loader/prettify.css" rel="stylesheet">
{%/block%}
{%block name="navColor"%}#666{%/block%}
{%block name="scroll"%} data-spy="scroll" data-target="#webb-guid-bar"{%/block%}
{%block name="content"%}
    <div class="webb-doc-header container-fluid">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-5 webb-doc-des">
                <h3>深入了解移动版Webb日志</h3>
                <p>日志在各终端设备上的覆盖情况,各类日志的实际采集情况.</p>
            </div>
            <div class="col-lg-5"></div>
        </div> 
    </div>
    <div class="webb-doc-content container-fluid">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-8">
                <div class="webb-wiki-section">
                    <h3 id="comm-log">公共字段</h3>
                    <br>
                    <h4 id="comm-log-tab">字段参考表</h4>
                    <table class="table table-bordered">
                        <tr class="success">
                            <td>字段</td>
                            <td>含义</td>
                            <td>取值</td>
                        </tr>
                        <tr class="table-hover">
                            <td>type</td>
                            <td>日志发送时机</td>
                            <td>0 轮询<br>1 切换query<br>2 卸载页面<br>3 立即发送</td>
                        </tr>
                        <tr class="active">
                            <td>fm</td>
                            <td>日志类别标识</td>
                            <td>disp 展现日志<br>view 浏览行为日志</td>
                        </tr>
                        <tr>
                            <td>q</td>
                            <td>搜索关键字</td>
                            <td>例：123</td>
                        </tr>
                        <tr class="active">
                            <td>qid</td>
                            <td>查询id</td>
                            <td>例：bc8c312e00002e4f</td>
                        </tr>
                        <tr class="active">
                            <td>did</td>
                            <td>展现id</td>
                            <td>例：9ad4e469b71b4e41f6bb02f647a081f2</td>
                        </tr>
                        <tr class="active">
                            <td>t</td>
                            <td>日志发送时间戳</td>
                            <td>例：1426819395195</td>
                        </tr>
                        <tr>
                            <td>data</td>
                            <td>各类日志内容</td>
                            <td>参考各类日志说明</td>
                        </tr>
                    </table>
                    <!--h4 id="comm-log-demo">Demo图</h4>
                    <img src="/static/img/demo.png" alt="日志Demo图" class="img-rounded webb-demo-png"-->
                </div>
                <div class="webb-wiki-section">
                    <h3 id="new-disp">展现日志</h3>
                    <br>
                    <h4 id="new-disp-collect">采集项</h4>
                    <p>1.页面整体展现结构（页面大小、各队列结果条数、RS等）</p>
                    <p>2.用户浏览环境（屏幕/浏览器大小、浏览器操作系统信息等）</p>
                    <p>3.每条结果展现结构及meta信息（结果尺寸位置、模版资源标志、图片信息等）</p>
                    <br>
                    <h4 id="new-disp-demo">样例日志</h4>
                    <pre class="prettyprint linenums Lang-js">{%include "wise-new-disp.tpl"%}</pre>
                </div>
                <div class="webb-wiki-section">
                    <h3 id="new-view">浏览行为日志</h3>
                    <br>
                    <h4 id="new-view-collect">采集项</h4>
                    <p>1.心跳日志</p>
                    <p>2.用户切换到激活/非激活状态</p>
                    <p>3.用户页面滚动行为</p>
                    <p>4.用户横竖屏切换行为</p>
                    <p>5.结果浏览行为（可视区域结果展现）</p>
                    <p>6.组件交互日志</p>
                    <br>
                    <h4 id="new-view-demo">日志样例</h4>
                    <pre class="prettyprint linenums Lang-js">{%include "wise-new-view.tpl"%}</pre>
                    <br>
                    <h4 id="new-view-function">前端使用方式</h4>
                <p>使用要求:必须为页面<b style="color:red;">通用组件</b>;日志仅记录<b style="color:red;">前端交互行为</b>.</p>
                    <p>页面内部的通用组件可以使用以下方法进行Webb日志发送:</p>
                    <pre class="prettyprint linenums Lang-js">{%include "wise-new-view-function.tpl"%}</pre>
                </div>
                <div class="webb-wiki-section">
                    <h3 id="webb-user">使用方</h3>
                    <table class="table table-bordered">
                        <tr class="success">
                            <td>使用方</td>
                            <td>使用内容</td>
                            <td>接口人</td>
                        </tr>
                        <tr class="table-hover">
                            <td>ubs</td>
                            <td>满意度计算、摘要满足、用户分析，反作弊等</td>
                            <td>马皓</td>
                        </tr>
                        <tr class="active">
                            <td>rank</td>
                            <td>点击调权等</td>
                            <td>袁怀文</td>
                        </tr>
                        <tr class="active">
                            <td>创维</td>
                            <td>借助用户实时的操作数据,满足个性化推荐需求.</td>
                            <td>潘晓雷</td>
                        </tr>
                        <tr class="active">
                            <td>反作弊</td>
                            <td>反作弊自然人识别</td>
                            <td>丁卓</td>
                        </tr>
                    </table>
                </div>
                <div class="webb-wiki-section">
                    <h3 id="owner">接口人</h3>
                    <div class="webb-owner" id="owner-webb-fe">
                        <h4>日志fe接口人</h4>
                        <address>
                            <strong>刘悦</strong><br>
                            接口使用调研、日志需求相关问题<br>
                            email: <a href="mailto:liuyue05@baidu.com">liuyue05@baidu.com</a><br>
                            hi: liuyue1027<br>
                            tel: 18614005007
                        </address>
                    </div>
                    <div class="webb-owner" id="owner-webb-ubs">
                        <h4>日志ubs接口人</h4>
                        <address>
                            <strong>马皓</strong><br>
                            接口日志获取相关问题<br>
                            email: <a href="mailto:mahao@baidu.com">mahao@baidu.com</a><br>
                            hi: xiaohaofancy<br>
                            tel: 18612291970
                        </address>
                        <address>
                            <strong>林广杰</strong><br>
                            接口日志获取相关问题<br>
                            email: <a href="mailto:linguangjie@baidu.com">linguangjie@baidu.com</a><br>
                            hi: lancelin3<br>
                            tel: 18500540401
                        </address>
                    </div>
                </div>
            </div>
            <div class="col-lg-2" id="webb-guid-bar">{%include "wise-affix.tpl"%}</div>
        </div>
    </div>
{%/block %}
{%block name="js"%}
    <script src="/static/code-prettify/loader/prettify.js"></script>
    <script src="/static/js/Chart.min.js"></script>
    <script>
        $(document).ready(function () {
            prettyPrint();
            var data = {
                labels: ['4/25','4/26','4/27','4/28','4/29','4/30','5/1','5/2','5/3','5/4','5/5','5/6','5/7','5/8','5/9','5/10','5/11','5/12','5/13','5/14','5/15','5/16','5/17','5/18','5/19','5/20','5/21','5/22','5/23','5/24','5/25','5/26','5/27','5/28','5/29','5/30','5/31','6/1','6/2','6/3','6/4','6/5','6/6','6/7','6/8','6/9','6/10','6/11','6/12','6/13','6/14','6/15'],
                datasets: [
                    {
                        fillColor: 'rgba(220, 220, 220, 0.5)',
                        strokeColor : 'rgba(220, 220, 220, 1)',
                        pointColor : 'rgba(220, 220, 220, 1)',
                        pointStrokeColor: '#fff',
                        data: [60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,88.09,87.98,87.92,87.09,87.42,88.24,88.40,88.30,88.16,87.97,87.20,88.17,89.34,89.31,89.12,89.19,89.01,88.35,88.57,89.25,89.35,89.37,89.27,89.31,88.94,89.25,89.75,89.47,89.48,89.52,89.28,88.86,88.94,89.52]
                    },
                    {
                        fillColor: 'rgba(151, 187, 205, 0.5)',
                        strokeColor : 'rgba(151, 187, 205, 1)',
                        pointColor : 'rgba(151, 187, 205, 1)',
                        pointStrokeColor: '#fff',
                        data: [73.54,71.10,71.41,73.29,72.31,72.18,71.04,67.85,68.62,69.53,71.61,71.44,72.08,71.57,71.17,69.31,70.09,72.23,71.76,71.80,72.06,72.76,71.20,71.88,74.25,74.50,74.68,74.36,74.04,72.12,74.27,77.33,77.72,77.70,77.81,77.53,76.15,76.81,78.40,78.54,78.41,78.27,78.40,77.41,77.91,79.02,78.86,79.29,79.73,79.52,78.65,78.85,79.91]
                    }
                ]
            }
            var ctx = $('#myChart').get(0).getContext('2d');
            var c = new Chart(ctx).Line(data);
            var data1 = {
                labels: ['4/25','4/26','4/27','4/28','4/29','4/30','5/1','5/2','5/3','5/4','5/5','5/6','5/7','5/8','5/9','5/10','5/11','5/12','5/13','5/14','5/15','5/16','5/17','5/18','5/19','5/20','5/21','5/22','5/23','5/24','5/25','5/26','5/27','5/28','5/29','5/30','5/31','6/1','6/2','6/3','6/4','6/5','6/6','6/7','6/8','6/9','6/10','6/11','6/12','6/13','6/14','6/15'],
                datasets: [
                    {
                        fillColor: 'rgba(220, 220, 220, 0.5)',
                        strokeColor : 'rgba(220, 220, 220, 1)',
                        pointColor : 'rgba(220, 220, 220, 1)',
                        pointStrokeColor: '#fff',
                        data: [50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,73.14,72.63,72.89,70.19,70.58,73.42,73.96,73.78,73.31,72.91,70.27,73.58,78.03,78.06,77.34,77.66,77.49,75.55,75.97,78.11,78.14,78.23,77.97,77.83,76.19,76.55,78.32,78.06,78.55,78.53,78.29,76.69,76.53,78.57]
                    },
                    {
                        fillColor: 'rgba(151, 187, 205, 0.5)',
                        strokeColor : 'rgba(151, 187, 205, 1)',
                        pointColor : 'rgba(151, 187, 205, 1)',
                        pointStrokeColor: '#fff',
                        data: [55.8,55.99,58.66,57.54,57.30,56.42,51.77,52.65,53.78,56.98,56.62,57.60,56.62,55.98,53.01,53.74,56.86,56.55,56.78,56.75,57.39,54.94,55.64,59.32,59.74,60.21,59.78,59.52,56.59,60.04,65.02,65.01,64.75,65.21,65.02,62.77,63.45,65.79,65.72,65.51,65.56,65.73,63.76,63.96,65.95,65.89,66.69,67.03,66.95,65.21,65.03,67.27,]
                    }
                ]
            }
            var ctx1 = $('#myChart1').get(0).getContext('2d');
            var c1 = new Chart(ctx1).Line(data1);
        });
    </script>
{%/block%}
