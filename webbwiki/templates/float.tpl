{%extends "base.tpl"%}
{%block name="title"%}Webb日志使用流程{%/block%}
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
        #owner-psid-fe{border-left-color: #ce4844;}
        #owner-psid-fe h4{color: #ce4844;}
    </style>
{%/block%}
{%block name="navColor"%}#666{%/block%}
{%block name="scroll"%} data-spy="scroll" data-target="#webb-guid-bar"{%/block%}
{%block name="float"%}select-item{%/block%}
{%block name="content"%}
    <div class="webb-doc-header container-fluid">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-5 webb-doc-des">
                <h3>Webb日志使用流程</h3>
                <p>work平台流程暂未打通，先走邮件审批流程。</p>
            </div>
            <div class="col-lg-5"></div>
        </div> 
    </div>
    <div class="webb-doc-content container-fluid">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-8">
                <h3>使用流程</h3>
                <p>1. 使用调研，确认是否满足需求</p>
                <p>2. 申请人撰写申请邮件发送申请人经理、申请人总监、ssg陈一凡</p>
                <p>3. 申请人经理审批</p>
                <p>4. 申请人总监审批</p>
                <p>5. ssg陈一凡审批</p>
                <p>6. ubs田海英提供数据</p>
                <h3>使用咨询、问题反馈</h3>
                <p>使用调研、日志需求相关问题ps－fe：刘悦</p>
                <p>日志获取相关问题咨询ubs：马皓、田海英</p>
            </div>
            <div class="col-lg-2"></div>
        </div>
    </div>
{%/block%}
{%block name="js"%}
    <script>
        $(document).ready(function () {
        });
    </script>
{%/block%}
