<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectConclusion.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SProjectConclusion" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">项目收尾工作计划</label>
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
						<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="">
					</div>
					<div id="title2" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">所属部门</span>
					</div>
					<div id="control2" class="col-md-4">
						<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="">
					</div>
				</div><div class="row"><div id="div472029" class="col-md-2"><label data-datafield="Title" data-type="SheetLabel" id="ctl507386" class="" style="">标题</label></div><div id="div137329" class="col-md-8"><input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl403713" class="" style=""></div><div id="div976205" class="col-md-2"></div></div>
				
				<div class="row">
					<div id="div507527" class="col-md-2">
						<span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号</span>
					</div>
					<div id="div107440" class="col-md-4">
						<input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum,ProjectName:ProjectName">
					</div>
					<div id="div691020" class="col-md-2">
						
					</div>
					<div id="div393327" class="col-md-4">
						
					</div>
				</div><div class="row"><div id="div507493" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称</span></div><div id="div634323" class="col-md-8"><input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="" data-onchange=" setProjectDepart();"></div><div id="div435494" class="col-md-2"></div></div>
				
				<div class="row tableContent">
					<div id="title5" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="WorkPlan" style="">工作计划</span>
					</div>
					<div id="control5" class="col-md-10">
						<table id="Control15" data-datafield="WorkPlan" data-type="SheetGridView" class="SheetGridView">
							<tbody>
								<tr class="header">
									<td id="Control15_SerialNo" class="rowSerialNo">序号</td>
									<td id="Control15_Header3" data-datafield="WorkPlan.WorkName">
										<label id="Control15_Label3" data-datafield="WorkPlan.WorkName" data-type="SheetLabel" style="" class="">收尾工作</label>
									</td>
									<td id="Control15_Header4" data-datafield="WorkPlan.Head">
										<label id="Control15_Label4" data-datafield="WorkPlan.Head" data-type="SheetLabel" style="">责任人或部门</label>
									</td>
									<td id="Control15_Header5" data-datafield="WorkPlan.DueDate">
										<label id="Control15_Label5" data-datafield="WorkPlan.DueDate" data-type="SheetLabel" style="">完成期限</label>
									</td>
									<td class="rowOption">删除</td>
								</tr>
								<tr class="template">
									<td id="Control15_Option" class="rowOption"></td>
									<td data-datafield="WorkPlan.WorkName" class=""><input id="Control15_ctl3" type="text" data-datafield="WorkPlan.WorkName" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="WorkPlan.Head" class="" style="width: 15%;">
										<input id="Control15_ctl4" type="text" data-datafield="WorkPlan.Head" data-type="SheetTextBox" style="" class="" data-placeholder="请填写">
									</td>
									<td data-datafield="WorkPlan.DueDate" class="" style="width: 15%;"><input id="Control15_ctl5" type="text" data-datafield="WorkPlan.DueDate" data-type="SheetTime" class="" style=""></td>
									<td class="rowOption"><a class="delete">
											<div class="fa fa-minus"></div>
									</a> <a class="insert">
											<div class="fa fa-arrow-down"></div>
									</a></td>
								</tr>
								<tr class="footer">
									<td class="rowOption"></td>
									<td data-datafield="WorkPlan.WorkName" class=""></td>
									<td data-datafield="WorkPlan.Head"></td>
									<td data-datafield="WorkPlan.DueDate"></td>
									<td class="rowOption"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><div class="row hidden"><div id="div308516" class="col-md-2"><label data-datafield="ProjectId" data-type="SheetLabel" id="ctl244156" class="" style="">项目id</label></div><div id="div923272" class="col-md-2"><input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl869545" class="" style=""></div><div id="div674166" class="col-md-2"><label data-datafield="ywbmzg" data-type="SheetLabel" id="ctl436630" class="" style="">业务部门主管</label></div><div id="div991131" class="col-md-2"><div data-datafield="ywbmzg" data-type="SheetUser" id="ctl331467" class="" style=""></div></div><div id="div855535" class="col-md-2"><label data-datafield="fgld" data-type="SheetLabel" id="ctl116435" class="" style="">分管领导</label></div><div id="div486159" class="col-md-2"><div data-datafield="fgld" data-type="SheetUser" id="ctl153402" class="" style=""></div></div></div>
				
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
			     <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
		       </div>
				
				
				
				<div class="row">
					<div id="div864213" class="col-md-2">
						<label data-datafield="ywbmzgyj" data-type="SheetLabel" id="ctl167350" class="" style="">业务部门主管</label>
					</div>
					<div id="div936087" class="col-md-10">
						<div data-datafield="ywbmzgyj" data-type="SheetComment" id="ctl362761" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div391616" class="col-md-2">
						<label data-datafield="ProjectManagement" data-type="SheetLabel" id="ctl181068" class="" style="">项目管理部门意见</label>
					</div>
					<div id="div583110" class="col-md-10">
						<div data-datafield="ProjectManagement" data-type="SheetComment" id="ctl92846" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div860984" class="col-md-2">
						<label data-datafield="MDepartment" data-type="SheetLabel" id="ctl440396" class="" style="">市场经营部意见</label>
					</div>
					<div id="div170439" class="col-md-10">
						<div data-datafield="MDepartment" data-type="SheetComment" id="ctl386125" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div21336" class="col-md-2">
						<label data-datafield="IntegratedOffice" data-type="SheetLabel" id="ctl818684" class="" style="">综合办公室意见</label>
					</div>
					<div id="div742728" class="col-md-10">
						<div data-datafield="IntegratedOffice" data-type="SheetComment" id="ctl243149" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div613739" class="col-md-2">
						<label data-datafield="LeadersInCharge" data-type="SheetLabel" id="ctl270243" class="" style="">分管领导意见</label>
					</div>
					<div id="div614645" class="col-md-10">
						<div data-datafield="LeadersInCharge" data-type="SheetComment" id="ctl514758" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div295758" class="col-md-2">
						<label data-datafield="ManageOption" data-type="SheetLabel" id="ctl840722" class="" style="">总经理意见</label>
					</div>
					<div id="div413159" class="col-md-10">
						<div data-datafield="ManageOption" data-type="SheetComment" id="ctl637871" class="" style=""></div>
					</div>
				</div>
			</div>
		</div>
	</asp:Content>