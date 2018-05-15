
//设置项目部门
function setProjectDepart() {
    
    var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "/Portal/Sheets/common/CommonService.ashx?Command=GetProjectDepart",   //处理页的相对地址
        data: {
            ProjectId: ProjectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            console.log(e);
            if (e.RDepartment != null) {
                $.MvcSheetUI.SetControlValue("xmfzr", e.xmfzr)
            }
            if (e.ProjectName != null) {
                $.MvcSheetUI.SetControlValue("ProjectName", e.ProjectName)
            }
            if (e.RDepartment != null) {
                $.MvcSheetUI.SetControlValue("ywbmzg", e.RDepartment)
            }
            if (e.fgld != null) {
                $.MvcSheetUI.SetControlValue("fgld", e.fgld.ArrayOfString.string)
            }
        }
    });


}

