/*公共字段以外格式：*/
data = {
    "status": 0,   // 0:success.mandatory
    "error": 0,    // 0:no error; 1:render timeout; 2:mip rules check failed.mandatory
    "ltm": 44,     // Loading time,ms,mandatory
    "rtm": 19,     // Rendering time,ms,optional
    "stm": 271,    // Scripting time,ms,optional
    "otm": 5       // Other time,ms,optional
}
