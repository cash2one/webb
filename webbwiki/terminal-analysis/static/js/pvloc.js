(function() {

    function renderBaiduLocDetailTbl(jsonData, selector) {
        var total = parseInt(jsonData.pv),
            baidulocs = (100.0*parseInt(jsonData.pv_loc)/total).toFixed(2),
            citycodes = (100.0*parseInt(jsonData.pv_city_code)/total).toFixed(2),
            ave_res_time = parseFloat(jsonData.average_loc_res_time).toFixed(2);
        $(selector).html(['<table class="table table-hover">',
            '<thead>',
            '<tr>',
            '<th>BAIDULOC_PV Ratio(%)</th>',
            '<th>Citycode_PV Ratio(%)</th>',
            '<th>平均剩余有效时间(h)</th>',
            '</tr>',
            '</thead>',
            '<tbody>',
            '<tr>',
            '<th>' + baidulocs + '</th>',
            '<th>' + citycodes + '</th>',
            '<th>' + ave_res_time + '</th>',
            '</tr>',
            '</tbody>',
            '</table>'
        ].join(''));
    }

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
