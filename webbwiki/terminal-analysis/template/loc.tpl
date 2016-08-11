<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <?php
    if ($tpl_name==='loc'){
        require_once TPL_DIR . '/include/loc_nav.tpl';
        require_once TPL_DIR . '/include/display_date_picker.tpl';
        if($category==='total'){
            require_once TPL_DIR . '/include/chart_wrapper.tpl';
            require_once TPL_DIR . '/include/display_table_wrapper.tpl';
        }
        if($category==='ua'){
            require_once TPL_DIR . '/include/loc_ua_select.tpl';
            require_once TPL_DIR . '/include/chart_wrapper.tpl';
        }
    }
    ?>
</div>
