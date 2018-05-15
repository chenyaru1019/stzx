// queryProjectInfo();
var tableData = new Array();
$('#ViewProjectInfo').bootstrapTable({

    toolbar: '#toolbar',
    //模拟数据
    columns: [
        // {
        //     field: 'ObjectID',
        //     title: '#',
        //     align: 'center',
        // },
        {
            align: 'left',
            valign: 'middle',
            field: 'ProjectNum',
            width: '50%',
            title: '项目编号'
        },
        {
            align: 'left',
            valign: 'middle',
            field: 'TaskNum',
            width: '50%',
            title: '任务编号'
        },

        {
            align: 'left',
            valign: 'middle',
            field: 'ProjectName',
            width: '60%',
            title: '项目名称'
        },
        {
            align: 'left',
            valign: 'middle',
            field: 'ProjectType',
            width: '50%',
            title: '项目类别'
        },

        {
            align: 'left',
            valign: 'middle',
            field: 'xmfzr',
            width: '50%',
            title: '项目负责人'
        },
        {
            align: 'left',
            valign: 'middle',
            field: 'fzbm',
            width: '50%',
            title: '项目负责人'
        }],
    showColumns: false, // 开启自定义列显示功能
    pagination: true,
    pageNumber: 1,
    pageSize: 10,
    data: tableData

});
function operateFormatter(value, row, index) {
    return ['<button  type="button" class="btn btn-primary btn-xs" onclick="Project.delete2(row)">操作</button>'
    ].join('');

}
//查询
function queryProjectInfo() {
    var user = window.localStorage.getItem('getCurrentUser');
    var userId = JSON.parse(user).ObjectID;
    var projectNum = $('input#ProjectNum').val();
    var contractNum = $('input#ContractNum').val();
    var taskNum = $('input#TaskNum').val();
    var projectName = $('input#ProjectName').val();
    var projectType = $('#ProjectType option:selected').val();
    var taskType = $('#TaskType option:selected').val();

    $("#ViewProjectInfo").bootstrapTable('removeAll');
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "Sheets/ProjectInfo/ProjectInfoService.ashx?Command=QueryProjectInfo",   //处理页的相对地址
        data: {
            UserId: userId,
            ProjectNum: projectNum,
            ContractNum: contractNum,
            TaskNum: taskNum,
            ProjectName: projectName,
            ProjectType: projectType,
            TaskType: taskType,

        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            console.log(e);
            for (var i = 0; i < e.length; i++) {
                var obj = {};
                obj.ObjectId = e[i].ObjectID;
                obj.ProjectNum = e[i].ProjectNum;
                obj.ContractNum = e[i].ContractNum;
                obj.TaskNum = e[i].TaskNum;
                obj.ProjectName = e[i].ProjectName;
                obj.ProjectType = e[i].ProjectType;
                obj.TaskType = e[i].TaskType;
                // 往bootstrapTable添加数据
                $("#ViewProjectInfo").bootstrapTable('insertRow', { index: i, row: obj });


            }
        }
    });
}

$(function () {
    $('#ViewProjectInfo').on('click-row.bs.table', function (e, row, element) {
        var url = "/Portal/Sheets/stzx/ProjectInfo/SProjectInfo.aspx?Mode=View&SchemaCode=ProjectInfo&BizObjectID="+row.ObjectId;
        $(".app-aside-right").find('iframe').attr('src',url);
        $('.app-aside-right').addClass('show');
        // window.open(url,'_blank');

    });
    $('#Btn_dropDown-ViewNews').on('click', function () {
        $('.searchBox').toggle(200);
        $('.Btn_dropDown').toggleClass('Btn_dropup');
    })
})  