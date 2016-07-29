var category = 'browser'; // 默认选中“浏览器”分类
var name = '';
var ver = '';
var start = '';
var end = '';
var jsonData = glbJSON.data.day;

$('.input-daterange input').each(function (){
    var me = $(this), 
        date = new Date();

    me.datepicker({
        format: 'yyyymmdd',
        startDate: new Date('07/27/2015'),
        endDate: new Date(),
        orientation: 'top'
    });

    if (me.hasClass('time-start')) {
        date.setDate(date.getDate()-15);
    }

    if (me.hasClass('time-end')) {
        date.setDate(date.getDate()-1);
    }
    
    me.datepicker('update', date);
});

var mainCateSelector = '.main-cate-list .dropdown-menu',
    nameCateSelector = '.name-cate-list .dropdown-menu',
    verCateSelector  = '.version-cate-list .dropdown-menu';
    
$(mainCateSelector).on('click', 'li a', function (e) {
    var me = $(this);

    category = me.attr('data-name');
    name = ver = '';
    $(e.delegateTarget).parent().find('.dropdown-toggle').text(me.attr('data-text'));            
    initialDropdownMenu((category.toLowerCase()==='display' ? ({}) : jsonData[category]), nameCateSelector, category);
});

$(nameCateSelector).on('click', 'li a', function (e) {
    var me = $(this),
        index = me.attr('data-index');

    name = (me.attr('data-name') !== 'all') ? me.attr('data-name') : '';
    ver = '';
    $(e.delegateTarget).parent().find('.dropdown-toggle').text(me.attr('data-text'));
    initialDropdownMenu(name ? jsonData[index][name] : ({}), verCateSelector);
});

$(verCateSelector).on('click', 'li a', function (e) {
    var me = $(this);

    ver = (me.attr('data-name') !== 'all') ? me.attr('data-name') : '';
    $(e.delegateTarget).parent().find('.dropdown-toggle').text(me.attr('data-text'));
});

$('.display-trend-btn').on('click', function (e) {
    start = $('.input-daterange .time-start').val();
    end = $('.input-daterange .time-end').val();

    if (category && start && end) {
        $.ajax({
            url: 'api/trendJSON.php?category=' + category + 
                                     '&name=' + name + 
                                     '&ver=' + ver + 
                                     '&start=' + start + 
                                     '&end=' + end,
            dataType: 'json'
        }).done(function (json, textStatus, jqXHR) {
            drawLineChart(json, '<b class="text-capitalize">' + category + '_' + name + '_' + ver + '</b>变化趋势', '.line-chart-wrapper');
        });
    }
});