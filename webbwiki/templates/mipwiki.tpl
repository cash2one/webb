{%extends "base.tpl" %}
{%block name="title"%}Mip Webb日志{%/block%}
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
{%block name="mipwiki"%}select-item{%/block%}
{%block name="content"%}
    <div class="webb-doc-header container-fluid">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-5 webb-doc-des">
                <h3>Mip Webb 日志</h3>
                <p>服务于Mip页面监控，为百度移动搜索接入的Mip提供整体监控、资源评测数据。</p>
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
                            <td>日志发送时机,必选</td>
                            <td>0 轮询<br>1 切换query<br>2 卸载页面<br>3 立即发送</td>
                        </tr>
                        <tr class="active">
                            <td>fm</td>
                            <td>日志类别标识,必选</td>
                            <td>disp 渲染日志<br>view 浏览行为日志</td>
                        </tr>
                        <tr>
                            <td>path</td>
                            <td>Mip页的加密URL</td>
                            <td>例：IlPT2AEptyoA_yixCFOxXnANedT62v3IGtiNNC1JQGn5nk_qva02</td>
                        </tr>
                        <tr class="active">
                            <td>qid</td>
                            <td>搜索请求的查询ID,可选</td>
                            <td>例：bc8c312e00002e4f</td>
                        </tr>
                        <tr>
                            <td>t</td>
                            <td>日志发送时间戳,必选</td>
                            <td>例：1426819395195</td>
                        </tr>
                        <tr class="active">
                            <td>data</td>
                            <td>详细日志内容</td>
                            <td>参考各类日志说明</td>
                        </tr>
                    </table>
                </div>
                <div class="webb-wiki-section">
                    <h3 id="new-disp">渲染日志</h3>
                    <br>
                    <h4 id="new-disp-collect">采集项</h4>
                    <p>1.渲染情况及错误信息</p>
                    <p>2.页面速度监控相关数据</p>
                    <br>
                    <h4 id="new-disp-demo">样例日志</h4>
                    <pre class="prettyprint linenums Lang-js">{%include "mip-disp.tpl"%}</pre>
                </div>
                <div class="webb-wiki-section">
                    <br>
                    <h3 id="webb-application">申请使用</h3>
                    <br>
                    <h4 id="webb-asktouse">申请流程</h3>
                    <br>
                    <p>发送申请邮件到:liuyue05@baidu.com;mahao@baidu.com;</p>
                    <p>邮件标题:XXX产品申请使用Mip Webb日志</p>
                    <p>邮件内容:
                    <ul>
                    <li>使用背景</li>
                    <li>日志存储资源调配信息</li>
                    </ul>
                    </p>
                    <br>
                    <h4 id="webb-user">已备案使用方</h3>
                    <table class="table table-bordered">
                        <tr class="success">
                            <td>使用方</td>
                            <td>接口人</td>
                        </tr>
                        <tr class="table-hover">
                            <td>Spider 死链检查</td>
                            <td>吕明</td>
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
            <div class="col-lg-2" id="webb-guid-bar">{%include "mip-afiix.tpl"%}</div>
        </div>
    </div>
{%/block %}
{%block name="js"%}
    <script src="/static/code-prettify/loader/prettify.js"></script>
    <script>
        $(document).ready(function () {
            prettyPrint();
        });
    </script>
{%/block%}
