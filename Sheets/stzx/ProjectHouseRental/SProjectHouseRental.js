
    //设置项目部门信息
function setHouseRentalInfo() {
       var ProjectId = $.MvcSheetUI.GetControlValue("ProjectId");
        $.ajax({
            type: "POST",    //页面请求的类型
            url: "SProjectHouseRental.ashx?Command=getHouseRentalInfo",   //处理页的相对地址
            data: {
                 ProjectId: ProjectId
            },
            async: false,
            success: function (result) {    //这是处理后执行的函数，msg是处理页返回的数据
                if (result != null) {
                    var dtl = $.MvcSheetUI.GetElement("ProjectHouseInfo").SheetGridView();
                    dtl._Clear();
                    for (var i = 0; i < result.length; i++) {
                        dtl._AddRow();
                        //遍历，给子表赋值
                        $.MvcSheetUI.SetControlValue("ProjectHouseInfo.Place", result[i].Place, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectHouseInfo.Personnel", result[i].Personnel, i + 1);
                        $.MvcSheetUI.SetControlValue("ProjectHouseInfo.Type", result[i].Type, i + 1);

                    }

                }

            }
        });


}



