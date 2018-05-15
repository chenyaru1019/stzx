//设置任务变更信息
function setTaskChangeInfo() {
    var ProjectTaskId = $.MvcSheetUI.GetControlValue("ProjectTaskId");
    var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "STaskChange.ashx?Command=GetTaskChangeInfo",   //处理页的相对地址
        data: {
            ProjectTaskId: ProjectTaskId, ProjectId: ProjectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            if (e != null) {
                console.log(e);
                if (e.xmfzr != null) {
                    $.MvcSheetUI.SetControlValue("xmfzr", e.xmfzr)
                }
                if (e.RDepartment != null) {
                    $.MvcSheetUI.SetControlValue("RDepartment", e.RDepartment)
                }
                if (e.JDepartment != null) {

                    $.MvcSheetUI.SetControlValue("JDepartment", e.JDepartment.ArrayOfString.string)
                }
                if (e.fgld != null) {

                    $.MvcSheetUI.SetControlValue("fgld", e.fgld.ArrayOfString.string)
                }

                $.MvcSheetUI.SetControlValue("ProjectName", e.ProjectName); //项目名称
                $.MvcSheetUI.SetControlValue("EntrustedUnit", e.EntrustedUnit);
                $.MvcSheetUI.SetControlValue("TaskBasis", e.TaskBasis);
                $.MvcSheetUI.SetControlValue("Content", e.Content);
                $.MvcSheetUI.SetControlValue("ServiceCycle", e.ServiceCycle);
                $.MvcSheetUI.SetControlValue("ServiceResults", e.ServiceResults);
                $.MvcSheetUI.SetControlValue("ContractAmount", e.ContractAmount);
                $.MvcSheetUI.SetControlValue("Outside", e.Outside);
                $.MvcSheetUI.SetControlValue("TechnicalValidation", e.TechnicalValidation);
                if (e.ChangeContent != null) {
                    $.MvcSheetUI.SetControlValue("ChangeContent", "上次修改"+e.ChangeContent); 
                }
               

                //项目人员
                if (e.projectMemberList != null) {
                    var result = e.projectMemberList;
                    var dtl = $.MvcSheetUI.GetElement("TaskChangeMember").SheetGridView();
                    dtl._Clear();
                    for (var i = 0; i < result.length; i++) {
                        dtl._AddRow();
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.FullName", result[i].FullName, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.PersonRole", result[i].UserRole, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.Department", result[i].Department, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.Profession", result[i].Profession, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.JobTitle", result[i].JobTitle, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.Qualification", result[i].Qualification, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.AppointmentDate", result[i].AppointmentDate, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.ResidentBegin", result[i].ResidentBegin, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.ResidentEnd", result[i].ResidentEnd, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.UserId", result[i].UserId, i + 1);
                    }
                }
                //项目专家
                if (e.projectExpertList != null) {
                    var result = e.projectExpertList;
                    var dtl = $.MvcSheetUI.GetElement("TaskChangeExpert").SheetGridView();
                    dtl._Clear();
                    for (var i = 0; i < result.length; i++) {
                        dtl._AddRow();
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.FullName", result[i].FullName, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.PersonRole", result[i].UserRole, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.Profession", result[i].Profession, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.JobTitle", result[i].JobTitle, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.Qualification", result[i].Qualification, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.AppointmentDate", result[i].AppointmentDate, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.ResidentBegin", result[i].ResidentBegin, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.ResidentEnd", result[i].ResidentEnd, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.UserId", result[i].UserId, i + 1);
                    }
                }


            }

        }
    });


}






//设置项目人员信息
function setProjectMember() {
    var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
    var ProjectTaskId = $.MvcSheetUI.GetControlValue("ProjectTaskId");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "STaskChange.ashx?Command=getProjectMember",   //处理页的相对地址
        data: {
            ProjectId: ProjectId, ProjectTaskId: ProjectTaskId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据

            if (e != null) {
                console.log(e);
                //项目人员
                if (e.projectMemberList != null) {
                    var result = e.projectMemberList;
                    var dtl = $.MvcSheetUI.GetElement("TaskChangeMember").SheetGridView();
                    dtl._Clear();
                    for (var i = 0; i < result.length; i++) {
                        dtl._AddRow();
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.FullName", result[i].FullName, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.PersonRole", result[i].UserRole, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.Department", result[i].Department, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.Profession", result[i].Profession, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.JobTitle", result[i].JobTitle, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.Qualification", result[i].Qualification, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.AppointmentDate", result[i].AppointmentDate, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.ResidentBegin", result[i].ResidentBegin, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.ResidentEnd", result[i].ResidentEnd, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeMember.UserId", result[i].UserId, i + 1);
                    }
                }
                //项目专家
                if (e.projectExpertList != null) {
                    var result = e.projectExpertList;
                    var dtl = $.MvcSheetUI.GetElement("TaskChangeExpert").SheetGridView();
                    dtl._Clear();
                    for (var i = 0; i < result.length; i++) {
                        dtl._AddRow();
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.FullName", result[i].FullName, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.PersonRole", result[i].UserRole, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.Profession", result[i].Profession, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.JobTitle", result[i].JobTitle, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.Qualification", result[i].Qualification, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.AppointmentDate", result[i].AppointmentDate, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.ResidentBegin", result[i].ResidentBegin, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.ResidentEnd", result[i].ResidentEnd, i + 1);
                        $.MvcSheetUI.SetControlValue("TaskChangeExpert.UserId", result[i].UserId, i + 1);
                    }
                }
            }

        }
    });


}
