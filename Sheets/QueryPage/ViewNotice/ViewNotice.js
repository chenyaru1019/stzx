
var tableData = new Array();
$('#ViewNotice').bootstrapTable({
    //height: ,
    //        showRefresh: true,
    toolbar: '#toolbar',
    //模拟数据
    columns: [
        {
        field: 'NoticeId',
        title: '#',
        align: 'center',
        },{
        align: 'left',
        valign: 'middle',
        field: 'Title',
        width: '50%',
        title: '标题'
    }, {
        align: 'left',
        valign: 'middle',
        field: 'PublishTime',
        width: '50%',
        title: '发布时间'
        }],
    pagination: true,
    pageNumber: 1,
    pageSize: 10,
    data: tableData
  
});
function operateFormatter(value, row, index) {
    return ['<button  type="button" class="btn btn-primary btn-xs" onclick="Project.delete2(row)">操作</button>'
    ].join('');

}
$.MvcSheet.Loaded = function () {
    $('#ViewNotice').bootstrapTable('hideColumn', 'NoticeId');
    queryNotice();
}
//查询
function queryNotice() {
    var title = $.MvcSheetUI.GetControlValue("Title");
    var department = $.MvcSheetUI.GetControlValue("Department");
    var startDate = $.MvcSheetUI.GetControlValue("PublicStart");
    var endDate = $.MvcSheetUI.GetControlValue("PublicEnd");

    $("#ViewNotice").bootstrapTable('removeAll');
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=QueryNotice",   //处理页的相对地址
        data: {
            title: title,
            department: department,
            startDate: startDate,
            endDate: endDate,
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
console.log(e);
            for (var i = 0; i < e.length; i++) {

                var obj = {};
                // console.log(obj);
                if (e[i].IsTop == 1 && e[i].Flag == 1) {
                    //置顶
                    obj.Title = "<img src='../../../img/ic_stick.png' style='width:15px;height: 17px;margin-right: 5px;' /><img src='../../../img/ic_new.png' style='width: 32px;margin-top: -2px; margin-right: 5px;'/>" + e[i].Title + "";
                }
                else if (e[i].IsTop == 1){
                    obj.Title = "<img src='../../../img/ic_stick.png' style='width:15px;height: 17px;margin-right: 5px;' />" + e[i].Title;
                } else if(e[i].Flag == 1){
                    obj.Title = "<img src='../../../img/ic_new.png' style='width: 32px;margin-top: -2px;  margin-right: 5px;'/>"+e[i].Title;
                } else {
                    obj.Title =  e[i].Title;
                }
                obj.ObjectId = e[i].ObjectID;
                obj.PublishTime = e[i].PublishTime.substring(0,10);

                // 往bootstrapTable添加数据
                $("#ViewNotice").bootstrapTable('insertRow', { index: i, row: obj });
            }
        }
    });
}

$(function () {
    $('#ViewNotice').on('click-row.bs.table', function (e, row, element) {
        //$(element).css({"color":"blue","font-size":"16px;"});  
        var url = "/Portal/Sheets/stzx/NewNotice/NewNotice.aspx?SheetCode=NewNotice&Mode=View&SchemaCode=NewNotice&BizObjectID=";
        window.open(url + row.ObjectId, '_blank');
         
    });
    $('#Btn_dropDown-ViewNews').on('click',function () {
        $('.searchBox').toggle(200);
        $('.Btn_dropDown').toggleClass('Btn_dropup');
    })
})  