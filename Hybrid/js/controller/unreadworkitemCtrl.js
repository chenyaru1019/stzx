﻿module.controller('unreadworkitemCtrl', function ($rootScope, $scope, $http, $state, $ionicPopup, $ionicModal, $ionicActionSheet, $ionicScrollDelegate, $ionicTabsDelegate, commonJS, focus) {
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
        $scope.totalCount = 0;
        // 排序方式
        $scope.sortActionIndex = 1;  // 默认是1
        $scope.sortKey = "ReceiveTime";
        $scope.sortDirection = "Desc";
        $scope.userId = $scope.user.ObjectID;

        $scope.selectItemMode = false;
        $scope.selectItems = [];
    }

    // 每次进入View时触发
    $scope.$on("$ionicView.enter", function (scopes, states) {
        if ($rootScope.dingMobile.isDingMobile) {
            $scope.SetDingDingHeader("待阅任务");
        }
        if ($scope.userId != $scope.user.ObjectID) {
            $scope.init();
            $scope.loadMoreUnreadWorkItem();
        } else {
            $scope.RefreshCirculateItem();
        }

    });

    // 刷新待阅
    $scope.RefreshCirculateItem = function () {
        if (!$scope.initCompleted) {
            commonJS.loadingHide();
            return;
        }
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/RefreshCirculateItems?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&userCode=" + $scope.user.Code;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + encodeURIComponent($scope.searchKey);
            url += "&lastTime=" + $scope.lastRefreshTime.Format("yyyy-MM-dd HH:mm:ss");
            url += "&existsLength=" + $scope.circulateItems.length;
            url += "&readWorkItem=false";
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/RefreshCirculateItems";
            params = {
                userId: $scope.user.ObjectID,
                userCode: $scope.user.Code,
                mobileToken: $scope.user.MobileToken,
                keyWord: encodeURIComponent($scope.searchKey),
                lastTime: $scope.lastRefreshTime.Format("yyyy-MM-dd HH:mm:ss"),
                existsLength: $scope.circulateItems.length,
                readWorkItem: false
            }
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            var resultValue = result;
            // 检查是否存在已经办完的任务
            for (var i = 0; i < $scope.circulateItems.length; i++) {
                if (resultValue.ExistsIds.indexOf($scope.circulateItems[i].ObjectID) == -1) {
                    $scope.setBadge($scope.totalCount - 1);
                    $scope.circulateItems.splice(i, 1);
                    i--;
                }
            }

            if (resultValue.CirculateItems && resultValue.CirculateItems.length > 0) {
                for (var i = resultValue.CirculateItems.length - 1; i > -1; i--) {
                    if ($scope.existsCirculateItem(resultValue.CirculateItems[i])) continue;
                    $scope.circulateItems.splice(0, 0, resultValue.CirculateItems[i]);
                }
            }
            if ($scope.circulateItems.length < 10
            && resultValue.ExistsIds.length > 0
            && $scope.circulateItems.length < resultValue.ExistsIds.length) {// 重新加载一次
                $scope.loadMoreUnreadWorkItem();
            }

            $scope.lastRefreshTime = commonJS.getDateFromJOSN(resultValue.LastTime);
            $scope.setBadge(resultValue.TotalCount);
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
    // 加载更多
    $scope.loadMoreUnreadWorkItem = function () {
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
            url += "&readWorkItem=false";
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/LoadCirculateItems";
            params = {
                userId: $scope.user.ObjectID,
                userCode: $scope.user.Code,
                mobileToken: $scope.user.MobileToken,
                keyWord: encodeURIComponent($scope.searchKey),
                sortKey: encodeURIComponent($scope.sortKey),
                sortDirection: encodeURI($scope.sortDirection),
                lastTime: $scope.lastLoadTime.Format("yyyy-MM-dd HH:mm:ss"),
                readWorkItem: false
            }
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
            $scope.setBadge(resultValue.TotalCount);
            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
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
    // 打开待阅
    $scope.openCirculateItem = function (CirculateItemId) {
        if (!CirculateItemId) return;
        $scope.worksheetUrl = $scope.setting.workItemUrl + CirculateItemId + "&LoginName=" + encodeURI($scope.user.Code) + "&LoginSID=" + $scope.clientInfo.UUID + "&MobileToken=" + $scope.user.MobileToken + "&IsApp=true";
        commonJS.GetWorkItemSheetUrl($scope, $scope.worksheetUrl, CirculateItemId);
        //commonJS.openWorkItem($scope, $scope.worksheetUrl, CirculateItemId);
    }

    $scope.existsCirculateItem = function (circulateItem) {
        if (!$scope.circulateItems || $scope.circulateItems.length == 0) return false;
        for (var i = 0; i < $scope.circulateItems.length; i++) {
            if ($scope.circulateItems[i].ObjectID == circulateItem.ObjectID) return true;
        }
        return false;
    };

    // 打开指定组织
    $scope.openUnit = function () {
        $state.go("home.index")
    }
    //设置Badge
    $scope.setBadge = function (totalCount) {
        if (totalCount > 0) {
            $rootScope.badge.unreadworkitem = totalCount > 99 ? "99+" : totalCount;
        }
        else if ($scope.circulateItems.length == 0) {
            $rootScope.badge.unreadworkitem = 0;
        }
    };
    //进入选择状态
    $scope.goToRead = function () {
        $scope.selectItemMode = true;
        $scope.allRead = true;
    }
    //退出选择状态
    $scope.goToUnread = function () {
        $scope.selectItemMode = false;
    }
    //点击搜索
    $scope.goToSearch = function () {
        $scope.modal.show();
    }
    //选中、取消选中
    $scope.itemChangeed = function ($event, itemid) {
        $event.stopPropagation();
        var isSelected = true;
        var sourceselectItems = $scope.selectItems;
        angular.forEach($scope.selectItems, function (id, index, full) {
            if (id == itemid) {
                //取消选中
                isSelected = false;
                sourceselectItems.splice(index, 1);
            }
        })
        if (isSelected) {
            sourceselectItems.push(itemid)
        }

        $scope.selectItems = sourceselectItems;
        if ($scope.selectItems.length == 0) {
            $scope.allRead = true;
        } else {
            $scope.allRead = false;
        }
    }
    $scope.readItem = function () {
        if ($scope.allRead) {
            //确认提示
            $scope.showConfirm("提示", "是否全部已阅？");
        } else {
            $scope.httpreadItems(false);
        }
    }
    //执行已阅
    $scope.httpreadItems = function (readAll) {
        var selectItems = "";
        angular.forEach($scope.selectItems, function (data, index, full) {
            selectItems = data + ";" + selectItems;
        })

        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/ReadCirculateItems?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&CirculateItemIDs=" + encodeURI(selectItems);
            url += "&ReadAll=" + readAll;
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/ReadCirculateItems";
            params = {
                userId: $scope.user.ObjectID,
                userCode: $scope.user.Code,
                mobileToken: $scope.user.MobileToken,
                CirculateItemIDs: encodeURI(selectItems),
                ReadAll: readAll
            }
        }
        commonJS.getHttpData(url, params)
       .success(function (data) {
           $scope.allRead = true;
           $scope.selectItems = [];
           $scope.RefreshCirculateItem();
       })
       .error(function (data) {
           $scope.RefreshCirculateItem();
       })
    }
    // 一个确认对话框
    $scope.showConfirm = function (title, template) {
        var confirmPopup = $ionicPopup.confirm({
            title: title,
            template: template,
            buttons: [
              { text: '取消' },
              {
                  text: '<b>确定</b>',
                  type: 'button-positive',
                  onTap: function (e) {
                      return true;
                  }
              },
            ]
        });
        confirmPopup.then(function (res) {
            if (res) {
                $scope.httpreadItems(true);
            } else {
            }
        });
    };
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
    $scope.loadMoreUnreadWorkItem();
});



module.controller('SearchUnreadCtr', function ($scope, $http, $ionicPopup, $ionicModal, $ionicActionSheet, $ionicScrollDelegate, $ionicTabsDelegate, commonJS, focus) {
    //进行搜索
    $scope.circulateItems_Search = [];
    $scope.doSearch = function (searchKey) {        
        $scope.searchKey = searchKey;
        $scope.lastLoadTime = new Date();      // 最后加载时间
        $scope.loadMoreUnreadWorkItem();
    }

    // 加载更多
    $scope.loadMoreUnreadWorkItem = function () {
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
            url += "&readWorkItem=false";
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/LoadCirculateItems";
            params = {
                userId: $scope.user.ObjectID,
                userCode: $scope.user.Code,
                mobileToken: $scope.user.MobileToken,
                keyWord: encodeURIComponent($scope.searchKey),
                sortKey: encodeURIComponent($scope.sortKey),
                sortDirection: encodeURI($scope.sortDirection),
                lastTime: $scope.lastRefreshTime.Format("yyyy-MM-dd HH:mm:ss"),
                readWorkItem: false
            }
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            $scope.circulateItems_Search = [];
            var resultValue = result;
            if (resultValue.CirculateItems && resultValue.CirculateItems.length > 0) {
                for (var i = 0; i < resultValue.CirculateItems.length; i++) {
                    $scope.circulateItems_Search.push(resultValue.CirculateItems[i]);
                }
            }
            $scope.initCompleted = true;
            $scope.lastLoadTime = commonJS.getDateFromJOSN(resultValue.LastTime);
            $scope.loadCompleted = resultValue.LoadComplete;
            commonJS.loadingHide();
            $scope.$broadcast("scroll.infiniteScrollComplete");
            $scope.exception = false;
        })
        .error(function () {
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
        $scope.circulateItems_Search = [];
        $scope.modal.hide();
    };
})