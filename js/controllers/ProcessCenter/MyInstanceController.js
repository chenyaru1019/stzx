app.controller('MyInstanceController', ['$scope', '$rootScope', '$translate', '$http', '$timeout', '$state', '$stateParams', '$compile', '$interval', '$filter', 'ControllerConfig', 'datecalculation', 'jq.datables',
    function ($scope, $rootScope, $translate, $http, $timeout, $state, $stateParams, $compile, $interval, $filter, ControllerConfig, datecalculation, jqdatables) {
        $scope.init = function () {
            $scope.InstanceState = '';
            switch ($stateParams.State) {
                case "Unfinished": $scope.InstanceState = 0; break;
                case "Finished": $scope.InstanceState = 1; break;
                case "Unspecified": $scope.InstanceState = 3; break;
                default: break;
            }
            if ($stateParams.SchemaCode != "") {
                $scope.WorkflowCode = $stateParams.SchemaCode;
            }
        };
        $scope.$on('$viewContentLoaded', function (event) {
            $scope.init();
            // $scope.loadData();
            var user = window.localStorage.getItem('getCurrentUser');
            $scope.UserId = JSON.parse(user).ObjectID;
            $('.lter').css('width',$('.hbox ').width()+17);
            if ($stateParams.SchemaCode){
                $('#sheetWorkflow').css('display','none');
            }
        });
        $(window).resize(function () {
            $('.lter').css('width',$('.hbox ').width()+17);
        });

        $scope.getLanguage = function () {
            $scope.LanJson = {
                search: $translate.instant("uidataTable.search"),
                ProcessName: $translate.instant("QueryTableColumn.ProcessName"),
                WorkFlow: $translate.instant("QueryTableColumn.WorkFlow"),
                StartTime: $translate.instant("QueryTableColumn.StartTime"),
                EndTime: $translate.instant("QueryTableColumn.EndTime"),
                sLengthMenu: $translate.instant("uidataTable.sLengthMenu"),
                sZeroRecords: $translate.instant("uidataTable.sZeroRecords_NoRecords"),
                sInfo: $translate.instant("uidataTable.sInfo"),
                sProcessing: $translate.instant("uidataTable.sProcessing"),
                UnfinishedText: $translate.instant("InstanceState.Unfinished"),
                FinishedText: $translate.instant("InstanceState.Finished"),
                CanceledText: $translate.instant("InstanceState.Canceled"),
                UnspecifiedText: $translate.instant("InstanceState.Unspecified")
            }
        }
        $scope.getLanguage();
        // 获取语言
        $rootScope.$on('$translateChangeEnd', function () {
            $scope.getLanguage();
            $state.go($state.$current.self.name, {}, { reload: true });
        });

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
                "mData": "Priority",
                "sClass": "hide1024",
                "mRender": function (data, type, full, a) {
                    var rtnstring = "";
                    //紧急程度
                    if (full.Priority == "0") {
                        rtnstring = "<i class=\"glyphicon glyphicon-bell\" ></i>";
                    } else if (full.Priority == "1") {
                        rtnstring = "<i class=\"glyphicon glyphicon-bell\" style=\"color:green;\"></i>";
                    } else {
                        rtnstring = "<i class=\"glyphicon glyphicon-bell\" style=\"color:red;\"></i>";
                    }
                    //是否催办
                    if (full.Urged == false) {
                        rtnstring = rtnstring + "<a> <i class=\"glyphicon glyphicon-bullhorn\"></i></a>";
                    } else {
                        rtnstring = rtnstring + "<a ng-click=\"showUrgeWorkItemInfoModal('" + full.ObjectID + "')\"> <i class=\"glyphicon glyphicon-bullhorn\" style=\"color:orangered;\"></i></a>";
                    }
                    return rtnstring;
                }
            });
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
                    return "<a ui-toggle-class='show' target='.app-aside-right' targeturl='InstanceSheets.html?InstanceId=" + full.InstanceID + "'>" + data + "</a>";
                }
            });
            columns.push({ "mData": "WorkflowName" });
            columns.push({
                "mData": "CreatedTime",
                "sClass": "center hide1024",
                "mRender": function (data, type, full) {
                    return "<span id='CreatedTime'>" + data + "</span>";
                }
            });

            //完成时间
            columns.push({
                "mData": "FinishTime",
                "sClass": "center hide414",
                "mRender": function (data, type, full) {
                    return "<span id='FinishedTime' ng-show=\"InstanceState==4\">" + data + "</span>";
                }
            });

            //取消时间
            columns.push({
                "mData": "FinishTime",
                "sClass": "center hide414",
                "mRender": function (data, type, full) {
                    return "<span id='CancelTime' ng-show=\"InstanceState==5\">" + data + "</span>";
                }
            });

            //审批环节
            columns.push({
                "mData": "ApproverLink",
                "sClass": "center hide414",
                "mRender": function (data, type, full) {
                    var link = data.split(",");
                    var text = "";
                    if (link.length == 1) {
                        text = data;
                    } else {
                        text = link[0] + "...";
                    }
                    return "<span  data-toggle='tooltip' data-placement='left' class='ApproverLink' ng-show=\"InstanceState==0 || InstanceState==3 \" title=\"" + data + "\">" + text + "</span>";
                }
            });
            //审批人
            columns.push({
                "mData": "Approver",
                "sClass": "center hide414",
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
                    return "<span data-toggle=\"tooltip\" data-placement=\"left\" class='Approver InstanceExceptionInfo' ng-show=\"InstanceState==0 || InstanceState==3 \" title=\"" + data + "\">" + text + "</span>";

                }
            });

            //流程状态
            columns.push({
                "mData": "State",
                "sClass": "center State",
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
        // $scope.loadData = function (init) {
        //     console.log(11111);
        //     var url = ControllerConfig.Instance.QueryMyInstance;
        //     $http({
        //         url: url})
        //         .success(function (result) {
        //             console.log(result,111);
        //             $scope.workflows = workflows;
        //         })
        //         .error(function (ex) {
        //         })
        // }
        $scope.getVisibleColumns = function (InstanceState) {
            var columns = [];
            if ($scope.InstanceState == 0) {
                columns.push({ "aTargets": [0], "bVisible": true });
            } else {
                columns.push({ "aTargets": [0], "bVisible": false });
            }
            return columns;
        };

        $scope.options_MyInstance = {
            "bProcessing": true,
            "bServerSide": false,    // 是否读取服务器分页
            // 'processing':true,// 加载
            "paging": true,         // 是否启用分页
            "bPaginate": true,      // 分页按钮
            "bLengthChange": false, // 每页显示多少数据
            "bFilter": false,        // 是否显示搜索栏
            "searchDelay": 1000,    // 延迟搜索
            "iDisplayLength": 10,   // 每页显示行数
            // "bSort": true,         // 排序
            "aaSorting": [9, 'desc'], // 默认排序
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

            "sAjaxSource": '/Portal/Sheets/handlers/WorkflowHandler.ashx?Command=QueryMyInstance',
            // "sAjaxSource": ControllerConfig.Instance.QueryMyInstance,
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
                            $state.go("platform.login");
                        }
                        fnCallback(json);
                    },
                    "error": function (json) {
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
                    { "name": "BeginTime", "value": $filter("date")($scope.StartTime, "yyyy-MM-dd") },
                    { "name": "EndTime", "value": $filter("date")($scope.EndTime, "yyyy-MM-dd") },
                    { "name": "State", "value": $scope.InstanceState },
                    { "name": "UserId", "value": $scope.UserId }
                    );
            },
            "aoColumns": $scope.getColumns(), // 字段定义
            "aoColumnDefs": $scope.getVisibleColumns($scope.InstanceState),
            // 初始化完成事件,这里需要用到 JQuery ，因为当前表格是 JQuery 的插件
            "initComplete": function (settings, json) {

                var filter = $(".searchContainer");
                filter.find("button").unbind("click.DT").bind("click.DT", function () {

                    $scope.WorkflowCode = $("#sheetWorkflow").SheetUIManager().GetValue();
                    // $("#tabMyInstance").dataTable().fnDraw(true);
                    $("#tabMyInstance").DataTable().ajax.reload();
                });
                filter.find("select").unbind("change.Load").bind("change.Load", function () {

                    $scope.WorkflowCode = $("#sheetWorkflow").SheetUIManager().GetValue();
                    // $("#tabMyInstance").dataTable().fnDraw(false);
                    $("#tabMyInstance").DataTable().ajax.reload();
                });
                //应用中心—流程列表
                $("#sheetWorkflow").SheetUIManager().SetValue($stateParams.SchemaCode);
            },
            "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                if(aData.State == 5){
                    $(nRow).css('color','#BEBEBE');
                    $(nRow).find('a').css('color','#BEBEBE');
                }
                var api = this.api();
                var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                $("td:first", nRow).html(+startIndex + iDisplayIndex + 1);//设置序号位于第一列，并顺次加一
                if (aData.InstanceState == "2" && aData.Approver == "" && aData.ApproverLink == "") {
                    $(nRow).addClass("InstanceException");
                }
                $compile(nRow)($scope);
            },
            "fnDrawCallback": function () {
                var options = {
                    height: 1000
                }
                $("[data-toggle='tooltip']").tooltip(options);
                jqdatables.trcss();

                if ($scope.InstanceState == 2) {
                    //进行中
                    this.find("td #FinishedTime").parent().hide();
                    this.find("td #CancelTime").parent().hide();
                    // this.find("td #InstanceState").parent().hide();
                }
                if ($scope.InstanceState == 4) {
                    //已完成
                    this.find("td #CancelTime").parent().hide();
                    this.find("td .ApproverLink").parent().hide();
                    this.find("td .Approver").parent().hide();
                    this.find("th[id=FinishTime]").css("width", "110px");
                    // this.find("td #InstanceState").parent().hide();
                }
                if ($scope.InstanceState == 5) {
                    this.find("td #Priority").parent().hide();
                    this.find("td #FinishedTime").parent().hide();
                    this.find("td .ApproverLink").parent().hide();
                    this.find("td .Approver").parent().hide();
                    this.find("th[id=CancelTime]").css("width", "110px");
                    // this.find("td #InstanceState").parent().hide();
                }
                if ($scope.InstanceState == '') {
                    this.find("td #FinishedTime").parent().hide();
                    this.find("td #CancelTime").parent().hide();
                }
            }
        }

    }]);