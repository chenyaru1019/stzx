module.controller('finishreadworkitemCtrl', function ($rootScope, $scope, $http, $ionicPopup, $ionicModal, $ionicActionSheet, $ionicScrollDelegate, $ionicTabsDelegate, commonJS, focus) {
    commonJS.loadingShow();
    $scope.pullingText = "松开刷新";
    $scope.refreshingText = "努力加载中...";
    $scope.init = function () {
        $scope.lastRefreshTime = new Date();   // 最后刷新时间
        $scope.lastLoadTime = new Date();      // 最后加载时间
        $scope.worksheetUrl = "";
        $scope.initCompleted = false;
        $scope.exception = false;
        $scope.searchKey = "";
        // 待办任务集合
        $scope.circulateItems = [];
        // 是否加载完成
        $scope.loadCompleted = false;
        // 排序方式
        $scope.sortActionIndex = 1;  // 默认是1
        $scope.sortKey = "ReceiveTime";
        $scope.sortDirection = "Desc";
        $scope.userId = $scope.user.ObjectID;
    }

    // 每次进入View时触发
    $scope.$on("$ionicView.enter", function (scopes, states) {
        if ($rootScope.dingMobile.isDingMobile) {
            $scope.SetDingDingHeader("已阅");
        }
        if ($scope.userId != $scope.user.ObjectID) {
            $scope.init();
            $scope.loadMoreFinishreadWorkItem();
        } else {
            $scope.RefreshCirculateItem();
        }
    });


    //返回
    $scope.back = function (){
        $state.go("home.index")
    }

    // 刷新待阅
    $scope.RefreshCirculateItem = function () {
        if (!$scope.initCompleted) {
            commonJS.loadingHide();
            return;
        }
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/RefreshCirculateItems?callback=JSON_CALLBACK&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + encodeURI($scope.searchKey);
            url += "&lastTime=" + $scope.lastRefreshTime.Format("yyyy-MM-dd HH:mm:ss");
            url += "&readWorkItem=true";
            url += "&existsLength=" + $scope.circulateItems.length;
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/RefreshCirculateItems";
            params = {
                userId: $scope.user.ObjectID,
                mobileToken: $scope.user.MobileToken,
                keyWord: encodeURI($scope.searchKey),
                lastTime: $scope.lastRefreshTime.Format("yyyy-MM-dd HH:mm:ss"),
                readWorkItem: true,
                existsLength: $scope.circulateItems.length
            };
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            var resultValue = result;

            if (resultValue.CirculateItems && resultValue.CirculateItems.length > 0) {
                for (var i = resultValue.CirculateItems.length - 1; i > -1; i--) {
                    if ($scope.existsCirculateItem(resultValue.CirculateItems[i])) continue;
                    $scope.circulateItems.splice(0, 0, resultValue.CirculateItems[i]);
                }
            }
            if ($scope.circulateItems.length < 10
              && resultValue.ExistsIds.length > 0
              && $scope.circulateItems.length < resultValue.ExistsIds.length) {// 重新加载一次
                $scope.loadMoreFinishreadWorkItem();
            }

            $scope.lastRefreshTime = commonJS.getDateFromJOSN(resultValue.LastTime);
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
        })
    };
    // 加载更多
    $scope.loadMoreFinishreadWorkItem = function () {
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/LoadCirculateItems?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + encodeURI($scope.searchKey);
            url += "&lastTime=" + $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss");
            url += "&sortKey=" + encodeURI($scope.sortKey);
            url += "&sortDirection=" + encodeURI($scope.sortDirection);
            url += "&readWorkItem=true";
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/LoadCirculateItems";
            params = {
                userId: $scope.user.ObjectID,
                userCode: $scope.user.Code,
                mobileToken: $scope.user.MobileToken,
                keyWord: encodeURI($scope.searchKey),
                sortKey: encodeURI($scope.sortKey),
                sortDirection: encodeURI($scope.sortDirection),
                lastTime: $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss"),
                readWorkItem: true
            };
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            var resultValue = result;
            if ($scope.circulateItems.length == 0) {
                // 设置刷新时间
                $scope.lastRefreshTime = commonJS.getDateFromJOSN(resultValue.RefreshTime);
            }

            if (resultValue.CirculateItems && resultValue.CirculateItems.length > 0) {
                for (var i = 0; i < resultValue.CirculateItems.length; i++) {
                    if ($scope.existsCirculateItem(resultValue.CirculateItems[i])) continue;
                    $scope.circulateItems.push(resultValue.CirculateItems[i]);
                }
            }
            $scope.initCompleted = true;
            $scope.lastLoadTime = commonJS.getDateFromJOSN(resultValue.LastTime);
            $scope.loadCompleted = resultValue.LoadComplete;
            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
            $scope.exception = false;
        })
        .error(function (ex) {
            console.log("加载待办出现异常");
            $scope.initCompleted = true;
            $scope.exception = true;
            $scope.loadCompleted = true;
            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
        })
    };
    // 打开已阅
    $scope.openCirculateItem = function (CirculateItemId) {
        if (!CirculateItemId) return;
        $scope.worksheetUrl = $scope.setting.workItemUrl + CirculateItemId + "&LoginName=" + encodeURI($scope.user.Code) + "&LoginSID=" + $scope.clientInfo.UUID + "&MobileToken=" + $scope.user.MobileToken + "&IsApp=true";
        commonJS.GetWorkItemSheetUrl($scope, $scope.worksheetUrl, CirculateItemId);
    }

    $scope.existsCirculateItem = function (circulateItem) {
        if (!$scope.circulateItems || $scope.circulateItems.length == 0) return false;
        for (var i = 0; i < $scope.circulateItems.length; i++) {
            if ($scope.circulateItems[i].ObjectID == circulateItem.ObjectID) return true;
        }
        return false;
    };
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


    // 滚动到顶部
    $scope.scrollTop = function () {
        $scope.displayTop = false;
        $ionicScrollDelegate.scrollTop(true);
    };

    $scope.getScrollPosition = function () {
        console.log(event.detail.scrollTop > 60);
        $scope.displayTop = (event.detail.scrollTop > 60);
        event.stopPropagation();
    };

    $scope.init();
    $scope.loadMoreFinishreadWorkItem();
});



module.controller('SearchFinshreadCtr', function ($scope, $http, $ionicPopup, $ionicModal, $ionicActionSheet, $ionicScrollDelegate, $ionicTabsDelegate, commonJS, focus) {
    //进行搜索
    $scope.circulateItems_Search = [];
    $scope.doSearch = function (searchKey) {
        $scope.circulateItems_Search = [];
        $scope.searchKey = searchKey;
        $scope.lastLoadTime = new Date();      // 最后加载时间
        $scope.loadMoreFinishreadWorkItem();
    }

    // 加载更多
    $scope.loadMoreFinishreadWorkItem = function () {
        if ($scope.searchKey == "") {
            $scope.circulateItems_Search = [];
            return;
        }
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/LoadCirculateItems?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + encodeURI($scope.searchKey);
            url += "&lastTime=" + $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss");
            url += "&sortKey=" + encodeURI($scope.sortKey);
            url += "&sortDirection=" + encodeURI($scope.sortDirection);
            url += "&readWorkItem=true";
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/LoadCirculateItems";
            params = {
                userId: $scope.user.ObjectID,
                mobileToken: $scope.user.MobileToken,
                keyWord: encodeURI($scope.searchKey),
                lastTime: $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss"),
                readWorkItem: true,
                sortKey: encodeURI($scope.sortKey),
                sortDirection: encodeURI($scope.sortDirection)
            };
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            var resultValue = result;
            if (resultValue.CirculateItems && resultValue.CirculateItems.length > 0) {
                for (var i = 0; i < resultValue.CirculateItems.length; i++) {
                    $scope.circulateItems_Search.push(resultValue.CirculateItems[i]);
                }
            }
            $scope.initCompleted = true;
            $scope.lastLoadTime = commonJS.getDateFromJOSN(resultValue.LastTime);
            $scope.loadCompleted = resultValue.LoadComplete;
            $scope.$broadcast("scroll.infiniteScrollComplete");
            $scope.exception = false;
        })
        .error(function (ex) {
            $scope.initCompleted = true;
            $scope.exception = true;
            $scope.loadCompleted = true;
            $scope.$broadcast("scroll.infiniteScrollComplete");
        })
    };

    //取消搜索
    $scope.closeModal = function () {
        $scope.searchKey = "";
        $scope.circulateItems_Search = [];
        $scope.modal.hide();
    };
})