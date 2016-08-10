<!DOCTYPE html>
<html lang="zh-cmn-Hans">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 
        The above 3 meta tags *must* come first in the head
        any other head content must come *after* these tags 
    -->
    <meta name="description" content="Wise终端分析平台" />
    <meta name="author" content="panfayi" />
    <!--link rel="icon" href="favicon.ico" /-->

    <title>FE日志数据调研平台</title>

    <!-- Bootstrap core CSS -->
    <link type="text/css" href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link type="text/css" href="static/bootstrap/css/datepicker3.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link type="text/css" href="static/css/base.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="static/ext_js/html5shiv.min.js"></script>
        <script src="static/ext_js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        window['tplName'] = '<?php echo $tpl_name; ?>';
        <?php if($tpl_name === 'index' || $tpl_name === 'detail' || $tpl_name === 'trend'){echo "window['glbJSON']=".json_encode(last_day_JSON());}?>;
        <?php if($tpl_name === 'pvloc' || $tpl_name === 'loc_UA'){echo "window['pvlocJSON'] = ".json_encode(last_day_PVLOC_JSON());}?>
    </script> 
</head>

    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="javascript:void();">FE日志数据调研平台</a>
            </div>
            
            <!--div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="javascript:void(0);">Home</a></li>
                    <li><a href="javascript:void(0);">Settings</a></li>
                    <li><a href="javascript:void(0);">Profile</a></li>
                    <li><a href="javascript:void(0);">Help</a></li>
                </ul>
            </div-->
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <?php
                        $nav_list = array(
                            array('tpl' => 'index', 'text' => '终端概况(UA)', 'url' => '?tpl=index'),
                            array('tpl' => 'pvloc', 'text' => '用户定位', 'url' => '?tpl=pvloc') 
                            //array('tpl' => '4g', 'text' => '4G召回', 'url' => '?tpl=4g')
                        );
                        foreach ($nav_list as $key => $value) {
                            if ($tpl_name==$value['tpl']) {
                                print <<<EOF
                    <li class="active">
                        <a href="{$_SERVER['SCRIPT_URI']}{$value['url']}">{$value['text']}<span class="sr-only">(current)</span></a>
                    </li>
EOF;
                            } else {
                                print <<<EOF
                    <li>
                        <a href="{$_SERVER['SCRIPT_URI']}{$value['url']}">{$value['text']}</a>
                    </li>
EOF;
                            }
                        }
                    ?>
                </ul>
            </div>
