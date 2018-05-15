
//设置项目文件
function setProjectAttachment() {
    var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "ProjectArchive.ashx?Command=GetProjectAttachment",   //处理页的相对地址
        data: {
            ProjectId: ProjectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            console.log(e);
            if (e.AttachmentResult != null) {
                        var result = e.AttachmentResult;
                        var dtl = $.MvcSheetUI.GetElement("TransferOrders").SheetGridView();
                        dtl._Clear();
                        for (var i = 0; i < result.length; i++) {
                            dtl._AddRow();
                            $.MvcSheetUI.SetControlValue("TransferOrders.FileName", result[i].FileName, i + 1);
                            $.MvcSheetUI.SetControlValue("TransferOrders.BizObjectId", result[i].BizObjectId, i + 1);
                            $.MvcSheetUI.SetControlValue("TransferOrders.FileObjectID", result[i].ObjectID, i + 1);
                            $.MvcSheetUI.SetControlValue("TransferOrders.SchemaCode", result[i].SchemaCode, i + 1);
                          
                        }
                    }

        }
    });


}
