var dialog = {
    // 错误弹出层
    error: function(message) {
        layer.msg(message,{
            // #content:message,
            icon:2,
            title : '错误提示',
            time: 3000
        });
    },
    //成功弹出层
    success : function(message,url) {
        layer.msg(message,{
            //content : message,
            time: 3000,
            icon : 1,
            //location.href : url
            end : function(){
                location.href=url;
            },
        });
    },
    // 确认弹出层
    confirm : function(message, url) {
        layer.open({
            content : message,
            icon:3,
            btn : ['是','否'],
            yes : function(){
                location.href=url;
            },
        });
    },
    //无需跳转到指定页面的确认弹出层
    toconfirm : function(message) {
        layer.open({
            content : message,
            icon:3,
            btn : ['确定'],
        });
    },
};