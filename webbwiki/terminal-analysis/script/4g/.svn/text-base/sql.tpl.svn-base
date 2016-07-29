select sum(wisetotal) wisetotal, 
       sum(wise4gtotal) wise4gtotal, 
       sum(iutotal) iutotal, 
       sum(iu4gtotal) iu4gtotal, 
       sum(iu_exclude_box_total) iu_exclude_box_total, 
       sum(iu_exclude_box_4g_total) iu_exclude_box_4g_total, 
       sum(iu_exclude_box_4g1) iu_exclude_box_4g1, 
       sum(iu_exclude_box_4g2) iu_exclude_box_4g2, 
       sum(iu_exclude_box_4g3) iu_exclude_box_4g3, 
       sum(iu_exclude_box_4g4) iu_exclude_box_4g4, 
       sum(iu_exclude_box_4g5) iu_exclude_box_4g5, 
       sum(iu_exclude_box_4g6) iu_exclude_box_4g6, 
       sum(bdbox) bdbox, 
       sum(bdbox_4g) bdbox_4g, 
       sum(bdbox_4g1) bdbox_4g1, 
       sum(bdbox_4g2) bdbox_4g2, 
       sum(bdbox_4g3) bdbox_4g3, 
       sum(bdbox_4g4) bdbox_4g4, 
       sum(bdbox_4g5) bdbox_4g5, 
       sum(bdbox_4g6) bdbox_4g6 
from (
    select 
        case when event_others['net_type'] is not null then 1 else 0 end wisetotal, 
        case when event_others['net_type']='4' then 1 else 0 end wise4gtotal, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_others['net_type'] is not null then 1 else 0 end iutotal, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_others['net_type']='4' then 1 else 0 end iu4gtotal, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type'] is not null then 1 else 0 end iu_exclude_box_total, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type']='4' then 1 else 0 end iu_exclude_box_4g_total, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type']='4' and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"1\"%' 
             then 1 else 0 end iu_exclude_box_4g1, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type']='4' and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"2\"%' 
             then 1 else 0 end iu_exclude_box_4g2, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type']='4' and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"3\"%' 
             then 1 else 0 end iu_exclude_box_4g3, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type']='4' and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"4\"%' 
             then 1 else 0 end iu_exclude_box_4g4, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type']='4' and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"5\"%' 
             then 1 else 0 end iu_exclude_box_4g5, 
        case when wiseps_formattn in ('iphone','utouch') and 
                  event_browser != 'baiduboxapp' and 
                  event_others['net_type']='4' and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"6\"%' 
             then 1 else 0 end iu_exclude_box_4g6, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type'] is not null and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) 
                  then 1 else 0 end bdbox, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type']='4' and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) 
                  then 1 else 0 end bdbox_4g, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type']='4' and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"1\"%' 
                  then 1 else 0 end bdbox_4g1, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type']='4' and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"2\"%' 
                  then 1 else 0 end bdbox_4g2, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type']='4' and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"3\"%' 
                  then 1 else 0 end bdbox_4g3, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type']='4' and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"4\"%' 
                  then 1 else 0 end bdbox_4g4, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type']='4' and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"5\"%' 
                  then 1 else 0 end bdbox_4g5, 
        case when event_browser='baiduboxapp' and 
                  event_others['net_type']='4' and 
                  substr(event_browser_version,1,3) >= 5.4 and 
                  (if(substr(split(wiseps_client_params['cut'],'_')[1],1,1) >= 7,TRUE,FALSE)) and 
                  event_others['temp_kv'] like '%\"key\":\"4gfrom\",\"value\":\"6\"%' 
                  then 1 else 0 end bdbox_4g6 
    from udw.udw_event 
    where event_day='${hivevar:day}' and 
          event_action='wiseps_query_click'
) tbl limit 10;
