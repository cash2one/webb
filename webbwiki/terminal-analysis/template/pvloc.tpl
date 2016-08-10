<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <ul class="nav nav-pills category-tabs">
        <li<?php if ($tpl_name==='pvloc') { echo ' class="active"'; } ?>><a href="?tpl=pvloc">BAIDULOC统计</a></li>
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
    <div class="table-responsive detail-table-wrapper" style="height:200px"></div>
</div>
