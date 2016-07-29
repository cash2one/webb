(function () {
    var date = glbJSON.date;
    var data = glbJSON.data;

    drawPieChart(data.day.os, 'Wise操作系统占比分布(' + date +')', '.chart-wrapper');
    
    renderMainTbl({
        day: data.day.os,
        month: (data.month && data.month.os) ? data.month.os : {},
        lastMon: (data.lastMon && data.lastMon.os) ? data.lastMon.os : {}
    }, 'os', '.detail-table-wrapper tbody');

    $('.date-picker-wrapper input').datepicker().on('changeDate', function (e) {
        if (typeof window.glbJSON === 'undefined') {
            return false;
        }

        var date = formatDate(e.date, '/');
        if (glbJSON.date != date) {
            $.ajax({
                url: 'api/getJSON.php?date=' + formatDate(e.date), 
                dataType: 'json'
            }).done(function( json, textStatus, jqXHR ){
                var data = json.data;

                drawPieChart(data.day.os, 'Wise操作系统占比分布(' + date +')', '.chart-wrapper');
                
                renderMainTbl({
                    day: data.day.os,
                    month: (data.month && data.month.os) ? data.month.os : {},
                    lastMon: (data.lastMon && data.lastMon.os) ? data.lastMon.os : {}
                }, 'os', '.detail-table-wrapper tbody');
                window.glbJSON = json;
            });
        }
    });
}) ();