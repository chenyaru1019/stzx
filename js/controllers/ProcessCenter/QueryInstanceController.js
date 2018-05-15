//查询流程实例
app.controller('QueryInstanceController', ['$scope', "$rootScope", "$translate", "$http", "$timeout", "$state", '$stateParams', "$filter", "$compile", "ControllerConfig", "datecalculation", "jq.datables",
    function ($scope, $rootScope, $translate, $http, $timeout, $state, $stateParams, $filter, $compile, ControllerConfig, datecalculation, jqdatables) {
        $scope.$on('$viewContentLoaded', function (event) {
            $scope.init();
        });
        if ($stateParams.SchemaCode){
            $('#sheetWorkflow').css('display','none');
            // $('#sheetUser').attr('data-orgunitvisible','true');
            // $('#sheetUser').attr('data-uservisible','false');
        }else  {
            $('#beginTime').css('display','none');
            $('#RDNo').css('display','none');
            $('#SequenceNo').css('display','none');
            $('#SequenceNoTravel').css('display','none');
            $('#SequenceNoSummary').css('display','none');
        }
        $scope.init = function () {
            $scope.UnfinishedText = $translate.instant("InstanceController.Unfinished");
            $scope.FinishedText = $translate.instant("InstanceController.Finished");
            $scope.CanceledText = $translate.instant("InstanceController.Canceled");
            $scope.UnspecifiedText = $translate.instant("InstanceController.Unspecified");

            $scope.Originator = $scope.user.ObjectID;
            $scope.InstanceState = '';
        }

        $scope.getLanguage = function () {
            $scope.LanJson = {
                search: $translate.instant("uidataTable.search"),
                ProcessName: $translate.instant("QueryTableColumn.ProcessName"),
                WorkFlow: $translate.instant("QueryTableColumn.WorkFlow"),
                Originator: $translate.instant("QueryTableColumn.Originator"),
                StartTime: $translate.instant("QueryTableColumn.StartTime"),
                EndTime: $translate.instant("QueryTableColumn.EndTime"),
                sLengthMenu: $translate.instant("uidataTable.sLengthMenu"),
                sZeroRecords: $translate.instant("uidataTable.sZeroRecords_NoRecords"),
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
            }
        }
        $scope.getLanguage();
        // 获取语言
        $rootScope.$on('$translateChangeEnd', function () {
            $scope.getLanguage();
            $state.go($state.$current.self.name, {}, { reload: true });
        });

        $scope.WorkflowCode = $stateParams.SchemaCode;
        $scope.WorkflowOptions = {
            Editable: true, Visiable: true, Mode: "WorkflowTemplate", IsMultiple: false, V: $scope.WorkflowCode, PlaceHolder: $scope.LanJson.WorkFlow
        }
        $scope.UserOptions = {
            Editable: true, Visiable: true, OrgUnitVisible: true, V: $scope.user.ObjectID, PlaceHolder: $scope.LanJson.Originator
        }
        $scope.getColumns = function () {
            var columns = [];
            // columns.push({
            //     "mData": "Priority",
            //     "sClass": "center hide1024",
            //     "mRender": function (data, type, full) {
            //         console.log(data);
            //         var rtnstring = "";
            //         //紧急程度
            //         if (full.Priority == "0") {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" id=\"Priority\"  style=\"margin-left:5px;\"></i>";
            //         } else if (full.Priority == "1") {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" id=\"Priority\" style=\"color:green;margin-left:5px;\"></i>";
            //         } else {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" id=\"Priority\" style=\"color:red;margin-left:5px;\"></i>";
            //         }
            //         return rtnstring;
            //     }
            // });

            //集团发文查询序号
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
                    return '<a data-toggle=\"tooltip\" data-placement=\"left\" title=\"' + data + '\" class="like" ui-toggle-class="show" target=".app-aside-right" targeturl="InstanceSheets.html?InstanceId=' + full.InstanceID + '"  >' + data + '</a>';
                }
            });
            //
            // columns.push({
            //     "mData": "WorkflowName" ,
            //     "sClass":"center WorkflowName",
            //     "mRender": function (data, type, full) {
            //         return "<span id=\"WorkflowName\">" + data + "</span>";
            //     }
            // });

            //后勤车辆管理用车开始时间
            columns.push({
                "mData": "beginTime",
                "sClass": "center beginTime",
                "mRender": function (data, type, full) {
                    return "<span id=\"beginTime\" data-toggle=\"tooltip\"  data-placement=\"left\" title=\"" + data + "\" >" + data + "</span>";
                }
            });

            //集团发文查询来文编号
            columns.push({
                "mData": "RDNo",
                "sClass": "center RDNo",
                "mRender": function (data, type, full) {
                    return "<span id=\"RDNo\" data-toggle=\"tooltip\"  data-placement=\"left\" title=\"" + data + "\" >" + data + "</span>";
                }
            });

            //出差申请流水号
            columns.push({
                "mData": "SequenceNo",
                "sClass": "center SequenceNo",
                "mRender": function (data, type, full) {
                    return "<span id=\"SequenceNo\" data-toggle=\"tooltip\"  data-placement=\"left\" title=\"" + data + "\" >" + data + "</span>";
                }
            });

            //出差小结流水号
            columns.push({
                "mData": "SequenceNo",
                "sClass": "center SequenceNoTravel",
                "mRender": function (data, type, full) {
                    return "<span id=\"SequenceNoTravel\" data-toggle=\"tooltip\"  data-placement=\"left\" title=\"" + data + "\" >" + data + "</span>";
                }
            });

            //集团发文查询流水号
            columns.push({
                "mData": "SequenceNo",
                "sClass": "center SequenceNoSummary",
                "mRender": function (data, type, full) {
                    return "<span id=\"SequenceNoSummary\" data-toggle=\"tooltip\"  data-placement=\"left\" title=\"" + data + "\" >" + data + "</span>";
                }
            });

            // columns.push({ "mData": "WorkflowName", "sClass": "center", });
            columns.push({
                "mData": "OriginatorName",
                "sClass": "center hide1024",
                "mRender": function (data, type, full) {
                    return "<a ng-click=\"showUserInfoModal('" + full.Originator + "');\" new-Bindcompiledhtml class='OriginatorName'>" + data + "</a>";
                }
            });
            columns.push({ "mData": "CreatedTime", "sClass": "center hide414", });
            //审批环节


            //结束时间
            columns.push({
                "mData": "FinishTime",
                "sClass": "center hide414",
                "mRender": function (data, type, full) {
                    return "<span id=\"FinishedTime\">" + data + "</span>";
                }
            });
            //取消时间
            columns.push({
                "mData": "FinishTime",
                "sClass": "center hide414",
                "mRender": function (data, type, full) {
                    return "<span id=\"CancelTime\">" + data + "</span>";
                }
            });

            columns.push({
                "mData": "ApproverLink",
                "sClass": "center hide1024",
                "mRender": function (data, type, full) {
                    var link = data.split(",");
                    var text = "";
                    if (link.length == 1) {
                        text = data;
                    } else {
                        text = link[0] + "...";
                    }
                    return "<span id=\"tooltip\" data-toggle=\"tooltip\" data-placement=\"left\" class='ApproverLink' title=\"" + data + "\">" + text + "</span>";
                }
            });
            //审批人
            columns.push({
                "mData": "Approver",
                "sClass": "center hide1024",
                "mRender": function (data, type, full) {
                    var link = data.split(",");
                    var text = "";
                    if (full.Exceptional == true) {
                        text = "出现异常，请与管理员联系！";
                    }
                    else if (link.length == 1) {
                        text = data;
                    }
                    else {
                        text = link[0] + "...";
                    }
                    return "<span id=\"tooltip\" data-toggle=\"tooltip\" data-placement=\"left\" class='Approver InstanceExceptionInfo' title=\"" + data + "\">" + text + "</span>";
                }
            });

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
        };

        $scope.tabQueryInstance = {
            "bProcessing": true,
            "bServerSide": false,    // 是否读取服务器分页
            "paging": true,         // 是否启用分页
            "bPaginate": true,      // 分页按钮  
            "bLengthChange": false, // 每页显示多少数据
            "bFilter": false,        // 是否显示搜索栏  
            "searchDelay": 1000,    // 延迟搜索
            "iDisplayLength": 10,   // 每页显示行数  
            // "bSort": false,         // 排序
            "aaSorting": [13, 'desc'], // 默认排序
            "aoColumnDefs": [ { "bSortable": false, "aTargets": [0,1] }],
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
            "sAjaxSource": '/Portal/Sheets/handlers/WorkflowHandler.ashx?Command=QueryInstance',
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
                    { "name": "SearchKey", "value": $scope.SearchKey },
                    { "name": "WorkflowCode", "value": $scope.WorkflowCode },
                    { "name": "UnitID", "value": $scope.Originator },
                    { "name": "StartTime", "value": $filter("date")($scope.StartTime, "yyyy-MM-dd") },
                    { "name": "EndTime", "value": $filter("date")($scope.EndTime, "yyyy-MM-dd") },
                    { "name": "InstanceState", "value": $scope.InstanceState },
                    { "name": "ApproverOuDept", "value": $scope.ApproverOuDept },
                    { "name": "BeginTime", "value": $scope.BeginTime }
                    );
            },
            "aoColumns": $scope.getColumns(), // 字段定义
            // 初始化完成事件,这里需要用到 JQuery ，因为当前表格是 JQuery 的插件
            "initComplete": function (settings, json) {
                var filter = $(".searchContainer");
                filter.find("button").unbind("click.DT").bind("click.DT", function () {
                    $scope.WorkflowCode = $("#sheetWorkflow").SheetUIManager().GetValue();
                    $scope.Originator = $("#sheetUser").SheetUIManager().GetValue();
                    $("#tabQueryInstance").DataTable().ajax.reload();
                    // $("#tabQueryInstance").dataTable().fnDraw();
                });
                filter.find("select").unbind("change.Load").bind("change.Load", function () {
                    $scope.WorkflowCode = $("#sheetWorkflow").SheetUIManager().GetValue();
                    $scope.Originator = $("#sheetUser").SheetUIManager().GetValue();
                    $("#tabQueryInstance").DataTable().ajax.reload();
                    // $("#tabQueryInstance").dataTable().fnDraw();
                });
            },
            "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                if(aData.InstanceState == 5){
                    $(nRow).css('color','#BEBEBE');
                    $(nRow).find('a').css('color','#BEBEBE');
                }
                //表格添加序号列
                var api = this.api();
                var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                $("td:first", nRow).html(+startIndex + iDisplayIndex + 1);//设置序号位于第一列，并顺次加一
                if (aData.InstanceState == "2" && aData.Approver == "" && aData.ApproverLink == "") {
                    $(nRow).addClass("InstanceException");
                }
                $compile(nRow)($scope);
            },
            //datables被draw完后调用
            "fnDrawCallback": function () {
                $("[data-toggle='tooltip']").tooltip();
                jqdatables.trcss();
                console.log($stateParams.SchemaCode);
                if(!$stateParams.SchemaCode){
                    this.find("td #beginTime").parent().hide();
                    this.find("td #RDNo").parent().hide();
                    this.find("td #SequenceNo").parent().hide();
                    this.find("td #SequenceNoSummary").parent().hide();
                    this.find("td #SequenceNoTravel").parent().hide();
                }
                //显示车辆管理 用车开始时间显示列
                if ($stateParams.SchemaCode !== 'Car') {
                    this.find("td #beginTime").parent().hide();
                }
                if ($stateParams.SchemaCode !== 'BusinessTravel') {
                    // this.find("td #SequenceNo1").parent().hide();
                    this.find("td #SequenceNoTravel").parent().hide();
                }
                if ($stateParams.SchemaCode !== 'BusinessSummary') {
                    // this.find("td #SequenceNo2").parent().hide();
                    this.find("td #SequenceNoSummary").parent().hide();
                }
                if ($stateParams.SchemaCode !== 'ExternalDocument') {
                    this.find("td #RDNo").parent().hide();
                    this.find("td #SequenceNo").parent().hide();
                }
                if ($stateParams.SchemaCode == 'ExternalDocument') {
                    this.find("td .OriginatorName").parent().hide();
                }

                if ($scope.InstanceState == 2) {
                    //进行中
                    this.find("td #FinishedTime").parent().hide();
                    this.find("td #CancelTime").parent().hide();
                    // this.find("td #WorkflowName").parent().hide();
                    // this.find("td #InstanceState").parent().hide();
                }
                if ($scope.InstanceState == 4) {
                    //已完成
                    this.find("td #CancelTime").parent().hide();
                    this.find("td .ApproverLink").parent().hide();
                    this.find("td .Approver").parent().hide();
                    this.find("td .ApproverOuDept").parent().hide();
                    // this.find("td #WorkflowName").parent().hide();
                    // this.find("td #InstanceState").parent().hide();
                    this.find("th[id=FinishedTime]").css("width", "110px");
                }
                if ($scope.InstanceState == 5) {
                    this.find("td #FinishedTime").parent().hide();
                    this.find("td .ApproverLink").parent().hide();
                    this.find("td .Approver").parent().hide();
                    // this.find("td #WorkflowName").parent().hide();
                    // this.find("td #InstanceState").parent().hide();
                    this.find("th[id=CancelTime]").css("width", "110px");
                }
                if ($scope.InstanceState == '') {
                    this.find("td #FinishedTime").parent().hide();
                    this.find("td #CancelTime").parent().hide();
                }
            }
        }
    }]);