/*公共字段以外格式：*/
data = {
    /**
     * is下一次完整的搜索过程可能跨多个qid，若已当前qid来发送日志，则搜索框sug操作日志很难关联，所以用起始qid来关联日志
     * 中间qid发生变化时，通过form_submit这个action来体现，会记录变化后的qid
     * 当最终确认pv时，会记录起始qid和最终确认pv时的qid
     * 当没有确认pv关闭浏览器，会记录起始qid，结束的qid为空
     * 例子：用户在一次完成搜索的过程中qid从A开始，中间变化成B、C，最终确认pv变成D，则这次搜索的搜索框sug日志关联qid（公共日志字段中的qid）即为A，start_qid为A，end_qid为D，中间两次form_submit的action会记录下B和C
     */

    type: 0,                       // 从操作开始到结束的类型，0异步确认pv，1同步确认pv，2unload页面未确认pv
    start_qid: "c2e47e94000ab643", // 操作起始qid 
    end_qid: "c2e47e94000ab644",   // 确认pv或unload页面未确认pv的qid，未确认pv值为空
    t: 1428458059296,              // 操作结束时间

    // 操作行为序列
    action:[
        {       
            /*动作类别，包括:
             * ipt_focus,ipt_input,ipt_paste,ipt_backspace
             * sug_show,sug_hide,sug_hover,sug_select,sug_click
             * form_submit
             * */    
            type: "ipt_focus",
            /*中间字符，包含输入的一个字符，粘贴内容，sug选择内容*/    
            tmp_key: "",
            /*当前query*/    
            cur_key: "1",
            /*展现sug的id,qid+序列号，若无sug展现，值为空*/ 
            sug_id: "c2e47e94000ab6431",
            /*动作时间*/      
            t: 1428456337565,
        },
            
        {    
            type: "ipt_input",
            tmp_key: "2",   
            cur_key: "12",   
            sug_id: "c2e47e94000ab6432",  
            t: 1428456471073,
        },
        {    
            type: "backspace",
            tmp_key: "3",   
            cur_key: "12",   
            sug_id: "c2e47e94000ab6432",  
            t: 1428456471073,
        },
            
        {     
            type: "ipt_paste", 
            tmp_key: "306",
            cur_key: "12306",  
            sug_id: "c2e47e94000ab6432", 
            t: 1428456533400,
        },
            
        {     
            type: "sug_show",  
            sug_id: "c2e47e94000ab6433",
            sug_num: 4,                                   // sug展现数目     
            sug_info: ["12306", "12306铁路客户服务中心"],   // sug具体展现内容,只记录特型，历史sug
            t: 1428456337565,  
        },
            
        {
            type: "sug_hide",
            sug_id: "c2e47e94000ab6434",              
            t: 1428456533400,           
        },
            
        {               
            type: "sug_hover",               
            sug_index: 1,  // 被操作sug索引     
            sug_id: "c2e47e94000ab6434",              
            t: 1428456533388,           
        },
            
        {               
            type: "sug_select",               
            sug_index: 0,             
            sug_id: "c2e47e94000ab6435",              
            t: 14284565333893           
        },
            
        {               
            type: "sug_click",                
            sug_index: 2,             
            sug_id: "c2e47e94000ab6436",              
            t: 1428456533395,           
        },
 
       {               
            type: “sug_req”,               
            status: "req",  // req开始请求，abort请求终止，success请求成功，error请求超时            
            sug_id: “c2e47e94000ab6436”,              
            t: 1428456533395,           
        },
            
        {               
            type: “form_submit”,
            submit_type: "enter_click", // 检索方式,enter_key回车,btn_click点击百度一下,sug_select sug选择,sug_click sug点击,ipt_change输入预取
            cur_key: "123",
            qid: "c2e47e94000ab643",              
            t: 1428458059296,           
        }
    ]
}
/**
 * 拆分说明:
 * 搜索框sug日志会被拆分成两种：action(多条)、确认pv或关闭浏览器的日志（只有一条）
 * 例子：{type: 0, start_qid: A, end_qid: D, t: 1428458059296｝, 
 * {action: {type: ipt_input,tmp_key: 2,   cur_key: 12, sug_id: c2e47e94000ab6432, t: 1428456471073}}
 * 合并说明：
 * 将多条action内容合并成数组，再与确认pv或关闭浏览器的日志合并即可
 */