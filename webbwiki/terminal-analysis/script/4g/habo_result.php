<?php
defined('BASE_DIR') or define('BASE_DIR', dirname(dirname(dirname(__FILE__))));
defined('LIB_DIR') or define('LIB_DIR', BASE_DIR . '/library');
defined('DATA_DIR') or define('DATA_DIR', BASE_DIR . '/data');
require_once LIB_DIR . '/functions.php';

// 判断输入参数，处理指定日期的数据，日期形如20150809
$date = http_params('date');
if (empty($date) || !preg_match("/[0-9]{8}/", $date)) {
    exit(json_encode(array(
        'errno' => -1,
        'msg'   => '缺少date参数或date参数格式不正确，形如20150809'
    )));
}

// 判断数据存储目录
$dir  = DATA_DIR . "/4g/" . substr($date, 0, 4);
if (!is_dir($dir)) {
    mkdir($dir);
}
$file = $dir . "/" . $date;
if (!file_exists($file)) {
    exit(json_encode(array(
        'errno' => -1,
        'msg'   => '数据文件不存在'
    )));
}

$arr  = explode("\t", trim(file_get_contents($file)));
if (count($arr)!==20) {
    exit(json_encode(array(
        'errno' => -1,
        'msg'   => '无数据'
    )));
}

// 数据处理，并以json格式存储到本地文件
$ret = array();
// 框数据，以框的4g占比作为基准来计算召回率
$box_total       = intval($arr[12]);
$box_4g          = intval($arr[13]);
$base_percentage = 100 * round($box_4g/(float)$box_total, 4);
$ret['wise_iu_box'] = array(
    'total' => $box_total, 
    '4g'    => $box_4g, 
    'percentage' => $base_percentage,
    'recall' => 1
);

// wise全量数据
$total      = intval($arr[0]);
$c4g        = intval($arr[1]);
$percentage = 100 * round($c4g/(float)$total, 4);
$recall     = 100 * round($percentage/$base_percentage, 4);
$ret['wise'] = array(
    'total'      => $total, 
    '4g'         => $c4g, 
    'percentage' => $percentage,
    'recall'     => $recall
);

// iphone、utouch两种版式的数据
$total      = intval($arr[2]);
$c4g        = intval($arr[3]);
$percentage = 100 * round($c4g/(float)$total, 4);
$recall     = 100 * round($percentage/$base_percentage, 4);
$ret['wise_iu'] = array(
    'total'      => $total, 
    '4g'         => $c4g, 
    'percentage' => $percentage,
    'recall'     => $recall
);

// 除掉框之外的iphone、utouch两种版式的数据
$total      = intval($arr[4]);
$c4g        = intval($arr[5]);
$percentage = 100 * round($c4g/(float)$total, 4);
$recall     = 100 * round($percentage/$base_percentage, 4);
$ret['wise_iu_exclude_box'] = array(
    'total'      => $total, 
    '4g'         => $c4g, 
    'percentage' => $percentage,
    'recall'     => $recall
);
// 除掉框之外的iphone、utouch两种版式流量中，6种4g识别策略的统计
$ret['wise_iu_exclude_box_4g1'] = array(
    'total' => intval($arr[4]), 
    '4g'    => intval($arr[6]), 
    'percentage' => 100 * round(intval($arr[6])/(float)intval($arr[4]), 4)
);
$ret['wise_iu_exclude_box_4g2'] = array(
    'total' => intval($arr[4]), 
    '4g'    => intval($arr[7]), 
    'percentage' => 100 * round(intval($arr[7])/(float)intval($arr[4]), 4)
);
$ret['wise_iu_exclude_box_4g3'] = array(
    'total' => intval($arr[4]), 
    '4g'    => intval($arr[8]), 
    'percentage' => 100 * round(intval($arr[8])/(float)intval($arr[4]), 4)
);
$ret['wise_iu_exclude_box_4g4'] = array(
    'total' => intval($arr[4]), 
    '4g'    => intval($arr[9]), 
    'percentage' => 100 * round(intval($arr[9])/(float)intval($arr[4]), 4)
);
$ret['wise_iu_exclude_box_4g5'] = array(
    'total' => intval($arr[4]), 
    '4g'    => intval($arr[10]), 
    'percentage' => 100 * round(intval($arr[10])/(float)intval($arr[4]), 4)
);
$ret['wise_iu_exclude_box_4g6'] = array(
    'total' => intval($arr[4]), 
    '4g'    => intval($arr[11]), 
    'percentage' => 100 * round(intval($arr[11])/(float)intval($arr[4]), 4)
);

// 框流量中6种4g识别策略的统计
$ret['wise_iu_box_4g1'] = array(
    'total' => intval($arr[12]), 
    '4g'    => intval($arr[14]), 
    'percentage' => 100 * round(intval($arr[14])/(float)intval($arr[12]), 4)
);
$ret['wise_iu_box_4g2'] = array(
    'total' => intval($arr[12]), 
    '4g'    => intval($arr[15]), 
    'percentage' => 100 * round(intval($arr[15])/(float)intval($arr[12]), 4)
);
$ret['wise_iu_box_4g3'] = array(
    'total' => intval($arr[12]), 
    '4g'    => intval($arr[16]), 
    'percentage' => 100 * round(intval($arr[16])/(float)intval($arr[12]), 4)
);
$ret['wise_iu_box_4g4'] = array(
    'total' => intval($arr[12]), 
    '4g'    => intval($arr[17]), 
    'percentage' => 100 * round(intval($arr[17])/(float)intval($arr[12]), 4)
);
$ret['wise_iu_box_4g5'] = array(
    'total' => intval($arr[12]), 
    '4g'    => intval($arr[18]), 
    'percentage' => 100 * round(intval($arr[18])/(float)intval($arr[12]), 4)
);
$ret['wise_iu_box_4g6'] = array(
    'total' => intval($arr[12]), 
    '4g'    => intval($arr[19]), 
    'percentage' => 100 * round(intval($arr[19])/(float)intval($arr[12]), 4)
);

echo json_encode(array('ret' => !!@file_put_contents($file . ".json", json_encode($ret))));
?>
