'use strict';
/**
 * 路由配置
 */
angular.module('app')
    .run(
        ['$rootScope', '$compile', '$state', '$stateParams','$templateCache',
            function ($rootScope, $compile, $state, $stateParams, $templateCache) {
                $rootScope.$state = $state;
                $rootScope.$stateParams = $stateParams;
                $rootScope.$on("$stateChangeSuccess", function (event, toState, toParams, fromState, fromParams) {
                    //to be used for back button
                    //won`t work when page is reloaded.
                    $rootScope.previousState_name = fromState.name;
                    $rootScope.previousState_params = fromParams;
                });
                $rootScope.back = function () {
                    $state.go($rootScope.previousState_name, $rootScope.previousState_params);
                };
                $rootScope.$on('$routeChangeStart', function(event, next, current) {
                    console.log('执行');
                    if (typeof(current) !== 'undefined'){
                        $templateCache.remove(current.templateUrl);
                    }
                });
            }
        ]
    )
    .config(
        ['$stateProvider', '$urlRouterProvider',
            function ($stateProvider, $urlRouterProvider) {
                // 默认页面
                $urlRouterProvider.otherwise('/platform/login');
                $stateProvider
                // 平台页面基类
                    .state('platform', {
                        url: '/platform',
                        abstract: true,
                        template: '<div ui-view class="fade-in-right-big smooth"></div>'
                    })
                    // 登录界面
                    .state('platform.login', {
                        url: '/login',
                        controller: 'LoginController',
                        templateUrl: 'template/login.html',
                        cache:false,
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/LoginController.js',
                                        'js/directives/app-directive.js',
                                    ]);
                                }]
                        }
                    })
                    // 主页面基类
                    .state('app', {
                        abstract: true,
                        url: '/app/:TopAppCode',
                        templateUrl: 'template/app.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/directives/app-directive.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    // 主页门户面基类
                    .state('appTemplate', {
                        abstract: true,
                        url: '/appTemplate',
                        templateUrl: 'template/appTemplates.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/directives/app-directive.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //首页-门户
                    .state('home', {
                        url: '/home/:PageId/:Mode',
                        templateUrl: 'template/default.html',
                        controller: "DefaultController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        //'WFRes/assets/stylesheets/sheet.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'vendor/jquery/jquery-ui/mouse.js',
                                            'vendor/jquery/jquery-ui/draggable.js',
                                            'vendor/jquery/jquery-ui/droppable.js',
                                            'vendor/jquery/jquery-ui/sortable.js',
                                            'vendor/jquery/jqueryui-touch-punch/jquery.ui.touch-punch.min.js',
                                            'js/controllers/DefaultController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })

                    //后勤管理
                    .state('app.logistics', {
                        url: '/logistics/:PageId/:Mode',
                        templateUrl: 'template/Administrative/Houqin.html',
                    })
                    //后勤管理——办公用品管理
                    .state('app.office', {
                        url: '/office',
                        templateUrl: 'template/Administrative/OfficeSupplies.html',
                    })
                    //文件管理
                    .state('app.fileManagement', {
                        url: '/fileManagement',
                        templateUrl: 'template/Administrative/fileManagement.html',
                    })
                    //信息发布管理
                    .state('app.NewInformation', {
                        url: '/Information',
                        templateUrl: 'template/Administrative/Information.html',
                    })

                    //会务管理-会议室使用情况
                    .state('app.houqinHys', {
                        url: '/ConferenceRoomUsage',
                        templateUrl: 'template/Administrative/Huiwu/H_Mroom_use.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'vendor/custom/H_Mroom_use.js',
                                        'css/custom/Usage.css',
                                    ])
                                }
                            ]
                        }
                    })

                    //会务管理-车辆使用情况
                    .state('app.houqinCar', {
                        url: '/VehicleUsage',
                        templateUrl: 'template/Administrative/Huiwu/H_Car_use.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'vendor/custom/H_Car_use.js',
                                        'css/custom/Usage.css',
                                    ])
                                }
                            ]
                        }
                    })

                    //后勤管理-出差情况概览
                    .state('app.houqinTravel', {
                        url: '/travelview',
                        templateUrl: 'template/Administrative/Huiwu/H_Travel_use.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'vendor/custom/H_Travel_use.js',
                                        'css/custom/Usage.css',
                                    ])
                                }
                            ]
                        }
                    })


                    //————门户管理————
                    //门户管理—模板管理
                    .state('appTemplate.PortalTemplates', {
                        url: '/PortalTemplates',
                        controller: "PortalTemplatesController",
                        templateUrl: 'template/Templates/PortalTemplates.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'js/controllers/Templates/PortalTemplatesController.js',
                                    //在线代码编辑
                                    'Admin/MvcDesigner/Lib/aspx.css',
                                    'Admin/MvcDesigner/Lib/codemirror.js',
                                ]).then(function () {
                                    return $ocLazyLoad.load([
                                        'Admin/MvcDesigner/Lib/matchbrackets.js',
                                        'Admin/MvcDesigner/Lib/xml.js',
                                        'Admin/MvcDesigner/Lib/javascript.js',
                                        'Admin/MvcDesigner/Lib/css.js',
                                        'Admin/MvcDesigner/Lib/htmlmixed.js',
                                        'Admin/MvcDesigner/Lib/htmlembedded.js',
                                        'Admin/MvcDesigner/Lib/fullscreen.js',
                                        'Admin/MvcDesigner/Lib/clike.js'
                                    ]);
                                });
                            }]
                        }
                    })
                    //门户管理—模板管理
                    .state('appTemplate.PortalPageManeger', {
                        url: '/PortalPageManeger',
                        controller: "PortalPageManegerController",
                        templateUrl: 'template/Templates/PortalPageManeger.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/Templates/PortalPageManegerController.js',
                                    ]);
                                }
                            ]
                        }
                    })

                    //————流程中心————
                    //待办
                    .state('app.MyUnfinishedWorkItem', {
                        cache:false,
                        url: '/MyUnfinishedWorkItem',
                        controller: "MyUnfinishedWorkItemController",
                        templateUrl: 'template/ProcessCenter/MyUnfinishedWorkItem.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //待办-分组模式
                    .state('app.MyUnfinishedWorkItemByGroup', {
                        url: '/MyUnfinishedWorkItemByGroup',
                        cache: 'true',
                        controller: "MyUnfinishedWorkItemByGroupController",
                        templateUrl: 'template/ProcessCenter/MyUnfinishedWorkItemByGroup.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyUnfinishedWorkItemByGroupController.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //待办-批量审批模式
                    .state('app.MyUnfinishedWorkItemByBatch', {
                        url: '/MyUnfinishedWorkItemByBatch',
                        controller: "MyUnfinishedWorkItemByBatchController",
                        templateUrl: 'template/ProcessCenter/MyUnfinishedWorkItemByBatch.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyUnfinishedWorkItemByBatchController.js'
                                    ]);
                                }
                            ]
                        }
                    })
                    //WorkItemDetail
                    .state('app.WorkItemDetail', {
                        url: '/WorkItemDetail',
                        controller: "WorkItemDetailController",
                        templateUrl: 'template/ProcessCenter/WorkItemDetail.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load(['js/controllers/ProcessCenter/WorkItemDetailController.js']);
                                }
                            ]
                        }
                    })
                    //待阅
                    .state('app.MyUnReadWorkItem', {
                        url: '/MyUnReadWorkItem',
                        controller: "MyUnReadWorkItemController",
                        templateUrl: 'template/ProcessCenter/MyUnReadWorkItem.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyUnReadWorkItemController.js'
                                    ]);
                                }
                            ]
                        }
                    })

                    //待阅-分组模式
                    .state('app.MyUnReadWorkItemByGroup', {
                        url: '/MyUnReadWorkItemByGroup',
                        cache: 'true',
                        controller: "MyUnReadWorkItemByGroupController",
                        templateUrl: 'template/ProcessCenter/MyUnReadWorkItemByGroup.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyUnReadWorkItemByGroupController.js',
                                    ]);
                                }
                            ]
                        }
                    })


                    //发起
                    .state('app.MyWorkflow', {
                        url: '/MyWorkflow',
                        controller: "MyWorkflowController",
                        templateUrl: 'template/ProcessCenter/MyWorkflow.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyWorkflowController.js',
                                        // 'vendor/jquery/bootstrapTable/bootstrap-table.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //已办
                    .state('app.MyFinishedWorkItem', {
                        url: '/MyFinishedWorkItem',
                        controller: "MyFinishedWorkItemController",
                        templateUrl: 'template/ProcessCenter/MyFinishedWorkItem.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyFinishedWorkItemController.js',
                                    ]);
                                }
                            ]
                        }
                    })

                    //已办 分组模式
                    .state('app.MyFinishedWorkItemByGroup', {
                        url: '/MyFinishedWorkItemByGroup',
                        controller: "MyFinishedWorkItemControllerByGroup",
                        templateUrl: 'template/ProcessCenter/MyFinishedWorkItemByGroup.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyFinishedWorkItemControllerByGroup.js',
                                    ]);
                                }
                            ]
                        }
                    })

                    //已阅
                    .state('app.MyReadWorkItem', {
                        url: '/MyReadWorkItem',
                        controller: "MyReadWorkItemController",
                        templateUrl: 'template/ProcessCenter/MyReadWorkItem.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyReadWorkItemController.js',
                                    ]);
                                }
                            ]
                        }
                    })

                    //已阅 分组模式
                    .state('app.MyReadWorkItemByGroup', {
                        url: '/MyReadWorkItemByGroup',
                        controller: "MyReadWorkItemControllerByGroup",
                        templateUrl: 'template/ProcessCenter/MyReadWorkItemByGroup.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyReadWorkItemByGroupController.js',
                                    ]);
                                }
                            ]
                        }
                    })


                    //我的流程
                    .state('app.MyInstance', {
                        url: '/MyInstance/:SchemaCode/:State',
                        controller: "MyInstanceController",
                        templateUrl: 'template/ProcessCenter/MyInstance.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyInstanceController.js',
                                        // 'vendor/jquery/bootstrap.js',
                                    ]);
                                }
                            ]
                        }
                    })

                    //我的流程 分组模式
                    .state('app.MyInstanceByGroup', {
                        url: '/MyInstanceByGroup/:SchemaCode/:State',
                        controller: "MyInstanceControllerByGroup",
                        templateUrl: 'template/ProcessCenter/MyInstanceByGroup.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyInstanceControllerByGroup.js',
                                        // 'vendor/jquery/bootstrap.js',
                                    ]);
                                }
                            ]
                        }
                    })

                    //查询流程实例
                    .state('app.QueryInstance', {
                        url: '/QueryInstance/:SchemaCode',
                        controller: "QueryInstanceController",
                        templateUrl: 'template/ProcessCenter/QueryInstance.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        // 'vendor/jquery/bootstrap.js',
                                        'js/controllers/ProcessCenter/QueryInstanceController.js'
                                    ]);
                                }
                            ]
                        }
                    })

                    // 查询流程实例1
                    // .state('app.QueryInstance1', {
                    //     url: '/QueryInstance1/:SchemaCode',
                    //     controller: "QueryInstanceController1",
                    //     templateUrl: 'template/ProcessCenter/QueryInstance1.html',
                    //     resolve: {
                    //         deps: ['$ocLazyLoad',
                    //             function ($ocLazyLoad) {
                    //                 return $ocLazyLoad.load([
                    //                     // 'vendor/jquery/bootstrap.js',
                    //                     'js/controllers/ProcessCenter/QueryInstanceController1.js'
                    //                 ]);
                    //             }
                    //         ]
                    //     }
                    // })

                    //查询任务
                    .state('app.QueryParticipantWorkItem', {
                        url: '/QueryParticipantWorkItem/:SchemaCode',
                        controller: "QueryParticipantWorkItemController",
                        templateUrl: 'template/ProcessCenter/QueryParticipantWorkItem.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/QueryParticipantWorkItemController.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //导出流程数据
                    .state('app.ExportInstanceData', {
                        url: '/ExportInstanceData',
                        controller: "ExportInstanceDataController",
                        templateUrl: 'template/ProcessCenter/ExportInstanceData.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        //jquery.dataTables.min.js、dataTables.bootstrap.js 不能互换加载顺序
                                        'vendor/jquery/datatables/jquery.dataTables.min.js',
                                        'vendor/jquery/datatables/dataTables.bootstrap.css'
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'vendor/jquery/datatables/dataTables.bootstrap.js',
                                            'js/controllers/ProcessCenter/ExportInstanceDataController.js',
                                        ])
                                    });
                                }
                            ]
                        }
                    })
                    //超时的任务
                    .state('app.QueryElapsedWorkItem', {
                        url: '/QueryElapsedWorkItem',
                        controller: "QueryElapsedWorkItemController",
                        templateUrl: 'template/ProcessCenter/QueryElapsedWorkItem.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/QueryElapsedWorkItemController.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //超时的流程
                    .state('app.QueryElapsedInstance', {
                        url: '/QueryElapsedInstance',
                        controller: "QueryElapsedInstanceController",
                        templateUrl: 'template/ProcessCenter/QueryElapsedInstance.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/QueryElapsedInstanceController.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //任务委托
                    .state('app.MyAgents', {
                        url: '/MyAgents',
                        controller: "MyAgentsController",
                        templateUrl: 'template/ProcessCenter/MyAgents.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyAgentsController.js',
                                        'js/services/notify.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    //常用意见
                    .state('app.MyComments', {
                        url: '/MyComments',
                        controller: "MyCommentsController",
                        templateUrl: 'template/ProcessCenter/MyComments.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MyCommentsController.js',
                                        // 'vendor/jquery/bootstrap.js'
                                    ]);
                                }
                            ]
                        }
                    })
                    //签章设置
                    .state('app.MySignature', {
                        url: '/MySignature',
                        controller: "MySignatureController",
                        templateUrl: 'template/ProcessCenter/MySignature.html',
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'js/controllers/ProcessCenter/MySignatureController.js',
                                        'vendor/angular/angular-file/ng-file-upload-shim.js',
                                        'vendor/angular/angular-file/ng-file-upload.js',
                                    ]);
                                }
                            ]
                        }
                    })
                    // 报表展示
                    .state('app.ShowReport', {
                        url: '/ShowReport/:ReportCode/:Params',
                        controller: 'ShowReportControler',
                        templateUrl: 'template/ReportCenter/ShowReport.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    //'WFRes/assets/stylesheets/sheet.css',
                                    'js/controllers/ReportCenter/ShowReportControler.js',
                                ])
                            }]
                        }
                    })

                    //流程状态-发起模式链接
                    .state('WorkflowInfo', {
                        url: '/WorkflowInfo/:InstanceID/:WorkItemID/:WorkflowCode/:WorkflowVersion',
                        controller: 'WorkflowInfoController',
                        templateUrl: 'template/ProcessCenter/WorkflowInfo.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'js/controllers/ProcessCenter/WorkflowInfoController.js',
                                ]);
                            }]
                        }
                    })
                    //流程状态-任务链接
                    .state('InstanceDetail', {
                        url: '/InstanceDetail/:InstanceID/:WorkItemID/:WorkflowCode/:WorkflowVersion',
                        controller: 'InstanceDetailController',
                        templateUrl: 'template/ProcessCenter/InstanceDetail.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                    //'WFRes/assets/stylesheets/sheet.css',
                                    'js/directives/app-directive.js',
                                    'js/controllers/ProcessCenter/InstanceDetailController.js',
                                ]);
                            }]
                        }
                    })
                    //流程状态-任务链接
                    .state('app.InstanceDetail', {
                        url: '/InstanceDetail/:InstanceID/:WorkItemID/:WorkflowCode/:WorkflowVersion',
                        controller: 'InstanceDetailController',
                        templateUrl: 'template/ProcessCenter/InstanceDetail.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                    //'WFRes/assets/stylesheets/sheet.css',
                                    'js/controllers/ProcessCenter/InstanceDetailController.js',
                                ]);
                            }]
                        }
                    })
                    //用户操作日志
                    .state('InstanceUserLog', {
                        url: '/InstanceUserLog/:InstanceID',
                        controller: 'InstanceUserLogController',
                        templateUrl: 'template/ProcessCenter/InstanceUserLog.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'js/controllers/ProcessCenter/InstanceDetailController.js',
                                ])
                            }]
                        }
                    })

                    /*
                     自定义页面
                     */

                    //应用中心-任务列表
                    .state('app.MyWorkItem', {
                        url: '/MyWorkItem/:SchemaCode/:State/:FunctionCode',
                        controller: 'MyWorkItemController',
                        templateUrl: 'template/AppCenter/MyWorkItem.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'js/controllers/AppCenter/MyWorkItemController.js',
                                ])
                            }]
                        }
                    })

                    //应用中心-表单
                    .state('app.EditBizObject', {
                        url: '/EditBizObject/:SchemaCode/:SheetCode/:Mode/:FunctionCode',
                        templateUrl: 'template/AppCenter/EditBizObject.html',
                        controller: "EditBizObjectController",
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    //'vendor/jquery/bootstrap.js',
                                    'js/controllers/AppCenter/EditBizObjectController.js'
                                ])
                            }]
                        }
                    })
                    //应用中心-查询列表
                    .state('app.BizQueryView', {
                        cache:false,
                        url: '/BizQueryView/:SchemaCode/:QueryCode/:FunctionCode',
                        controller: 'BizQueryViewController',
                        templateUrl: 'template/AppCenter/BizQueryView.html?t=' + Math.floor(Date.now() / 1000),
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'WFRes/_Scripts/jquery/jquery.lang.js',
                                    'WFRes/_Scripts/bizquery.js',

                                ]).then(function () {
                                    return $ocLazyLoad.load([
                                        'js/controllers/AppCenter/BizQueryViewController.js',
                                        'css/custom/BizQueryView.css'
                                    ]);
                                });
                            }]
                        }
                    })

                //易耗品采购货品查询
                    .state('app.ConsumableQuery', {
                        url: 'BizQueryView/Consumables/ConsumablesManage/yhpcghpcx',
                        templateUrl: 'template/Administrative/ConsumableQuery.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'css/custom/QueryList.css',
                                    'vendor/custom/QueryList.js',
                                    'vendor/jquery/calendar/WdatePicker.js'
                                ])
                            }]
                        }
                    })

                //内部公文库查询
                    .state('app.InternalLibrary', {
                        url: 'BizQueryView/InternalLibrary/InternalLibrary/nbgwkcx',
                        templateUrl: 'template/Administrative/InternalLibrary.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'css/custom/QueryList.css',
                                    'vendor/custom/QueryList.js'
                                ])
                            }]
                        }
                    })

                    //外部公文库查询
                    .state('app.ExternalDocument', {
                        url: 'BizQueryView/ExternalDocument/ExternalDocument/wbgwkcx',
                        templateUrl: 'template/Administrative/ExternalDocument.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'css/custom/QueryList.css',
                                    'vendor/custom/QueryList.js'
                                ])
                            }]
                        }
                    })


                //项目管理路由配置
                //合同管理
                    .state('app.ContractManagement', {
                        url: '/ContractManagement',
                        templateUrl: 'template/projectManagement/ContractManagement.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })
                //项目事务
                    .state('app.ProjectTransaction', {
                        url: '/ProjectTransaction',
                        templateUrl: 'template/projectManagement/ProjectTransaction.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })
                //后勤物品
                    .state('app.LogisticsGoods', {
                        url: '/LogisticsGoods',
                        templateUrl: 'template/projectManagement/LogisticsGoods.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })
                //人员管理
                    .state('app.PersonnelManagement', {
                        url: '/PersonnelManagement',
                        templateUrl: 'template/projectManagement/PersonnelManagement.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })
                    //考勤差假
                    .state('app.FalseAttendance', {
                        url: '/FalseAttendance',
                        templateUrl: 'template/projectManagement/FalseAttendance.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'css/custom/QueryList.css',
                                    'vendor/custom/QueryList.js'
                                ])
                            }]
                        }
                    })
                    //项目生产
                    .state('app.ProjectProduction', {
                        url: '/ProjectProduction',
                        templateUrl: 'template/projectManagement/ProjectProduction.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })
                    //考核管理
                    .state('app.AssessmentManagement', {
                        url: '/AssessmentManagement',
                        templateUrl: 'template/projectManagement/AssessmentManagement.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })
                    //项目档案管理
                    .state('app.ProjectFile', {
                        url: '/ProjectFile',
                        templateUrl: 'template/projectManagement/ProjectFile.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })
                    //专家库
                    .state('app.ExpertLibrary', {
                        url: '/ExpertLibrary',
                        templateUrl: 'template/projectManagement/ExpertLibrary.html',
                        controller: "MyUnfinishedWorkItemController",
                        resolve: {
                            deps: ['$ocLazyLoad',
                                function ($ocLazyLoad) {
                                    return $ocLazyLoad.load([
                                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                                        'vendor/jquery/jquery-ui/core.js',
                                        'vendor/jquery/jquery-ui/widget.js',
                                    ]).then(function () {
                                        return $ocLazyLoad.load([
                                            'js/controllers/ProcessCenter/MyUnfinishedWorkItemController.js',
                                        ]);
                                    });
                                }
                            ]
                        }
                    })

                    //考勤表页面
                    .state('app.Attendance', {
                        cache:false,
                        url: '/ExpertLibrary/Attendance',

                        templateUrl: 'template/projectManagement/attendance.html',

                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'vendor/jquery/datatables/jquery.dataTables.min.js',
                                    'vendor/jquery/calendar/WdatePicker.js',
                                    'vendor/Datatable/jquery.dataTables.css',
                                    'vendor/custom/attendance.js',
                                ])
                            }]
                        }
                    })

                    //公司简介页面
                    .state('app.CompanyProfile', {
                        url: '/CompanyProfile',
                        templateUrl: 'template/CompanyProfile.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'vendor/jquery/jquery-enlargement20160816/src/zoomify.js',
                                    'vendor/jquery/jquery-enlargement20160816/dist/zoomify.css',
                                ])
                            }]
                        }
                    })
                    //项目信息页面
                    .state('app.ProjectInfo', {
                        url: '/ProjectInfo',
                        templateUrl: 'template/projectManagement/ProjectInfo.html',
                        resolve: {
                            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                                return $ocLazyLoad.load([
                                    'css/custom/QueryList.css',
                                    // 'Sheets/js/bootstrap-table.js',
                                    // 'Sheets/js/bootstrap-table-zh-CN.js',
                                ])
                            }]
                        }
                    })

                // End
            }
        ]
    );