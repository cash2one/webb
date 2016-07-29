<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="4g-date-picker-wrapper row">
        <div class="col-sm-4">
            <div class="form-group">
                <div class="input-group date" class="datetimepicker">
                    <input type="text" name="date" class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <?php
        $date = preg_match("/[0-9]{8}/", http_params('date')) ? http_params('date') : '20150809';
        $file = DATA_DIR . "/4g/" . substr($date, 0, 4) . "/" . $date . ".json";
        $data = json_decode(file_get_contents($file), true);
        echo <<<EOF
    <div class="table-responsive 4g-table-wrapper 4g-table-overview">
        <table class="table table-hover">
            <caption style="text-align:center;">4G召回（{$date}）</caption>
            <thead>
                <tr>
                    <th>分类</th>
                    <th>pv总量</th>
                    <th>4g pv量</th>
                    <th>4g pv占比</th>
                    <th>4g pv召回率</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><b>Wise全量</b></td>
                    <td>{$data['wise']['total']}</td>
                    <td>{$data['wise']['4g']}</td>
                    <td>{$data['wise']['percentage']}%</td>
                    <td>{$data['wise']['recall']}%</td>
                </tr>
                <tr>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="只统计iphone、utouch两种版式的流量">
                            <b>限定版式</b>
                        </span>
                    </td>
                    <td>{$data['wise_iu']['total']}</td>
                    <td>{$data['wise_iu']['4g']}</td>
                    <td>{$data['wise_iu']['percentage']}%</td>
                    <td>{$data['wise_iu']['recall']}%</td>
                </tr>
                <tr>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="限定iphone、utouch两种版式，同时排除框的流量">
                            <b>非框流量(限版)</b>
                        </span>
                    </td>
                    <td>{$data['wise_iu_exclude_box']['total']}</td>
                    <td>{$data['wise_iu_exclude_box']['4g']}</td>
                    <td>{$data['wise_iu_exclude_box']['percentage']}%</td>
                    <td>{$data['wise_iu_exclude_box']['recall']}%</td>
                </tr>
                <tr>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="以框的4g pv占比作为参考基准计算4g召回率">
                            <b>框流量</b>
                        </span>
                    </td>
                    <td>{$data['wise_iu_box']['total']}</td>
                    <td>{$data['wise_iu_box']['4g']}</td>
                    <td>{$data['wise_iu_box']['percentage']}%</td>
                    <td>1</td>
                </tr>
            </tbody>
        </table>
    </div>
EOF;
        echo <<<EOF
    <div class="table-responsive 4g-table-wrapper 4g-identified-detail">
        <table class="table table-hover">
            <caption style="text-align:center;">4G识别策略占比分析（{$date}）</caption>
            <thead>
                <tr>
                    <th>分类</th>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="利用运营商4G头部信息">
                            <b>4G头</b>
                        </span>
                    </td>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="利用框network参数识别">
                            <b>network参数</b>
                        </span>
                    </td>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="利用html5接口识别">
                            <b>html5</b>
                        </span>
                    </td>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="利用moplus识别">
                            <b>moplus</b>
                        </span>
                    </td>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="利用push识别">
                            <b>push</b>
                        </span>
                    </td>
                    <td>
                        <span data-toggle="tooltip" data-placement="top" title="" data-original-title="利用ip适配识别">
                            <b>ip</b>
                        </span>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>非框流量(限版)</td>
                    <td>{$data['wise_iu_exclude_box_4g1']['percentage']}%</td>
                    <td>{$data['wise_iu_exclude_box_4g2']['percentage']}%</td>
                    <td>{$data['wise_iu_exclude_box_4g3']['percentage']}%</td>
                    <td>{$data['wise_iu_exclude_box_4g4']['percentage']}%</td>
                    <td>{$data['wise_iu_exclude_box_4g5']['percentage']}%</td>
                    <td>{$data['wise_iu_exclude_box_4g6']['percentage']}%</td>
                </tr>
                <tr>
                    <td>框流量</td>
                    <td>{$data['wise_iu_box_4g1']['percentage']}%</td>
                    <td>{$data['wise_iu_box_4g2']['percentage']}%</td>
                    <td>{$data['wise_iu_box_4g3']['percentage']}%</td>
                    <td>{$data['wise_iu_box_4g4']['percentage']}%</td>
                    <td>{$data['wise_iu_box_4g5']['percentage']}%</td>
                    <td>{$data['wise_iu_box_4g6']['percentage']}%</td>
                </tr>
            </tbody>
        </table>
    </div>
EOF;
    ?>
</div>