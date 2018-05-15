module.controller('indexController', function ($rootScope, $scope, $state, $http, $stateParams,$sce,
     $ionicSlideBoxDelegate, $timeout, commonJS) {
    commonJS.loadingShow();

    $scope.init = function () {
        //加载轮播图
        //加载九宫格
        $scope.activeIndex = 1;
        $scope.SlideShowDisplay = false;//是否显示轮播图
        $scope.SlideShows = [];
        $scope.AppFunctionNodes = [];
        var url = "";
        var params = null;
        if (window.cordova) {
            url = $scope.setting.httpUrl + "/GetHybridApp?callback=JSON_CALLBACK";
            url += "&userId=" + $scope.user.ObjectID;
            url += "&mobileToken=" + $scope.user.MobileToken;
            url += "&appCode=";

        } else {
            url = $scope.setting.httpUrl + "/HybridApp/GetHybridApp";
            params = { appCode: "" };
        }
        commonJS.getHttpData(url, params)
        .success(function (result) {
            commonJS.loadingHide();
            if (result.Message == "登录超时！") {
                $state.go("login");
            }
            if (result.Success && result.Extend) {
                $scope.url = $scope.setting.httpUrl.toLocaleLowerCase().split(config.portalroot.toLocaleLowerCase())[0];
                // $scope.SlideShows = result.Extend.SlideShows;
                $scope.AppFunctionNodes = result.Extend.AppFunctionNodes;
                // $scope.SlideShowDisplay = result.Extend.SlideShowDisplay;
                $http({
                    method: 'GET',
                    url: '/Portal/Sheets/handlers/DingTalkHandler.ashx?Command=DDViewNews',
                    cache:true
                }).then(function successCallback(response) {
                    $scope.SlideShows = response.data;
                    $ionicSlideBoxDelegate.update();
                    $scope.SlideShowDisplay = true;
                }, function errorCallback(response) {
                });

            }
        })
        .error(function (ex) {
            commonJS.loadingHide();
        })
    }

    // 每次进入View时触发
    $scope.$on("$ionicView.enter", function (scopes, states) {
        $scope.imgHeight = screen.width*0.5625;
console.log($scope.imgHeight);
        // $scope.init();
        $scope.loadWorkflows();
        //设置钉钉Header
        if ($rootScope.dingMobile.isDingMobile) {
            $scope.SetDingDingHeader("申通咨询");
        }

        if ($scope.AppFunctionNodes.length == 0 || $scope.userId != $scope.user.ObjectID) {
            $scope.init();
            $scope.userId = $scope.user.ObjectID;
        }
        if ($rootScope.dingMobile.isDingMobile && dd) {
            dd.biz.navigation.setRight({
                show: false//控制按钮显示， true 显示， false 隐藏， 默认true
            });
        }
        //打开表单页面
        if ($scope.jpushWorkItemId != "") {
            $scope.worksheetUrl = $scope.setting.workItemUrl + $scope.jpushWorkItemId + "&LoginName=" + encodeURI($scope.user.Code) + "&LoginSID=" + $scope.clientInfo.UUID + "&MobileToken=" + $scope.user.MobileToken;
            commonJS.GetWorkItemSheetUrl($scope, $scope.worksheetUrl, workItemId);
            $scope.jpushWorkItemId = "";
        }
    });
    // 打开新闻
    $scope.openCirculateItem = function (workItemId) {
        if (!workItemId) return;
        // var url = $scope.setting.workItemUrl.split('portal')[0] +'Portal/Sheets/stzx/NewsView/NewsViewMobile.aspx?SheetCode=NewsView&IsMobile=True&Mode=Work&WorkItemID='+workItemId+'&T='+new Date().getTime()+'&loginfrom=wechat#/form/detail';
        $scope.worksheetUrl = $scope.setting.workItemUrl.split('portal')[0] +'Portal/Sheets/stzx/NewsView/NewsViewMobile.aspx?SheetCode=NewsView&IsMobile=True&Mode=Work&WorkItemID='+workItemId+'&LoginSID='+$scope.clientInfo.UUID+'&MobileToken'+ $scope.user.MobileToken;
        commonJS.openWorkItem($scope, $scope.worksheetUrl, workItemId);
    }
    $scope.loadWorkflows = function () {
    };

    // 打开待办
    $scope.openWorkItem = function (workItemId) {
        if (!workItemId) return;
        $scope.worksheetUrl = $scope.setting.workItemUrl + workItemId + "&LoginName=" + encodeURI($scope.user.Code) + "&LoginSID=" + $scope.clientInfo.UUID + "&MobileToken=" + $scope.user.MobileToken;
        commonJS.openWorkItem($scope, $scope.worksheetUrl, workItemId);
    }

    // 发起流程
    $scope.startWorkflow1 = function (WorkflowCode) {
        $scope.worksheetUrl = $scope.setting.startInstanceUrl + WorkflowCode + "&LoginName=" + encodeURI($scope.user.Code) + "&LoginSID=" + $scope.clientInfo.UUID + "&MobileToken=" + $scope.user.MobileToken;

        commonJS.OpenStartInstanceSheet($scope, $scope.worksheetUrl);
        // console.log($event);
    };

    //滑动图片的点击事件
    $scope.coverFlowClick = function () {
        var index = $ionicSlideBoxDelegate.currentIndex();
        console.log("coverFlowClick index = ", index);
    }
    //此事件对应的是pager-click属性，当显示图片是有对应数量的小圆点，这是小圆点的点击事件
    $scope.pageClick = function (index) {
        console.log("pageClick index = ", index);
        $scope.activeIndex = index;
    };

    //当图片切换后，触发此事件，注意参数
    $scope.slideHasChanged = function ($index) {
        console.log("slideHasChanged index = ", $index);
    };

    //这是属性delegate-handle的验证使用的，其实没必要重定义，直接使用$ionicSlideBoxDelegate就可以
    $scope.delegateHandle = $ionicSlideBoxDelegate;

    $scope.init();
    $scope.loadWorkflows();

    //钉钉微信首次首页无法加载
    $timeout(function () {
        if ($scope.AppFunctionNodes.length == 0)
            $scope.init();
    }, 1000 * 1.5);

});
