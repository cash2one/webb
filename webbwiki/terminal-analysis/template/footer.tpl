    </div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="static/ext_js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/bootstrap/js/datepicker.min.js"></script>
<script type="text/javascript" src="static/bootstrap/locales/datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="static/ext_js/highcharts.js"></script>
<script type="text/javascript" src="static/ext_js/highcharts-exporting.js"></script>
<script type="text/javascript" src="static/js/base.js"></script>
<script type="text/javascript">
    (function () {
        try {
            <?php
            if($tpl_name==='pvloc' || $tpl_name==='loc_UA')
                echo 'initDatePicker(pvlocJSON.date);';
            if($tpl_name==='index' || $tpl_name==='detail' || $tpl_name==='trend') 
                echo 'initDatePicker(glbJSON.date);';
            ?>
            // 初始化日期选择插件
        } catch (e) {} 
    })();
</script>
<?php
    if ($tpl_name==='pvloc') {
        echo '<script type="text/javascript" src="static/js/pvloc.js"></script>';
    }
?>
<?php
    if ($tpl_name==='index' && $category==='browser') {
        echo '<script type="text/javascript" src="static/js/browser.js"></script>';
    }
?>
<?php
    if ($tpl_name==='index' && $category==='os') {
        echo '<script type="text/javascript" src="static/js/os.js"></script>';
    }
?>
<?php
    if ($tpl_name==='index' && $category==='display') {
        echo '<script type="text/javascript" src="static/js/display.js"></script>';
    }
?>
<?php
    if ($tpl_name==='index' && $category ==='detail') {
        echo '<script type="text/javascript" src="static/js/detail.js"></script>';
    }
?>
<?php
    if ($tpl_name==='index' && $category ==='trend') {
        echo '<script type="text/javascript" src="static/js/trend.js"></script>';
    }
?>
<?php
    if ($tpl_name==='4g') {
        echo '<script type="text/javascript" src="static/js/4g.js"></script>';
    }
?>

<?php
    if ($tpl_name==='index') {
?>
<script type="text/javascript">
    (function () {
        // 分类版本详情
        $('.detail-table-wrapper').on('click', '.display-versions-item', function (e) {
            var me = $(this);
            var name = me.attr('data-name');
            var type = me.attr('data-type') || 'browser';
            var data = glbJSON.data;

            drawPieChart(data['day'][type][name], '', '.detail-modal-chart-wrapper');

            renderVersionsTbl({
                day: data['day'][type][name],
                month: (data['month'] && data['month'][type]) ? data['month'][type][name] : {},
                lastMon: (data['lastMon'] && data['lastMon'][type]) ? data['lastMon'][type][name] : {}
            }, '.detail-modal-table-wrapper tbody');

            $('.modal-title').html('<b class="text-capitalize">' + name + '</b>各版本占比详情');
        });
    })();
</script>
<?php
    }
?>
</body>
</html>
