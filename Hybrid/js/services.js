angular.module("starter.services", [])

  .service("commonJS", function ($rootScope, $ionicModal, $http, $ionicLoading, $cordovaToast, $state,
                                 $ionicPopup, $cordovaFileTransfer, $cordovaFileOpener2, $timeout, $cordovaNetwork) {
      this.loadingShow = function (msg) {
          if (!msg) msg = "<ion-spinner icon=\"bubbles\" class=\"centerscreen spinner-balanced\"></ion-spinner>";
          $ionicLoading.show({
              template: msg,
              duration: 6 * 1000
          }); // ionic内置插件，显示等待框
      };
      this.loadingHide = function () {
          $ionicLoading.hide();
      };

      this.getHttpData = function (url, params) {
          if (params) {
              return $http({ url: url, params: params });
          }
          return $http.jsonp(url);
      }
      //打开任务表单
      this.GetWorkItemSheetUrl = function ($scope, url, workItemId) {
          var that = this;
          that.loadingShow();
          var paramString = JSON.stringify(this.getUrlVars(url));
          $http({
              url: url.split("WorkItemSheets.html")[0] + "/WorkItemSheets/WorkItemSheets",
              params: { paramString: paramString }
          })
          .success(function (data) {
              if (data.Success) {
                  var url = $scope.setting.httpUrl.toLocaleLowerCase().split(config.portalroot.toLocaleLowerCase())[0] + data.Message;
                  that.openWorkItem($scope, url, workItemId)
              } else {
                  return "";
                  //判断pc，app，wechat超时处理
              }
          })
          .error(function (data) {
              console.log(data)
              return "";
          })
      }
      //打开发起流程表单
      this.OpenStartInstanceSheet = function ($scope, url) {
          var that = this;
          that.loadingShow();
          var paramString = JSON.stringify(this.getUrlVars(url));
          $http({
              url: url.split("StartInstance.html")[0] + "/StartInstance/StartInstance",
              params: { paramString: paramString }
          })
          .success(function (data) {
              if (data.Success) {
                  var url = $scope.setting.httpUrl.toLocaleLowerCase().split(config.portalroot.toLocaleLowerCase())[0] + data.Message;
                  that.openWorkItem($scope, url)
              } else {
                  return "";
                  //判断pc，app，wechat超时处理
              }
          })
          .error(function (data) {
              console.log(data)
              return "";
          })
      }
      //打开流程表单
      this.OpenInstanceSheet = function ($scope, url, InstanceId) {
          var that = this;
          that.loadingShow();
          var paramString = JSON.stringify(this.getUrlVars(url));
          $http({
              url: url.split("InstanceSheets.html")[0] + "/InstanceSheets/InstanceSheets",
              params: { paramString: paramString }
          })
          .success(function (data) {
              if (data.Success) {
                  if (data.Extend == "Redirect") {
                      var url = $scope.setting.httpUrl.toLocaleLowerCase().split(config.portalroot.toLocaleLowerCase())[0] + data.Message;
                      that.openWorkItem($scope, url);
                  } else {
                      $rootScope.mulSheets = data.Extend;
                      $state.go("mulSheets", {}, { reload: true });
                  }
              } else {
                  return "";
                  //判断pc，app，wechat超时处理
              }
          })
          .error(function (data) {
              console.log(data)
              return "";
          })
      }
      //获取url参数
      this.getUrlVars = function (url) {
          var vars = {};
          var hash;
          var hashs = url.slice(url.indexOf('?') + 1).split('&');
          for (var i = 0; i < hashs.length; i++) {
              hash = hashs[i].split('=');
              vars[hash[0]] = hash[1];
          }
          return vars;
      }
      // 从 JSON 字符串转换为 JS 日期
      this.getDateFromJOSN = function (value) {
          value = value.replace(/\/Date\((\d+)\)\//gi, '$1');
          var date = new Date();
          date.setTime(value);
          return date;
      };
      //
      this.showShortTop = function (msg) {
          if (window.plugins) {
              $cordovaToast.showShortTop(msg);
          }
          else {
              $ionicLoading.show({
                  template: msg,
                  duration: 2 * 1000
              });
          }
      },
      // 检查是否在线
      this.checkOnline = function () {
          if (window.plugins) {
              if (!$cordovaNetwork.isOnline()) {
                  this.showShortTop("您处理离线状态，请检查网络！");
                  return false;
              }
          }
          return true;
      };
      // 打开当前待办
      this.openWorkItem = function ($scope, worksheetUrl, workItemId, transitionstyle) {
          // 如果是App端，那么使用 InAppBrowser 方式打开
          worksheetUrl = worksheetUrl + "&loginfrom=" + $rootScope.loginfrom + "&T=" + new Date().getTime();
          var that = this;
          if (window.plugins) {
              // 离线检测
              console.log("check online...");
              if (!this.checkOnline()) {
                  $scope.clientInfo.isOffline = true;
                  return;
              }
              var hidden = "yes";
              if (!transitionstyle) {
                  transitionstyle = "coververtical";
                  hidden = "no";
              }
              // transitionstyle: Set to fliphorizontal, crossdissolve or coververtical to set the transition style (defaults to coververtical).
              that.loadingShow();
              var errorUrl = "";
              //if ($scope.ref)$scope.ref.close();
              console.log("open url,errorUrl=" + errorUrl);

              $scope.ref = window.open(worksheetUrl, "_blank",
                "location=no,closebuttoncaption=关闭,hidden=" + hidden + ",hardwareback=yes,EnableViewPortScale=yes,transitionstyle=" + transitionstyle);
              var isSheetView = true;
              $scope.ref.addEventListener("loadstart", function (event) {
                  // 监测回到原移动办公主页时，立即关闭当前页
                  if (event.url.toLowerCase().indexOf("index.html") > 0) {
                      that.loadingHide();
                      $scope.ref.close();
                      if (workItemId && $scope.refreshWorkItemId) {
                          $scope.refreshWorkItemId(workItemId);
                      }
                  } else if (event.url.toLowerCase().indexOf("readattachment/read?") > 0) {
                      that.openAttachment($scope, event.url, worksheetUrl, workItemId, transitionstyle);
                  }
                  console.log("InAppBrowser.loadstart->" + event.url);
              });
              $scope.ref.addEventListener("loadstop", function (event) {
                  that.loadingHide();
                  $scope.ref.show();
                  console.log("InAppBrowser.loadstop->" + event.url);
              });
              $scope.ref.addEventListener("loaderror", function (event) {
                  that.loadingHide();
                  var url = event.url.toLocaleLowerCase();
                  if (url.indexOf("zherp.") > -1) return;
                  if (url.indexOf("/qdss/") > -1) {
                      alert("当前链接不支持移动端,请在PC端查看！");
                  } else {
                      if (url.indexOf("readattachment.aspx") == -1) {
                          if (errorUrl || errorUrl != event.url) {
                              if (url.indexOf("workitemid") == -1
                                && url.indexOf("instanceid") == -1
                                && url.indexOf("workflowcode") == -1) {
                                  alert("当前附件格式不支持,请在PC端查看！");
                              }
                              else {
                                  alert("当前表单打开错误,请稍候再试！");
                              }
                          }
                          console.log("eventUrl1 eventUrl->" + event.url);
                          console.log("errorUrl1 errorUrl->" + errorUrl);
                      }
                      else {
                          console.log("eventUrl2 eventUrl->" + event.url);
                          console.log("errorUrl2 errorUrl->" + errorUrl);
                          if (url.indexOf("mobile") > 0) {
                              console.log("移动端访问附件");
                              if (errorUrl && errorUrl != event.url) {  // 移动端附件URL会跳转
                                  // alert("当前附件格式不支持,请在PC端查看！");
                              }
                              errorUrl = event.url;
                          }
                          else {  // 非移动端附件URL不跳转,第二次提醒
                              console.log("非移动端访问附件");
                              if (errorUrl && errorUrl == event.url) {
                                  alert("当前附件格式不支持,请在PC端查看！");
                                  eventUrl = "";
                              }
                              else {
                                  errorUrl = event.url;
                              }
                          }
                      }
                  }
                  //alert("当前表单不能正常访问，请稍候在试！");
                  //ref.close();
                  console.log("InAppBrowser.loaderror->" + event.url);
              });
              $scope.ref.addEventListener("exit", function (event) {
                  that.loadingHide();
                  if (!isSheetView) {
                      that.openWorkItem($scope, worksheetUrl, workItemId, "crossdissolve");
                  } else {
                      $state.go($state.$current.self.name, {}, { reload: true });
                  }
                  console.log("InAppBrowser.exit");
              });
          }
          else if ($rootScope.dingMobile.isDingMobile && dd) {
              dd.biz.util.openLink({
                  url: worksheetUrl + "&loginfrom=dingtalk",
                  onSuccess: function (result) {
                      if ($scope.hasOwnProperty("refreshUnfinishedWorkItem")) {
                          $scope.refreshUnfinishedWorkItem();
                      } else if ($scope.hasOwnProperty("RefreshCirculateItem")) {
                          $scope.RefreshCirculateItem();
                      }
                      $scope.GetBadge();
                  },
                  onFail: function (err) { }
              });
          }
          else {
              //微信
              var url = worksheetUrl + "&loginfrom=wechat";
              window.location.href = url;
              var templateUrl = "templates/home/worksheet.html";
              $ionicModal.fromTemplateUrl(templateUrl,
               {
                   scope: $scope,
                   width: "100%",
                   height: "100%",
                   animation: "slide-in-up"
               }).then(function (modal) {
                   $scope.modalForm = modal;
                   window._scope = $scope;
                   $scope.modalForm.show();
               });
          }
          that.loadingHide();
      };

      this.openAttachment = function ($scope, attachmentUrl, worksheetUrl, workItemId, transitionstyle) {
          console.log("下载附件");
          var that = this;
          if (window.cordova.InAppBrowser) {
              if (!this.checkOnline()) {
                  $scope.clientInfo.isOffline = true;
                  return;
              }
              var hidden = "yes";
              if (!transitionstyle) {
                  transitionstyle = "coververtical";
                  hidden = "no";
              }
              that.loadingShow();
              $scope.ref = window.open(attachmentUrl, "_system",
                "location=no,closebuttoncaption=关闭,hidden=" + hidden + ",hardwareback=yes,EnableViewPortScale=yes,transitionstyle=" + transitionstyle);
              var isSheetView = true;
              $scope.ref.addEventListener("loadstart", function (event) {
                  // 监测回到原移动办公主页时，立即关闭当前页                  
                  if (event.url.toLowerCase().indexOf("index.html") > 0) {
                      that.loadingHide();
                      $scope.ref.close();
                      if (workItemId && $scope.refreshWorkItemId) {
                          $scope.refreshWorkItemId(workItemId);
                      }
                  } else if (event.url.toLowerCase().indexOf("readattachment/read?") > 0) {
                      that.openAttachment($scope, event.url, worksheetUrl, workItemId, transitionstyle);
                  }
                  console.log("InAppBrowser.loadstart->" + event.url);
              });
              $scope.ref.addEventListener("loadstop", function (event) {
                  that.loadingHide();
                  $scope.ref.show();
                  console.log("InAppBrowser.loadstop->" + event.url);
              });
              $scope.ref.addEventListener("exit", function (event) {
                  that.loadingHide();
                  console.log("InAppBrowser.exit");
              });
          }
      }

      this.openDateSearch = function ($scope) {
          var templateUrl = "templates/home/dateSpanSearch.html";
          $ionicModal.fromTemplateUrl(templateUrl,
            {
                scope: $scope,
                width: "100%",
                height: "100%",
                animation: "slide-in-up"
            }).then(function (modal) {
                $scope.datemodal = modal;
                window._scope = $scope;
                $scope.datemodal.show();
            });
      }

      this.openDateRangeSelectModal = function ($scope) {
          var templateUrl = "templates/home/dateRangeSelect.html";
          $ionicModal.fromTemplateUrl(templateUrl,
            {
                scope: $scope,
                width: "100%",
                height: "100%",
                animation: "slide-in-up"
            }).then(function (modal) {
                $scope.dateselectmodal = modal;
                window._scope = $scope;
                $scope.dateselectmodal.show();
            });
      }

      // 弹出对话框
      this.alert = function (msg) {
          var alertPopup = $ionicPopup.alert({
              title: "系统提示",
              okText: "确认",
              template: msg
          });
          alertPopup.then(function (res) {
          });
      };
      // 检查升级(入口函数)
      this.checkVersion = function (serviceUrl, platform, version) {
          this.checkVersionFromServer(serviceUrl, platform, version, this.upgrade);
      };
      // 升级动作
      this.upgrade = function (platform, result) {
          var storagePath = "";
          if (platform.toLowerCase().indexOf("android") > -1) {
              storagePath = "file:///storage/sdcard0/Download/H3.apk";
              storagePath = cordova.file.externalRootDirectory + "H3.apk";
          }
          var msg = result.Description;
          var that = this;
          if (result.Confirm) {
              this.confirm("系统提示", msg, "下次再说", "立即升级",
                function () {
                    that.download(result.Url, storagePath, true);
                });
          }
          else {
              this.download(result.Url, storagePath, true);
          }
      };
      // 下载文件
      this.download = function (url, storagePath, open) {
          if (!storagePath) {
              // iOS 直接弹出浏览器转向链接
              console.log("ios upgrade url=" + url);
              window.open(url, "_system", "location=yes");
          }
          else {  // Android 直接下载再打开
              try {
                  $cordovaFileTransfer.download(url, storagePath, {}, true)
                    .then(function (result) {
                        // 直接打开下载的文件
                        $ionicLoading.show({
                            template: "已经下载：100%"
                        });

                        $cordovaFileOpener2.open(storagePath, "application/vnd.android.package-archive").then(
                          function () {
                              console.log("open complete");
                          },
                          function (err) {
                              console.log("open error->" + err);
                          }
                        );
                        $ionicLoading.hide();
                    },
                      function (err) {
                          $ionicLoading.hide();
                          console.log("download error->" + err);
                      },
                      function (progress) {
                          //进度，这里使用文字显示下载百分比
                          $timeout(function () {
                              var downloadProgress = (progress.loaded / progress.total) * 100;
                              $ionicLoading.show({
                                  template: "已经下载：" + Math.floor(downloadProgress) + "%"
                              });
                              if (downloadProgress > 99) {
                                  $ionicLoading.hide();
                              }
                          })
                      });
              }
              catch (e) {
                  console.log(e.message);
              }
          }
      };
      // 从服务器检查新的版本
      this.checkVersionFromServer = function (serviceUrl, platform, version) {
          var param = { platform: platform, version: version };
          var that = this;

          var url = serviceUrl + "/CheckVersion?callback=JSON_CALLBACK&platform=" + platform + "&version=" + version;
          $http.jsonp(url)
            .success(function (result) {
                if (that.isNewVersion(version, result.Version)) {
                    that.upgrade(platform, result);
                }
            })
            .error(function (ex) {
                $rootScope.$broadcast("scroll.refreshComplete");
            });
      }
      this.isNewVersion = function (oldVersion, newVersion) {
          var oldArr = oldVersion.split(".");
          var newArr = newVersion.split(".");

          for (var i = 0; i < newArr.length; i++) {
              if (i >= oldArr.length) return true;
              if (parseInt(newArr[i]) > parseInt(oldArr[i])) {
                  return true;
              }
              else if (parseInt(newArr[i]) < parseInt(oldArr[i])) {
                  return false;
              }
          }
          return newArr.length > oldArr.length;
      };
      // 弹出确认对话框
      this.confirm = function (title, msg, cancelText, okText, callback, cancel) {
          var confirmPopup = $ionicPopup.confirm({
              title: "检测到新版本",
              template: msg,
              cancelText: cancelText,
              okText: okText
          });
          confirmPopup.then(function (result) {
              if (result) {
                  if (callback)
                      callback.call(this);
              }
              else {
                  if (cancel)
                      cancel.call(this);
              }
          })
      };
      // 处理微信单点登录
      this.getUrlParam = function (name) {
          var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
          var r = window.location.search.substr(1).match(reg);
          if (r != null) return unescape(r[2]); return null;
      };
  })
  .directive('focusOn', function () {
      return function (scope, elem, attr) {
          scope.$on('focusOn', function (e, name) {
              if (name === attr.focusOn) {
                  elem[0].focus();
              }
          });
      };
  })
  .factory('focus', function ($rootScope, $timeout) {
      return function (name) {
          $timeout(function () {
              $rootScope.$broadcast('focusOn', name);
          });
      }
  });

Date.prototype.Format = function (fmt) { //author: meizz
    var str = fmt;
    var Week = ['日', '一', '二', '三', '四', '五', '六'];
    var month = parseInt(this.getMonth()) + 1;
    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/yy|YY/, (this.getYear() % 100) > 9 ? (this.getYear() % 100).toString() : '0' + (this.getYear() % 100));
    str = str.replace(/MM/, month > 9 ? month.toString() : '0' + month);
    str = str.replace(/M/g, month);
    str = str.replace(/w|W/g, Week[this.getDay()]);
    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    str = str.replace(/d|D/g, this.getDate());
    str = str.replace(/hh|HH/, this.getHours() > 9 ? this.getHours().toString() : '0' + this.getHours());
    str = str.replace(/h|H/g, this.getHours());
    str = str.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes().toString() : '0' + this.getMinutes());
    str = str.replace(/m/g, this.getMinutes());
    str = str.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds().toString() : '0' + this.getSeconds());
    str = str.replace(/s|S/g, this.getSeconds());

    return str;
}
