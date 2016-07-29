(function () {
    var date = glbJSON.date;
    var data = glbJSON.data;
    var wiki = "http://wiki.babel.baidu.com/twiki/bin/view/Com/Test/%E7%BB%88%E7%AB%AF%E7%89%88%E5%BC%8F";


    drawPieChart(data.day.display, 'Wise终端版式占比分布(' + date +')', '.chart-wrapper', '<a href="' + wiki + '" target="_blank">' + wiki + '</a>');
    
    renderDisplayTbl({
        day: data.day.display,
        month: (data.month && data.month.display) ? data.month.display : {},
        lastMon: (data.lastMon && data.lastMon.display) ? data.lastMon.display : {}
    }, '.detail-table-wrapper tbody');

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

                drawPieChart(data.day.display, 'Wise终端版式占比分布(' + date +')', '.chart-wrapper', '<a href="' + wiki + '" target="_blank">' + wiki + '</a>');
    
                renderDisplayTbl({
                    day: data.day.display,
                    month: (data.month && data.month.display) ? data.month.display : {},
                    lastMon: (data.lastMon && data.lastMon.display) ? data.lastMon.display : {}
                }, '.detail-table-wrapper tbody');
                window.glbJSON = json;
            });
        }
    });
}) ();