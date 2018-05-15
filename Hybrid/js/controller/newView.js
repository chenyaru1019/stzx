module.controller('newViewCtrl',
    function ($rootScope, $scope, $http, $state, $ionicLoading, $ionicScrollDelegate, $ionicModal, $window, $ionicActionSheet, commonJS, focus) {
        commonJS.loadingShow();
        $scope.pullingText = "松开刷新";
        $scope.refreshingText = "努力加载中...";

        $scope.init = function () {
            $scope.showCancelButton = false; //是否显示取消按钮
            $scope.lastLoadTime = new Date().Format("yyyy-MM-dd HH:mm:ss");      // 最后加载时间
            $scope.lastRefreshTime = new Date().Format("yyyy-MM-dd HH:mm:ss");   // 最后刷新时间
            $scope.displayTop = false;
            $scope.userId = $scope.user.ObjectID;
            //搜索条件
            $scope.search =
                {
                    searchKey: "",
                    startDate: new Date("2000-01-01"),
                    endDate: new Date("2099-01-01")
                }
            $scope.worksheetUrl = "";
            $scope.initCompleted = false;
            $scope.exception = false;
            // 待办任务集合
            $scope.finishedWorkItems = [];
            // 是否加载完成
            $scope.loadCompleted = false;
            // 排序方式
            $scope.sortActionIndex = 1;  // 默认是1
            $scope.sortKey = "OT_WORKITEM.FinishTime";
            $scope.sortDirection = "Desc";
        };

        //显示隐藏取消按钮
        $scope.showCancelBtn = function () {
            $scope.showCancelButton = true;
        }
        $scope.hideCancelBtn = function () {
            $scope.showCancelButton = false;
        }

        //取消按钮事件
        $scope.cancelSearch = function () {
            $scope.search.searchKey = "";
            $scope.doSearch();

            $scope.showCancelButton = false;
            //return false;
        }

        // 每次进入View时触发
        $scope.$on("$ionicView.enter", function (scopes, states) {
            if ($rootScope.dingMobile.isDingMobile) {
                $scope.SetDingDingHeader("已办任务");
            }

            if ($scope.userId != $scope.user.ObjectID) {
                $scope.init();
                $scope.loadMoreFishedWorkItem();
            }
            else {
                $scope.refreshFinishedWorkItem();
            }
        });
        // 刷新待办
        $scope.refreshFinishedWorkItem = function () {
            if (!$scope.initCompleted) {
                commonJS.loadingHide();
                return;
            }
            // console.log("refresh refreshFinishedWorkItem");
            var url = "";
            var params = null;
            if (window.cordova) {
                url = $scope.setting.httpUrl + "/GetRefreshWorkItems?callback=JSON_CALLBACK";
                url += "&userId=" + $scope.user.ObjectID;
                url += "&mobileToken=" + $scope.user.MobileToken;
                url += "&keyWord=" + $scope.search.searchKey;
                url += "&lastTime=" + $scope.lastRefreshTime.Format("yyyy-MM-dd HH:mm:ss");
                url += "&finishedWorkItem=" + true;
                url += "&existsLength=" + $scope.finishedWorkItems.length;
                url += "&startDate=" + $scope.search.startDate.Format("yyyy-MM-dd HH:mm:ss");
                url += "&endDate=" + $scope.search.endDate.Format("yyyy-MM-dd HH:mm:ss");
            } else {
                url = '/Portal/Sheets/handlers/DingTalkHandler.ashx?Command=DDQueryNewsAndNotice';
                params = {
                    // userId: $scope.user.ObjectID,
                    // mobileToken: $scope.user.MobileToken,
                    SearchingStr: $scope.search.searchKey,
                    LastTime: $scope.lastRefreshTime,
                    isNews: 1,
                    // existsLength: $scope.finishedWorkItems.length,
                    // startDate: $scope.search.startDate,
                    // endDate: $scope.search.endDate
                };
            }
            commonJS.getHttpData(url, params)
                .success(function (result) {
                    // console.log(result);
                    var resultValue = result;
                    if (resultValue.NewsList && resultValue.NewsList.length > 0) {
                        for (var i = resultValue.NewsList.length - 1; i > -1; i--) {
                            if ($scope.existsWorkItem(resultValue.NewsList[i])) continue;
                            $scope.finishedWorkItems.splice(0, 0, resultValue.NewsList[i]);
                        }
                    }
                    $scope.lastRefreshTime = resultValue.LastTime;
                    commonJS.loadingHide();
                    $scope.$broadcast("scroll.refreshComplete");
                    if ($scope.exception) {
                        $scope.loadCompleted = false;
                    }
                    $scope.exception = false;
                })
                .error(function (ex) {
                    $scope.exception = true;
                    $scope.loadCompleted = true;
                    commonJS.loadingHide();
                    $scope.$broadcast("scroll.refreshComplete");
                })
        };
        $scope.existsWorkItem = function (workItem) {
            if (!$scope.finishedWorkItems || $scope.finishedWorkItems.length == 0) return false;
            for (var i = 0; i < $scope.finishedWorkItems.length; i++) {
                if ($scope.finishedWorkItems[i].ObjectID == workItem.ObjectID) return true;
            }
            return false;
        };
        // 加载更多
        $scope.loadMoreFishedWorkItem = function () {
            // console.log("loadMoreFishedWorkItem");
            var url = "";
            var params = null;
            if (window.cordova) {
                url = $scope.setting.httpUrl + "/GetWorkItems?callback=JSON_CALLBACK";
                url += "&userId=" + $scope.user.ObjectID;
                url += "&mobileToken=" + $scope.user.MobileToken;
                url += "&keyWord=" + $scope.search.searchKey;
                url += "&lastTime=" + $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss");
                url += "&sortKey=" + $scope.sortKey;
                url += "&sortDirection=" + $scope.sortDirection;
                url += "&finishedWorkItem=" + true;
                url += "&startDate=" + $scope.search.startDate.Format("yyyy-MM-dd HH:mm:ss");
                url += "&endDate=" + $scope.search.endDate.Format("yyyy-MM-dd HH:mm:ss");
            } else {
                url = '/Portal/Sheets/handlers/DingTalkHandler.ashx?Command=DDQueryNewsAndNotice';
                params = {
                    // userId: $scope.user.ObjectID,
                    // mobileToken: $scope.user.MobileToken,
                    SearchingStr: $scope.search.searchKey,
                    LastTime: $scope.lastLoadTime,
                    isNews: 1,
                    // sortKey: $scope.sortKey,
                    // sortDirection: $scope.sortDirection,
                    // finishedWorkItem: true,
                    // startDate: $scope.search.startDate,
                    // endDate: $scope.search.endDate
                };
            }
            commonJS.getHttpData(url, params)
                .success(function (result) {
                    // console.log(result);
                    if (result.NewsList && result.NewsList.length > 0) {
                        for (var i = 0; i < result.NewsList.length; i++) {
                            if ($scope.existsWorkItem(result.NewsList[i])) continue;
                            $scope.finishedWorkItems.push(result.NewsList[i]);
                        }
                    }
                    $scope.initCompleted = true;
                    $scope.exception = false;
                    $scope.lastLoadTime = result.LastTime;
                    $scope.loadCompleted = result.LoadComplete;
                    commonJS.loadingHide();
                    $scope.$broadcast("scroll.infiniteScrollComplete");
                })
                .error(function (ex) {
                    console.log("加载已办出现异常");
                    $scope.initCompleted = true;
                    $scope.loadCompleted = true;
                    $scope.exception = true;
                    commonJS.loadingHide();
                    $scope.$broadcast("scroll.infiniteScrollComplete");
                })
        };
        // 显示搜索
        $scope.showSearch = function () {
            $scope.displaySearchButton = !$scope.displaySearchButton;
            if (!$scope.displaySearchButton) {
                if ($scope.search.searchKey) {
                    $scope.search.searchKey = "";
                    $scope.doSearch();
                }
            }
            focus("searchKey");
        }
        // 搜索
        $scope.doSearch = function () {
            $scope.lastRefreshTime = new Date();   // 最后刷新时间
            $scope.lastLoadTime = new Date();      // 最后加载时间
            $scope.finishedWorkItems = [];
            $scope.loadMoreFishedWorkItem();
        }
        // 排序操作
        $scope.showActionsheet = function () {
            var sortButtons = [
                { text: "<i class=\"icon ion-ios-arrow-up\"></i>按完成时间正序", key: "OT_WORKITEM.FinishTime", direction: "ASC" },
                { text: "<i class=\"icon ion-ios-arrow-down\"></i>按完成时间倒序", key: "OT_WORKITEM.FinishTime", direction: "DESC" },
                { text: "<i class=\"icon ion-ios-arrow-up\"></i>按发起时间正序", key: "CreatedTime", direction: "ASC" },
                { text: "<i class=\"icon ion-ios-arrow-down\"></i>按发起时间倒序", key: "CreatedTime", direction: "DESC" },
            ];
            for (var i = 0; i < sortButtons.length; i++) {
                if ($scope.sortActionIndex == i) {
                    sortButtons[i].text = "<span class=\"sheetActionPanel selectedAction\">" + sortButtons[i].text + "<i class=\"radio-icon selectedActionIcon disable-pointer-events ion-checkmark\"></i></span>";
                }
                else {
                    sortButtons[i].text = "<span class=\"sheetActionPanel\">" + sortButtons[i].text + "</span>";
                }
            }

            $ionicActionSheet.show({
                //titleText: "表单操作示例",
                buttons: sortButtons,
                // destructiveText: '删除',
                cancelText: "取消",
                cancel: function () {
                    console.log("取消操作");
                },
                buttonClicked: function (index) {
                    $scope.sortActionIndex = index;
                    $scope.sortKey = this.buttons[index].key;
                    $scope.sortDirection = this.buttons[index].direction;
                    $scope.finishedWorkItems = [];
                    $scope.lastLoadTime = new Date();
                    $scope.lastRefreshTime = new Date();
                    $scope.loadMoreFishedWorkItem();
                    console.log("按钮操作：", index);
                    return true;
                },
                destructiveButtonClicked: function () {
                    console.log("删除操作");
                    return true;
                }
            });
        };

        // 滚动到顶部
        $scope.scrollTop = function () {
            this.$parent.displayTop = false;
            $ionicScrollDelegate.scrollTop(true);
        };

        $scope.getScrollPosition = function () {
            // console.log(event.detail.scrollTop);
            $scope.displayTop = (event.detail.scrollTop > 60);
            event.stopPropagation();
        }

        // 打开新闻
        $scope.openCirculateItem = function (workItemId) {
            if (!workItemId) return;
            // var url = $scope.setting.workItemUrl.split('portal')[0] +'Portal/Sheets/stzx/NewsView/NewsViewMobile.aspx?SheetCode=NewsView&IsMobile=True&Mode=Work&WorkItemID='+workItemId+'&T='+new Date().getTime()+'&loginfrom=wechat#/form/detail';
            $scope.worksheetUrl = $scope.setting.workItemUrl.split('portal')[0] +'Portal/Sheets/stzx/NewsView/NewsViewMobile.aspx?SheetCode=NewsView&IsMobile=True&Mode=Work&WorkItemID='+workItemId+'&LoginSID='+$scope.clientInfo.UUID+'&MobileToken'+ $scope.user.MobileToken;
            commonJS.openWorkItem($scope, $scope.worksheetUrl, workItemId);
        }

        // 关闭表单
        $scope.closeWorkItem = function () {
            $scope.modalForm.hide();
        }
        //点击搜索
        $scope.goToSearch = function () {
            $scope.modal.show();
        }
        //初始化搜索Modal
        $ionicModal.fromTemplateUrl('Search.html', {
            scope: $scope,
            animation: 'slide-in-up',
            focusFirstInput: true
        }).then(function (modal) {
            $scope.modal = modal;
        });
        // Cleanup when we're done with it!
        $scope.$on('$destroy', function () {
            $scope.modal.remove();
        });

        $scope.init();
        $scope.loadMoreFishedWorkItem();
    });


module.controller('SearchNewViewWorkItemCtr', function ($scope, $http, $ionicPopup, $ionicModal, $ionicActionSheet, $ionicScrollDelegate, $ionicTabsDelegate, commonJS, focus) {
    //进行搜索
    $scope.newViewItems_Search = [];
    $scope.doSearch = function (searchKey) {
        $scope.newViewItems_Search = [];
        $scope.search.searchKey = searchKey;
        $scope.lastLoadTime = new Date().Format("yyyy-MM-dd HH:mm:ss");      // 最后加载时间
        $scope.loadMoreWorkItem();
    }

    // 加载更多
    $scope.loadMoreWorkItem = function () {
        if ($scope.search.searchKey == "") {
            $scope.newViewItems_Search = [];
            return;
        }
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/GetWorkItems?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + $scope.search.searchKey;
            url += "&lastTime=" + $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss");
            url += "&sortKey=" + $scope.sortKey;
            url += "&sortDirection=" + $scope.sortDirection;
            url += "&finishedWorkItem=" + true;
            url += "&startDate=" + $scope.search.startDate.Format("yyyy-MM-dd HH:mm:ss");
            url += "&endDate=" + $scope.search.endDate.Format("yyyy-MM-dd HH:mm:ss");
        }
        else {
            url = '/Portal/Sheets/handlers/DingTalkHandler.ashx?Command=DDQueryNewsAndNotice';
            params = {
                // userId: $scope.user.ObjectID,
                // mobileToken: $scope.user.MobileToken,
                SearchingStr: $scope.search.searchKey,
                LastTime: $scope.lastLoadTime,
                isNews: 1,
                // sortKey: $scope.sortKey,
                // sortDirection: $scope.sortDirection,
                // finishedWorkItem: true,
                // startDate: $scope.search.startDate,
                // endDate: $scope.search.endDate
            };
        }
        commonJS.getHttpData(url, params)
            .success(function (result) {
                if (result.NewsList && result.NewsList.length > 0) {
                    for (var i = 0; i < result.NewsList.length; i++) {
                        if ($scope.existsWorkItem_Search($scope.newViewItems_Search, result.NewsList[i])) continue;
                        $scope.newViewItems_Search.push(result.NewsList[i]);
                    }
                }
                $scope.initCompleted = true;
                $scope.exception = false;
                $scope.lastLoadTime = result.LastTime;
                $scope.loadCompleted_Search = result.LoadComplete;
                commonJS.loadingHide();
                $scope.$broadcast("scroll.infiniteScrollComplete");
            })
            .error(function (ex) {
                console.log("加载已办出现异常");
                $scope.initCompleted = true;
                $scope.loadCompleted = true;
                $scope.exception = true;
                commonJS.loadingHide();
                $scope.$broadcast("scroll.infiniteScrollComplete");
            })
    };

    $scope.existsWorkItem_Search = function (existWorkItems, workItem) {
        if (!existWorkItems || existWorkItems.length == 0) return false;
        for (var i = 0; i < existWorkItems.length; i++) {
            if (existWorkItems[i].ObjectID == workItem.ObjectID) return true;
        }
        return false;
    };
    //取消搜索
    $scope.closeModal = function () {
        $scope.search.searchKey = "";
        $scope.newViewItems_Search = [];
        $scope.modal.hide();
    };
})
