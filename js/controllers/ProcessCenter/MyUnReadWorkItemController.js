﻿//待阅
app.controller('MyUnReadWorkItemController', ['$scope', '$rootScope', '$translate', '$http', '$state', '$compile', '$interval', 'ControllerConfig', 'jq.datables',
    function ($scope, $rootScope, $translate, $http, $state, $compile, $interval, ControllerConfig, jqdatables) {
        // 获取语言
        $scope.name = $translate.instant("WorkItemController.MyUnReadWorkItem");
        $scope.isFolded = true;
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
                sZeroRecords: $translate.instant("uidataTable.sZeroRecords_UnReadWorkItem"),
                sInfo: $translate.instant("uidataTable.sInfo"),
                sProcessing: $translate.instant("uidataTable.sProcessing"),

                NoSelectWorkItem: $translate.instant("WarnOfNotMetCondition.NoSelectWorkItem"),
            }
        }
        $scope.getLanguage();
        // 获取列定义
        $scope.getColumns = function () {
            var columns = [];
            columns.push({
                "mData": "ObjectID",
                "mRender": function (data, type, full) {
                    return "<input type=\"checkbox\" ng-checked=\"checkAll\" class=\"WorkItemBatchItem\" data-id=\"" + data + "\"/>";
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
                "sClass": "hideName",
                "mRender": function (data, type, full) {
                    return "<a class=\"InstanceName\" ui-toggle-class='show' target='.app-aside-right' targeturl='WorkItemSheets.html?WorkItemID=" + full.ObjectID + "'>" + data + "</a>";
                }
            });
            columns.push({
                "mData": "DisplayName",
                "mRender": function (data, type, full) {
                    //传阅来源  有传阅人显示传阅人，没有显示节点名称
                    var ShowText = "";
                    var CreatorName = full.CirculateCreatorName;
                    if (CreatorName == "") {
                        ShowText = data != "" ? data : full.ActivityCode;
                    } else {
                        ShowText = CreatorName;
                    }
                    return ShowText;
                }
            });
            columns.push({ "mData": "ReceiveTime", "sClass": "center hide414" });
            columns.push({
                "mData": "OriginatorName",
                "sClass": "center hide1024",
                "mRender": function (data, type, full) {
                    return "<a ng-click=\"showUserInfoModal('" + full.Originator + "');\" new-Bindcompiledhtml>" + data + "</a>";
                }
            });
            columns.push({ "mData": "OriginatorOUName", "sClass": "center hide1024" });
            return columns;
        }
        // TODO:下面的需要获取语言
        $scope.dtOptions = {
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
            "sAjaxSource": ControllerConfig.WorkItem.GetUnReadWorkItems,
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
                aoData.push(
                    { "name": "keyWord", "value": $scope.searchKey })
            },
            "aoColumns": $scope.getColumns(),  // 字段定义
            // 初始化完成事件,这里需要用到 JQuery ，因为当前表格是 JQuery 的插件
            "initComplete": function (settings, json) {
                var filter = $(".searchContainer");
                filter.find("button").unbind("click.DT").bind("click.DT", function () {
                    $("#tabUnReadWorkitem").dataTable().fnDraw();
                });
            },
            //创建行，未绘画到屏幕上时调用
            "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                //表格添加序号列
                var api = this.api();
                var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                $("td.Index", nRow).html(+startIndex + iDisplayIndex + 1);//设置序号位于第一列，并顺次加一
                $(nRow ).find('.hideName').css('cursor', 'pointer').click(function() {
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

        $scope.searchKeyChange = function () {
            if ($scope.searchKey == "") {
                $("#tabUnReadWorkitem").dataTable().fnDraw();
            }
        }

        $scope.showCommentModal = function () {  //打开模态 
            $scope.selectedCirculateItems = [];
            // 获取所有选中的行
            var items = angular.element(document.querySelectorAll(".WorkItemBatchItem"));
            angular.forEach(items, function (data, index, array) {
                if (data.checked) {
                    $scope.selectedCirculateItems.push(data.getAttribute("data-id"));
                }
            });

            // 没有选择任何记录，弹出提示
            if (!$scope.selectedCirculateItems.length) {
                $.notify({ message: $scope.LanJson.NoSelectWorkItem, status: "danger" });
                return;
            }

            //执行批量已阅
            $http({
                url: ControllerConfig.CirculateItem.ReadCirculateItemsByBatch,
                params: {
                    CirculateItemIDs: $scope.selectedCirculateItems
                }
            })
            .success(function (data) {
                $state.go($state.$current.self.name, {}, { reload: true });
            })
            .error()
        }
    }]);