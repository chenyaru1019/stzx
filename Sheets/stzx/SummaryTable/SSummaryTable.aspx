<%@ Page Language="C#" AutoEventWireup="true"
	CodeFile="SSummaryTable.aspx.cs"
	Inherits="OThinker.H3.Portal.Sheets.stzx.SSummaryTable"
	EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %> <%@
	OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
	<asp:Content ID="head" ContentPlaceHolderID="headContent"
		runat="Server">
		<script src="SSummaryTable.js"></script>
		<script type="text/javascript">
            $(function () {
                $('#divTopBars').css('display', 'none');
                $('#Control13_Label5').on('mouseenter', function (e) {
                    //显示提示
                    mTips.c.x = 5;
                    mTips.c.y = 5;
                    mTips.s('<p>1.项目团队及时编制项目大纲，并通过评审或审核<p>' +
                        '<p>2.按专业部门的规范要求认真执行项目，符合项目质量要求</p>' +
                        '<p>3.服务质量及提交成果满足合同要求或业主认可</p>' +
                        '<p>4.项目质量符合分管领导、负责部门、区域总经理认定的其他质量要求</p>', 'success');
                });

                $('#Control13_Label6').on('mouseenter', function (e) {
                    //显示提示
                    mTips.c.x = 5;
                    mTips.c.y = 5;
                    mTips.s('<p>1.及时制定项目实施计划、年度工作计划等<p>' +
                        '<p>2.按照进度计划及时提供咨询服务、按期提交服务成果</p>' +
                        '<p>3.按进度计划及时监控委外单位执行进度</p>' +
                        '<p>4.项目进度符合分管领导、负责部门、区域总经理认定的其他进度要求</p>', 'success');
                });

                $('#Control13_Label7').on('mouseenter', function (e) {
                    //显示提示
                    mTips.c.x = 5;
                    mTips.c.y = 5;
                    mTips.s('<p>1.遵守公司合同管理制度，确保项目合同信息安全，不发生合同泄密事件<p>' +
                        '<p>2.认真遵守公司合同管理规定，避免项目合同纠纷</p>' +
                        '<p>3.按照公司规定制定项目收款、成本资金付款计划</p>' +
                        '<p>4.及时办理项目成本资金支付事项</p>' +
                        '<p>5.及时向业主提交付款申请及相关材料</p>' +
                        '<p>6.确保合同进度款及时到账（不得超过3个月）</p>', 'success');
                });

                $('#Control13_Label8').on('mouseenter', function (e) {
                    //显示提示
                    mTips.c.x = 5;
                    mTips.c.y = 5;
                    mTips.s('<p>1.认真履行项目安全管理<p>' +
                        '<p>2.不得发生安全事故</p>', 'success');
                });

                $('#Control13_Label9').on('mouseenter', function (e) {
                    //显示提示
                    mTips.c.x = 5;
                    mTips.c.y = 5;
                    mTips.s('<p>1.认真履行项目信息资料管理，及时资料信息分类归纳<p>' +
                        '<p>2.及时提交项目报告<p>' +
                        '<p>3.按项目档案归档要求执行资料与项目进度同步整理归档<p>' +
                        '<p>4.按时提交项目收尾计划、撤销申请、项目总结</p>', 'success');
                });

                $('#Control13_Label10').on('mouseenter', function (e) {
                    //显示提示
                    mTips.c.x = 5;
                    mTips.c.y = 5;
                    mTips.s('<p>1.各类低值易耗品采购有计划、有审批，验收手续齐全<p>' +
                        '<p>2.低值易耗品发放、固定资产管理有完整的登记、领用、保管台帐<p>', 'success');
                });

                $('#Control13_Label11').on('mouseenter', function (e) {
                    //显示提示
                    mTips.c.x = 5;
                    mTips.c.y = 5;
                    mTips.s('<p>1.编制项目成本计划，计划执行不发生重大偏差<p>' +
                        '<p>2.业务招待、劳务费、专家咨询费等成本费用事先申报，按规定使用<p>' +
                        '<p>3.成本费用账目清晰、数据准确<p>' +
                        '<p>4.伙食费、津贴、考勤、休假等报表数据准确<p>' +
                        '<p>5.项目租赁事项按要求申报、执行<p>' +
                        '<p>6.遵守公司认定的其他成本考核事项<p>', 'success');
                });

                $('#Control13_Label5,#Control13_Label6,#Control13_Label7,#Control13_Label8,#Control13_Label9,#Control13_Label10,#Control13_Label11').on('mouseleave', function (e) {
                    mTips.h();
                    mTips.c.x = 0;
                    mTips.c.y = 0;
                });

            });

		</script>
	</asp:Content>
	<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
	</asp:Content>
	<asp:Content ID="master" ContentPlaceHolderID="masterContent"
		runat="Server">
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">项目绩效评价汇总表</label>
		</div>
		<div class="panel-body sheetContainer">
			<div class="nav-icon fa fa-chevron-right bannerTitle hidden">
				<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
			</div>
			<div class="divContent">
				<div class="row hidden">
					<div id="divFullNameTitle" class="col-md-2">
						<label id="lblFullNameTitle" data-type="SheetLabel"
							data-datafield="Originator.UserName" data-en_us="Originator"
							data-bindtype="OnlyVisiable" style="">发起人</label>
					</div>
					<div id="divFullName" class="col-md-4">
						<label id="lblFullName" data-type="SheetLabel"
							data-datafield="Originator.UserName" data-bindtype="OnlyData"
							style=""></label>
					</div>
					<div id="divOriginateDateTitle" class="col-md-2">
						<label id="lblOriginateDateTitle" data-type="SheetLabel"
							data-datafield="OriginateTime" data-en_us="Originate Date"
							data-bindtype="OnlyVisiable" style="">发起时间</label>
					</div>
					<div id="divOriginateDate" class="col-md-4">
						<label id="lblOriginateDate" data-type="SheetLabel"
							data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>
					</div>
				</div>
				<div class="row hidden">
					<div id="divOriginateOUNameTitle" class="col-md-2">
						<label id="lblOriginateOUNameTitle" data-type="SheetLabel"
							data-datafield="Originator.OUName" data-en_us="Originate OUName"
							data-bindtype="OnlyVisiable" style="">所属组织</label>
					</div>
					<div id="divOriginateOUName" class="col-md-4">
						<!--					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">
<span class="OnlyDesigner">Originator.OUName</span>
					</label>-->
						<select data-datafield="Originator.OUName"
							data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class=""
							style="">
						</select>
					</div>
					<div id="divSequenceNoTitle" class="col-md-2">
						<label id="lblSequenceNoTitle" data-type="SheetLabel"
							data-datafield="SequenceNo" data-en_us="SequenceNo"
							data-bindtype="OnlyVisiable" style="">流水号</label>
					</div>
					<div id="divSequenceNo" class="col-md-4">
						<label id="lblSequenceNo" data-type="SheetLabel"
							data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>
					</div>
				</div>
			</div>
			<div class="nav-icon fa  fa-chevron-right bannerTitle hidden">
				<label id="divSheetInfo" data-en_us="Sheet information" class="">表单信息</label>
			</div>
			<div class="divContent" id="divSheet">
				<div class="row" style='border-top: 1px solid #E3E3E3'>
					<div id="div391702" class="col-md-2">
						<span id="Label11" data-type="SheetLabel"
							data-datafield="ParticularYear" style="" class="">考核年份</span>
					</div>
					<div id="div350032" class="col-md-3">
						<input id="Control11" type="text" data-datafield="ParticularYear"
							data-type="SheetTextBox" style="" class="">
					</div>
					<div id="div867458" class="col-md-2">
						<span id="Label12" data-type="SheetLabel"
							data-datafield="Quarterly" style="" class="">考核季度</span>
					</div>
					<div id="div55868" class="col-md-3">
						<select data-datafield="Quarterly" data-type="SheetDropDownList"
							id="ctl769476" class="" style=""
							data-defaultitems="第一季度;第二季度;第三季度;第四季度"
							data-displayemptyitem="true"></select>
					</div>
					<div id="div455293" class="col-md-2">
					   <input type="button" value="查询"  onclick="querySummary()" style='line-height: 25px;padding: 0px 10px;'/>
					
					</div>
				</div>
				<div class="row">
					<div id="div816195" class="col-md-12">
						<table id="Control13" data-datafield="Summary_Table"
							data-type="SheetGridView" class="SheetGridView"
							data-displayadd="false" data-displaysummary="false"
							data-displaydelete="false" data-displayexport="true">
							<tbody>

								<tr class="header">
									<td id="Control13_SerialNo" class="rowSerialNo">序号</td>
									<td id="Control13_Header3"
										data-datafield="Summary_Table.ProjectName"><label
										id="Control13_Label3"
										data-datafield="Summary_Table.ProjectName"
										data-type="SheetLabel" style="">项目名称</label></td>
									<td id="Control13_Header4"
										data-datafield="Summary_Table.TaskNum"><label
										id="Control13_Label4" data-datafield="Summary_Table.TaskNum"
										data-type="SheetLabel" style="">任务编号</label></td>
									<td id="Control13_Header5"
										data-datafield="Summary_Table.Quality"><label
										id="Control13_Label5" data-datafield="Summary_Table.Quality"
										data-type="SheetLabel" style="">质量管理（20）</label></td>
									<td id="Control13_Header6"
										data-datafield="Summary_Table.Schedule"><label
										id="Control13_Label6" data-datafield="Summary_Table.Schedule"
										data-type="SheetLabel" style="" class="">进度管理（15）</label></td>
									<td id="Control13_Header7"
										data-datafield="Summary_Table.Contract"><label
										id="Control13_Label7" data-datafield="Summary_Table.Contract"
										data-type="SheetLabel" style="" class="">合同管理（15）</label></td>
									<td id="Control13_Header8"
										data-datafield="Summary_Table.Security"><label
										id="Control13_Label8" data-datafield="Summary_Table.Security"
										data-type="SheetLabel" style="" class="">安全管理（5）</label></td>
									<td id="Control13_Header9" data-datafield="Summary_Table.Datum">
										<label id="Control13_Label9"
										data-datafield="Summary_Table.Datum" data-type="SheetLabel"
										style="" class="">资料管理（15）</label>
									</td>
									<td id="Control13_Header10"
										data-datafield="Summary_Table.Material"><label
										id="Control13_Label10" data-datafield="Summary_Table.Material"
										data-type="SheetLabel" style="" class="">物资管理（5）</label></td>
									<td id="Control13_Header11" data-datafield="Summary_Table.Cost"
										class=""><label id="Control13_Label11"
										data-datafield="Summary_Table.Cost" data-type="SheetLabel"
										style="" class="">成本管理（15）</label></td>
									<td id="Control13_Header12"
										data-datafield="Summary_Table.Total" class=""><label
										id="Control13_Label12" data-datafield="Summary_Table.Total"
										data-type="SheetLabel" style="">总分</label></td>
									<td id="Control13_Header13"
										data-datafield="Summary_Table.Percentage" class=""><label
										id="Control13_Label13"
										data-datafield="Summary_Table.Percentage"
										data-type="SheetLabel" style="">百分制换算</label></td>
									<td class="rowOption">删除</td>
								</tr>
								<tr class="template">
									<td id="Control13_Option" class="rowOption"></td>
									<td data-datafield="Summary_Table.ProjectName"><input
										id="Control13_ctl3" type="text"
										data-datafield="Summary_Table.ProjectName"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.TaskNum"><input
										id="Control13_ctl4" type="text"
										data-datafield="Summary_Table.TaskNum"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.Quality" class=""
										style="width: 7%;"><input id="Control13_ctl5" type="text"
										data-datafield="Summary_Table.Quality"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.Schedule" class=""
										style="width: 7%;"><input id="Control13_ctl6" type="text"
										data-datafield="Summary_Table.Schedule"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.Contract" class=""
										style="width: 7%;"><input id="Control13_ctl7" type="text"
										data-datafield="Summary_Table.Contract"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.Security" class=""
										style="width: 7%;"><input id="Control13_ctl8" type="text"
										data-datafield="Summary_Table.Security"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.Datum" class=""
										style="width: 7%;"><input id="Control13_ctl9" type="text"
										data-datafield="Summary_Table.Datum" data-type="SheetTextBox"
										style="" class=""></td>
									<td data-datafield="Summary_Table.Material" class=""
										style="width: 7%;"><input id="Control13_ctl10"
										type="text" data-datafield="Summary_Table.Material"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.Cost" class=""
										style="width: 7%;"><input id="Control13_ctl11"
										type="text" data-datafield="Summary_Table.Cost"
										data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="Summary_Table.Total" class=""
										style="width: 7%;"><input id="Control13_ctl12"
										type="text" data-datafield="Summary_Table.Total"
										data-type="SheetTextBox" style="" class=""
										data-computationrule="2,{Summary_Table.Quality}+{Summary_Table.Schedule}+{Summary_Table.Contract}+{Summary_Table.Security}+{Summary_Table.Datum}+{Summary_Table.Material}+{Summary_Table.Cost}">
									</td>
									<td data-datafield="Summary_Table.Percentage" class=""
										style="width: 7%;"><input id="Control13_ctl13"
										type="text" data-datafield="Summary_Table.Percentage"
										data-type="SheetTextBox" style="" class=""
										data-computationrule="2,{Summary_Table.Total}/4.5"></td>
									<td class="rowOption hidden"><a class="delete">
											<div class="fa fa-minus"></div>
									</a> <a class="insert">
											<div class="fa fa-arrow-down"></div>
									</a></td>
								</tr>
								<tr class="footer">
									<td class="rowOption"></td>
									<td data-datafield="Summary_Table.ProjectName"></td>
									<td data-datafield="Summary_Table.TaskNum"></td>
									<td data-datafield="Summary_Table.Quality" class=""
										style="width: 7%;"><label id="Control13_stat5"
										data-datafield="Summary_Table.Quality"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Schedule"><label
										id="Control13_stat6" data-datafield="Summary_Table.Schedule"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Contract"><label
										id="Control13_stat7" data-datafield="Summary_Table.Contract"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Security"><label
										id="Control13_stat8" data-datafield="Summary_Table.Security"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Datum"><label
										id="Control13_stat9" data-datafield="Summary_Table.Datum"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Material"><label
										id="Control13_stat10" data-datafield="Summary_Table.Material"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Cost"><label
										id="Control13_stat11" data-datafield="Summary_Table.Cost"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Total" class=""><label
										id="Control13_stat12" data-datafield="Summary_Table.Total"
										data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="Summary_Table.Percentage"><label
										id="Control13_stat13"
										data-datafield="Summary_Table.Percentage"
										data-type="SheetCountLabel" style=""></label></td>
									<td class="rowOption"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</asp:Content>