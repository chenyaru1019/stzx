
    //判断该项目大纲是否提交过
  function checkProject() {
        var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
        $.ajax({
            type: "POST",    //页面请求的类型
            url: "SProjectOutline.ashx?Command=checkProject",   //处理页的相对地址
            data: {
                ProjectId: ProjectId
            },
            async: false,
            success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
                console.log(e);
                if (e.status != "success") {

                    alert("该项目大纲已申请过，请选择其他项目");
                    //状态设置为0 ，提交判断为0阻止提交
                    $.MvcSheetUI.SetControlValue("Status", "1");
                } else {
                    setProjectMember();
                    $("#ctl205039").SheetUIManager().ClearChoices(); 
                    setProjectDepart();
                }

            }
        });


}

//设置项目成员和专家
function setProjectMember() {
    var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "SProjectOutline.ashx?Command=GetProjectMember",   //处理页的相对地址
        data: {
            ProjectId: ProjectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            if (e != null) {
                //项目人员
                if (e.projectMemberList != null) {
                    var result = e.projectMemberList;
                    var dtl = $.MvcSheetUI.GetElement("ProjectMember").SheetGridView();
                    dtl._Clear();
                    for (var i = 0; i < result.length; i++) {
                        dtl._AddRow();
                        $.MvcSheetUI.SetControlValue("ProjectMember.FullName", result[i].FullName, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.UserRole", result[i].UserRole, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.Department", result[i].Department, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.Profession", result[i].Profession, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.JobTitle", result[i].JobTitle, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.Qualification", result[i].Qualification, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.AppointmentDate", result[i].AppointmentDate, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.ResidentBegin", result[i].ResidentBegin, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.ResidentEnd", result[i].ResidentEnd, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectMember.UserId", result[i].UserId, i + 1);
                    }
                }
                //项目专家
                if (e.projectExpertList != null) {
                    var result = e.projectExpertList;
                    var dtl = $.MvcSheetUI.GetElement("ProjectExpert").SheetGridView();
                    dtl._Clear();
                    for (var i = 0; i < result.length; i++) {
                        dtl._AddRow();
                        $.MvcSheetUI.SetControlValue("ProjectExpert.FullName", result[i].FullName, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectExpert.UserRole", result[i].UserRole, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectExpert.Profession", result[i].Profession, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectExpert.JobTitle", result[i].JobTitle, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectExpert.Qualification", result[i].Qualification, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectExpert.AppointmentDate", result[i].AppointmentDate, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectExpert.ResidentBegin", result[i].ResidentBegin, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectExpert.ResidentEnd", result[i].ResidentEnd, i + 1);

                    }
                }
            }

        }
    });


}