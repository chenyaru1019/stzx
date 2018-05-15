
    //设置项目人员信息
  function setProjectOutline() {
        var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
        $.ajax({
            type: "POST",    //页面请求的类型
            url: "ProjectOutlineChanges.ashx?Command=getProjectOutline",   //处理页的相对地址
            data: {
                ProjectId: ProjectId
            },
            async: false,
            success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
                console.log(e);
                if (e != null) {
                    //技术要求
                    if (e.SkillsRequirement != null) {
                        $.MvcSheetUI.SetControlValue("SkillsRequirement",e.SkillsRequirement);
                    }
                    //项目人员
                    if (e.projectMemberList != null) {
                        var result = e.projectMemberList;
                        var dtl = $.MvcSheetUI.GetElement("ProjectChangeMember").SheetGridView();
                        dtl._Clear();
                        for (var i = 0; i < result.length; i++) {
                            dtl._AddRow();
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.FullName", result[i].FullName, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.UserRole", result[i].UserRole, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.Department", result[i].Department, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.Profession", result[i].Profession, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.JobTitle", result[i].JobTitle, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.Qualification", result[i].Qualification, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.AppointmentDate", result[i].AppointmentDate, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.ResidentBegin", result[i].ResidentBegin, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.ResidentEnd", result[i].ResidentEnd, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeMember.UserId", result[i].UserId, i + 1);
                        }
                    }
                    //项目专家
                    if (e.projectExpertList!= null) {
                        var result = e.projectExpertList;
                        var dtl = $.MvcSheetUI.GetElement("ProjectChangeExpert").SheetGridView();
                        dtl._Clear();
                        for (var i = 0; i < result.length; i++) {
                            dtl._AddRow();
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.FullName", result[i].FullName, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.UserRole", result[i].UserRole, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.Profession", result[i].Profession, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.JobTitle", result[i].JobTitle, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.Qualification", result[i].Qualification, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.AppointmentDate", result[i].AppointmentDate, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.ResidentBegin", result[i].ResidentBegin, i + 1);
                            $.MvcSheetUI.SetControlValue("ProjectChangeExpert.ResidentEnd", result[i].ResidentEnd, i + 1);
            
                        }
                    }

                    //项目收付款计划
                    if (e.paymentPlanList != null) {
                        var result = e.paymentPlanList;
                        var dtl = $.MvcSheetUI.GetElement("sfkjhbg").SheetGridView();
                        dtl._Clear();
                        for (var i = 0; i < result.length; i++) {
                            dtl._AddRow();
                            $.MvcSheetUI.SetControlValue("sfkjhbg.PlanTitle", result[i].PlanTitle, i + 1);
                            $.MvcSheetUI.SetControlValue("sfkjhbg.PlanDate", result[i].PlanDate, i + 1);
                            $.MvcSheetUI.SetControlValue("sfkjhbg.PaymentDescription", result[i].PaymentDescription, i + 1);
                            $.MvcSheetUI.SetControlValue("sfkjhbg.PaymentPercentage", result[i].PaymentPercentage, i + 1);
                       
                        }
                    }

                     //项目形象进度计划
                    if (e.projectProgressList != null) {
                        var result = e.projectProgressList;
                        var dtl = $.MvcSheetUI.GetElement("xmjtjh").SheetGridView();
                        dtl._Clear();
                        for (var i = 0; i < result.length; i++) {
                            dtl._AddRow();
                            $.MvcSheetUI.SetControlValue("xmjtjh.ScheduleBegin", result[i].ScheduleBegin, i + 1);
                            $.MvcSheetUI.SetControlValue("xmjtjh.ScheduleEnd", result[i].ScheduleEnd, i + 1);
                            $.MvcSheetUI.SetControlValue("xmjtjh.ItemDescription", result[i].ItemDescription, i + 1);
                            $.MvcSheetUI.SetControlValue("xmjtjh.ProjectSchedule", result[i].ProjectSchedule, i + 1);
                        }
                    }
                }

            }
        });


    }

