(function () {
    var selector = '.4g-date-picker-wrapper input';
    var currDate = '2015/08/09';
    var endDate  = '2015/08/16';

    $(selector).datepicker({
        format: 'yyyymmdd',
        startDate: new Date(currDate),
        endDate: new Date(endDate)
    });    
    $(selector).datepicker('update', new Date('08/09/2015'));

    $(selector).datepicker().on('changeDate', function (e) {
        var date = formatDate(e.date, '/');
        if (date != currDate) {
            var dateArr = date.split('/');
            $.ajax({
                url: 'data/4g/' + dateArr[0] +'/' + dateArr.join('') + '.json', 
                dataType: 'json'
            }).done(function( json, textStatus, jqXHR ){
                currDate = date;
                createTbl(json, date);
            });
        }
    });
    $('.4g-table-wrapper table').find('[data-toggle="tooltip"]').tooltip();

    function formatDate (date, split) {
        var y = date.getFullYear().toString();
        var m = (date.getMonth() + 1).toString();
        var d = date.getDate().toString();
        return [y, m.length===2 ? m : '0'+m, d.length===2 ? d : '0' + d].join(split || '');
    }

    function createTbl (json, date) {
        var overviewSelector  = '.4g-table-overview';
        var identifiedSeletor = '.4g-identified-detail';

        $(overviewSelector).html([
            '<table class="table table-hover">', 
                '<caption style="text-align:center;">4G召回（', date, '）</caption>', 
                '<thead>', 
                    '<tr>', 
                        '<th>分类</th>', 
                        '<th>pv总量</th>', 
                        '<th>4g pv量</th>', 
                        '<th>4g pv占比</th>', 
                        '<th>4g pv召回率</th>', 
                    '</tr>', 
                '</thead>', 
                '<tbody>', 
                    '<tr>', 
                        '<td><b>Wise全量</b></td>', 
                        '<td>', json['wise']['total'], '</td>', 
                        '<td>', json['wise']['4g'], '</td>', 
                        '<td>', json['wise']['percentage'], '%</td>', 
                        '<td>', json['wise']['recall'], '%</td>', 
                    '</tr>', 
                    '<tr>', 
                        '<td>', 
                            '<span data-toggle="tooltip" data-placement="top" title="" data-original-title="只统计iphone、utouch两种版式的流量">', 
                                '<b>限定版式</b>', 
                            '</span>', 
                        '</td>', 
                        '<td>', json['wise_iu']['total'], '</td>', 
                        '<td>', json['wise_iu']['4g'], '</td>', 
                        '<td>', json['wise_iu']['percentage'], '%</td>', 
                        '<td>', json['wise_iu']['recall'], '%</td>', 
                    '</tr>', 
                    '<tr>', 
                        '<td>', 
                            '<span data-toggle="tooltip" data-placement="top" title="" data-original-title="限定iphone、utouch两种版式，同时排除框的流量">', 
                                '<b>非框流量(限版)</b>', 
                            '</span>', 
                        '</td>', 
                        '<td>', json['wise_iu_exclude_box']['total'], '</td>', 
                        '<td>', json['wise_iu_exclude_box']['4g'], '</td>', 
                        '<td>', json['wise_iu_exclude_box']['percentage'], '%</td>', 
                        '<td>', json['wise_iu_exclude_box']['recall'], '%</td>', 
                    '</tr>', 
                    '<tr>', 
                        '<td>', 
                            '<span data-toggle="tooltip" data-placement="top" title="" data-original-title="以框的4g pv占比作为参考基准计算4g召回率">', 
                                '<b>框流量</b>', 
                            '</span>', 
                        '</td>', 
                        '<td>', json['wise_iu_box']['total'], '</td>', 
                        '<td>', json['wise_iu_box']['4g'], '</td>', 
                        '<td>', json['wise_iu_box']['percentage'], '%</td>', 
                        '<td>1</td>', 
                    '</tr>', 
                '</tbody>', 
            '</table>'].join(''));

        $([identifiedSeletor, ' caption'].join(' ')).html('4G识别策略占比分析（' + date + '）');
        $([identifiedSeletor, ' tbody'].join(' ')).html([
            '<tr>', 
                '<td>非框流量(限版)</td>', 
                '<td>', json['wise_iu_exclude_box_4g1']['percentage'], '%</td>', 
                '<td>', json['wise_iu_exclude_box_4g2']['percentage'], '%</td>', 
                '<td>', json['wise_iu_exclude_box_4g3']['percentage'], '%</td>', 
                '<td>', json['wise_iu_exclude_box_4g4']['percentage'], '%</td>', 
                '<td>', json['wise_iu_exclude_box_4g5']['percentage'], '%</td>', 
                '<td>', json['wise_iu_exclude_box_4g6']['percentage'], '%</td>', 
            '</tr>', 
            '<tr>', 
                '<td>框流量</td>', 
                '<td>', json['wise_iu_box_4g1']['percentage'], '%</td>', 
                '<td>', json['wise_iu_box_4g2']['percentage'], '%</td>', 
                '<td>', json['wise_iu_box_4g3']['percentage'], '%</td>', 
                '<td>', json['wise_iu_box_4g4']['percentage'], '%</td>', 
                '<td>', json['wise_iu_box_4g5']['percentage'], '%</td>', 
                '<td>', json['wise_iu_box_4g6']['percentage'], '%</td>', 
            '</tr>'].join(''));
    }
}) ();