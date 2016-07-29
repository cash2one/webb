<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{%block name="title"%}{%/block%}</title>
          
        <!-- Bootstrap -->
        <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
              
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            html,body{height: 100%;}
            .header {width: 100%;height: 58px;position: absolute;top: 8px;z-index: 2;font-family: '方正兰亭黑',  Helvetica, 'Microsoft YaHei';}
            .logo {height:100%;}
            .logo img{float: left;height: 46px;margin: 6px auto;}
            .logo div{font-size: 18px;float: left;margin-left: 10px;line-height: 58px;}
            .nav_item{float: right;margin-top: 12px;margin-right: 20px;width: 71px;height: 33px;text-align: center;}
            .nav_item a{display: inline-block;height: 100%;line-height: 33px;}
            .nav_item a:hover{text-decoration: none;}
            .nav_item a:hover, .select-item a{border-bottom: 2px solid #666;}
            .logo div, .nav_item a{color: {%block name="navColor"%}{%/block%};}
            .content {width: 100%;height: 100%;}
        </style>
        {%block name="css"%}{%/block%}
    </head>
    <body {%block name="scroll"%}{%/block%}>
        <div class="header" id="header-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-2 logo">
                        <a href="/">
                            <img src="/static/img/logo.png">
                            <div>Webb日志</div>
                        </a>
                    </div>
                    <div class="col-lg-6 webb-nav">
                        <div class="nav_item {%block name="float"%}{%/block%}"><a href="/float">使用流程</a></div>
                        <div class="nav_item {%block name="wisepro-wiki"%}{%/block%}"><a href="/wisepro-wiki">移动通用版</a></div>
                        <div class="nav_item {%block name="wiki"%}{%/block%}"><a href="/wiki">PC搜索版</a></div>
                        <div class="nav_item {%block name="wise-wiki"%}{%/block%}"><a href="/wise-wiki">移动搜索版</a></div>
                        <div class="nav_item {%block name="mip-wiki"%}{%/block%}"><a href="/mipwiki">Mip</a></div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
        </div>
        <div class="content">
            {%block name="content"%}{%/block %}
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/static/js/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="/static/bootstrap/js/bootstrap.min.js"></script>
        <script src="/static/js/base.js"></script>
        {%block name="js"%}{%/block%}
    </body>
</html>

