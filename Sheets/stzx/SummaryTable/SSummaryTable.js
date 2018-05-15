
function querySummary() {
    var year = $.MvcSheetUI.GetControlValue("ParticularYear");
    var quarterly = $.MvcSheetUI.GetControlValue("Quarterly");
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "SSummaryTable.ashx?Command=querySummary",   //处理页的相对地址
        data: {
            year: year, quarterly: quarterly
        },
        async: false,
        success: function (e) {   
            //这是处理后执行的函数，msg是处理页返回的数据
            if (e != null) {
                var dtl = $.MvcSheetUI.GetElement("Summary_Table").SheetGridView();
                dtl._Clear();
                for (var i = 0; i < e.length; i++) {
                    dtl._AddRow();
                    $.MvcSheetUI.SetControlValue("Summary_Table.ProjectName", e[i].ProjectName, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.TaskNum", e[i].TaskNum, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.Quality", e[i].Quality, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.Schedule", e[i].Schedule, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.Contract", e[i].Contract, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.Security", e[i].Security, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.Datum", e[i].Datum, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.Material", e[i].Material, i + 1);
                    $.MvcSheetUI.SetControlValue("Summary_Table.Cost", e[i].Cost, i + 1);
                }


            }
            
        }
    });

}

