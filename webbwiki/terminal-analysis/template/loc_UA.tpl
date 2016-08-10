<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <ul class="nav nav-pills category-tabs">
        <li<?php if ($tpl_name==='pvloc') { echo ' class="active"'; } ?>><a href="?tpl=pvloc">概述</a></li>
        <li<?php if ($tpl_name==='loc_UA') { echo ' class="active"'; } ?>><a href="?tpl=loc_UA">UA详情</a></li>
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
    <div class="chart-wrapper" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    <div class="table-responsive detail-table-wrapper"></div>
</div>
