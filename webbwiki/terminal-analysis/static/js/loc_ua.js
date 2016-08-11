(function() {

    var detail = window['pvlocJSON']['data']['detail'];
    var locos = document.getElementById('loc-os-select');
    var locbrowser = document.getElementById('loc-browser-select');

    function renderOS(){
        var cnt = 0;
        for(var _os in detail){
            locos.options[cnt++] = new Option(_os, _os);
        }
    }

    function renderBrowser(_os){
        var cnt = 0;
        for(var _browser in detail[_os]['browser']){
            locbrowser.options[cnt++] = new Option(_browser, _browser);
        }
    }

    function renderUAPie(jsonData){

        var data = jsonData.data.detail,
            date = jsonData.date;
        var _os = locos.value,
            _browser = locbrowser.value;
        
        var total_pv = parseFloat(data[_os]['browser'][_browser]['total']),
            baiduloc_pv = parseFloat(data[_os]['browser'][_browser]['baiduloc_pv']);
        var baiduloc_ratio = total_pv > 0 ? (100.0*baiduloc_pv/total_pv).toFixed(2) : -1;

        drawPieChart({'覆盖': {share: baiduloc_ratio/100}, '不覆盖': {share: 1.0-baiduloc_ratio/100}},'定位信息覆盖率(' + date +')', '.chart-wrapper');

    }

    locbrowser.onchange = function(){
        renderUAPie(pvlocJSON);
    }

    locos.onchange = function(){
        renderBrowser(locos.value);
        renderUAPie(pvlocJSON);
    }

    renderOS();
    renderBrowser(locos.value);
    renderUAPie(pvlocJSON);
 
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
                renderOS();
                renderBrowser(locos.value);
                renderUAPie(json);
                window.pvlocJSON = json;
            });
        }
    });
})();
