<div class="row col-sm-4">
    <label for="loc-browser-select">操作系统:</label>
    <select id="loc-os-select" class="form-control"></select>
</div>
<div class="row col-sm-4">
    <label for="loc-browser-select">浏览器:</label>
    <select id="loc-browser-select" class="form-control"></select>
</div>

<script>
    var detail = window['pvlocJSON']['data']['detail'];
    var locos = document.getElementById('loc-os-select');
    var locbrowser = document.getElementById('loc-browser-select');
    var cnt = 0, tmp_os;
    for(var _os in detail){
        tmp_os = _os;
        locos.options[cnt++] = new Option(_os, _os);
    }
    cnt = 0;
    for(var _browser in detail[tmp_os]['browser']){
        locbrowser.options[cnt++] = new Option(_browser, _browser);
    }
</script>
