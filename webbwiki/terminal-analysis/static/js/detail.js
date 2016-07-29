(function () {
    renderBrowserDetailTbl(glbJSON['data'], '.detail-table-wrapper');

    // 查看版本详情
    $('.detail-table-wrapper').on('click', '.display-browser-versions-item', function (e) {
        var me = $(this);
        var os = me.attr('data-os');
        var browser = me.attr('data-name');
        renderBrowserDetailModalTbl(glbJSON['data']['day']['detail'][os][browser], '.detail-modal-table-wrapper tbody');
        $('.modal-title').html('<b class="text-capitalize">' + browser + '</b>各版本占比详情');
    });

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
                renderBrowserDetailTbl(json.data, '.detail-table-wrapper');
                window.glbJSON = json;
            });
        }
    });
}) ();