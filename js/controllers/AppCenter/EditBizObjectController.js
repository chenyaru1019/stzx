/*
    应用中心-表单
*/

app.controller('EditBizObjectController', ['$rootScope', '$scope', '$http', '$location', '$stateParams',
   '$window', '$translate', '$state', 'ControllerConfig',
function ($rootScope, $scope, $http, $location, $stateParams, $window, $translate, $state, Controller) {
    $scope.IframeInit = function () {
        // console.log(typeof );
        $http({
            url: Controller.RunBizQuery.EditBizObjectSheet,
            params: {
                BizObjectID: "",
                SchemaCode: $stateParams.SchemaCode,
                SheetCode: $stateParams.SheetCode,
                Mode: $stateParams.Mode,
                IsMobile: false,
                EditInstanceData: "",
                rendom: new Date().getTime()
            }
        })
            .success(function (data) {
                if (data.Success) {
                    // console.log($stateParams.SchemaCode, $stateParams.SheetCode, $stateParams.Mode);
                    var target = ".app-aside-right";
                    var url = 'StartInstance.html?WorkflowCode=' + encodeURI($stateParams.SchemaCode) + '&PageAction=Close';
                    if ($(target).length == 0) {
                        window.location.href = url;
                    } else {
                        $(target).toggleClass("show");
                        $(target).find("iframe").attr("src", url);
                        if ($(target).hasClass("show")) {
                            $("body").addClass("noscroll");
                        }
                        else {
                            $("body").removeClass("noscroll");
                        }
                    }
                } else {
                    //$rootScope.back();
                    var message = $translate.instant("msgGlobalString.LackOfAuth");
                    $.notify({ message: message, status: "danger" });
                }
            })
    };
    //当再次点击侧边栏申请表单按钮，防止页面消失 与main.js文件结合使用
    $scope.IframeInit();
    // $rootScope.$on('callIframeEvent', function(event, args) {
    //     if (args.Code == 'hwsq' || args.Code == 'clsysq'|| args.Code == 'kfdsq' || args.Code == 'ygcc' || args.Code == 'tq' || args.Code == 'zzdsq' || args.Code == 'yydsq'||args.Code == 'pzssq') {
    //         // console.log(window.top !== window.self);
    //     }
    // });
}]);