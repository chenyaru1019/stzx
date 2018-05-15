﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectHouseRental.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SProjectHouseRental" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">项目租房申请</label>
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
					<span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">申请人</span>
				</div>
				<div id="control1" class="col-md-4">
					<input id="Control11" readonly="true" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
				</div>
				<div id="title2" class="col-md-2">
					<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">所属部门</span>
				</div>
				<div id="control2" class="col-md-4">
					<input id="Control12" readonly="true" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
				</div>
			</div>
			<div class="row">
				<div id="title3" class="col-md-2">
					<span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="">项目名称</span>
				</div>
				<div id="control3" class="col-md-4">
					<input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectTask" data-querycode="TaskList" data-outputmappings="ProjectId:ObjectID,ProjectName:ProjectName,ProjectNum:ProjectNum">
				</div>
				<div id="title4" class="col-md-2">
					<span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="">项目编号</span>
				</div>
				<div id="control4" class="col-md-4">
					<input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-onchange="	var projectId = $.MvcSheetUI.GetControlValue(&quot;ProjectId&quot;);
	var dtl = $.MvcSheetUI.GetElement(&quot;ProjectHouseInfo&quot;).SheetGridView();
	dtl._Clear();
	$.MvcSheet.Action({
		Action : &quot;GetHouseRental&quot;, // 后台方法名称
		Datas : [ projectId ], // 输入参数，格式 [&quot;{数据项名称}&quot;,&quot;String值&quot;,&quot;控件ID&quot;]，当包含数据项名称时 LoadControlValue必须为true
		LoadControlValue : true, // 是否获取表单数据
		PostSheetInfo : false, // 是否获取已经改变的表单数据
		OnActionDone : function(e) {
			if (e != null) {
				var result = e[0].Table;
				var dtl = $.MvcSheetUI.GetElement(&quot;ProjectHouseInfo&quot;)
						.SheetGridView();
				for (var i = 0; i < result.length; i++) {
					dtl._AddRow();
				}
				$.each(result, function(index, term) {
					//遍历，给子表赋值
					$.MvcSheetUI.SetControlValue(&quot;ProjectHouseInfo.Place&quot;,
							term.Place, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;ProjectHouseInfo.Personnel&quot;,
							term.Accommodation, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;ProjectHouseInfo.Type&quot;,
							term.Type, index + 1);

				})

			}
		}
	})">
				</div>
			</div>
			<div class="row tableContent">
				<div id="title5" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="ProjectHouseInfo" style="">享有租房信息</span>
				</div>
				<div id="control5" class="col-md-10">
					<table id="Control15" data-datafield="ProjectHouseInfo" data-type="SheetGridView" class="SheetGridView" data-displayadd="false">
						<tbody>
							
							<tr class="header">
								<td id="Control15_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control15_Header3" data-datafield="ProjectHouseInfo.Place">
									<label id="Control15_Label3" data-datafield="ProjectHouseInfo.Place" data-type="SheetLabel" style="">租房处所</label>
								</td>
								<td id="Control15_Header4" data-datafield="ProjectHouseInfo.Personnel">
									<label id="Control15_Label4" data-datafield="ProjectHouseInfo.Personnel" data-type="SheetLabel" style="">住宿人员</label>
								</td>
								<td id="Control15_Header5" data-datafield="ProjectHouseInfo.Type" class="">
									<label id="Control15_Label5" data-datafield="ProjectHouseInfo.Type" data-type="SheetLabel" style="">户型</label>
								</td>
								<td class="rowOption hidden">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control15_Option" class="rowOption">
								</td>
								<td data-datafield="ProjectHouseInfo.Place">
									<input id="Control15_ctl3" type="text" data-datafield="ProjectHouseInfo.Place" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="ProjectHouseInfo.Personnel">
									<input id="Control15_ctl4" type="text" data-datafield="ProjectHouseInfo.Personnel" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="ProjectHouseInfo.Type">
									<input id="Control15_ctl5" type="text" data-datafield="ProjectHouseInfo.Type" data-type="SheetTextBox" style="" class="">
								</td>
								<td class="rowOption hidden">
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
								<td class="rowOption">
								</td>
								<td data-datafield="ProjectHouseInfo.Place">
								</td>
								<td data-datafield="ProjectHouseInfo.Personnel">
								</td>
								<td data-datafield="ProjectHouseInfo.Type">
								</td>
								<td class="rowOption hidden">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title7" class="col-md-2">
					<span id="Label16" data-type="SheetLabel" data-datafield="ApplyerHouseInfo" style="">本次申请租房信息</span>
				</div>
				<div id="control7" class="col-md-10">
					<table id="Control16" data-datafield="ApplyerHouseInfo" data-type="SheetGridView" class="SheetGridView">
						<tbody>
							
							<tr class="header">
								<td id="Control16_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control16_Header3" data-datafield="ApplyerHouseInfo.Place">
									<label id="Control16_Label3" data-datafield="ApplyerHouseInfo.Place" data-type="SheetLabel" style="">租房处所</label>
								</td>
								<td id="Control16_Header4" data-datafield="ApplyerHouseInfo.Type">
									<label id="Control16_Label4" data-datafield="ApplyerHouseInfo.Type" data-type="SheetLabel" style="">户型</label>
								</td>
								<td id="Control16_Header5" data-datafield="ApplyerHouseInfo.LeaseTerm">
									<label id="Control16_Label5" data-datafield="ApplyerHouseInfo.LeaseTerm" data-type="SheetLabel" style="">租期</label>
								</td>
								<td id="Control16_Header6" data-datafield="ApplyerHouseInfo.Area">
									<label id="Control16_Label6" data-datafield="ApplyerHouseInfo.Area" data-type="SheetLabel" style="">面积</label>
								</td>
								<td id="Control16_Header7" data-datafield="ApplyerHouseInfo.Rent">
									<label id="Control16_Label7" data-datafield="ApplyerHouseInfo.Rent" data-type="SheetLabel" style="">月租金 （元）</label>
								</td>
								<td id="Control16_Header8" data-datafield="ApplyerHouseInfo.PaymentCycle">
									<label id="Control16_Label8" data-datafield="ApplyerHouseInfo.PaymentCycle" data-type="SheetLabel" style="">租金支付周期</label>
								</td>
								<td id="Control16_Header9" data-datafield="ApplyerHouseInfo.IntermediateFee">
									<label id="Control16_Label9" data-datafield="ApplyerHouseInfo.IntermediateFee" data-type="SheetLabel" style="">中介费 （元）</label>
								</td>
								<td id="Control16_Header10" data-datafield="ApplyerHouseInfo.ZBear">
									<label id="Control16_Label10" data-datafield="ApplyerHouseInfo.ZBear" data-type="SheetLabel" style="">中介费是否由我方承担</label>
								</td>
								<td id="Control16_Header11" data-datafield="ApplyerHouseInfo.SBear">
									<label id="Control16_Label11" data-datafield="ApplyerHouseInfo.SBear" data-type="SheetLabel" style="">房租税费是否由我方承担</label>
								</td>
								<td id="Control16_Header12" data-datafield="ApplyerHouseInfo.Accommodation">
									<label id="Control16_Label12" data-datafield="ApplyerHouseInfo.Accommodation" data-type="SheetLabel" style="">拟安排住宿人员</label>
								</td>
								<td class="rowOption">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control16_Option" class="rowOption">
								</td>
								<td data-datafield="ApplyerHouseInfo.Place">
									<input id="Control16_ctl3" type="text" data-datafield="ApplyerHouseInfo.Place" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="ApplyerHouseInfo.Type">
									<input id="Control16_ctl4" type="text" data-datafield="ApplyerHouseInfo.Type" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="ApplyerHouseInfo.LeaseTerm">
									<input id="Control16_ctl5" type="text" data-datafield="ApplyerHouseInfo.LeaseTerm" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ApplyerHouseInfo.Area">
									<input id="Control16_ctl6" type="text" data-datafield="ApplyerHouseInfo.Area" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ApplyerHouseInfo.Rent">
									<input id="Control16_ctl7" type="text" data-datafield="ApplyerHouseInfo.Rent" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ApplyerHouseInfo.PaymentCycle">
									<input id="Control16_ctl8" type="text" data-datafield="ApplyerHouseInfo.PaymentCycle" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ApplyerHouseInfo.IntermediateFee">
									<input id="Control16_ctl9" type="text" data-datafield="ApplyerHouseInfo.IntermediateFee" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ApplyerHouseInfo.ZBear">
									<input id="Control16_ctl10" type="text" data-datafield="ApplyerHouseInfo.ZBear" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ApplyerHouseInfo.SBear">
									<input id="Control16_ctl11" type="text" data-datafield="ApplyerHouseInfo.SBear" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ApplyerHouseInfo.Accommodation">
									<input id="Control16_ctl12" type="text" data-datafield="ApplyerHouseInfo.Accommodation" data-type="SheetTextBox" style="" class="">
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
								<td class="rowOption">
								</td>
								<td data-datafield="ApplyerHouseInfo.Place">
								</td>
								<td data-datafield="ApplyerHouseInfo.Type">
								</td>
								<td data-datafield="ApplyerHouseInfo.LeaseTerm">
								</td>
								<td data-datafield="ApplyerHouseInfo.Area">
									<label id="Control16_stat6" data-datafield="ApplyerHouseInfo.Area" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="ApplyerHouseInfo.Rent">
									<label id="Control16_stat7" data-datafield="ApplyerHouseInfo.Rent" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="ApplyerHouseInfo.PaymentCycle">
								</td>
								<td data-datafield="ApplyerHouseInfo.IntermediateFee">
									<label id="Control16_stat9" data-datafield="ApplyerHouseInfo.IntermediateFee" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="ApplyerHouseInfo.ZBear">
								</td>
								<td data-datafield="ApplyerHouseInfo.SBear">
								</td>
								<td data-datafield="ApplyerHouseInfo.Accommodation">
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 5px -26px;">
					<label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
			</div>
			
			<div class="row"><div id="div314269" class="col-md-2"><label data-datafield="Related_items" data-type="SheetLabel" id="ctl95154" class="" style="">关联项目</label></div><div id="div45584" class="col-md-4"><input type="text" data-datafield="Related_items" data-type="SheetTextBox" id="ctl533586" class="" style=""></div><div id="div333506" class="col-md-2"></div><div id="div202702" class="col-md-4"></div></div><div class="row"><div id="div884792" class="col-md-2"><label data-datafield="Workflow" data-type="SheetLabel" id="ctl603705" class="" style="">关联流程</label></div><div id="div591421" class="col-md-4"><input type="text" data-datafield="Workflow" data-type="SheetTextBox" id="ctl604824" class="" style=""></div><div id="div123730" class="col-md-2"></div><div id="div402484" class="col-md-4"></div></div><div class="row"><div id="div14848" class="col-md-2"><label data-datafield="Attachment" data-type="SheetLabel" id="ctl981625" class="" style="">附件</label></div><div id="div350518" class="col-md-10"><div data-datafield="Attachment" data-type="SheetAttachment" id="ctl379053" class="" style=""></div></div></div>
			
			
			<div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
			     <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
		    </div>
			
			
			<div class="row tableContent">
				<div id="title11" class="col-md-2">
					<span id="Label18" data-type="SheetLabel" data-datafield="ProjectManagement" style="">项目管理部意见</span>
				</div>
				<div id="control11" class="col-md-10">
					<div id="Control18" data-datafield="ProjectManagement" data-type="SheetComment" style=""></div>
				</div>
			</div><div class="row"><div id="div591486" class="col-md-2"><label data-datafield="BusinessDepart" data-type="SheetLabel" id="ctl857213" class="" style="">业务部门主管意见</label></div><div id="div512444" class="col-md-10"><div data-datafield="BusinessDepart" data-type="SheetComment" id="ctl989605" class="" style=""></div></div></div><div class="row"><div id="div241837" class="col-md-2"><label data-datafield="MarketingDepart" data-type="SheetLabel" id="ctl418563" class="" style="">市场部主管意见</label></div><div id="div967024" class="col-md-10"><div data-datafield="MarketingDepart" data-type="SheetComment" id="ctl636620" class="" style=""></div></div></div><div class="row"><div id="div350999" class="col-md-2"><label data-datafield="IntegratedOffice" data-type="SheetLabel" id="ctl592094" class="" style="">综合办主管意见</label></div><div id="div772445" class="col-md-10"><div data-datafield="IntegratedOffice" data-type="SheetComment" id="ctl382078" class="" style=""></div></div></div>
			
			<div class="row tableContent">
				<div id="title15" class="col-md-2">
					<span id="Label20" data-type="SheetLabel" data-datafield="ManagerOption" style="">公司总经理意见</span>
				</div>
				<div id="control15" class="col-md-10">
					<div id="Control20" data-datafield="ManagerOption" data-type="SheetComment" style=""></div>
				</div>
			</div><div class="row hidden"><div id="div472643" class="col-md-2"><label data-datafield="ProjectId" data-type="SheetLabel" id="ctl301509" class="" style="">ProjectId</label></div><div id="div75749" class="col-md-4"><input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl280603" class="" style=""></div><div id="div298467" class="col-md-2"></div><div id="div702306" class="col-md-4"></div></div>
		</div>
	</div>
</asp:Content>