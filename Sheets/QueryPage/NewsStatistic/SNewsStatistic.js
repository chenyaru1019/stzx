

//查询
function newsStatistic(year) {
    if (!year) {
        var year = $("#Control11").val();
    }
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "SNewsStatistic.ashx?Command=NewsStatistic",   //处理页的相对地址
        data: {
            Year: year,
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
      
            if (e != null) {
                var result = e;
                var dtl = $.MvcSheetUI.GetElement("NewsStatisticTable").SheetGridView();
                dtl._Clear();
                for (var i = 0; i < result.length; i++) {
                    dtl._AddRow();
                    $.MvcSheetUI.SetControlValue("NewsStatisticTable.Department", result[i].Department, i + 1);
                    $.MvcSheetUI.SetControlValue("NewsStatisticTable.Applyer", result[i].Publisher, i + 1);
                    $.MvcSheetUI.SetControlValue("NewsStatisticTable.NewsName", result[i].Title, i + 1);
                    $.MvcSheetUI.SetControlValue("NewsStatisticTable.PulishDate", result[i].PublishTime, i + 1);
                    $.MvcSheetUI.SetControlValue("NewsStatisticTable.Total", result[i].Total, i + 1);
                  
                }
            }
        }
    });
}
