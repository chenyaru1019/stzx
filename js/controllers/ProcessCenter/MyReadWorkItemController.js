﻿//已阅
app.controller('MyReadWorkItemController', ['$scope', '$rootScope', '$translate', '$http', '$timeout', '$state', '$filter', '$compile', '$interval', 'ControllerConfig', 'datecalculation', 'jq.datables',
function ($scope, $rootScope, $translate, $http, $timeout, $state, $filter, $compile, $interval, ControllerConfig, datecalculation, jqdatables) {
    $scope.init = function () {
        $scope.name = $translate.instant("WorkItemController.MyReadWorkItem");
        $scope.StartTime = datecalculation.redDays(new Date(), 30);
        $scope.EndTime = datecalculation.addDays(new Date(), 30);
    }
    //进入视图触发
    $scope.$on('$viewContentLoaded', function (event) {
        $scope.init();
        $('.lter').css('width',$('.hbox ').width()+17);
    });
    $(window).resize(function () {
        $('.lter').css('width',$('.hbox ').width()+17);
    });


    // 获取语言
    $rootScope.$on('$translateChangeEnd', function () {
        $scope.getLanguage();
        $state.go($state.$current.self.name, {}, { reload: true });
    });

    $scope.getLanguage = function () {
        $scope.LanJson = {
            search: $translate.instant("uidataTable.search"),
            ProcessName: $translate.instant("QueryTableColumn.ProcessName"),
            WorkFlow: $translate.instant("QueryTableColumn.WorkFlow"),
            StartTime: $translate.instant("QueryTableColumn.StartTime"),
            EndTime: $translate.instant("QueryTableColumn.EndTime"),
            sLengthMenu: $translate.instant("uidataTable.sLengthMenu"),
            sZeroRecords: $translate.instant("uidataTable.sZeroRecords"),
            sInfo: $translate.instant("uidataTable.sInfo"),
            sProcessing: $translate.instant("uidataTable.sProcessing")
        }
    }
    $scope.getLanguage();

    $scope.WorkflowOptions = {
        Editable: true,
        Visiable: true,
        Mode: "WorkflowTemplate",
        IsMultiple: false,
        PlaceHolder: $scope.LanJson.WorkFlow
    }

    // 获取列定义
    $scope.getColumns = function () {
        var columns = [];
        columns.push({
            "mData": "Index",
            "sClass": "center Index",
            "mRender": function (data, type, full) {
                return "<span id=\"Index\">" + data + "</span>";
            }
        });
        columns.push({
            "mData": "InstanceName",
            "sClass": "hideName",
            "mRender": function (data, type, full) {
                return "<a ui-toggle-class='show' target='.app-aside-right' targeturl='WorkItemSheets.html?WorkItemID=" + full.ObjectID + "'>" + data + "</a>";
            }
        });
        columns.push({ "mData": "DisplayName" });
        columns.push({ "mData": "ReceiveTime", "sClass": "center hide1024" });
        columns.push({ "mData": "FinishTime", "sClass": "center hide414" });
        columns.push({
            "mData": "OriginatorName",
            "sClass": "center hide414",
            "mRender": function (data, type, full) {
                return "<a ng-click=\"showUserInfoModal('" + full.Originator + "');\" new-Bindcompiledhtml>" + data + "</a>";
            }
        });
        columns.push({ "mData": "OriginatorOUName", "sClass": "center hide1024" });
        return columns;
    }

    // TODO:下面的需要获取语言
    $scope.options_ReadWorkitem = {
        "bProcessing": true,
        "bServerSide": true,    // 是否读取服务器分页
        "paging": true,         // 是否启用分页
        "bPaginate": true,      // 分页按钮  
        "bLengthChange": false, // 每页显示多少数据
        "bFilter": false,        // 是否显示搜索栏  
        "searchDelay": 1000,    // 延迟搜索
        "iDisplayLength": 10,   // 每页显示行数  
        "bSort": false,         // 排序  
        "singleSelect": true,
        "bInfo": true,          // Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息  
        "pagingType": "full_numbers",  // 设置分页样式，这个是默认的值
        "language": {           // 语言设置
            "sLengthMenu": $scope.LanJson.sLengthMenu,
            "sZeroRecords": "<i class=\"icon-emoticon-smile\"></i>" + $scope.LanJson.sZeroRecords,
            "sInfo": $scope.LanJson.sInfo,
            "infoEmpty": "",
            "sProcessing": $scope.LanJson.sProcessing,
            "paginate": {
                "first": "<<",
                "last": ">>",
                "previous": "<",
                "next": ">"
            }
        },
        "sAjaxSource": ControllerConfig.WorkItem.GetReadWorkItems,
        "fnServerData": function (sSource, aDataSet, fnCallback) {
            $.ajax({
                "dataType": 'json',
                "type": 'POST',
                "url": sSource,
                "data": aDataSet,
                "success": function (json) {
                    for (var i = 0; i < json.Rows.length; i++){
                        json.Rows[i]["Index"] = i+1;
                    }
                    if (json.ExceptionCode == 1 && json.Success == false) {
                        json.Rows = [];
                        json.sEcho = 1;
                        json.Total = 0;
                        json.iTotalDisplayRecords = 0;
                        json.iTotalRecords = 0;
                        $state.go("platform.login");
                    }
                    fnCallback(json);
                }
            });
        },
        "sAjaxDataProp": 'Rows',
        "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
        "sPaginationType": "full_numbers",
        "fnServerParams": function (aoData) {  // 增加自定义查询条件
            $scope.StartTime = $("#StartTime").val();
            $scope.EndTime = $("#EndTime").val();
            aoData.push(
                { "name": "startTime", "value": $filter("date")($scope.StartTime, "yyyy-MM-dd") },
                { "name": "endTime", "value": $filter("date")($scope.EndTime, "yyyy-MM-dd") },
                { "name": "workflowCode", "value": $scope.WorkflowCode },
                { "name": "instanceName", "value": $scope.InstanceName }
                );
        },
        "aoColumns": $scope.getColumns(), // 字段定义
        "initComplete": function (settings, json) {
            var filter = $(".searchContainer");
            filter.find("button").unbind("click.DT").bind("click.DT", function () {
                $scope.WorkflowCode = $("#sheetWorkflow").SheetUIManager().GetValue();
                $("#tabReadWorkitem").dataTable().fnDraw();
            });
        },
        //创建行，未绘画到屏幕上时调用
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            //表格添加序号列
            var api = this.api();
            var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
            $("td:first", nRow).html(+startIndex + iDisplayIndex + 1);//设置序号位于第一列，并顺次加一
            $(nRow ).find('.hideName').css('cursor', 'pointer').click(function() {
                url = 'WorkItemSheets.html?WorkItemID=' + aData.ObjectID;
                $(".app-aside-right").find('iframe').attr('src',url);
                $('.app-aside-right').addClass('show');
            });
            $compile(nRow)($scope);
        },
        //datables被draw完后调用
        "fnDrawCallback": function () {
            jqdatables.trcss();
        }
    }
}]);
