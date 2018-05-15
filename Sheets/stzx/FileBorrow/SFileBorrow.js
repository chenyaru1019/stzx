
//设置项目借阅文件
function setArchiveData() {
    var projectId = $.MvcSheetUI.GetControlValue("ProjectId");
    var flag = $.MvcSheetUI.GetControlValue("Flag");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "/Portal/Sheets/stzx/ArchiveInfo/SArchiveInfo.ashx?Command=GetArchiveData",   //处理页的相对地址
        data: {
            ProjectId: projectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            console.log(e);
            if (e.ArchiveData != null) {
                var result = e.ArchiveData;
                var dtl = $.MvcSheetUI.GetElement("BorrowDocuments").SheetGridView();
                dtl._Clear();
                for (var i = 0; i < result.length; i++) {
                    dtl._AddRow();
                    $.MvcSheetUI.SetControlValue("BorrowDocuments.FileName", result[i].FileName, i + 1);
                    $.MvcSheetUI.SetControlValue("BorrowDocuments.Modus", result[i].Modus, i + 1);
                    $.MvcSheetUI.SetControlValue("BorrowDocuments.Num", result[i].Num, i + 1);
                    $.MvcSheetUI.SetControlValue("BorrowDocuments.Note", result[i].Note, i + 1);

                    $.MvcSheetUI.SetControlValue("BorrowDocuments.BizObjectId", result[i].BizObjectId, i + 1);
                    $.MvcSheetUI.SetControlValue("BorrowDocuments.FileObjectID", result[i].FileObjectID, i + 1);
                    $.MvcSheetUI.SetControlValue("BorrowDocuments.SchemaCode", result[i].SchemaCode, i + 1);

          
                }
            }


        }
    });


}



//设置名称和编号
function setProjectInfo() {
    var projectId = $.MvcSheetUI.GetControlValue("ProjectId");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "SFileBorrow.ashx?Command=GetProjectInfo",   //处理页的相对地址
        data: {
            ProjectId: projectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            if (e != null) {
                $.MvcSheetUI.SetControlValue("ProjectNum", e.ProjectNum);
                $.MvcSheetUI.SetControlValue("ProjectName", e.ProjectName);
            }
           
        }
    });


}

