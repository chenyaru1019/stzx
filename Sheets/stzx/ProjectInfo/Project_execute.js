
function getProjectProcess(projectId) {
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "Project_execute.ashx?Command=GetProjectProcess",   //处理页的相对地址
        data: {
            ProjectId: projectId
        },
        async: false,
        success: function (e) {
            //这是处理后执行的函数，msg是处理页返回的数据
            if (e) {
                switch (e.Status) {
                    case "1":
                        $("#sel").val("任务书下达");
                        break;
                    case "2":
                      
                        $("#sel").val("大纲编制");
                        break;
                    case "3":
                        $("#sel").val("项目执行");
                        break;
                    case "4":
                        $("#sel").val("项目归档");
                        break;
                    case "5":
                        $("#sel").val("项目销项");
                        break;
                    default:
                        break;
                }


                $("#FlowChart1").find("li:lt(" +(e.Status)+")").css({'background-color':'#9A9A9A','border-bottom-color':'#9A9A9A'});
                $("#FlowChart").find("li:lt(" +(e.Status)+") span").css({'font-weight':'600'});
            }

        }
    });

}

