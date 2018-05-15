<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectAssessment.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectAssessment" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script type="text/javascript">
        $.MvcSheet.Loaded = function (sheetInfo) {

            var dt1 = $.MvcSheetUI.GetElement("ProjectDepartment").SheetGridView()
            console.log(dt1.V.R.length);


        }
        $(function () {
            $('#Control17_Label5').on('mouseenter', function (e) {
                //显示提示 质量管理
                mTips.c.x = 5;
                mTips.c.y = 5;
                mTips.s('<p>1.项目团队及时编制项目大纲，并通过评审或审核<p>' +
                    '<p>2.按专业部门的规范要求认真执行项目，符合项目质量要求</p>' +
                    '<p>3.服务质量及提交成果满足合同要求或业主认可</p>' +
                    '<p>4.项目质量符合分管领导、负责部门、区域总经理认定的其他质量要求</p>', 'success');
            });

            $('#Control17_Label6').on('mouseenter', function (e) {
                //显示提示 进度管理
                mTips.c.x = 5;
                mTips.c.y = 5;
                mTips.s('<p>1.及时制定项目实施计划、年度工作计划等<p>' +
                    '<p>2.按照进度计划及时提供咨询服务、按期提交服务成果</p>' +
                    '<p>3.按进度计划及时监控委外单位执行进度</p>' +
                    '<p>4.项目进度符合分管领导、负责部门、区域总经理认定的其他进度要求</p>', 'success');
            });

            $('#Control17_Label7,#Control18_Label5').on('mouseenter', function (e) {
                //显示提示 合同管理
                mTips.c.x = 5;
                mTips.c.y = 5;
                mTips.s('<p>1.遵守公司合同管理制度，确保项目合同信息安全，不发生合同泄密事件<p>' +
                    '<p>2.认真遵守公司合同管理规定，避免项目合同纠纷</p>' +
                    '<p>3.按照公司规定制定项目收款、成本资金付款计划</p>' +
                    '<p>4.及时办理项目成本资金支付事项</p>' +
                    '<p>5.及时向业主提交付款申请及相关材料</p>' +
                    '<p>6.确保合同进度款及时到账（不得超过3个月）</p>', 'success');
            });

            $('#Control17_Label8,#ctl36048_Label2').on('mouseenter', function (e) {
                //显示提示 安全管理
                mTips.c.x = 5;
                mTips.c.y = 5;
                mTips.s('<p>1.认真履行项目安全管理<p>' +
                    '<p>2.不得发生安全事故</p>', 'success');
            });

            $('#Control17_Label9').on('mouseenter', function (e) {
                //显示提示 资料管理
                mTips.c.x = 5;
                mTips.c.y = 5;
                mTips.s('<p>1.认真履行项目信息资料管理，及时资料信息分类归纳<p>' +
                    '<p>2.及时提交项目报告<p>' +
                    '<p>3.按项目档案归档要求执行资料与项目进度同步整理归档<p>' +
                    '<p>4.按时提交项目收尾计划、撤销申请、项目总结</p>', 'success');
            });

            $('#ctl36048_Label3').on('mouseenter', function (e) {
                //显示提示 物资管理
                mTips.c.x = 5;
                mTips.c.y = 5;
                mTips.s('<p>1.各类低值易耗品采购有计划、有审批，验收手续齐全<p>' +
                    '<p>2.低值易耗品发放、固定资产管理有完整的登记、领用、保管台帐<p>', 'success');
            });

            $('#Control17_Label10,#ctl36048_Label4').on('mouseenter', function (e) {
                //显示提示 成本管理
                mTips.c.x = 5;
                mTips.c.y = 5;
                mTips.s('<p>1.编制项目成本计划，计划执行不发生重大偏差<p>' +
                    '<p>2.业务招待、劳务费、专家咨询费等成本费用事先申报，按规定使用<p>' +
                    '<p>3.成本费用账目清晰、数据准确<p>' +
                    '<p>4.伙食费、津贴、考勤、休假等报表数据准确<p>' +
                    '<p>5.项目租赁事项按要求申报、执行<p>' +
                    '<p>6.遵守公司认定的其他成本考核事项<p>', 'success');
            });

            $('#Control17_Label5,#Control17_Label6,#Control17_Label7,#Control17_Label8,#Control17_Label9,#Control17_Label10,#Control18_Label5').on('mouseleave', function (e) {
                mTips.h();
                mTips.c.x = 0;
                mTips.c.y = 0;
            });
            $('#ctl36048_Label2,#ctl36048_Label3,#ctl36048_Label4').on('mouseleave', function (e) {
                mTips.h();
                mTips.c.x = 0;
                mTips.c.y = 0;
            });
        });
    </script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">项目考核</label>
    </div>
    <div class="panel-body sheetContainer">
        <div class="nav-icon fa fa-chevron-right bannerTitle">
            <label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
        </div>
        <div class="divContent">
            <div class="row">
                <div id="divFullNameTitle" class="col-md-2">
                    <label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="">发起人</label>
                </div>
                <div id="divFullName" class="col-md-4">
                    <label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>
                </div>
                <div id="divOriginateDateTitle" class="col-md-2">
                    <label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
                </div>
                <div id="divOriginateDate" class="col-md-4">
                    <label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>
                </div>
            </div>
            <div class="row">
                <div id="divOriginateOUNameTitle" class="col-md-2">
                    <label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" style="">所属组织</label>
                </div>
                <div id="divOriginateOUName" class="col-md-4">
                    <!--					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">
<span class="OnlyDesigner">Originator.OUName</span>
					</label>-->
                    <select data-datafield="Originator.OUName" data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class="" style="">
                    </select>
                </div>
                <div id="divSequenceNoTitle" class="col-md-2">
                    <label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号</label>
                </div>
                <div id="divSequenceNo" class="col-md-4">
                    <label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>
                </div>
            </div>
        </div>
        <div class="nav-icon fa  fa-chevron-right bannerTitle">
            <label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
        </div>
        <div class="divContent" id="divSheet">
            <div class="row">
                <div id="title1" class="col-md-2">
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">提交人</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">提交部门</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
                </div>
            </div>
            <div class="row">
                <div id="div901665" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="Title" style="" class="">标题</span></div>
                <div id="div198723" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class=""></div>
                <div id="div671961" class="col-md-2"></div>
            </div>

            <div class="row">
                <div id="div306083" class="col-md-2">
                    <span id="Label14" data-type="SheetLabel" data-datafield="ScoringDepartment" class="" style="">评分部门</span>
                </div>
                <div id="div242278" class="col-md-4">
                    <input id="Control14" type="text" data-datafield="ScoringDepartment" data-type="SheetTextBox" class="" style="">
                </div>
                <div id="div328080" class="col-md-2">
                </div>
                <div id="div856752" class="col-md-4">
                </div>
            </div>
            <div class="row">
                <div id="title3" class="col-md-2">
                    <span id="Label15" data-type="SheetLabel" data-datafield="ParticularYear" style="" class="">考核年份</span>
                </div>
                <div id="control3" class="col-md-4">
                    <input id="Control15" type="text" data-datafield="ParticularYear" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="title4" class="col-md-2">
                </div>
                <div id="control4" class="col-md-4">
                </div>
            </div>
            <div class="row">
                <div id="div646748" class="col-md-2"><span id="Label16" data-type="SheetLabel" data-datafield="Quarterly" style="" class="">考核季度</span></div>
                <div id="div826448" class="col-md-4">
                    <select data-datafield="Quarterly" data-type="SheetDropDownList" id="ctl681523" class="" style="" data-defaultitems="第一季度;第二季度;第三季度;第四季度"></select></div>
                <div id="div362586" class="col-md-2"></div>
                <div id="div885012" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div815474" class="col-md-2"><span id="Label17" data-type="SheetLabel" data-datafield="ProjectDepartment" style="" class="">项目绩效评价表（项管部）</span></div>
                <div id="div283687" class="col-md-10">
                    <table id="Control17" data-datafield="ProjectDepartment" data-type="SheetGridView" class="SheetGridView" data-displaysummary="false" data-defaultrowcount="0">
                        <tbody>

                            <tr class="header">
                                <td id="Control17_SerialNo" class="rowSerialNo">序号								</td>
                                <td id="Control17_Header3" data-datafield="ProjectDepartment.ProjectName">
                                    <label id="Control17_Label3" data-datafield="ProjectDepartment.ProjectName" data-type="SheetLabel" style="">项目名称</label>
                                </td>
                                <td id="Control17_Header4" data-datafield="ProjectDepartment.TaskNum" class="">
                                    <label id="Control17_Label4" data-datafield="ProjectDepartment.TaskNum" data-type="SheetLabel" style="">任务编号</label>
                                </td>
                                <td id="Control17_Header5" data-datafield="ProjectDepartment.Quality">
                                    <label id="Control17_Label5" data-datafield="ProjectDepartment.Quality" data-type="SheetLabel" style="">质量管理（20）</label>
                                </td>
                                <td id="Control17_Header6" data-datafield="ProjectDepartment.Schedule">
                                    <label id="Control17_Label6" data-datafield="ProjectDepartment.Schedule" data-type="SheetLabel" style="">进度管理（15）</label>
                                </td>
                                <td id="Control17_Header7" data-datafield="ProjectDepartment.Contract">
                                    <label id="Control17_Label7" data-datafield="ProjectDepartment.Contract" data-type="SheetLabel" style="">合同管理（7.5）</label>
                                </td>
                                <td id="Control17_Header8" data-datafield="ProjectDepartment.Security">
                                    <label id="Control17_Label8" data-datafield="ProjectDepartment.Security" data-type="SheetLabel" style="">安全管理（2.5）</label>
                                </td>
                                <td id="Control17_Header9" data-datafield="ProjectDepartment.Material">
                                    <label id="Control17_Label9" data-datafield="ProjectDepartment.Material" data-type="SheetLabel" style="">资料管理（15）</label>
                                </td>
                                <td id="Control17_Header10" data-datafield="ProjectDepartment.Cost">
                                    <label id="Control17_Label10" data-datafield="ProjectDepartment.Cost" data-type="SheetLabel" style="">成本管理（7.5）</label>
                                </td>
                                <td id="Control17_Header11" data-datafield="ProjectDepartment.Total">
                                    <label id="Control17_Label11" data-datafield="ProjectDepartment.Total" data-type="SheetLabel" style="">总分</label>
                                </td>
                                <td class="rowOption">删除								</td>
                            </tr>
                            <tr class="template">
                                <td id="Control17_Option" class="rowOption"></td>
                                <td data-datafield="ProjectDepartment.ProjectName">
                                    <input id="Control17_ctl3" type="text" data-datafield="ProjectDepartment.ProjectName" data-type="SheetTextBox" style="">
                                </td>
                                <td data-datafield="ProjectDepartment.TaskNum">
                                    <input id="Control17_ctl4" type="text" data-datafield="ProjectDepartment.TaskNum" data-type="SheetTextBox" style="">
                                </td>
                                <td data-datafield="ProjectDepartment.Quality" class="" style="width: 7%;">
                                    <input id="Control17_ctl5" type="text" data-datafield="ProjectDepartment.Quality" data-type="SheetTextBox" style="" class="" data-regularexpression="/^[1-5]{1}$/" data-regularinvalidtext="请输入分值1~5">
                                </td>
                                <td data-datafield="ProjectDepartment.Schedule" class="" style="width: 7%;">
                                    <input id="Control17_ctl6" type="text" data-datafield="ProjectDepartment.Schedule" data-type="SheetTextBox" style="" class="" data-regularexpression="/^[1-5]{1}$/" data-regularinvalidtext="请输入分值1~5">
                                </td>
                                <td data-datafield="ProjectDepartment.Contract" class="" style="width: 7%;">
                                    <input id="Control17_ctl7" type="text" data-datafield="ProjectDepartment.Contract" data-type="SheetTextBox" style="" class="" data-regularinvalidtext="请输入分值1~5" data-regularexpression="/^[1-5]{1}$/">
                                </td>
                                <td data-datafield="ProjectDepartment.Security" class="" style="width: 7%;">
                                    <input id="Control17_ctl8" type="text" data-datafield="ProjectDepartment.Security" data-type="SheetTextBox" style="" class="" data-regularinvalidtext="请输入分值1~5">
                                </td>
                                <td data-datafield="ProjectDepartment.Material" class="" style="width: 7%;">
                                    <input id="Control17_ctl9" type="text" data-datafield="ProjectDepartment.Material" data-type="SheetTextBox" style="" class="" data-regularinvalidtext="请输入分值1~5">
                                </td>
                                <td data-datafield="ProjectDepartment.Cost" class="" style="width: 7%;">
                                    <input id="Control17_ctl10" type="text" data-datafield="ProjectDepartment.Cost" data-type="SheetTextBox" style="" class="" data-regularinvalidtext="请输入分值1~5">
                                </td>
                                <td data-datafield="ProjectDepartment.Total" class="" style="width: 7%;">
                                    <input id="Control17_ctl11" type="text" data-datafield="ProjectDepartment.Total" data-type="SheetTextBox" style="" class="" data-computationrule="{ProjectDepartment.Quality}+{ProjectDepartment.Schedule}+{ProjectDepartment.Contract}+{ProjectDepartment.Security}+{ProjectDepartment.Material}+{ProjectDepartment.Cost}">
                                </td>
                                <td class="rowOption">
                                    <a class="delete">
                                        <div class="fa fa-minus">
                                        </div>
                                    </a>
                                    <a class="insert">
                                        <div class="fa fa-arrow-down">
                                        </div>
                                    </a>
                                </td>
                            </tr>
                            <tr class="footer">
                                <td class="rowOption"></td>
                                <td data-datafield="ProjectDepartment.ProjectName"></td>
                                <td data-datafield="ProjectDepartment.TaskNum"></td>
                                <td data-datafield="ProjectDepartment.Quality" class="" style="width: 6%;">
                                    <label id="Control17_stat5" data-datafield="ProjectDepartment.Quality" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td data-datafield="ProjectDepartment.Schedule">
                                    <label id="Control17_stat6" data-datafield="ProjectDepartment.Schedule" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td data-datafield="ProjectDepartment.Contract" class="" style="width: 6%;">
                                    <label id="Control17_stat7" data-datafield="ProjectDepartment.Contract" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td data-datafield="ProjectDepartment.Security">
                                    <label id="Control17_stat8" data-datafield="ProjectDepartment.Security" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td data-datafield="ProjectDepartment.Material" class="" style="width: 6%;">
                                    <label id="Control17_stat9" data-datafield="ProjectDepartment.Material" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td data-datafield="ProjectDepartment.Cost">
                                    <label id="Control17_stat10" data-datafield="ProjectDepartment.Cost" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td data-datafield="ProjectDepartment.Total" class="" style="width: 7%;">
                                    <label id="Control17_stat11" data-datafield="ProjectDepartment.Total" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td class="rowOption"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row tableContent">
                <div id="title9" class="col-md-2">
                    <span id="Label18" data-type="SheetLabel" data-datafield="MarketingDepartment" style="">项目绩效评价表（市场部）</span>
                </div>
                <div id="control9" class="col-md-10">
                    <table id="Control18" data-datafield="MarketingDepartment" data-type="SheetGridView" class="SheetGridView" data-displaysummary="false" data-defaultrowcount="0">
                        <tbody>

                            <tr class="header">
                                <td id="Control18_SerialNo" class="rowSerialNo">序号								</td>
                                <td id="Control18_Header3" data-datafield="MarketingDepartment.ProjectName">
                                    <label id="Control18_Label3" data-datafield="MarketingDepartment.ProjectName" data-type="SheetLabel" style="">项目名称</label>
                                </td>
                                <td id="Control18_Header4" data-datafield="MarketingDepartment.TaskNum">
                                    <label id="Control18_Label4" data-datafield="MarketingDepartment.TaskNum" data-type="SheetLabel" style="">任务编号</label>
                                </td>
                                <td id="Control18_Header5" data-datafield="MarketingDepartment.Contract">
                                    <label id="Control18_Label5" data-datafield="MarketingDepartment.Contract" data-type="SheetLabel" style="">合同管理（7.5）</label>
                                </td>
                                <td id="Control18_Header6" data-datafield="MarketingDepartment.Total">
                                    <label id="Control18_Label6" data-datafield="MarketingDepartment.Total" data-type="SheetLabel" style="">总分</label>
                                </td>
                                <td class="rowOption">删除								</td>
                            </tr>
                            <tr class="template">
                                <td id="Control18_Option" class="rowOption"></td>
                                <td data-datafield="MarketingDepartment.ProjectName">
                                    <input id="Control18_ctl3" type="text" data-datafield="MarketingDepartment.ProjectName" data-type="SheetTextBox" style="">
                                </td>
                                <td data-datafield="MarketingDepartment.TaskNum">
                                    <input id="Control18_ctl4" type="text" data-datafield="MarketingDepartment.TaskNum" data-type="SheetTextBox" style="">
                                </td>
                                <td data-datafield="MarketingDepartment.Contract">
                                    <input id="Control18_ctl5" type="text" data-datafield="MarketingDepartment.Contract" data-type="SheetTextBox" style="" class="" data-regularexpression="/^[1-5]{1}$/" data-regularinvalidtext="请输入分值1~5">
                                </td>
                                <td data-datafield="MarketingDepartment.Total">
                                    <input id="Control18_ctl6" type="text" data-datafield="MarketingDepartment.Total" data-type="SheetTextBox" style="" class="" data-computationrule="{MarketingDepartment.Contract}">
                                </td>
                                <td class="rowOption">
                                    <a class="delete">
                                        <div class="fa fa-minus">
                                        </div>
                                    </a>
                                    <a class="insert">
                                        <div class="fa fa-arrow-down">
                                        </div>
                                    </a>
                                </td>
                            </tr>
                            <tr class="footer">
                                <td class="rowOption"></td>
                                <td data-datafield="MarketingDepartment.ProjectName"></td>
                                <td data-datafield="MarketingDepartment.TaskNum"></td>
                                <td data-datafield="MarketingDepartment.Contract">
                                    <label id="Control18_stat5" data-datafield="MarketingDepartment.Contract" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td data-datafield="MarketingDepartment.Total">
                                    <label id="Control18_stat6" data-datafield="MarketingDepartment.Total" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td class="rowOption"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div id="div197845" class="col-md-2">
                    <label data-datafield="IntegratedOffice" data-type="SheetLabel" id="ctl572229" class="" style="">项目绩效评价表（综合办）</label></div>
                <div id="div719744" class="col-md-10">
                    <table id="ctl36048" data-datafield="IntegratedOffice" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0" data-displaysummary="false">
                        <tbody>
                            <tr class="header">
                                <td id="ctl36048_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl36048_header0" data-datafield="IntegratedOffice.ProjectName" style="">
                                    <label id="ctl36048_Label0" data-datafield="IntegratedOffice.ProjectName" data-type="SheetLabel" style="">项目名称</label></td>
                                <td id="ctl36048_header1" data-datafield="IntegratedOffice.TaskNum" style="">
                                    <label id="ctl36048_Label1" data-datafield="IntegratedOffice.TaskNum" data-type="SheetLabel" style="">任务编号</label></td>
                                <td id="ctl36048_header2" data-datafield="IntegratedOffice.Security" style="" class="">
                                    <label id="ctl36048_Label2" data-datafield="IntegratedOffice.Security" data-type="SheetLabel" style="" class="">安全管理（2.5）</label></td>
                                <td id="ctl36048_header3" data-datafield="IntegratedOffice.Material" style="" class="">
                                    <label id="ctl36048_Label3" data-datafield="IntegratedOffice.Material" data-type="SheetLabel" style="" class="">物资管理（5）</label></td>
                                <td id="ctl36048_header4" data-datafield="IntegratedOffice.Cost" style="" class="">
                                    <label id="ctl36048_Label4" data-datafield="IntegratedOffice.Cost" data-type="SheetLabel" style="" class="">成本管理（7.5）</label></td>
                                <td id="ctl36048_header5" data-datafield="IntegratedOffice.Total" style="">
                                    <label id="ctl36048_Label5" data-datafield="IntegratedOffice.Total" data-type="SheetLabel" style="">总分</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl36048_control0" data-datafield="IntegratedOffice.ProjectName" style="">
                                    <input type="text" data-datafield="IntegratedOffice.ProjectName" data-type="SheetTextBox" id="ctl36048_control0" style=""></td>
                                <td id="ctl36048_control1" data-datafield="IntegratedOffice.TaskNum" style="">
                                    <input type="text" data-datafield="IntegratedOffice.TaskNum" data-type="SheetTextBox" id="ctl36048_control1" style=""></td>
                                <td id="ctl36048_control2" data-datafield="IntegratedOffice.Security" style="">
                                    <input type="text" data-datafield="IntegratedOffice.Security" data-type="SheetTextBox" id="ctl36048_control2" style=""></td>
                                <td id="ctl36048_control3" data-datafield="IntegratedOffice.Material" style="" data-regularexpression="/^[1-5]{1}$/" data-regularinvalidtext="请输入分值1~5">
                                    <input type="text" data-datafield="IntegratedOffice.Material" data-type="SheetTextBox" id="ctl36048_control3" style="" class="" data-regularexpression="/^[1-5]{1}$/" data-regularinvalidtext="请输入分值1~5"></td>
                                <td id="ctl36048_control4" data-datafield="IntegratedOffice.Cost" style="">
                                    <input type="text" data-datafield="IntegratedOffice.Cost" data-type="SheetTextBox" id="ctl36048_control4" style=""></td>
                                <td id="ctl36048_control5" data-datafield="IntegratedOffice.Total" style="" data-computationrule="{IntegratedOffice.Security}+{IntegratedOffice.Material}+{IntegratedOffice.Cost}">
                                    <input type="text" data-datafield="IntegratedOffice.Total" data-type="SheetTextBox" id="ctl36048_control5" style="" class="" data-computationrule="{IntegratedOffice.Security}+{IntegratedOffice.Material}+{IntegratedOffice.Cost}"></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                            <tr class="footer">
                                <td></td>
                                <td id="ctl36048_Stat0" data-datafield="IntegratedOffice.ProjectName" style=""></td>
                                <td id="ctl36048_Stat1" data-datafield="IntegratedOffice.TaskNum" style=""></td>
                                <td id="ctl36048_Stat2" data-datafield="IntegratedOffice.Security" style="">
                                    <label id="ctl36048_StatControl2" data-datafield="IntegratedOffice.Security" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td id="ctl36048_Stat3" data-datafield="IntegratedOffice.Material" style="">
                                    <label id="ctl36048_StatControl3" data-datafield="IntegratedOffice.Material" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td id="ctl36048_Stat4" data-datafield="IntegratedOffice.Cost" style="">
                                    <label id="ctl36048_StatControl4" data-datafield="IntegratedOffice.Cost" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td id="ctl36048_Stat5" data-datafield="IntegratedOffice.Total" style="">
                                    <label id="ctl36048_StatControl5" data-datafield="IntegratedOffice.Total" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
