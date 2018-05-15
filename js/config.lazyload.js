// lazyload config

angular.module('app')
    /**
   * jQuery plugin config use ui-jq directive , config the js and css files that required
   * key: function name of the jQuery plugin
   * value: array of the css js file located
   */
  .constant('JQ_CONFIG', {
      easyPieChart: ['vendor/jquery/charts/easypiechart/jquery.easy-pie-chart.js'],
      sparkline: ['vendor/jquery/charts/sparkline/jquery.sparkline.min.js'],
      plot: ['vendor/jquery/charts/flot/jquery.flot.min.js',
                          'vendor/jquery/charts/flot/jquery.flot.resize.js',
                          'vendor/jquery/charts/flot/jquery.flot.tooltip.min.js',
                          'vendor/jquery/charts/flot/jquery.flot.spline.js',
                          'vendor/jquery/charts/flot/jquery.flot.orderBars.js',
                          'vendor/jquery/charts/flot/jquery.flot.pie.min.js'],
      slimScroll: ['vendor/jquery/slimscroll/jquery.slimscroll.min.js'],
      sortable: ['vendor/jquery/sortable/jquery.sortable.js'],
      nestable: ['vendor/jquery/nestable/jquery.nestable.js',
                          'vendor/jquery/nestable/nestable.css'],
      filestyle: ['vendor/jquery/file/bootstrap-filestyle.min.js'],
      slider: ['vendor/jquery/slider/bootstrap-slider.js',
                          'vendor/jquery/slider/slider.css'],
      chosen: ['vendor/jquery/chosen/chosen.jquery.min.js',
                          'vendor/jquery/chosen/chosen.css'],
      TouchSpin: ['vendor/jquery/spinner/jquery.bootstrap-touchspin.min.js',
                          'vendor/jquery/spinner/jquery.bootstrap-touchspin.css'],
      wysiwyg: ['vendor/jquery/wysiwyg/bootstrap-wysiwyg.js',
                          'vendor/jquery/wysiwyg/jquery.hotkeys.js'],
      dataTable: ['vendor/jquery/datatables/jquery.dataTables.min.js',
                          'vendor/jquery/datatables/dataTables.bootstrap.js',
                          'vendor/jquery/datatables/dataTables.bootstrap.css'],
      vectorMap: ['vendor/jquery/jvectormap/jquery-jvectormap.min.js',
                          'vendor/jquery/jvectormap/jquery-jvectormap-world-mill-en.js',
                          'vendor/jquery/jvectormap/jquery-jvectormap-us-aea-en.js',
                          'vendor/jquery/jvectormap/jquery-jvectormap.css'],
      footable: ['vendor/jquery/footable/footable.all.min.js',
                          'vendor/jquery/footable/footable.core.css'],
      wdatePicker: ['vendor/jquery/calendar/WdatePicker.js',
                          'vendor/jquery/calendar/skin/WdatePicker.css'],
      bootstrapTable: ['vendor/jquery/bootstrapTable/bootstrap-table.js',
                          'vendor/jquery/bootstrapTable/bootstrap-table.css'],
      angularFileUpLoad: ['vendor/modules/angular-file-upload/angular-file-upload.js'],

      LoadReport: ['vendor/jquery/calendar/WdatePicker.js',
                        'vendor/jquery/calendar/skin/WdatePicker.css',
                        'WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                        'WFRes/_Content/themes/ligerUI/ligerui-icons.css',
                        'WFRes/_Content/themes/H3Default/H3-ReportTemplate.css',
                        'WFRes/_Scripts/jquery/jquery.lang.js',
                        'vendor/ligerUI/ligerui.all.js',
                        'WFRes/_Scripts/ReportDesigner/ReportViewManager.js'
      ],

      //����״̬ͼ
      workflowdocument: ['WFRes/assets/stylesheets/themes.min.css',
                            'WFRes/_Content/designer/css/designer.css',
                            'WFRes/_Scripts/jquery/jquery.lang.js',
                            'WFRes/_Scripts/designer/Line.js',
                            'WFRes/_Scripts/designer/misc.js',
                            'WFRes/_Scripts/designer/Activity.js',
                            'WFRes/_Scripts/designer/Workflow.js',
                            'WFRes/_Scripts/designer/ActivityModel.js',
                            'WFRes/_Scripts/designer/ActivityDrag.js',
                            'WFRes/_Scripts/designer/WorkflowDocument.js',
                            'vendor/jquery/workflowdocument/loader.js'
      ],
      SheetWorkflow: ['WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                        'WFRes/assets/stylesheets/sheet.css',
                        'WFRes/_Scripts/jquery/jquery.lang.js',
                        'WFRes/_Scripts/ligerUI/ligerui.all.js',
                        'WFRes/_Scripts/MvcSheet/SheetControls.js',
                        'WFRes/_Scripts/MvcSheet/MvcSheetUI.js',
                        'WFRes/_Scripts/MvcSheet/Controls/SheetWorkflow.js'],
      SheetUser: ['WFRes/_Content/themes/ligerUI/Aqua/css/ligerui-all.css',
                        'WFRes/assets/stylesheets/sheet.css',
                        'WFRes/_Scripts/jquery/jquery.lang.js',
                        'WFRes/_Scripts/ligerUI/ligerui.all.js',
                        'WFRes/_Scripts/MvcSheet/SheetControls.js',
                        'WFRes/_Scripts/MvcSheet/MvcSheetUI.js',
                        'WFRes/_Scripts/MvcSheet/Controls/SheetUser.js']
  })
  .constant('ControllerConfig', {
      Organization: {
          LoginIn: "Organization/LoginIn",
          LoginOut: "Organization/LoginOut",
          GetCurrentUser: "Organization/GetCurrentUser",//��ȡ��ǰ��¼�û�
          GetUserInfo: "PersonalInfo/GetUserInfo",//��ȡ�û���Ϣ�������û�ID��
      },
      HomePage: {
          RenderTemplateToPage: "HomePage/RenderTemplateToPage",//����ҳ��ģ��

          RemoveWebPartFromPage: "PortalHandler/RemoveWebPartFromPage",//�Ƴ���ҳ����
          GetWebPartInstEditValue: "PortalHandler/GetWebPartInstEditValue",//��ȡ���ò������Եĳ�ʼֵ
          PageWebPartSort: "PortalHandler/PageWebPartSort",//��ק���������λ��
      },
      WorkItem: {
          GetDefaultUnfinishWorkItems: "WorkItem/GetDefaultUnfinishWorkItems",//��ȡ��ҳ�Ĵ�������
          GetWorkCount: "WorkItem/GetWorkCount",//��ȡ���죬���ģ��ҵ����� ����
          GetUnfinishWorkItems: "WorkItem/GetUnfinishWorkItems",//����          
          GetFinishWorkItems: "WorkItem/GetFinishWorkItems",//�Ѱ�
          GetUnReadWorkItems: "CirculateItem/GetUnReadWorkItems",//����
          GetReadWorkItems: "CirculateItem/GetReadWorkItems",//����
          QueryParticipantWorkItems: "WorkItem/QueryParticipantWorkItems",//��ѯ����
          QueryUnfinishedWorkItem: "WorkItem/QueryUnfinishedWorkItem",//�����е�����
          MyUnfinishedWorkItemByGroup: "WorkItem/MyUnfinishedWorkItemByGroup",//�ҵĴ���-����
          MyUnfinishedWorkItemByBatch: "WorkItem/MyUnfinishedWorkItemByBatch",//�ҵĴ���-����
          QueryElapsedWorkItem: "WorkItem/QueryElapsedWorkItem",//��ʱ������
          QueryAgentWorkItem: "WorkItem/QueryAgentWorkItem",//ί������
          HandleWorkItemByBatch: "WorkItem/HandleWorkItemByBatch",//������������

          GetMyWorkItem: "WorkItem/GetMyWorkItem",//Ӧ�����ġ��������б�
      },
      CirculateItem: {
          ReadCirculateItemsByBatch: "CirculateItem/ReadCirculateItemsByBatch",//��������
      },
      Workflow: {
          QueryWorkflowNodes: "Workflow/QueryWorkflowNodes",
          ChangeFrequence: "Workflow/ChangeFrequence",
          GetWorkflowInfo: "Workflow/GetWorkflowInfo",//��ȡ����״̬����״̬��Ϣ
      },
      Instance: {
          QueryInstance: "Instance/QueryInstance",//��ѯ����ʵ��
          QueryMyInstance: "Instance/QueryMyInstance",//�ҵ�����
          QueryUnfinishedInstance: "Instance/QueryUnfinishedInstance",//�����е�����
          QueryElapsedInstance: "Instance/QueryElapsedInstance",//��ʱ������
          QueryExceptionInstance: "Instance/QueryExceptionInstance",//�쳣������

          //���¾�Ϊ  �����������ݲ���
          ChangeWorkflowCode: "Instance/ChangeWorkflowCode",//����ģ��ı�,��ȡ��ѯ������������
          ExportDataItems: "Instance/ExportDataItems",//����ģ��ı�,��ȡ�ɲ�ѯ��������
          QueryInstanceData: "Instance/QueryInstanceData",//��ѯ��������
          ExportDataValidateWFInsAdmin: "Instance/ExportDataValidateWFInsAdmin",//������֤
          ExportIntanceData: "Instance/ExportIntanceData",//����
      },
      InstanceDetail: {
          GetInstanceStateInfo: "InstanceDetail/GetInstanceStateInfo",//����InstanceID��ȡ����״̬��Ϣ
          GetUrgeInstanceInfo: "InstanceDetail/GetUrgeInstanceInfo",//����InstanceID��ȡ�߰���ʷ��Ϣ
          GetUrgeWorkItemInfo: "InstanceDetail/GetUrgeWorkItemInfo",//����WorkItemID��ȡ�߰���Ϣ
          AddUrgeInstance: "InstanceDetail/AddUrgeInstance",//���һ���߰���Ϣ
          GetInstanceUserLog: "InstanceDetail/GetInstanceUserLog",//��ȡ����ʵ�����û�������־
          GetAdjustActivityInfo: "InstanceDetail/GetAdjustActivityInfo",//��ȡ������Ļ�ڵ�
          GetActivityChangeInfo: "InstanceDetail/GetActivityChangeInfo",//��ڵ�ı�ʱ�¼�
          ActivateActivity: "InstanceDetail/ActivateActivity",//����
          CancelActivity: "InstanceDetail/CancelActivity",//ȡ���
          AdjustActivity: "InstanceDetail/AdjustActivity",//�����������
          CancelInstance: "InstanceDetail/CancelInstance",//ȡ������ʵ��
          ActivateInstance: "InstanceDetail/ActivateInstance",//��������ʵ��
          RemoveInstance: "InstanceDetail/RemoveInstance",//ɾ������ʵ��
      },
      Agents: {
          GeyAgencyTable: "QueryAgent/GeyAgencyTable",
          GetAgency: "QueryAgent/GetAgency",
          AddAgency: "QueryAgent/AddAgency",
          RemoveAgency: "QueryAgent/RemoveAgency",
      },
      PersonalInfo: {
          GetUserInfo: "PersonalInfo/GetUserInfo",//��ȡ������Ϣ
          UpdateUserInfo: "PersonalInfo/UpdateUserInfo",//���ø�����Ϣ
          SetPassword: "PersonalInfo/SetPassword",//�޸�����
          GetFrequentlyUsedComment: "PersonalInfo/GetFrequentlyUsedComment",//��ȡ�����������
          GetFrequentlyUsedCommentsByUser: "PersonalInfo/GetFrequentlyUsedCommentsByUser",//��ȡ�û��������
          AddFrequentlyUsedComment: "PersonalInfo/AddFrequentlyUsedComment",//�����������
          RemoveFrequentlyUsedComment: "PersonalInfo/RemoveFrequentlyUsedComment",//ɾ���������

          AddSignature: "OrgUser/AddSignature",//���ǩ��
          GetSignaureList: "OrgUser/GetSignaureList",//��ȡ�û�ǩ��
          SetDefaultSignature: "OrgUser/ChangeSignaureDefault",//����Ĭ��ǩ��
          RemoveSignature: "OrgUser/RemoveSignaure",//ɾ��ǩ��
      },
      RunBizQuery: {
          EditBizObjectSheet: "RunBizQuery/EditBizObjectSheet",
          GetBizQueryViewData: "RunBizQuery/GetBizQueryViewData"
      },
      WebParts: {
          Save: "PortalHandler/SaveWebPart", //���沿��


          GetDataModelData: "PortalAdminHandler/GetDataModelData",//��ȡ����ģ�Ͳ��� ����

          ChangeWorkflowCode: "PortalAdminHandler/ChangeWorkflowCode",//DataModel ��ȡ����ģ�͵�������
      }
  })
  .config(['$ocLazyLoadProvider', function ($ocLazyLoadProvider) {
      $ocLazyLoadProvider.config({
          debug: true,
          events: true,
          modules: [
              {
                  name: 'ngGrid',
                  files: [
                      'vendor/modules/ng-grid/ng-grid.min.js',
                      'vendor/modules/ng-grid/ng-grid.min.css',
                      'vendor/modules/ng-grid/theme.css'
                  ]
              },
              {
                  name: 'ui.select',
                  files: [
                      'vendor/modules/angular-ui-select/select.min.js',
                      'vendor/modules/angular-ui-select/select.min.css'
                  ]
              },
              {
                  name: 'angularFileUpload',
                  files: [
                    'vendor/modules/angular-file-upload/angular-file-upload.min.js'
                  ]
              },
              {
                  name: 'ui.calendar',
                  files: ['vendor/modules/angular-ui-calendar/calendar.js']
              },
              {
                  name: 'ngImgCrop',
                  files: [
                      'vendor/modules/ngImgCrop/ng-img-crop.js',
                      'vendor/modules/ngImgCrop/ng-img-crop.css'
                  ]
              },
              {
                  name: 'angularBootstrapNavTree',
                  files: [
                      'vendor/modules/angular-bootstrap-nav-tree/abn_tree_directive.js',
                      'vendor/modules/angular-bootstrap-nav-tree/abn_tree.css'
                  ]
              },
              {
                  name: 'toaster',
                  files: [
                      'vendor/modules/angularjs-toaster/toaster.js',
                      'vendor/modules/angularjs-toaster/toaster.css'
                  ]
              },
              {
                  name: 'textAngular',
                  files: [
                      'vendor/modules/textAngular/textAngular-sanitize.min.js',
                      'vendor/modules/textAngular/textAngular.min.js'
                  ]
              },
              {
                  name: 'vr.directives.slider',
                  files: [
                      'vendor/modules/angular-slider/angular-slider.min.js',
                      'vendor/modules/angular-slider/angular-slider.css'
                  ]
              },
              {
                  name: 'com.2fdevs.videogular',
                  files: [
                      'vendor/modules/videogular/videogular.min.js'
                  ]
              },
              {
                  name: 'com.2fdevs.videogular.plugins.controls',
                  files: [
                      'vendor/modules/videogular/plugins/controls.min.js'
                  ]
              },
              {
                  name: 'com.2fdevs.videogular.plugins.buffering',
                  files: [
                      'vendor/modules/videogular/plugins/buffering.min.js'
                  ]
              },
              {
                  name: 'com.2fdevs.videogular.plugins.overlayplay',
                  files: [
                      'vendor/modules/videogular/plugins/overlay-play.min.js'
                  ]
              },
              {
                  name: 'com.2fdevs.videogular.plugins.poster',
                  files: [
                      'vendor/modules/videogular/plugins/poster.min.js'
                  ]
              },
              {
                  name: 'com.2fdevs.videogular.plugins.imaads',
                  files: [
                      'vendor/modules/videogular/plugins/ima-ads.min.js'
                  ]
              }
          ]
      });
  }])
;