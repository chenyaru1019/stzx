app.controller('QueryParticipantWorkItemController', ['$scope', "$rootScope", "$translate", "$http", "$timeout", "$state", "$stateParams", "$filter", "$compile", "ControllerConfig", "datecalculation", "jq.datables",
    function ($scope, $rootScope, $translate, $http, $timeout, $state, $stateParams, $filter, $compile, ControllerConfig, datecalculation, jqdatables) {
        $scope.State = '';
        //查询页面（查询所有流程）
        $scope.$on("$viewContentLoaded", function (event) {
            // if($stateParams.SchemaCode){
            //     // $scope.Participant = '';
            //
            // }else {
                $scope.Participant = $scope.user.ObjectID;
            // }
            //$scope.name = $translate.instant("WorkItemController.QueryParticipantWorkItem");
        });
        $scope.getLanguage = function () {
            $scope.LanJson = {
                search: $translate.instant("uidataTable.search"),
                ProcessName: $translate.instant("QueryTableColumn.ProcessName"),
                WorkFlow: $translate.instant("QueryTableColumn.WorkFlow"),
                Originator: $translate.instant("QueryTableColumn.Originator"),
                Approver: $translate.instant("QueryTableColumn.Approver"),
                StartTime: $translate.instant("QueryTableColumn.StartTime"),
                EndTime: $translate.instant("QueryTableColumn.EndTime"),
                sLengthMenu: $translate.instant("uidataTable.sLengthMenu"),
                sZeroRecords: $translate.instant("uidataTable.sZeroRecords"),
                sInfo: $translate.instant("uidataTable.sInfo"),
                sProcessing: $translate.instant("uidataTable.sProcessing"),
                UnfinishedText: $translate.instant("InstanceState.Unfinished"),
                FinishedText: $translate.instant("InstanceState.Finished"),
                CanceledText: $translate.instant("InstanceState.Canceled"),
                UnspecifiedText: $translate.instant("InstanceState.Unspecified"),

                //权限
                QueryInstanceByProperty_NotEnoughAuth1: $translate.instant("NotEnoughAuth.QueryInstanceByProperty_NotEnoughAuth1"),
                QueryInstanceByProperty_NotEnoughAuth2: $translate.instant("NotEnoughAuth.QueryInstanceByProperty_NotEnoughAuth2"),
                QueryInstanceByProperty_NotEnoughAuth3: $translate.instant("NotEnoughAuth.QueryInstanceByProperty_NotEnoughAuth3"),
                QueryParticipantWorkItem_NoParticipant: $translate.instant("NotEnoughAuth.QueryParticipantWorkItem_NoParticipant"),
                DataFilter_NotEnoughAuth: $translate.instant("NotEnoughAuth.DataFilter_NotEnoughAuth"),
            }
        };
        $scope.getLanguage();
        // 获取语言
        $rootScope.$on('$translateChangeEnd', function () {
            $scope.getLanguage();
            $state.go($state.$current.self.name, {}, { reload: true });
        });

        //查询页面（查询所有流程）
        $scope.WorkflowCode = $stateParams.SchemaCode;
        $scope.WorkflowOptions = {
            Editable: true, Visiable: true, Mode: "WorkflowTemplate", IsMultiple: false, V: $scope.WorkflowCode, PlaceHolder: $scope.LanJson.WorkFlow
        };
        // if($stateParams.SchemaCode){
            // $scope.UserOptions = {
            //     Editable: true, Visiable: true, OrgUnitVisible: false, PlaceHolder: $scope.LanJson.Approver
            // };
            // $('#sheetWorkflow').css('display','none');
            // $('#sheetUser').css('display','none');
        // }else {
            $scope.UserOptions = {
                Editable: true, Visiable: true, OrgUnitVisible: false, V: $scope.user.ObjectID, PlaceHolder: $scope.LanJson.Approver
            };
        // }

        // 获取列定义
        $scope.getColumns = function () {
            var columns = [];
            // columns.push({
            //     "mData": "Priority",
            //     "sClass": "center hide1024",
            //     "mRender": function (data, type, full) {
            //         var rtnstring = "";
            //         //紧急程度
            //         if (full.Priority == "0") {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" style=\"margin-left:5px;\"></i>";
            //         } else if (full.Priority == "1") {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" style=\"color:green;margin-left:5px;\"></i>";
            //         } else {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" style=\"color:red;margin-left:5px;\"></i>";
            //         }
            //         return rtnstring;
            //     }
            // });

            //序号
            columns.push({
                "mData": "Index",
                "sClass": "center Index",
                "mRender": function (data, type, full) {
                    return "<span id=\"Index\">" + data + "</span>";
                }
            });

            columns.push({
                "mData": "InstanceName",
                "mRender": function (data, type, full) {
                    return "<a data-toggle=\"tooltip\" data-placement=\"left\" title=\"" + data + "\" ui-toggle-class='show' target='.app-aside-right' targeturl='WorkItemSheets.html?WorkItemID=" + full.ObjectID + "'>" + data + "</a>";

                }
            });
            //后勤车辆管理用车开始时间
            columns.push({
                "mData": "BeginTime",
                "sClass": "center BeginTime",
                "mRender": function (data, type, full) {
                    return "<span id=\"BeginTime\">" + data + "</span>";
                }
            });

            //集团发文查询来文编号
            columns.push({
                "mData": "RDNo",
                "sClass": "center RDNo",
                "mRender": function (data, type, full) {
                    return "<span data-toggle=\"tooltip\"  id=\"RDNo\"  data-placement=\"left\" title=\"" + data + "\" >" + data + "</span>";
                }
            });

            //集团发文查询流水号
            columns.push({
                "mData": "SequenceNo",
                "sClass": "center SequenceNo",
                "mRender": function (data, type, full) {
                    return "<span data-toggle=\"tooltip\" id=\"SequenceNo\"   data-placement=\"left\" title=\"" + data + "\" >" + data + "</span>";
                }
            });

            // columns.push({ "mData": "WorkflowName" });
            columns.push({
                "mData": "ApproverLink",
                "sClass": "center hide414",
                "mRender": function (data, type, full) {

                    data = data != "" ? data : full.ActivityCode;
                    return "<a ui-toggle-class='show' target='.app-aside-right' targeturl='WorkItemSheets.html?WorkItemID=" + full.ObjectID + "'>" + data + "</a>";
                }
            });
            columns.push({
                "mData": "Approver",
                "sClass": "center hide1024",
                "mRender": function (data, type, full) {
                    return "<a ng-click=\"showUserInfoModal('" + full.Participant + "');\" new-Bindcompiledhtml>" + data + "</a>";
                }
            });

            if ($scope.State == 0) {
                columns.push({ "mData": "ReceiveTime", "sClass": "center hide414" });
            } else {
                columns.push({ "mData": "FinishTime", "sClass": "center hide414" });
            }
            //流程状态
            columns.push({
                "mData": "State",
                "sClass": "center InstanceState",
                'orderable': "true",
                "mRender": function (data, type, full) {
                    var state = "";
                    if (data == "2") {
                        state = "<span id=\"InstanceState\"  style='background:#E33144 '>进行中</span>";
                    } else if (data == "4") {
                        state = "<span id=\"InstanceState\" style='background:#00B948'>已完成</span>";
                    } else {
                        state = "<span id=\"InstanceState\" style='background: #DBDBDB;color: #58666E'>已取消</span>";
                    }
                    return state;
                }
            });
            return columns;
        }

        $scope.dtOptions_tabQueryParticipantWorkItem = {
            "bProcessing": true,
            "bServerSide": false,    // 是否读取服务器分页
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
            "sAjaxSource": '/Portal/Sheets/handlers/WorkflowHandler.ashx?Command=QueryParticipantWorkItems',
            "fnServerData": function (sSource, aDataSet, fnCallback) {
                $.ajax({
                    "dataType": 'json',
                    "type": 'POST',
                    "url": sSource,
                    "data": aDataSet,
                    "success": function (json) {
                        console.log(json);
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
                        if (json.ExtendProperty != null && json.ExtendProperty.Success == false) {
                            // 没有权限，弹出提示
                            if (json.ExtendProperty.Message == "QueryInstanceByProperty_NotEnoughAuth1") {
                                $.notify({ message: $scope.LanJson.QueryInstanceByProperty_NotEnoughAuth1, status: "danger" });
                            } else if (json.ExtendProperty.Message == "QueryInstanceByProperty_NotEnoughAuth2") {
                                $.notify({ message: $scope.LanJson.QueryInstanceByProperty_NotEnoughAuth2, status: "danger" });
                            } else if (json.ExtendProperty.Message == "QueryInstanceByProperty_NotEnoughAuth3") {
                                $.notify({ message: $scope.LanJson.QueryInstanceByProperty_NotEnoughAuth3, status: "danger" });
                            }
                        }

                        //集团发文查询添加来文编号、流水
                        if ($stateParams.SchemaCode == 'ExternalDocument') {
                            for (var i = 0; i < json.Rows.length; i++) {

                                // if (json.Rows[i].WorkflowCode == "ExternalDocument") {
                                $.ajax({
                                    type: "POST",
                                    url: "/Portal/Sheets/handlers/FileHandler.ashx?Command=GetExternalDocumentById",   //处理页的相对地址
                                    data: {
                                        InstanceID: json.Rows[i].InstanceId
                                    },
                                    async: false,
                                    success: function (e) {
                                        json.Rows[i]["RDNo"] = e.RDNo;
                                        json.Rows[i]["SequenceNo"] = e.SequenceNo;

                                    }
                                });
                            }
                        }

                        //车辆管理查询添加用车开始时间
                        if ($stateParams.SchemaCode == 'Car') {
                            // 车辆管理以用车开始时间进行排序
                            var rows = json.Rows;
                            rows.sort(function(a,b){
                                return Date.parse(a.BeginTime) - Date.parse(b.BeginTime);//时间正序
                            });
                            for (var i = 0; i < json.Rows.length; i++) {
                                $.ajax({
                                    type: "POST",
                                    url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=QueryCarByInstanceId",   //处理页的相对地址
                                    data: {
                                        InstanceID: json.Rows[i].InstanceId
                                    },
                                    async: false,
                                    success: function (e) {
                                        json.Rows[i]["BeginTime"] = e.beginTime;
                                    }
                                });
                            }
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
                    { "name": "InstanceName", "value": $scope.InstanceName },
                    { "name": "WorkflowCode", "value": $scope.WorkflowCode },
                    { "name": "Participant", "value": $scope.Participant},
                    { "name": "StartTime", "value": $filter("date")($scope.StartTime, "yyyy-MM-dd") },
                    { "name": "EndTime", "value": $filter("date")($scope.EndTime, "yyyy-MM-dd") },
                    { "name": "State", "value": $scope.State },
                    { "name": "BeginTime", "value": $scope.BeginTime }
                    );
            },
            "aoColumns": $scope.getColumns(),  // 字段定义           
            // 初始化完成事件,这里需要用到 JQuery ，因为当前表格是 JQuery 的插件
            "initComplete": function (settings, json) {
                var filter = $(".searchContainer");
                filter.find("button").unbind("click.DT").bind("click.DT", function () {
                    $scope.WorkflowCode = $("#sheetWorkflow").SheetUIManager().GetValue();
                    $scope.Participant = $("#sheetUser").SheetUIManager().GetValue();
                    $("#tabQueryParticipantWorkItem").DataTable().ajax.reload();
                    // $("#tabQueryParticipantWorkItem").dataTable().fnDraw();
                });
                filter.find("select").unbind("change.Load").bind("change.Load", function () {
                    $scope.WorkflowCode = $("#sheetWorkflow").SheetUIManager().GetValue();
                    $scope.Participant = $("#sheetUser").SheetUIManager().GetValue();
                    $("#tabQueryParticipantWorkItem").DataTable().ajax.reload();
                    // $("#tabQueryParticipantWorkItem").dataTable().fnDraw();
                });
            },
            "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                //表格添加序号列
                var api = this.api();
                var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                $("td:first", nRow).html(+startIndex + iDisplayIndex + 1);//设置序号位于第一列，并顺次加一
                $compile(nRow)($scope);
            },
            //datables被draw完后调用
            "fnDrawCallback": function () {
                $("[data-toggle='tooltip']").tooltip();
                jqdatables.trcss();

                //显示车辆管理 用车开始时间显示列
                if ($stateParams.SchemaCode !== 'Car') {
                    this.find("td #BeginTime").parent().hide();
                }

                //集团发文查询添加来文编号、流水
                if ($stateParams.SchemaCode !== 'ExternalDocument') {
                    this.find("td #RDNo").parent().hide();
                    this.find("td #SequenceNo").parent().hide();
                }
            }
        };
        if ($stateParams.SchemaCode){
            $('#sheetWorkflow').css('display','none');
            $('#sheetUser').css('display','none');
        }
    }]);