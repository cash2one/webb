// AMD组件配置Paths
{
    "wcl/webb-ia":"webb-1.0.min",
    "wcl/webb-disp":"webb-1.0.min"
}

// webb发送渲染日志
require(['wcl/webb-disp'],function(Disp){
    var disp = new Disp();
});

// webb发送交互日志
require(['wcl/webb-ia'],function(IA){
    var ia = new IA({useBase:true});
});

// webb 同时发送渲染和交互日志
require(['wcl/webb-ia','wcl/webb-disp'],function(IA,Disp){
    var IA = new IA({useBase:true});
    var Disp = new Disp();
});

