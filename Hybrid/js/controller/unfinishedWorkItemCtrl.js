module.controller('unfinishedWorkItemCtrl', function ($rootScope, $scope, $http, $state, $ionicTabsDelegate,
    $ionicActionSheet, $ionicScrollDelegate, $ionicModal, commonJS, focus) {
    commonJS.loadingShow();
    $scope.pullingText = "松开刷新";
    $scope.refreshingText = "努力加载中...";
    $scope.IsSearchType = false;
    $scope.init = function () {
        $scope.showCancelButton = false; //是否显示取消按钮
        $scope.lastRefreshTime = new Date();   // 最后刷新时间
        $scope.lastLoadTime = new Date();      // 最后加载时间
        $scope.worksheetUrl = "";
        $scope.displayTop = false;
        $scope.searchKey = "";
        $scope.initCompleted = false;
        $scope.exception = false;
        $scope.displaySearchButton = false;
        //$scope.currentPageIndex = 1;
        // 高优先级任务集合
        $scope.HighPriorityItems = [];

        // 普通优先级任务集合
        $scope.NormalPriorityItems = [];

        // 是否加载完成
        $scope.loadCompleted = false;
        $scope.totalCount = 0;
        // 排序方式
        $scope.sortActionIndex = 1;  // 默认是1
        $scope.sortKey = "ReceiveTime";
        $scope.sortDirection = "Desc";
        $scope.userId = $scope.user.ObjectID;
    }
    //显示隐藏取消按钮
    $scope.showCancelBtn = function () {
        $scope.showCancelButton = true;
    }
    $scope.hideCancelBtn = function () {
        $scope.showCancelButton = false;
    }

    //取消按钮事件
    $scope.cancelSearch = function () {
        $scope.searchKey = "";
        $scope.doSearch();
        $scope.showCancelButton = false;
    }
    
    // 每次进入View时触发
    $scope.$on("$ionicView.enter", function (scopes, states) {
        if ($rootScope.dingMobile.isDingMobile) {
            $scope.SetDingDingHeader("待办");
        }

        if ($scope.userId != $scope.user.ObjectID) {
            $scope.init();
            $scope.loadMoreUnfishedWorkItem();
        }
        else {
            //$scope.refreshUnfinishedWorkItem();

            $scope.init();
            $scope.loadMoreUnfishedWorkItem();
        }
        if ($rootScope.badge.unfinishedworkitem > $scope.NormalPriorityItems.length + $scope.HighPriorityItems.length) {
            $scope.loadCompleted = false;
        }
        //打开表单页面
        if ($scope.jpushWorkItemId != "") {
            $scope.openWorkItem($scope.jpushWorkItemId);
            $scope.jpushWorkItemId = "";
        }
    });

    // 刷新待办
    $scope.refreshUnfinishedWorkItem = function () {
        if (!$scope.initCompleted) {
            commonJS.loadingHide();
            return;
        }
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/GetRefreshWorkItemsByPriority?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + $scope.searchKey;
            url += "&highLastTime=" + $scope.lastRefreshTimeHigh.Format("yyyy-MM-dd HH:mm:ss");
            url += "&normalLastTime=" + $scope.lastRefreshTimeNormal.Format("yyyy-MM-dd HH:mm:ss");
            url += "&finishedWorkItem=false";
            url += "&existsLengthHigh=" + $scope.HighPriorityItems.length;
            url += "&existsLenthNormal=" + $scope.NormalPriorityItems.length;
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/GetRefreshWorkItemsByPriority";
            params = {
                userId: $scope.user.ObjectID,
                mobileToken: $scope.user.MobileToken,
                keyWord: $scope.searchKey,
                highLastTime: $scope.lastRefreshTimeHigh.Format("yyyy-MM-dd HH:mm:ss"),
                normalLastTime: $scope.lastRefreshTimeNormal.Format("yyyy-MM-dd HH:mm:ss"),
                finishedWorkItem: false,
                existsLengthHigh: $scope.HighPriorityItems.length,
                existsLenthNormal: $scope.NormalPriorityItems.length
            }
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            var resultValue = result;
            // 检查是否存在已经办完的任务
            for (var i = 0; i < $scope.HighPriorityItems.length; i++) {
                if (resultValue.HighRefreshWrokitem.ExistsIds.indexOf($scope.HighPriorityItems[i].ObjectID) == -1) {
                    $scope.setBadge($scope.totalCount - 1);
                    $scope.HighPriorityItems.splice(i, 1);
                    i--;
                }
            }
            if (resultValue.HighRefreshWrokitem.WorkItems && resultValue.HighRefreshWrokitem.WorkItems.length > 0) {
                for (var i = resultValue.HighRefreshWrokitem.WorkItems.length - 1; i > -1; i--) {
                    if ($scope.existsWorkItem($scope.HighPriorityItems, resultValue.HighRefreshWrokitem.WorkItems[i])) continue;
                    $scope.HighPriorityItems.splice(0, 0, resultValue.HighRefreshWrokitem.WorkItems[i]);
                }
            }

            // 检查是否存在已经办完的任务
            for (var i = 0; i < $scope.NormalPriorityItems.length; i++) {
                if (resultValue.NormalRefreshWrokitem.ExistsIds.indexOf($scope.NormalPriorityItems[i].ObjectID) == -1) {
                    $scope.setBadge($scope.totalCount - 1);
                    $scope.NormalPriorityItems.splice(i, 1);
                    i--;
                }
            }
            if (resultValue.NormalRefreshWrokitem.WorkItems && resultValue.NormalRefreshWrokitem.WorkItems.length > 0) {
                for (var i = resultValue.NormalRefreshWrokitem.WorkItems.length - 1; i > -1; i--) {
                    if ($scope.existsWorkItem($scope.NormalPriorityItems, resultValue.NormalRefreshWrokitem.WorkItems[i])) continue;
                    $scope.NormalPriorityItems.splice(0, 0, resultValue.NormalRefreshWrokitem.WorkItems[i]);
                }
            }

            var workItemCount = $scope.NormalPriorityItems.length + $scope.HighPriorityItems.length;
            var existsIdsCount = resultValue.NormalRefreshWrokitem.ExistsIds.length + resultValue.HighRefreshWrokitem.ExistsIds.length;
            var totalCount = 0;
            totalCount = resultValue.HighRefreshWrokitem.TotalCount + resultValue.NormalRefreshWrokitem.TotalCount;
            if (totalCount > workItemCount) $scope.loadCompleted = false;

            if (resultValue.HighRefreshWrokitem.LastTime) {
                $scope.lastRefreshTimeHigh = commonJS.getDateFromJOSN(resultValue.HighRefreshWrokitem.LastTime);
            } else {
                $scope.lastRefreshTimeHigh = new Date();
            }
            if (resultValue.NormalRefreshWrokitem.LastTime) {
                $scope.lastRefreshTimeNormal = commonJS.getDateFromJOSN(resultValue.NormalRefreshWrokitem.LastTime);
            } else {
                $scope.lastRefreshTimeNormal = new Date();
            }

            $scope.setBadge(totalCount);
            $scope.$broadcast("scroll.refreshComplete");
            commonJS.loadingHide();
            if ($scope.exception) {
                $scope.loadCompleted = false;
            }
            $scope.exception = false;
        })
        .error(function (ex) {
            $scope.loadCompleted = true;
            $scope.exception = true;
            commonJS.loadingHide();
            $scope.$broadcast("scroll.refreshComplete");
        });
    };
    $scope.existsWorkItem = function (workItems, workItem) {
        if (!workItems || workItems.length == 0) return false;
        for (var i = 0; i < workItems.length; i++) {
            if (workItems[i].ObjectID == workItem.ObjectID) return true;
        }
        return false;
    };

    $scope.setBadge = function (totalCount) {
        //待办数量，在Controller中
        if (totalCount > 0) {
            $rootScope.badge.unfinishedworkitem = totalCount > 99 ? "99+" : totalCount;
        }
        else if ($scope.HighPriorityItems.length == 0 && $scope.NormalPriorityItems.length == 0) {
            $rootScope.badge.unfinishedworkitem = 0;
        }
    };
    // 加载更多
    $scope.loadMoreUnfishedWorkItem = function () {
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/GetWorkItemsByPriority?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + $scope.searchKey;
            url += "&lastTime=" + $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss");
            url += "&sortKey=" + $scope.sortKey;
            url += "&sortDirection=" + $scope.HighPriorityItems.length;
            url += "&finishedWorkItem=" + false;
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/GetWorkItemsByPriority";
            params = {
                userId: $scope.user.ObjectID,
                mobileToken: $scope.user.MobileToken,
                keyWord: $scope.searchKey,
                lastTime: $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss"),
                sortKey: $scope.sortKey,
                sortDirection: $scope.sortDirection,
                finishedWorkItem: false
            }
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            //区分高优先级流程和普通优先级流程
            //高优先级任务数超过10条，与高优先级数少于10条
            //刷新情况  high.length>10 ，刷新一页后重新加载的high多余10条
            //          high.length>10 ，刷新一页后重新加载的high少于余10条，需要加载普通优先级任务
            //          high.length<10 ,只需要刷新普通优先级任务 
            var resultValue = result;
            var HighPriorityItems = result.HighPriorityItems;
            var NormalPriorityItems = result.NormalPriorityItems;

            if (!HighPriorityItems && !NormalPriorityItems) {
                $state.go("login");
                return;
            }

            if (result.HighPriorityItems.WorkItems && result.HighPriorityItems.WorkItems.length > 0) {
                // 设置高优先级刷新时间
                $scope.lastRefreshTimeHigh = commonJS.getDateFromJOSN(result.HighPriorityItems.RefreshTime);
            } else { $scope.lastRefreshTimeHigh = new Date(); }
            if (result.NormalPriorityItems.WorkItems && result.NormalPriorityItems.WorkItems.length > 0) {
                // 设置普通优先级刷新时间
                $scope.lastRefreshTimeNormal = commonJS.getDateFromJOSN(result.NormalPriorityItems.RefreshTime);
            } else { $scope.lastRefreshTimeNormal = new Date(); }

            //高优先级
            if (HighPriorityItems.WorkItems && HighPriorityItems.WorkItems.length > 0) {
                for (var i = 0; i < resultValue.HighPriorityItems.WorkItems.length; i++) {
                    if ($scope.existsWorkItem($scope.HighPriorityItems, resultValue.HighPriorityItems.WorkItems[i])) continue;
                    $scope.HighPriorityItems.push(resultValue.HighPriorityItems.WorkItems[i]);
                }
            }
            //普通优先级
            if (NormalPriorityItems.WorkItems && NormalPriorityItems.WorkItems.length > 0) {
                for (var i = 0; i < resultValue.NormalPriorityItems.WorkItems.length; i++) {
                    if ($scope.existsWorkItem($scope.NormalPriorityItems, resultValue.NormalPriorityItems.WorkItems[i])) continue;
                    $scope.NormalPriorityItems.push(resultValue.NormalPriorityItems.WorkItems[i]);
                }
            }
            $scope.lastLoadTimeHigh = commonJS.getDateFromJOSN(HighPriorityItems.LastTime);
            $scope.lastLoadTimeNormal = commonJS.getDateFromJOSN(NormalPriorityItems.LastTime);
            $scope.loadCompletedHigh = resultValue.HighPriorityItems.TotalCount > $scope.HighPriorityItems.length ? false : true;
            $scope.loadCompletedNormal = resultValue.NormalPriorityItems.TotalCount > $scope.NormalPriorityItems.length ? false : true;
            $scope.loadCompleted = $scope.loadCompletedHigh && $scope.loadCompletedNormal;

            //是否加载完成
            if (!$scope.loadCompletedHigh) {
                $scope.lastLoadTime = $scope.lastLoadTimeHigh
            }
            else {
                $scope.lastLoadTime = $scope.lastLoadTimeNormal
            }

            //待办数量
            var totalCount = resultValue.HighPriorityItems.TotalCount + resultValue.NormalPriorityItems.TotalCount;
            $scope.setBadge(totalCount);

            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
            $scope.initCompleted = true;
            $scope.exception = false;
        })
        .error(function () {
            console.log("加载待办出现异常");
            $scope.initCompleted = true;
            $scope.exception = true;
            $scope.loadCompleted = true;
            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
        });
    };
    // 显示搜索
    $scope.showSearch = function () {
        $scope.displaySearchButton = !$scope.displaySearchButton;
        if (!$scope.displaySearchButton) {
            $scope.searchKey = "";
            $scope.doSearch();
        }
        focus("searchKey");
    }
    // 搜索
    $scope.doSearch = function () {
        $scope.lastRefreshTime = new Date();   // 最后刷新时间
        $scope.lastLoadTime = new Date();      // 最后加载时间
        $scope.lastRefreshTimeHigh = new Date();   // 最后刷新时间
        $scope.lastLoadTimeHigh = new Date();

        $scope.HighPriorityItems = [];
        $scope.NormalPriorityItems = [];
        $scope.loadMoreUnfishedWorkItem();
    }

    // 打开指定组织
    $scope.openUnit = function () {
            $state.go("home.index")
    }
    // 打开待办
    $scope.openWorkItem = function (workItemId) {
        if (!workItemId) return;
        $scope.worksheetUrl = $scope.setting.workItemUrl + workItemId + "&LoginName=" + encodeURI($scope.user.Code) + "&LoginSID=" + $scope.clientInfo.UUID + "&MobileToken=" + $scope.user.MobileToken;
        commonJS.GetWorkItemSheetUrl($scope, $scope.worksheetUrl, workItemId);
    }

    // 完成一个任务
    $scope.finishWorkItem = function (workItemId) {
        for (var i = 0; i < $scope.unfinishedWorkItems.length; i++) {
            if ($scope.unfinishedWorkItems[i].ObjectID == workItemId) {
                if ($scope.totalCount > 0) {
                    $scope.setBadge($scope.totalCount - 1);
                }
                $scope.unfinishedWorkItems.splice(i, 1);
            }
        }
    }
    // 关闭表单
    $scope.closeWorkItem = function () {
        $scope.modalForm.hide();
    }
    // 排序操作
    $scope.showActionsheet = function () {
        var sortButtons = [
                { text: "<i class=\"icon ion-ios-arrow-thin-up\"></i>按接收时间正序", key: "ReceiveTime", direction: "ASC" },
                { text: "<i class=\"icon ion-ios-arrow-thin-down\"></i>按接收时间倒序", key: "ReceiveTime", direction: "DESC" },
                { text: "<i class=\"icon ion-ios-arrow-thin-up\"></i>按发起时间正序", key: "CreatedTime", direction: "ASC" },
                { text: "<i class=\"icon ion-ios-arrow-thin-down\"></i>按发起时间倒序", key: "CreatedTime", direction: "DESC" },
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
                $scope.unfinishedWorkItems = [];
                $scope.lastLoadTime = new Date();
                $scope.lastRefreshTime = new Date();
                //$scope.loadMoreUnfishedWorkItem();
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
        $scope.displayTop = false;
        $ionicScrollDelegate.scrollTop(true);
    };

    $scope.getScrollPosition = function () {
        $scope.displayTop = (event.detail.scrollTop > 60);
        event.stopPropagation();
    }

    // 打开消息推送的待办
    if ($scope.jpushWorkItemId) {
        $scope.openWorkItem($scope.jpushWorkItemId);
        $scope.jpushWorkItemId = "";
    }

    //关闭模态窗口，注销自动刷新
    $scope.$on('$destory', function () {
        $scope.modal.remove();
    })

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

    $scope.init();
    $scope.loadMoreUnfishedWorkItem();
});

//搜索控制器
module.controller('SearchUnFinishCtr', function ($scope, $state, $http, $ionicPopup, $ionicModal, $ionicActionSheet, $ionicScrollDelegate, $ionicTabsDelegate, commonJS, focus) {
    //进行搜索
    // 高优先级任务集合
    $scope.HighPriorityItems_Search = [];
    // 普通优先级任务集合
    $scope.NormalPriorityItems_Search = [];
    $scope.lastLoadTime_Search = new Date();

    $scope.doSearch = function (searchKey) {
        //进行搜索
        // 高优先级任务集合
        $scope.HighPriorityItems_Search = [];
        // 普通优先级任务集合
        $scope.NormalPriorityItems_Search = [];
        $scope.lastLoadTime_Search = new Date();

        $scope.loadMoreUnfishedWorkItem(searchKey);
    }

    // 加载更多
    $scope.loadMoreUnfishedWorkItem = function (searchKey) {
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/GetWorkItemsByPriority?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + searchKey;
            url += "&lastTime=" + $scope.lastLoadTime_Search.Format("yyyy-MM-dd HH:mm:ss");
            url += "&sortKey=" + $scope.sortKey;
            url += "&sortDirection=" + $scope.HighPriorityItems_Search.length;
            url += "&finishedWorkItem=" + false;
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/GetWorkItemsByPriority";
            params = {
                userId: $scope.user.ObjectID,
                mobileToken: $scope.user.MobileToken,
                keyWord: searchKey,
                lastTime: $scope.lastLoadTime_Search.Format("yyyy-MM-dd HH:mm:ss"),
                sortKey: $scope.sortKey,
                sortDirection: $scope.sortDirection,
                finishedWorkItem: false
            }
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            //区分高优先级流程和普通优先级流程
            //高优先级任务数超过10条，与高优先级数少于10条
            //刷新情况  high.length>10 ，刷新一页后重新加载的high多余10条
            //          high.length>10 ，刷新一页后重新加载的high少于余10条，需要加载普通优先级任务
            //          high.length<10 ,只需要刷新普通优先级任务 
            var resultValue = result;
            var HighPriorityItems = result.HighPriorityItems;
            var NormalPriorityItems = result.NormalPriorityItems;

            if (!HighPriorityItems && !NormalPriorityItems) {
                $state.go("login");
                return;
            }

            if (result.HighPriorityItems.WorkItems && result.HighPriorityItems.WorkItems.length > 0) {
                // 设置高优先级刷新时间
                $scope.lastRefreshTimeHigh = commonJS.getDateFromJOSN(result.HighPriorityItems.RefreshTime);
            } else { $scope.lastRefreshTimeHigh = new Date(); }
            if (result.NormalPriorityItems.WorkItems && result.NormalPriorityItems.WorkItems.length > 0) {
                // 设置普通优先级刷新时间
                $scope.lastRefreshTimeNormal = commonJS.getDateFromJOSN(result.NormalPriorityItems.RefreshTime);
            } else { $scope.lastRefreshTimeNormal = new Date(); }

            //高优先级
            if (HighPriorityItems.WorkItems && HighPriorityItems.WorkItems.length > 0) {
                for (var i = 0; i < resultValue.HighPriorityItems.WorkItems.length; i++) {
                    if ($scope.existsWorkItem($scope.HighPriorityItems_Search, resultValue.HighPriorityItems.WorkItems[i])) continue;
                    $scope.HighPriorityItems_Search.push(resultValue.HighPriorityItems.WorkItems[i]);
                }
            }
            else {
                $scope.HighPriorityItems_Search = [];
            }
            //普通优先级
            if (NormalPriorityItems.WorkItems && NormalPriorityItems.WorkItems.length > 0) {
                for (var i = 0; i < resultValue.NormalPriorityItems.WorkItems.length; i++) {
                    if ($scope.existsWorkItem($scope.NormalPriorityItems_Search, resultValue.NormalPriorityItems.WorkItems[i])) continue;
                    $scope.NormalPriorityItems_Search.push(resultValue.NormalPriorityItems.WorkItems[i]);
                }
            } else {
                $scope.NormalPriorityItems_Search = [];
            }
            //
            $scope.lastLoadTimeHigh = commonJS.getDateFromJOSN(HighPriorityItems.LastTime);
            $scope.loadCompletedHigh = HighPriorityItems.LoadComplete;

            $scope.lastLoadTimeNormal = commonJS.getDateFromJOSN(NormalPriorityItems.LastTime);
            $scope.loadCompletedNormal = NormalPriorityItems.LoadComplete;

            if (!$scope.loadCompletedHigh) { $scope.lastLoadTime = $scope.lastLoadTimeHigh }
            else { $scope.lastLoadTime_Search = $scope.lastLoadTimeNormal }

            $scope.loadCompleted_Search = $scope.loadCompletedHigh && $scope.loadCompletedNormal;

            $scope.initCompleted = true;
            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
            $scope.exception = false;
        })
        .error(function () {
            console.log("搜索待办出现异常");
            $scope.initCompleted = true;
            $scope.exception = true;
            $scope.loadCompleted = true;
            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
        });
    };

    //取消搜索
    $scope.closeModal = function () {
        $scope.searchKey = "";
        // 高优先级任务集合
        $scope.HighPriorityItems_Search = [];
        // 普通优先级任务集合
        $scope.NormalPriorityItems_Search = [];
        $scope.modal.hide();
    };
})