<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <?php
    
    if ($tpl_name==='index'){
        // 头部Tab导航
        require_once TPL_DIR . '/include/index_nav.tpl';

        if ($category==='display' || $category==='os' || $category==='browser') {
            require_once TPL_DIR . '/include/display_date_picker.tpl';
            require_once TPL_DIR . '/include/chart_wrapper.tpl';
            require_once TPL_DIR . '/include/display_table_wrapper.tpl';
            if($category==='os' || $category==='browser'){
                require_once TPL_DIR . '/include/display_modal.tpl';
            }
        }
        if($category==='detail'){
            require_once TPL_DIR . '/include/display_date_picker.tpl';
            require_once TPL_DIR . '/include/detail_table_wrapper.tpl';
            require_once TPL_DIR . '/include/detail_modal.tpl';
        }
        if($category==='trend'){
            require_once TPL_DIR . '/include/trend.tpl';
        }
    }
    
    ?>

</div>
