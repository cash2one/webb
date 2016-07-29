/**
 * 将原始JSON数据转化为绘制表格的数组
 * @param {Object} jsonData - 数据列表，形如：{'day': {}, 'month': {}, 'lastMon': {}}
 * @return {Array} 绘制图表的数组列表，单条数据格式:
 *                 {
 *                     name: 'xxxx', 
 *                     share: 0.2514, 
 *                     monthShare: 0.1234, 
 *                     lastMonShare: 0.2345
 *                 }
 */
function json2array (jsonData) {
    if (typeof jsonData !== 'object') {
        return [];
    }

    var array = [],
        name = '',
        monthShare = 0,
        lastMonShare = 0,
        dayJSON = jsonData.day || {},
        monthJSON = jsonData.month || {},
        lastMonJSON = jsonData.lastMon || {};

    for (name in dayJSON) {
        if (typeof dayJSON[name] === 'object' && 
            typeof dayJSON[name]['share'] === 'number' && 
            dayJSON[name]['share']) {
            monthShare = 'None';
            if (monthJSON && monthJSON[name] && monthJSON[name]['share']) {
                monthShare = monthJSON[name]['share'];
            }
            lastMonShare = 'None';
            if (lastMonJSON && lastMonJSON[name] && lastMonJSON[name]['share']) {
                lastMonShare = lastMonJSON[name]['share'];
            }
            array.push({
                name: name, 
                share: dayJSON[name]['share'],
                monthShare: monthShare,
                lastMonShare: lastMonShare
            });
        }
    }

    return array.sort(function (a, b) {
        var s1 = a.share,
            s2 = b.share;
        return s1>s2 ? -1 : ((s1<s2) ? 1 : 0);
    });
}

/**
 * 版式分布表格
 * @param {Object} jsonData - 数据列表，形如：{'day': {}, 'month': {}, 'lastMon': {}}
 * @param {String} selector - 绘制图形的元素选择器，jQuery格式
 */
function renderDisplayTbl (jsonData, selector) {
    if (typeof jsonData !== 'object') {
        return [];
    }

    var map = {
            'iphone': '高端炫', 
            'utouch': '高端简', 
            'middle': '炫彩', 
            'pad': 'pad版', 
            'big': '触屏', 
            'wml': '极简'
        },
        array = json2array(jsonData),
        i = 0,
        item = null, 
        len = array.length,
        html = [];

    for (; i<len; i++) {
        item = array[i];
        html.push(['<tr>',
                       '<td>', (typeof map[item.name] === 'undefined' ? ('<b>'+item.name+'</b>') : ('<b>'+item.name+'</b>('+map[item.name]+')')), '</td>', 
                       '<td>', (item.share * 100).toFixed(2), '%</td>', 
                       '<td>', (typeof item.monthShare === 'string' ? item.monthShare : (item.monthShare * 100).toFixed(2)+'%'), '</td>', 
                       '<td>', (typeof item.lastMonShare === 'string' ? item.lastMonShare : (item.lastMonShare * 100).toFixed(2)+'%'), '</td>', 
                    '</tr>'].join(''));
    }            
    $(selector||'.detail-modal-table-wrapper tbody').html(html.join(''));
}

/**
 * 指定分类各个版本占比表格
 * @param {Object} jsonData - 数据列表，形如：{'day': {}, 'month': {}, 'lastMon': {}}
 * @param {String} selector - 绘制图形的元素选择器，jQuery格式
 */
function renderVersionsTbl (jsonData, selector) {
    var array = json2array(jsonData),
        i = 0,
        item = null, 
        len = array.length,
        html = [];

    for (; i<len; i++) {
        item = array[i];
        html.push(['<tr>', 
                      '<td><b>', item.name, '</b></td>', 
                      '<td>', (item.share * 100).toFixed(2), '%</td>', 
                      '<td>', (typeof item.monthShare === 'string' ? item.monthShare : ((item.monthShare * 100).toFixed(2)+'%')), '</td>', 
                      '<td>', (typeof item.lastMonShare === 'string' ? item.lastMonShare : ((item.lastMonShare * 100).toFixed(2)+'%')), '</td>', 
                   '</tr>'].join(''));
    }            
    $(selector||'.detail-modal-table-wrapper tbody').html(html.join(''));
}

/**
 * 不同分类占比表格
 * @param {Object} jsonData - 数据列表，形如：{'day': {}, 'month': {}, 'lastMon': {}}
 * @param {String} selector - 绘制图形的元素选择器，jQuery格式
 */
function renderMainTbl (jsonData, type, selector) {
    var array = json2array(jsonData),
        i = 0,
        item = null, 
        len = array.length,
        html = [];

    type = type || 'browser';
    for (; i<len; i++) {
        item = array[i];
        html.push('<tr>' +
            '<td>' + 
                '<span class="display-versions-item" data-type="' + type + '" data-name="' + item.name + '" data-toggle="tooltip" data-placement="top" title="查看版本详情">' + 
                    '<span data-toggle="modal" data-target="#detailVersionModal"><b>' + 
                        item.name + 
                    '</b></span>' + 
                '</span>' + 
            '</td>' +
            '<td>' + (item.share * 100).toFixed(2) + '%</td>' +
            '<td>' + (typeof item.monthShare === 'string' ? item.monthShare : (item.monthShare * 100).toFixed(2)+'%') + '</td>' +
            '<td>' + (typeof item.lastMonShare === 'string' ? item.lastMonShare : (item.lastMonShare * 100).toFixed(2)+'%') + '</td>' +
        '</tr>');
    }       
    $(selector||'.browser-table tbody').html(html.join(''));
    $(selector||'.browser-table tbody').find('[data-toggle="tooltip"]').tooltip();
}

/**
 * 绘制饼状图
 * @param {Object} jsonData - 数据列表，单条数据格式 {name: 'xxxx', share: 0.0125}
 * @param {Sting}  title    - 图标标题 
 * @param {Strig}  selector - 绘制图形的元素选择器，jQuery格式
 */
function drawPieChart (jsonData, title, selector, subtitle) {
    var data = json2array(jsonData);

    function json2array (json) {
        if (typeof json !== 'object') {
            return [];
        }

        var name = '', array = [];
        //try {
        for (name in json) {
            if (typeof json[name] === 'object' && 
                typeof json[name]['share'] === 'number' && 
                json[name]['share']) {
                array.push({
                    name: name, 
                    y: json[name]['share']
                });
            }
        }           
        //} catch (e) {}

        return array.sort(function (a, b) {
            var s1 = a.y,
                s2 = b.y;
            return s1>s2 ? -1 : ((s1<s2) ? 1 : 0);
        });
    }
    
    $(selector || '.chart-wrapper').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: typeof title === 'string' ? title : 'Wise浏览器占比分布'
        },
        subtitle: {
            text: typeof subtitle === 'string' ? subtitle : ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.2f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.2f}%',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: "占比",
            colorByPoint: true,
            data: data
        }]
    });
}

/**
 * 初始化日期插件，考虑Hadoop集群计算延迟，最新数据为2天前
 * @param {String} date - 形如'2015/07/29'的日期
 * @param {String} [selector='.date-picker-wrapper input'] - jQuery选择器，日期控件绑定的input标签.
 */
function initDatePicker (date, selector) {
    selector = selector || '.date-picker-wrapper input';

    $(selector).datepicker({
        format: 'yyyymmdd',
        startDate: new Date('07/27/2015'),
        endDate: '-2d'
    });    
    $(selector).datepicker('update', new Date(date));
}

/**
 * 更新日期插件取值
 * @param {String} date - 形如'2015/07/29'的日期
 * @param {String} [selector='.date-picker-wrapper input'] - jQuery选择器，日期控件绑定的INPUT标签.
 */
function updateDatePicker (date, selector) {
    $(selector||'.date-picker-wrapper input').datepicker('update', new Date(date));
}

/**
 * 生成下拉选择列表
 * @param {Object} json     - 下拉列表内容
 * @param {String} selector - jQuery选择器，下拉选择列表绑定的UL标签.
 * @param {String} index    - glbJSON数据的下标
 */
function initialDropdownMenu (json, selector, index) {
    var array = json2array(json), 
        len = array.length, 
        i = 0, 
        name = '', 
        html = ['<li><a data-name="all" data-text="--全部--" href="javascript:void(0)">--全部--</a></li>'];

    index = (typeof index === 'string' && index) ? ('data-index="' + index + '"') : '';
    for (; i<len; i++) {
        name = array[i];
        html.push(['<li><a data-text="', name, '" ', 
                        index, 
                        ' data-name="', name, '" href="javascript:void(0)">',
                        name, 
                        '</a></li>'].join(''));
    }

    $(selector).html(html.join(''));

    function json2array(json) {
        if (typeof json !== 'object') {
            return [];
        }

        var array = [],
            name = '';

        for (name in json) {
            if (name === 'share' || name === 'total' || name === 'count') {
                continue;
            }
            array.push(name);
        }        

        return array.sort(function (a, b) {
            return a<b ? -1 : ((a>b) ? 1 : 0);
        });
    }
}

/**
 * 绘制线性图
 * @param {Array} jsonData - 数据列表
 * @param {Sting} title    - 图标标题 
 * @param {Strig} selector - 绘制图形的元素选择器，jQuery格式
 */
function drawLineChart(jsonData, title, selector) {
    $(selector||'.line-chart-wrapper').highcharts({
        title: {
            text: title
        },
        xAxis: {
            categories: jsonData.xAxis
        },
        yAxis: {
            //max: 100,
            min: 0,
            title: {
                text: ''
            },
            labels: {
                formatter: function () {
                    return this.value ? this.value + '%' : 0;
                }
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '%'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: jsonData.series
    });
}

/**
 * 浏览器在特定操作系统中流量占比
 * @param {Object} jsonData - 数据列表，形如：{'day': {}, 'month': {}, 'lastMon': {}}
 * @param {String} selector - 表格区域选择器，jQuery格式
 */
function renderBrowserDetailTbl (jsonData, selector) {
    var total = jsonData.day.total;
    $(selector).html(['<table class="table table-hover">', 
        '<thead>', 
            '<tr>', 
                '<th>操作系统</th>', 
                '<th>浏览器</th>', 
                '<th>全量占比</th>', 
            '</tr>', 
        '</thead>', 
        '<tbody>', 
        json2tableHTML('iphone', jsonData.day.detail.iphone), 
        '</tbody>', 
    '</table>', 
    '<table class="table table-hover">', 
        '<thead>', 
            '<tr>', 
                '<th>操作系统</th>', 
                '<th>浏览器</th>', 
                '<th>全量占比</th>', 
            '</tr>', 
        '</thead>', 
        '<tbody>', 
        json2tableHTML('android', jsonData.day.detail.android), 
        '</tbody>', 
    '</table>'].join(''));

    function json2array (json) {
        var array = [];

        for (var idx in json) {
            if (idx==='total') {
                continue;
            }
            array.push({'name': idx, 'total': json[idx]['total']});
        }

        return array.sort(function (a, b) {
            var s1 = a.total,
                s2 = b.total;
            return s1>s2 ? -1 : ((s1<s2) ? 1 : 0);
        });

    }

    function json2tableHTML (os, json) {
        var html = '';
        var flag = false;
        var array = json2array(json);
        var i = 0;
        var len = array.length;

        for (; i<len; i++) {
            html += ['<tr>', 
                        '<td>', 
                            '<b>', flag ? '' : os, '</b>', 
                        '</td>', 
                        '<td>',                         
                            '<span style="cursor:pointer;" class="display-browser-versions-item" data-os="', os, '" data-name="', 
                            array[i]['name'], 
                            '" data-toggle="tooltip" data-placement="top" data-original-title="查看版本详情">', 
                            '<span data-toggle="modal" data-target="#detailVersionModal">', 
                            array[i]['name'], 
                            '</span></span>', 
                        '</td>', 
                        '<td>', ((array[i]['total']/total)*100).toFixed(2) ,'%</td>', 
                    '</tr>'].join('');
            flag = true;
        }
        return html;
    }
}

/**
 * 浏览器在特定操作系统中各版本流量占比
 * @param {Object} jsonData - 数据列表，形如：{'day': {}, 'month': {}, 'lastMon': {}}
 * @param {String} selector - 表格区域选择器，jQuery格式
 */
function renderBrowserDetailModalTbl (jsonData, selector) {
    var total = jsonData.total;
    $(selector).html(json2tableHTML(jsonData));

    function json2array (json) {
        var array = [];

        for (var idx in json) {
            if (idx==='total') {
                continue;
            }
            array.push({'name': idx, 'total': json[idx]});
        }

        return array.sort(function (a, b) {
            var s1 = a.total,
                s2 = b.total;
            return s1>s2 ? -1 : ((s1<s2) ? 1 : 0);
        });

    }

    function json2tableHTML (json) {
        var html = '';
        var array = json2array(json);
        var i = 0;
        var len = array.length;

        for (; i<len; i++) {
            html += ['<tr>', 
                        '<td>', 
                            array[i]['name'], 
                        '</td>', 
                        '<td>', ((array[i]['total']/total)*100).toFixed(2) ,'%</td>', 
                    '</tr>'].join('');
        }
        return html;
    }
}


/**
 * 格式化日期
 * @param {Object} date  - 日期对象
 * @param {String} split - 年月日分隔符
 */
function formatDate (date, split) {
    var y = date.getFullYear().toString(),
        m = (date.getMonth() + 1).toString(),
        d = date.getDate().toString();
    return [y, m.length===2 ? m : '0'+m, d.length===2 ? d : '0' + d].join(split || '');
}