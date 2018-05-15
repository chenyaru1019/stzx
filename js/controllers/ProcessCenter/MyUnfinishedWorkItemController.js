﻿//待办
app.controller('MyUnfinishedWorkItemController', ['$scope', '$rootScope', "$translate", "$http", "$state", "$compile", "$interval", "ControllerConfig", "jq.datables",
    function ($scope, $rootScope, $translate, $http, $state, $compile, $interval, ControllerConfig, jqdatables) {
        var PortalRoot = window.localStorage.getItem("H3.PortalRoot");
        $scope.searchKey = "";
        //进入视图触发
        $scope.$on('$viewContentLoaded', function (event) {
            $scope.searchKey = "";
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
                sLengthMenu: $translate.instant("uidataTable.sLengthMenu"),
                sZeroRecords: $translate.instant("uidataTable.sZeroRecords_UnfinishedWorkItem"),
                sInfo: $translate.instant("uidataTable.sInfo"),
                sProcessing: $translate.instant("uidataTable.sProcessing")
            }
        }
        $scope.getLanguage();

        // 获取列定义
        $scope.getColumns = function () {
            var columns = [];
            // columns.push({
            //     "mData": "Priority",
            //     "sClass": "hide1024",
            //     "mRender": function (data, type, full, a) {
            //         var rtnstring = "";
            //         //紧急程度
            //         if (full.Priority == "0") {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" ></i>";
            //         } else if (full.Priority == "1") {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" style=\"color:green;\"></i>";
            //         } else {
            //             rtnstring = "<i class=\"glyphicon glyphicon-bell\" style=\"color:red;\"></i>";
            //         }
            //         //是否催办
            //         if (full.Urged == false) {
            //             rtnstring = rtnstring + "<a> <i class=\"glyphicon glyphicon-bullhorn\"></i></a>";
            //         } else {
            //             rtnstring = rtnstring + "<a ng-click=\"showUrgeWorkItemInfoModal('" + full.ObjectID + "')\"> <i class=\"glyphicon glyphicon-bullhorn\" style=\"color:orangered;\"></i></a>";
            //         }
            //         return rtnstring;
            //     }
            // });

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
                    return "<td><a ui-toggle-class='show' target='.app-aside-right' targeturl='WorkItemSheets.html?WorkItemID=" + full.ObjectID + "'>" + data + "</a></td>";
                }
            });
            columns.push({
                "mData": "DisplayName",
                "mRender": function (data, type, full) {
                    //打开流程状态
                    data = data != "" ? data : full.ActivityCode;
                    return "<td><a href='index.html#/InstanceDetail/" + full.InstanceId + "/" + full.ObjectID + "/" + "/' target='_blank'>" + data + "</a></td>";
                }
            });
            columns.push({ "mData": "ReceiveTime", "sClass": "center hide414" });
            columns.push({
                "mData": "OriginatorName",
                "sClass": "hide414",
                "mRender": function (data, type, full) {
                    return "<a ng-click=\"showUserInfoModal('" + full.Originator + "');\" new-Bindcompiledhtml>" + data + "</a>";
                }
            });
            columns.push({ "mData": "OriginatorOUName", "sClass": "hide1024" });
            return columns;
        }

        $scope.options = function () {
            var options = {
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
                "sAjaxSource": ControllerConfig.WorkItem.GetUnfinishWorkItems,
                "fnServerData": function (sSource, aDataSet, fnCallback,Num) {
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
                        },
                        "error":function () {
                            $state.go("platform.login");
                        }
                    });
                },
                "sAjaxDataProp": 'Rows',
                "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
                "sPaginationType": "full_numbers",
                "fnServerParams": function (aoData) {  // 增加自定义查询条件
                    aoData.push({ "name": "keyWord", "value": $scope.searchKey });
                },
                "aoColumns": $scope.getColumns(), // 字段定义
                // 初始化完成事件,这里需要用到 JQuery ，因为当前表格是 JQuery 的插件
                "initComplete": function (settings, json) {
                    var filter = $(".searchContainer");
                    filter.find("button").unbind("click.DT").bind("click.DT", function () {
                        $("#tabUnfinishWorkitem").dataTable().fnDraw();
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
                    //将添加的angular事件添加到作用域中
                    if (aData.ItemSummary != "") {
                        $(nRow).attr("title", aData.ItemSummary);
                        //angular-tooltip暂不可用
                        //$(nRow).attr("tooltips", "");
                        //$(nRow).attr("tooltip-template", aData.ItemSummary);
                        //$(nRow).attr("tooltip-side", "bottom");
                    }
                },
                //datables被draw完后调用
                "fnDrawCallback": function () {

                    jqdatables.trcss();
                    $compile($("#tabUnfinishWorkitem"))($scope);
                    //重新注册
                    $interval.cancel($scope.interval);
                    $scope.registerInterval();
                }
            }
            return options;
        }

        $scope.searchKeyChange = function () {
            if ($scope.searchKey == "")
                $("#tabUnfinishWorkitem").dataTable().fnDraw();
        }

        $scope.registerInterval = function () {
            $scope.interval = $interval(function () {
                $("#tabUnfinishWorkitem").dataTable().fnDraw();
            }, 90 * 1000);
        }

        $scope.$on("$destroy", function () {
            $interval.cancel($scope.interval);
        })
    }]);
$(function(){
    var initialLocaleCode = 'zh-cn';
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultDate: '2017-05-12',
            locale: initialLocaleCode,
            navLinks: true, // can click day/week names to navigate views
            selectable: true,
            selectHelper: true,
            select: function(start, end) {
                var title = prompt('Event Title:');
                var eventData;
                if (title) {
                    eventData = {
                        title: title,
                        start: start,
                        end: end
                    };
                    $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
                }
                $('#calendar').fullCalendar('unselect');
            },
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: [
                // {
                //     title: 'All Day Event',
                //     start: '2017-05-01'
                // },
                // {
                //     title: 'Long Event',
                //     start: '2017-05-07',
                //     end: '2017-05-10'
                // },
                // {
                //     id: 999,
                //     title: 'Repeating Event',
                //     start: '2017-05-09T16:00:00'
                // },
                // {
                //     id: 999,
                //     title: 'Repeating Event',
                //     start: '2017-05-16T16:00:00'
                // },
                // {
                //     title: 'Conference',
                //     start: '2017-05-11',
                //     end: '2017-05-13'
                // },
                // {
                //     title: 'Meeting',
                //     start: '2017-05-12T10:30:00',
                //     end: '2017-05-12T12:30:00'
                // },
                // {
                //     title: 'Lunch',
                //     start: '2017-05-12T12:00:00'
                // },
                // {
                //     title: 'Meeting',
                //     start: '2017-05-12T14:30:00'
                // },
                // {
                //     title: 'Happy Hour',
                //     start: '2017-05-12T17:30:00'
                // },
                // {
                //     title: 'Dinner',
                //     start: '2017-05-12T20:00:00'
                // },
                // {
                //     title: 'Birthday Party',
                //     start: '2017-05-13T07:00:00'
                // },
                // {
                //     title: 'Click for Google',
                //     url: 'http://google.com/',
                //     start: '2017-05-28'
                // }
            ]
        });
})