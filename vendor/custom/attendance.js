/**
 * Created by LX on 2017/9/27.
 */
window.dataTableApp = {
    myDate: new Date(),
    year: new Date().getFullYear(),
    month: new Date().getMonth() + 1,
    daysCount: new Date(new Date().getFullYear(), new Date().getMonth() + 1, 0).getDate(),
    userName: null,
    Department:null,


    dataTableInit: function (dataTableDom) {
        var html = '';
        var that = this;

        that.dataTableobj = dataTableDom.dataTable({
            "sScrollX": "100%",
            "sScrollXInner": "110%",
            "bScrollCollapse": true,
            "searching ": false,
            "bLengthChange": false,
            "bFilter": false,
            "ordering": false,
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
            "sAjaxSource": url+'attendance/workdaily',
            "fnServerData":function ( sSource, aoData, fnCallback ) {//获取数据的处理函数
                $.ajax( {
                    type: "get",
                    url: sSource,
                    dataType: "jsonp",
                    data: aoData,
                    success: function(data) {
                        var jsonT;

                        if (data.length > 0) {

                            var rowList = new Array();

                            for (var i = 0; i < data.length; i++) {
//                                        console.log(data.length);
                                var row = data[i];
                                var objlist0 = [];
                                var objlist1 = [];
                                objlist0.push(""+i);
                                objlist0.push(""+row.name);
                                for(var x=0;x<row.workDayResult.length;x++){
                                    console.log(row.workDayResult.length);
                                    if(row.workDayResult[x] == null ){
                                        objlist0.push("空");
                                    }else{
                                        if(row.workDayResult[x].leaveType == null){
                                            objlist0.push("" + row.workDayResult[x].total);
                                        } else {
                                            if(row.workDayResult[x].leaveType == 'sj'){
                                                row.workDayResult[x].leaveType = '√';
                                            }else if (row.workDayResult[x].leaveType == 'gc'){
                                                row.workDayResult[x].leaveType = '△';
                                            }else if (row.workDayResult[x].leaveType == 'bj'){
                                                row.workDayResult[x].leaveType = '○';
                                            }else if (row.workDayResult[x].leaveType == 'kg'){
                                                row.workDayResult[x].leaveType = '×';
                                            }else if (row.workDayResult[x].leaveType == 'gx'){
                                                row.workDayResult[x].leaveType = '☆';
                                            }else if (row.workDayResult[x].leaveType == 'hs'){
                                                row.workDayResult[x].leaveType = '★';
                                            }else if (row.workDayResult[x].leaveType == 'cj'){
                                                row.workDayResult[x].leaveType = '◇';
                                            }else if (row.workDayResult[x].leaveType == 'gs'){
                                                row.workDayResult[x].leaveType = '●';
                                            }else if (row.workDayResult[x].leaveType == 'hh'){
                                                row.workDayResult[x].leaveType = '□';
                                            }else if (row.workDayResult[x].leaveType == 'tq'){
                                                row.workDayResult[x].leaveType = '□';
                                            }else if (row.workDayResult[x].leaveType == null){
                                                row.workDayResult[x].leaveType = '×';
                                            }
                                            objlist0.push(""+row.workDayResult[x].leaveType);
                                        }

                                    }
                                }
                                rowList.push(objlist0);
                            }
                            jsonT = {
                                "sEcho": 3,
                                "iTotalRecords": 57,
                                "iTotalDisplayRecords": 57,
                                "aaData": rowList
                            };
//                                console.log(jsonT);
                        } else {
                            jsonT = {
                                "sEcho": 3,
                                "iTotalRecords": 57,
                                "iTotalDisplayRecords": 57,
                                "aaData": []
                            };
                        }

                        fnCallback(jsonT);

                    },

                    error:function(){
                        alert('error');
                    }
                });
            },
            "fnServerParams": function (aoData) {  // 增加自定义查询条件
                aoData.push(
                    { "name": "userName", "value": that.userName },
                    { "name": "year", "value": that.year },
                    { "name": "month", "value": that.month},
                    { "name": "department", "value": that.Department}
                );
            }
        });
    },

    setdataTableHeader: function(daycount) {
        var html = '';
        var that = this;
        var count;

        if (daycount) {
            count = daycount;
            $('.Workdays').attr('colspan',count);
        } else {
            count = that.daysCount;
            $('.Workdays').attr('colspan',count);
        }
        for (var i = 0;i< count;i++) {

            html+="<th>"+(i+1)+"</th>";
        }

        $('#table_id thead .two').html(html);
    }
};
window.cottageApp = {
    myDate: new Date(),
    year: new Date().getFullYear(),
    month: new Date().getMonth() + 1,
//        daysCount: new Date(new Date().getFullYear(), new Date().getMonth() + 1, 0).getDate(),
    userName: null,
    Department:null,


    dataTableInit: function (cottageDom) {
        var that = this;

        that.cottageObj = cottageDom.dataTable({
            "sScrollX": "100%",
            "sScrollXInner": "110%",
            "bScrollCollapse": true,
            "searching ": false,
            "bLengthChange": false,
            "bFilter": false,
            "ordering": false,
            fixedColumns : {//关键是这里了，需要第一列不滚动就设置1
                leftColumns : 1
            },

            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
            "columns": [
                { "data": "name" },
                { "data": "cqgs" },
                { "data": "bj" },
                { "data": "tq" },
                { "data": "gx" },
                { "data": "hs" },
                { "data": "cj" },
                { "data": "wc" },
                { "data": "sj" },
                { "data": "gc" },
                { "data": "hh" }
            ],
            "sAjaxSource": url+'attendance/cottage',
            "fnServerData":function ( sSource, aoData, fnCallback ) {//获取数据的处理函数
                $.ajax( {
                    type: "get",
                    url: sSource,
                    dataType: "jsonp",
                    data: aoData,
                    success: function(data) {
                        console.log( data);
//                            var aaData = [];
                        for (var i = 0;i<data.length;i++){
//                                data[i].push(i);
                        }
                        var jsonT = {
                            aaData: data};
                        // console.log(jsonT);
                        fnCallback(jsonT);

                    },
                    error:function(){
                        alert('error');
                    }
                });
            },
            "fnServerParams": function (aoData) {  // 增加自定义查询条件
                aoData.push(
                    { "name": "userName", "value": that.userName },
                    { "name": "year", "value": that.year },
                    { "name": "month", "value": that.month},
                    { "name": "department", "value": that.Department}
                );
            }
        });
    }
};