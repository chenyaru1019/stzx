//待阅-分组模式
app.controller('MyUnReadWorkItemByGroupController', ['$scope', "$rootScope", "$translate", "$http", "$state", "$compile", "$interval", "ControllerConfig", "jq.datables",
    function ($scope, $rootScope, $translate, $http, $state, $compile, $interval, ControllerConfig, jqdatables) {
        //进入视图触发
        $scope.$on('$viewContentLoaded', function (event) {
            $scope.init();
            $scope.loadData("init");
            $('.lter').css('width',$('.hbox ').width()+17);
        });
        $(window).resize(function () {
            $('.lter').css('width',$('.hbox ').width()+17);
        });
        //切换语言
        $rootScope.$on('$translateChangeEnd', function () {
            $scope.getLanguage();
            $state.go($state.$current.self.name, {}, { reload: true });
        });

        $scope.getLanguage = function () {
            $scope.LanJson = {
                search: $translate.instant("uidataTable.search"),
                sLengthMenu: $translate.instant("uidataTable.sLengthMenu"),
                sZeroRecords: $translate.instant("uidataTable.sZeroRecords"),
                sInfo: $translate.instant("uidataTable.sInfo"),
                sInfoFiltered: $translate.instant("uidataTable.sInfoFiltered"),
                sProcessing: $translate.instant("uidataTable.sProcessing")
            }
        }
        $scope.init = function () {
            $scope.getLanguage();
            $scope.workflows = [];
            $scope.workflowOpen = [];
        }
        //获取数据
        $scope.loadData = function (init) {
            var url = "/Portal/Sheets/handlers/WorkflowHandler.ashx?Command=GetUnReadWorkItemsByGroup";
            var user = window.localStorage.getItem('getCurrentUser');
            var  userid= JSON.parse(user);
            console.log(userid.ObjectID);
            $http({
                url: url,
                params: {
                    userId: userid.ObjectID
                }
            })
                .success(function (result) {
                    var workflows = result.Rows;
                    if (init != "init") {
                        for (var i = 0; i < workflows.length; i++) {
                            workflows[i].Open = $scope.workflowOpen[i];
                        }
                    } else {
                        for (var i = 0; i < workflows.length; i++) {
                            if (i == 0) workflows[i].Open = true;
                            $scope.workflowOpen[i] = workflows[i].Open;
                        }
                    }
                    $scope.workflows = workflows;
                })
                .error(function (ex) {
                })
        }
        // 获取列定义
        $scope.getColumns = function () {
            var columns = [];
            columns.push({
                "mData": "Priority",
                "sClass": "hide1024",
                "mRender": function (data, type, full) {
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
            })
            columns.push({
                "mData": "InstanceName",
                "sClass": "hideName",
                "mRender": function (data, type, full) {
                    return "<a ui-toggle-class='show' target='.app-aside-right' targeturl='WorkItemSheets.html?WorkItemID=" + full.ObjectID + "'>" + data + "</a>";
                }
            });
            columns.push({ "mData": "DisplayName" });
            columns.push({ "mData": "ReceiveTime", "sClass": "center hide1024" });
            columns.push({
                "mData": "OriginatorName",
                "sClass": "center hide414",
                "mRender": function (data, type, full) {
                    return "<a ng-click=\"showUserInfoModal('" + full.Originator + "');\" new-Bindcompiledhtml>" + data + "</a>";
                }
            });
            columns.push({ "mData": "Name", "sClass": "center hide1024" });
            return columns;
        }

        $scope.options = function (workflow) {
            var options = {
                "bProcessing": true,
                "bServerSide": false,   // 是否读取服务器分页
                "paging": true,         // 是否启用分页
                "bPaginate": true,      // 分页按钮
                "bLengthChange": false, // 每页显示多少数据
                "bFilter": true,        // 是否显示搜索栏
                "searchDelay": 1000,    // 延迟搜索
                "iDisplayLength": 6,    // 每页显示行数
                "bSort": false,         // 排序
                "singleSelect": true,
                "bInfo": true,          // Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息
                "pagingType": "full_numbers",  // 设置分页样式，这个是默认的值
                "language": {           // 语言设置
                    "sLengthMenu": $scope.LanJson.sLengthMenu,
                    "sZeroRecords": "<i class=\"icon-emoticon-smile\"></i>" + $scope.LanJson.sZeroRecords,
                    "sInfo": $scope.LanJson.sInfo,
                    "sInfoFiltered": $scope.LanJson.sInfoFiltered,
                    "infoEmpty": "",
                    "sProcessing": $scope.LanJson.sProcessing,
                    "search": "_INPUT_",
                    "paginate": {
                        "first": "<<",
                        "last": ">>",
                        "previous": "<",
                        "next": ">"
                    }
                },
                "columnsDef": [{
                    "targets": 0,
                    "orderable": false
                }],
                "data": workflow.WorkItems,
                //"sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
                "sPaginationType": "full_numbers",
                "aoColumns": $scope.getColumns(), // 字段定义
                // 初始化完成事件,这里需要用到 JQuery ，因为当前表格是 JQuery 的插件
                "initComplete": function (settings, json) {
                    var filter = angular.element(document.querySelectorAll(".dataTables_filter"));
                    filter.find("label input").attr("placeholder", $scope.LanJson.search);
                },
                //创建行，未绘画到屏幕上时调用
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    var api = this.api();
                    var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                    $("td:first", nRow).html(+startIndex + iDisplayIndex + 1);//设置序号位于第一列，并顺次加一
                    // $("td:first", nRow).css('text-align','center');
                    $(nRow).find('.hideName').css('cursor', 'pointer').click(function() {
                        url = 'WorkItemSheets.html?WorkItemID=' + aData.ObjectID;
                        $(".app-aside-right").find('iframe').attr('src',url);
                        $('.app-aside-right').addClass('show');
                    });
                    //将添加的angular事件添加到作用域中
                    $compile(nRow)($scope);
                },
                //datables被draw完后调用
                "fnDrawCallback": function () {
                    jqdatables.trcss();
                }
            }
            return options;
        };

        $scope.saveOpen = function (open, workflow) {
            workflow.open = open;
        }
    }]);