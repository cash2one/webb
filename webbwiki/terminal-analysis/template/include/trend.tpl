    <div class="row" style="margin-top:18px">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="main-category">分类:</label>
            <?php
                function createTopCategoriesHTML() {
                    $cate_array = array(
                        array(
                            'name' => 'browser',
                            'text' => '浏览器'
                        ),
                        array(
                            'name' => 'os',
                            'text' => '操作系统'
                        ),
                        array(
                            'name' => 'display',
                            'text' => '显示类型'
                        )
                    );
                    $html = "";
                    $selected = "";

                    foreach ($cate_array as $key => $value) {
                        $html .= "<li><a data-text=\"{$value['text']}\" data-name=\"{$value['name']}\" href=\"javascript:void(0)\">{$value['text']}</a></li>";
                    }
                    echo <<<EOF
            <div class="col-sm-10 btn-group main-cate-list">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="main-category">
                    --选择类别--&nbsp;&nbsp;<span class="caret"></span>
                </button>

                <ul class="trend-dropdown-menu dropdown-menu">{$html}</ul>
            </div>
EOF;
                }
            ?>
            <?php createTopCategoriesHTML(); ?>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="name-category">名称:</label>
            <div class="col-sm-10 btn-group name-cate-list">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="name-category">
                    --全部--&nbsp;&nbsp;<span class="caret"></span>
                </button>

                <ul class="trend-dropdown-menu dropdown-menu"></ul>
            </div>
        </div> 

        <div class="form-group">
            <label class="col-sm-2 control-label" for="version-category">版本:</label>
            <div class="col-sm-10 btn-group version-cate-list">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="version-category">
                    --全部--&nbsp;&nbsp;<span class="caret"></span>
                </button>

                <ul class="trend-dropdown-menu dropdown-menu"></ul>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="trend-input-daterange">时间区间:</label>
        
            <div class="col-sm-10" id="trend-input-daterange">
                <div class="input-daterange">
                    <input type="text" class="input-small time-start" />
                    <span class="add-on">to</span>
                    <input type="text" class="input-small time-end" />
                </div>
            </div>
        </div>

        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-default btn-primary display-trend-btn">查看</button>
        </div>
    </form>
    </div>

    <div class="line-chart-wrapper" style="margin: 0 auto"></div>
