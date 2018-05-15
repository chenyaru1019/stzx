module.controller('myInstanceTabCtrl', function ($rootScope, $scope, $http, $timeout, $ionicScrollDelegate, $ionicModal, commonJS) {
    commonJS.loadingShow();
    $scope.pullingText = "松开刷新";
    $scope.refreshingText = "努力加载中...";
    // 每次进入View时触发
    $scope.$on("$ionicView.enter", function (scopes, states) {
        if ($rootScope.dingMobile.isDingMobile) {
            $scope.SetDingDingHeader("我的流程");
            //设置header 右边按钮
            dd.biz.navigation.setMenu({
                /*backgroundColor: "#cGGGS",*/
                items: [
                    {
                        "id": "1",//字符串
                        "iconId": "search",//字符串，图标命名
                        "text": "搜索"
                    }
                ],
                onSuccess: function (data) {
                    $scope.goToSearch()
                }
            });
        }
        $scope.init();
        //加载我的实例
        $scope.loadAllData();
        $scope.tabInfo = $scope.getTabInfo(0);
        $scope.tabInfo.currentTab = 0;
    });

    $scope.$on("$ionicView.afterLeave", function () {
        if ($rootScope.dingMobile.isDingMobile && dd) {
            //设置header 右边按钮
            dd.biz.navigation.setRight({
                show: false//控制按钮显示， true 显示， false 隐藏， 默认true
            });
        }
    })

    //初始化
    $scope.init = function () {
        $scope.worksheetUrl = "";
        $scope.exception = false;
        $scope.displayTop = false;
        $scope.searchKey = "";
        //我的流程对象
        $scope.instances = {};
        // 是否加载完成
        $scope.totalCount = 0;
    };

    //获取当前面板信息
    $scope.getTabInfo = function (tab) {
        var color = 'H3Triangleunfinished';
        var title = '进行中';
        var tabName = 'unfinished';
        switch (tab) {
            case 0:
                color = 'H3Triangleunfinished';
                title = '进行中';
                tabName = 'unfinish';
                break;
            case 1:
                color = 'H3Trianglefinished';
                title = '已完成';
                tabName = 'finished';
                break;
            case 2:
                color = 'H3Trianglecancel';
                title = '已取消';
                tabName = 'cancel';
                break;
        }
        var tabInfo = {
            color: color,
            title: title,
            currentTab: 0,
            tabName: tabName
        }
        return tabInfo;
    }

    $scope.openInstance = function (instanceId) {
        if (!instanceId) return;
        $scope.worksheetUrl = $scope.setting.instanceSheetUrl + instanceId + "&LoginName=" + encodeURI($scope.user.Code) + "&LoginSID=" + $scope.clientInfo.UUID + "&MobileToken=" + $scope.user.MobileToken;
        commonJS.OpenInstanceSheet($scope, $scope.worksheetUrl, instanceId);
    }
    //点击搜索
    $scope.goToSearch = function () {
        $scope.modal.show();
    }
    //加载面板信息
    $scope.loadAllData = function () {
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/LoadAllInstances?callback=JSON_CALLBACK&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/LoadAllInstances";
            params = {
                userId: $scope.user.ObjectID,
                mobileToken: $scope.user.MobileToken
            };
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            if (result.Success) {
                $scope.instances = result.Extend
                $scope.currentTab = $scope.getCurrentTab(0);
                commonJS.loadingHide();
                $scope.$broadcast('scroll.infiniteScrollComplete');
            }
        })
        .error(function (ex) {
            $scope.exception = true;
            commonJS.loadingHide();
            $scope.$broadcast('scroll.infiniteScrollComplete');
        })
    };
    //获取当前的Tab
    $scope.getCurrentTab = function (tab) {
        switch (tab) {
            case 0:
                return $scope.instances.unfinished;
                break;
            case 1:
                return $scope.instances.finished;
                break;
            case 2:
                return $scope.instances.cancel;
                break;
        }
    }
    //切换tab
    $scope.changeInstance = function (tab) {
        $scope.tabInfo = $scope.getTabInfo(tab);
        $scope.currentTab = $scope.getCurrentTab(tab);
        $scope.tabInfo.currentTab = tab;
    };
    //上拉刷新
    $scope.doRefresh = function () {
        $scope.lastRefshTime = new Date();
        var url = "";
        var params = null;
        if (window.cordova) {
            var url = $scope.setting.httpUrl + "/RefreshInstancesByState?callback=JSON_CALLBACK&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&keyWord=" + encodeURI($scope.searchKey);
            url += "&lastTime=" + commonJS.getDateFromJOSN($scope.currentTab.lastRefreshTime).Format("yyyy-MM-dd HH:mm:ss");
            url += "&instanceState=" + $scope.currentTab.InstanceState;
        }
        else {
            url = $scope.setting.httpUrl + "/Mobile/RefreshInstancesByState";
            params = {
                userId: $scope.user.ObjectID,
                mobileToken: $scope.user.MobileToken,
                keyWord: encodeURI($scope.searchKey),
                lastTime: commonJS.getDateFromJOSN($scope.currentTab.lastRefreshTime).Format("yyyy-MM-dd HH:mm:ss"),
                instanceState: $scope.currentTab.InstanceState
            };
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            if (result.Success) {
                //更新对象数据
                $scope.updateInstances(result.Extend, "refresh");
                $scope.currentTab = $scope.getCurrentTab($scope.tabInfo.currentTab);
                commonJS.loadingHide();
                $scope.$broadcast('scroll.refreshComplete');
            }
        })
        .error(function (ex) {
            $scope.exception = true;
            commonJS.loadingHide();
            $scope.$broadcast('scroll.infiniteScrollComplete');
        })
    };
    //下拉加载
    $scope.loadMore = function () {
        if ($scope.currentTab) {
            commonJS.loadingShow();
            var url = "";
            var params = null;
            if (window.cordova) {
                url = $scope.setting.httpUrl + "/LoadInstancesByState?callback=JSON_CALLBACK&userId=" + $scope.user.ObjectID;
                url += "&mobileToken=" + $scope.user.MobileToken;
                url += "&keyWord=" + encodeURI($scope.searchKey);
                url += "&lastTime=" + commonJS.getDateFromJOSN($scope.currentTab.lastReloadTime).Format("yyyy-MM-dd HH:mm:ss");
                url += "&instanceState=" + $scope.currentTab.InstanceState;
            }
            else {
                url = $scope.setting.httpUrl + "/Mobile/LoadInstancesByState";;
                params = {
                    userId: $scope.user.ObjectID,
                    mobileToken: $scope.user.MobileToken,
                    keyWord: encodeURI($scope.searchKey),
                    lastTime: commonJS.getDateFromJOSN($scope.currentTab.lastReloadTime).Format("yyyy-MM-dd HH:mm:ss"),
                    instanceState: $scope.currentTab.InstanceState
                };
            }
            commonJS.getHttpData(url, params)
           .success(function (result) {
               if (result.Success) {
                   //更新对象数据
                   $scope.updateInstances(result.Extend, "load");
                   $scope.currentTab = $scope.getCurrentTab($scope.tabInfo.currentTab);
                   commonJS.loadingHide();
                   $scope.$broadcast('scroll.infiniteScrollComplete');
               }
           })
           .error(function (ex) {
               $scope.exception = true;
               commonJS.loadingHide();
               $scope.$broadcast('scroll.infiniteScrollComplete');
           })
        }
    };

    //更新数据,type:load/refresh
    $scope.updateInstances = function (obj, type) {
        switch ($scope.tabInfo.currentTab) {
            case 0:
                $scope.mergeData($scope.currentTab.list, $scope.instances.unfinished, obj, type);
                break;
            case 1:
                $scope.mergeData($scope.currentTab.list, $scope.instances.finished, obj, type);
                break;
            case 2:
                $scope.mergeData($scope.currentTab.list, $scope.instances.cancel, obj, type);
                break;
        }
    };

    /**
     * 合并数组中的数据,保证不重复
     *  @param {array} list   页面用于显示数据的临时数组
     *  @param {object} obj   每一个tab页对应的实例对象
     *  @param {object} ret   服务器返回的实例数据
     *  @param {string} type  加载方式
     *  @returns void
    **/
    $scope.mergeData = function (list, obj, ret, type) {
        if (type == "load") {
            obj.moredata = ret.moredata;
            obj.lastReloadTime = ret.lastReloadTime;
            if (ret.list && ret.list.length > 0) {
                for (var i = 0; i < ret.list.length; i++) {
                    if ($scope.existsInstance(list, ret.list[i])) continue;
                    obj.list.push(ret.list[i]);
                }
            }
        } else if (type == "refresh") {
            obj.lastRefreshTime = ret.lastRefreshTime;
            if (ret.list && ret.list.length > 0) {
                for (var i = ret.list.length - 1; i > -1; i--) {
                    if ($scope.existsInstance($scope.currentTab.list, ret.list[i])) continue;
                    obj.list.splice(0, 0, ret.list[i]);
                }
            }
        }

    };

    //判断是否已经包含该对象
    $scope.existsInstance = function (list, obj) {
        if (!list || list.length == 0) return false;
        for (var i = 0; i < list.length; i++) {
            if (list[i].ObjectID == obj.ObjectID) return true;
        }
        return false;
    };

    // 滚动到顶部
    $scope.scrollTop = function () {
        $scope.displayTop = false;
        $ionicScrollDelegate.scrollTop(true);
    };

    $scope.getScrollPosition = function () {
        $scope.displayTop = (event.detail.scrollTop > 60);
        event.stopPropagation();
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

    //封装的HTTP方法
    $scope.Request = function (url, param) {
        if (param) {
            return $http({ url: url, params: param });
        }
        return $http.jsonp(url);
    }
});


module.controller('searchInstanceCtrl', function ($scope, $http, $ionicPopup, $ionicModal, $ionicActionSheet, $ionicScrollDelegate, $ionicTabsDelegate, commonJS, focus) {
    //进行搜索
    $scope.searchInstances = {
        moredata: true,
        list: [],
        lastReloadTime: new Date()
    };

    //进行查询
    $scope.doSearch = function (searchKey) {
        if ($scope.searchKey == "") {
            $scope.searchInstances.list = [];
            return;
        }
        $scope.currentTab = $scope.getCurrentTab($scope.tabInfo.currentTab);
        $scope.searchInstances.list = [];
        $scope.searchInstances.lastReloadTime = new Date();
        $scope.searchKey = searchKey;
        $scope.searchMore();
    }

    // 加载更多
    $scope.searchMore = function () {
        if ($scope.currentTab) {
            var url = "";
            var params = null;
            if (window.cordova) {
                url = $scope.setting.httpUrl + "/LoadInstancesByState?callback=JSON_CALLBACK&userId=" + $scope.user.ObjectID;
                url += "&mobileToken=" + $scope.user.MobileToken;
                url += "&keyWord=" + encodeURI($scope.searchKey);
                url += "&lastTime=" + $scope.searchInstances.lastReloadTime.Format("yyyy-MM-dd HH:mm:ss");
                url += "&instanceState=" + $scope.currentTab.InstanceState;
            }
            else {
                url = $scope.setting.httpUrl + "/Mobile/LoadInstancesByState";
                params = {
                    userId: $scope.user.ObjectID,
                    mobileToken: $scope.user.MobileToken,
                    keyWord: encodeURI($scope.searchKey),
                    lastTime: $scope.searchInstances.lastReloadTime.Format("yyyy-MM-dd HH:mm:ss"),
                    instanceState: $scope.currentTab.InstanceState
                };
            }
            commonJS.getHttpData(url, params)
            .success(function (result) {
                if (result.Success) {
                    //更新对象数据
                    $scope.mergeData($scope.searchInstances.list, $scope.searchInstances, result.Extend, "load");
                    $scope.searchInstances.lastReloadTime = commonJS.getDateFromJOSN(result.Extend.lastReloadTime);
                    $scope.currentTab = $scope.getCurrentTab($scope.tabInfo.currentTab);
                    $scope.$broadcast('scroll.infiniteScrollComplete');
                }
            })
            .error(function (ex) {
                $scope.exception = true;
                $scope.$broadcast('scroll.infiniteScrollComplete');
            })
        }
    };


    //取消搜索
    $scope.closeModal = function () {
        $scope.searchKey = "";
        $scope.searchInstances.list = [];
        $scope.modal.hide();
    };
})