<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <ul class="nav nav-pills category-tabs">
        <li<?php if ($tpl_name==='index' && $category==='browser') { echo ' class="active"'; } ?>><a href="?category=browser">浏览器分布</a></li>
        <li<?php if ($tpl_name==='index' && $category==='os') { echo ' class="active"'; } ?>><a href="?category=os">操作系统分布</a></li>
        <li<?php if ($tpl_name==='index' && $category==='display') { echo ' class="active"'; } ?>><a href="?category=display">版式分布</a></li>
        <li<?php if ($tpl_name==='detail') { echo ' class="active"'; } ?>><a href="?tpl=detail">浏览器详情</a></li>
        <li<?php if ($tpl_name==='trend') { echo ' class="active"'; } ?>><a href="?tpl=trend">趋势</a></li>
    </ul>
    <div class="date-picker-wrapper row">
        <div class="col-sm-4">
            <div class="form-group">
                <div class="input-group date" class="datetimepicker">
                    <input type="text" name="date" class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>
    
    <div class="table-responsive detail-table-wrapper">
    </div>

    <!-- Modal: browser/os分类详情 -->
    <div class="modal fade bs-example-modal-lg" id="detailVersionModal" tabindex="-1" role="dialog" aria-labelledby="detailVersionModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="detailVersionModalLabel">各版本占比详情</h4>
                </div>
                <div class="modal-body">    
                    <div class="table-responsive detail-modal-table-wrapper">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>版本号</th>
                                    <th>流量占比</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
