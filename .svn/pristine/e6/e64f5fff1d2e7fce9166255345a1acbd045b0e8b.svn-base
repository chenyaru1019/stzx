app.controller('ShowReportControler', ['$scope', "$rootScope", "$translate", "$timeout",
    "$http", "$state", "$stateParams",
    "$filter", "ControllerConfig",
function ($scope, $rootScope, $translate, $timeout, $http, $state, $stateParams, $filter, ControllerConfig) {
    $scope.$on('$viewContentLoaded', function (event) {
    });

    // 获取语言
    $rootScope.$on('$translateChangeEnd', function () {
        $state.go($state.$current.self.name, {}, { reload: true });
    });


    $scope.options = function () {
        var option = {
            SourceCode: $stateParams.ReportCode,
            PortalRoot: window.localStorage.getItem("H3.PortalRoot"),
            TableShowObj: $("#ReportView"),
            dParamShowObj: $("#ParamContent")
        }
        return option;
    }

    // 查询
    $scope.Search = function () {
        ReportViewManager.Reload();
    }

    // 导出
    $scope.ExportReport = function () {
        ReportViewManager.ExportReport();
    }

}]);