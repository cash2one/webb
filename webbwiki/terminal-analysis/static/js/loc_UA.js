(function() {

    var jsonData = pvlocJSON['data'],
        date = pvlocJSON['date'];

    var total_pv = parseInt(jsonData.total_pv),
        baiduloc_pv = parseInt(jsonData.baiduloc_pv),
        citycode_pv = parseInt(jsonData.citycode_pv),
        restime_total = parseFloat(jsonData.restime_total),
        restime_num = parseInt(jsonData.restime_num);

    var baiduloc_ratio = total_pv > 0 ? (100.0*baiduloc_pv/total_pv).toFixed(2) : -1,
        citycode_ratio = total_pv > 0 ? (100.0*citycode_pv/total_pv).toFixed(2) : -1,
        restime_average = restime_num > 0 ? (restime_total/restime_num).toFixed(2) : -1;

    function renderBaiduLocDetailTbl(jsonData, selector) {
         $(selector).html(['<table class="table table-hover">',
            '<thead>',
            '<tr>',
            '<th>用户定位信息携带率</th>',
            '<th>城市信息携带率</th>',
            '<th>平均剩余有效时间</th>',
            '</tr>',
            '</thead>',
            '<tbody>',
            '<tr>',
            '<th>' + (baiduloc_ratio>0?(baiduloc_ratio+'%'):'None') + '</th>',
            '<th>' + (citycode_ratio>0?(citycode_ratio+'%'):'None') + '</th>',
            '<th>' + (restime_average>0?(restime_average+'h'):'None') + '</th>',
            '</tr>',
            '</tbody>',
            '</table>'
        ].join(''));
    }

    drawPieChart({'携带': {share: baiduloc_ratio/100}, '不携带': {share: 1.0-baiduloc_ratio/100}},'用户定位信息携带率(' + date +')', '.chart-wrapper');



    renderBaiduLocDetailTbl(pvlocJSON['data'], '.detail-table-wrapper');

    $('.date-picker-wrapper input').datepicker().on('changeDate', function(e) {
        if (typeof window.pvlocJSON === 'undefined') {
            return false;
        }

        var date = formatDate(e.date, '/');
        if (pvlocJSON.date != date) {
            $.ajax({
                url: 'api/getpvloc.php?date=' + formatDate(e.date),
                dataType: 'json'
            }).done(function(json, textStatus, jqXHR) {
                renderBaiduLocDetailTbl(json.data, '.detail-table-wrapper');
                window.pvlocJSON = json;
            });
        }
    });
})();
