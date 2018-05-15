
function setArchiveData() {
    var projectId = $.MvcSheetUI.GetControlValue("ProjectId");
    var flag = $.MvcSheetUI.GetControlValue("Flag");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "SArchiveInfo.ashx?Command=GetArchiveData",   //处理页的相对地址
        data: {
            ProjectId: projectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            console.log(e);
            if (e.ArchiveData != null) {
                var result = e.ArchiveData;
                var dtl = $.MvcSheetUI.GetElement("ArchiveData").SheetGridView();
                dtl._Clear();
                for (var i = 0; i < result.length; i++) {
                    dtl._AddRow();
                    $.MvcSheetUI.SetControlValue("ArchiveData.FileName", result[i].FileName, i + 1);
                    $.MvcSheetUI.SetControlValue("ArchiveData.Modus", result[i].Modus, i + 1);
                    $.MvcSheetUI.SetControlValue("ArchiveData.Num", result[i].Num, i + 1);
                    $.MvcSheetUI.SetControlValue("ArchiveData.Note", result[i].Note, i + 1);
                    if (flag == "1") {
                        //可下载操作
                        var url = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=" + result[i].SchemaCode + "&BizObjectID=" + result[i].BizObjectId + "&AttachmentID=" + result[i].FileObjectID + "&OpenMethod=0";
                        $($('#Control12 .rows #operate ').find('a')[i]).html('下载')
                        $($('#Control12 .rows #operate ').find('a')[i]).attr('href', url)
                    } else {
                        //借阅操作   
                        var url = "/Portal/Sheets/stzx/FileBorrow/SFileBorrow.aspx?Mode=Originate&WorkflowCode=FileBorrow&WorkflowVersion=" + e.Version + "&ProjectId=" + projectId;
                        $($('#Control12 .rows #operate ').find('a')[i]).html('借阅')
                        $($('#Control12 .rows #operate ').find('a')[i]).attr('href', url)
                    }

                }
            }


        }
    });


}


function setProcessInfo() {
    var projectId = $.MvcSheetUI.GetControlValue("ProjectId");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "SArchiveInfo.ashx?Command=GetProcessInfo",   //处理页的相对地址
        data: {
            ProjectId: projectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            console.log(e);
            $.MvcSheetUI.SetControlValue("ProjectNum", e.ProjectNum);
            $.MvcSheetUI.SetControlValue("ProjectName", e.ProjectName);
            if (e.projectProcessInfoList != null) {
                var result = e.projectProcessInfoList;
                var dtl = $.MvcSheetUI.GetElement("ProcessInfo").SheetGridView();
                dtl._Clear();
                for (var i = 0; i < result.length; i++) {
                    dtl._AddRow();
                    $.MvcSheetUI.SetControlValue("ProcessInfo.SerialNum", result[i].SequenceNo, i + 1);
                    $.MvcSheetUI.SetControlValue("ProcessInfo.Title", result[i].Title, i + 1);
                    $.MvcSheetUI.SetControlValue("ProcessInfo.FormName", result[i].FormName, i + 1);
                    $.MvcSheetUI.SetControlValue("ProcessInfo.StartDate", result[i].StartDate, i + 1);
                    $.MvcSheetUI.SetControlValue("ProcessInfo.Department", result[i].Department, i + 1);
                    $.MvcSheetUI.SetControlValue("ProcessInfo.Applyer", result[i].Applyer, i + 1);
                    var url = '';
                    switch (result[i].SchemaCode) {
                        case "ProjectPropose":
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SProjectPropose&Mode=View&SchemaCode=ProjectPropose&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "PreProject":
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SPreProject&Mode=View&SchemaCode=PreProject&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "ContractWillSign":
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SContractWillSign&Mode=View&SchemaCode=ContractWillSign&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "ProjectTask":
                            url = "/Portal/Sheets/stzx/ProjectTask/SProjectTask.aspx?Mode=View&SchemaCode=ProjectTask&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "TaskChange":
                            url = "/Portal/Sheets/stzx/TaskChange/STaskChange.aspx?Mode=View&SchemaCode=TaskChange&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "ProjectOutline": //大纲
                            url = "/Portal/Sheets/stzx/ProjectOutline/SProjectOutline.aspx?Mode=View&SchemaCode=ProjectOutline&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "ProjectOutlineChanges": //大纲变更
                            url = "/Portal/Sheets/stzx/ProjectOutlineChanges/SProjectOutlineChanges.aspx?Mode=View&SchemaCode=ProjectOutlineChanges&BizObjectID=" + result[i].BizObjectID;
                            break;

                        case "ProjectOutside":  //委外
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SProjectOutside&Mode=View&SchemaCode=ProjectOutside&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "ExternalDataregistrat":  //外部
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SExternalDataregistrat&Mode=View&SchemaCode=ExternalDataregistrat&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "ProjectReview":  //输入评审
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SProjectReview&Mode=View&SchemaCode=ProjectReview&BizObjectID=" + result[i].BizObjectID;
                            break;

                        case "DesignTRR ":  //外部
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SDesignTRR &Mode=View&SchemaCode=DesignTRR &BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "ConsultativeTRR":  //输入评审
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SConsultativeTRR&Mode=View&SchemaCode=ConsultativeTRR&BizObjectID=" + result[i].BizObjectID;
                            break;

                        case "ProjectArchive": //归档
                            url = "/Portal/Sheets/stzx/ProjectArchive/SProjectArchive.aspx?Mode=View&SchemaCode=ProjectArchive&BizObjectID=" + result[i].BizObjectID;
                            break;

                        case "ProjectConclusion":  //收尾
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SProjectConclusion&Mode=View&SchemaCode=ProjectConclusion&BizObjectID=" + result[i].BizObjectID;
                            break;

                        case "ProjectRevoked":  //撤销
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SProjectRevoked&Mode=View&SchemaCode=ProjectRevoked&BizObjectID=" + result[i].BizObjectID;
                            break;
                        case "HTXH":  //销号
                            url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SHTXH&Mode=View&SchemaCode=HTXH&BizObjectID=" + result[i].BizObjectID;
                            break;
                        default:

                            break;


                    }
                    if (url != '') {
                        $($('#ctl88608 .rows #ctl88608_control6 ').find('a')[i]).html('查看')
                        $($('#ctl88608 .rows #ctl88608_control6 ').find('a')[i]).attr('href', url)
                    }

                }
            }


        }
    });


}