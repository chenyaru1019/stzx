module.controller("loginCtrl",
    function ($rootScope, $scope, $ionicPlatform, $state) {
        $scope.$on("$ionicView.enter", function () {
            // 登录成功，转向主页面
            $state.go("home.index");
        });
    });
