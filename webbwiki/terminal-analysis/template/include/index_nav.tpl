    <ul class="nav nav-pills category-tabs">
        <li<?php if ($tpl_name==='index' && $category==='browser') { echo ' class="active"'; } ?>><a href="?category=browser">浏览器分布</a></li>
        <li<?php if ($tpl_name==='index' && $category==='os') { echo ' class="active"'; } ?>><a href="?category=os">操作系统分布</a></li>
        <li<?php if ($tpl_name==='index' && $category==='display') { echo ' class="active"'; } ?>><a href="?category=display">版式分布</a></li>
        <li<?php if ($tpl_name==='index' && $category==='detail') { echo ' class="active"'; } ?>><a href="?category=detail">浏览器详情</a></li>
        <li<?php if ($tpl_name==='index' && $category==='trend') { echo ' class="active"'; } ?>><a href="?category=trend">趋势</a></li>
    </ul>
