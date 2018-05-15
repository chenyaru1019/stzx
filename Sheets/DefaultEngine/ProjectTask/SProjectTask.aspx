﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectTask.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SProjectTask" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">项目任务书</label>
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
					<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
				</div>
				<div id="title2" class="col-md-2">
					<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">所属部门</span>
				</div>
				<div id="control2" class="col-md-4">
					<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
				</div>
			</div>
			<div class="row">
				<div id="div996644" class="col-md-2">
					<span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称</span>
				</div>
				<div id="div857864" class="col-md-4">
					<input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="div143719" class="col-md-2">
				</div>
				<div id="div29195" class="col-md-4">
				</div>
			</div>
			<div class="row"><div id="div6898" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="ProjectType" class="" style="">项目类型</span></div><div id="div376503" class="col-md-4"><select data-datafield="ProjectType" data-type="SheetDropDownList" id="ctl67388" class="" style="" data-defaultitems="高新类;普通类;平台类" data-displayemptyitem="true" data-emptyitemtext="请选择" data-queryable="false"></select></div><div id="div348621" class="col-md-2"><span id="Label15" data-type="SheetLabel" data-datafield="ProjectNum" class="" style="">项目编号</span></div><div id="div96914" class="col-md-4"><input id="Control15" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" class="" style=""></div></div><div class="row"><div id="div245012" class="col-md-2"><label data-datafield="TaskType" data-type="SheetLabel" id="ctl214355" class="" style="">任务类型</label></div><div id="div487842" class="col-md-4"><select data-datafield="TaskType" data-type="SheetDropDownList" id="ctl931727" class="" style="" data-masterdatacategory="项目任务类型" data-displayemptyitem="true" data-emptyitemtext="请选择" data-queryable="false"></select></div><div id="div298204" class="col-md-2"><span id="Label16" data-type="SheetLabel" data-datafield="TaskNum" class="" style="">任务编号</span></div><div id="div889599" class="col-md-4"><input id="Control16" type="text" data-datafield="TaskNum" data-type="SheetTextBox" class="" style=""></div></div>
			<div class="row">
				<div id="div57264" class="col-md-2">
					<span id="Label17" data-type="SheetLabel" data-datafield="EntrustedUnit" class="" style="">委托单位</span>
				</div>
				<div id="div597234" class="col-md-2">
					
				<input type="text" data-datafield="EntrustedUnit" data-type="SheetTextBox" id="ctl503392" class="" style=""></div>
				<div id="div532909" class="col-md-2">
					<span id="Label18" data-type="SheetLabel" data-datafield="RDepartment" class="" style="">负责部门</span>
				</div>
				<div id="div633310" class="col-md-2">
					<input id="Control18" type="text" data-datafield="RDepartment" data-type="SheetTextBox" class="" style="">
				</div>
				<div id="div214050" class="col-md-2">
					<span id="Label20" data-type="SheetLabel" data-datafield="JDepartment" class="" style="">参加部门</span>
				</div>
				<div id="div622639" class="col-md-2">
					<input id="Control20" type="text" data-datafield="JDepartment" data-type="SheetTextBox" class="" style="">
				</div>
			</div>
			<div class="row tableContent">
				<div id="title11" class="col-md-2">
					<span id="Label21" data-type="SheetLabel" data-datafield="PRequirements" style="">项目要求</span>
				</div>
				<div id="control11" class="col-md-10">
					<textarea id="Control21" data-datafield="PRequirements" data-type="SheetRichTextBox" style="" class="">					</textarea>
				</div>
			</div><div class="row"><div id="div88363" class="col-md-2"><label data-datafield="ProjectMembers" data-type="SheetLabel" id="ctl919936" class="" style="">项目成员</label></div><div id="div962078" class="col-md-10"><table id="ctl923865" data-datafield="ProjectMembers" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0"><tbody><tr class="header"><td id="ctl923865_SerialNo" class="rowSerialNo">序号</td><td id="ctl923865_header0" data-datafield="ProjectMembers.FullName" style=""><label id="ctl923865_Label0" data-datafield="ProjectMembers.FullName" data-type="SheetLabel" style="">姓名</label></td><td id="ctl923865_header1" data-datafield="ProjectMembers.PersonRole" style=""><label id="ctl923865_Label1" data-datafield="ProjectMembers.PersonRole" data-type="SheetLabel" style="">角色</label></td><td id="ctl923865_header2" data-datafield="ProjectMembers.Department" style=""><label id="ctl923865_Label2" data-datafield="ProjectMembers.Department" data-type="SheetLabel" style="">所属部门</label></td><td id="ctl923865_header3" data-datafield="ProjectMembers.Profession" style=""><label id="ctl923865_Label3" data-datafield="ProjectMembers.Profession" data-type="SheetLabel" style="">专业</label></td><td id="ctl923865_header4" data-datafield="ProjectMembers.JobTitle" style=""><label id="ctl923865_Label4" data-datafield="ProjectMembers.JobTitle" data-type="SheetLabel" style="">职称</label></td><td id="ctl923865_header5" data-datafield="ProjectMembers.GNVQ" style=""><label id="ctl923865_Label5" data-datafield="ProjectMembers.GNVQ" data-type="SheetLabel" style="">职业资格</label></td><td id="ctl923865_header6" data-datafield="ProjectMembers.AppointmentDate" style=""><label id="ctl923865_Label6" data-datafield="ProjectMembers.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td><td id="ctl923865_header7" data-datafield="ProjectMembers.ResidentDate" style=""><label id="ctl923865_Label7" data-datafield="ProjectMembers.ResidentDate" data-type="SheetLabel" style="">常驻日期</label></td><td id="ctl923865_header8" data-datafield="ProjectMembers.UserId" class="" style=""><label id="ctl923865_Label8" data-datafield="ProjectMembers.UserId" data-type="SheetLabel" style="">UserId</label></td><td class="rowOption">删除</td></tr><tr class="template"><td class=""></td><td id="ctl923865_control0" data-datafield="ProjectMembers.FullName" style="" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="ProjectMembers.UserId:ObjectID,ProjectMembers.FullName:UserName,ProjectMembers.Department:Department,ProjectMembers.Profession:Profession,ProjectMembers.JobTitle:Appellation"><input type="text" data-datafield="ProjectMembers.FullName" data-type="SheetTextBox" id="ctl923865_control0" style="" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="ProjectMembers.UserId:ObjectID,ProjectMembers.FullName:UserName,ProjectMembers.Department:Department,ProjectMembers.Profession:Profession,ProjectMembers.JobTitle:Appellation"></td><td id="ctl923865_control1" data-datafield="ProjectMembers.PersonRole" style="width: 15%;" class=""><select data-datafield="ProjectMembers.PersonRole" data-type="SheetDropDownList" id="ctl480752" class="" style="" data-defaultitems="一般员工;项目经理" data-queryable="false"></select></td><td id="ctl923865_control2" data-datafield="ProjectMembers.Department" style="" class=""><input type="text" data-datafield="ProjectMembers.Department" data-type="SheetTextBox" id="ctl923865_control2" style="" class=""></td><td id="ctl923865_control3" data-datafield="ProjectMembers.Profession" style="" class=""><input type="text" data-datafield="ProjectMembers.Profession" data-type="SheetTextBox" id="ctl923865_control3" style="" class=""></td><td id="ctl923865_control4" data-datafield="ProjectMembers.JobTitle" style="" class=""><input type="text" data-datafield="ProjectMembers.JobTitle" data-type="SheetTextBox" id="ctl923865_control4" style="" class=""></td><td id="ctl923865_control5" data-datafield="ProjectMembers.GNVQ" style="" class=""><input type="text" data-datafield="ProjectMembers.GNVQ" data-type="SheetTextBox" id="ctl923865_control5" style="" class=""></td><td id="ctl923865_control6" data-datafield="ProjectMembers.AppointmentDate" style="" class=""><input type="text" data-datafield="ProjectMembers.AppointmentDate" data-type="SheetTime" id="ctl923865_control6" style="" class=""></td><td id="ctl923865_control7" data-datafield="ProjectMembers.ResidentDate" style="" class=""><input type="text" data-datafield="ProjectMembers.ResidentDate" data-type="SheetTime" id="ctl923865_control7" style="" class=""></td><td id="ctl923865_control8" data-datafield="ProjectMembers.UserId" style="" class=""><input type="text" data-datafield="ProjectMembers.UserId" data-type="SheetTextBox" id="ctl923865_control8" style="" class=""></td><td class="rowOption"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr></tbody></table></div></div>
			
			
			
			<div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
			    <label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
		    </div>
			
			
			<div class="row"><div id="div44722" class="col-md-2"><label data-datafield="Related_items" data-type="SheetLabel" id="ctl371197" class="" style="">关联项目</label></div><div id="div21724" class="col-md-4"><input type="text" data-datafield="Related_items" data-type="SheetTextBox" id="ctl684216" class="" style=""></div><div id="div96836" class="col-md-2"></div><div id="div302603" class="col-md-4"></div></div><div class="row"><div id="div411765" class="col-md-2"><label data-datafield="Workflow" data-type="SheetLabel" id="ctl10951" class="" style="">关联流程</label></div><div id="div801161" class="col-md-4"><input type="text" data-datafield="Workflow" data-type="SheetTextBox" id="ctl764157" class="" style=""></div><div id="div812195" class="col-md-2"></div><div id="div975973" class="col-md-4"></div></div><div class="row"><div id="div273688" class="col-md-2"><label data-datafield="Attachment" data-type="SheetLabel" id="ctl549798" class="" style="">附件</label></div><div id="div340133" class="col-md-10"><div data-datafield="Attachment" data-type="SheetAttachment" id="ctl943072" class="" style=""></div></div></div>
			
			<div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
			     <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
		    </div>
			
			<div class="row tableContent">
				<div id="title19" class="col-md-2">
					<span id="Label25" data-type="SheetLabel" data-datafield="DepartOption" style="">市场部主管意见</span>
				</div>
				<div id="control19" class="col-md-10">
					<div id="Control25" data-datafield="DepartOption" data-type="SheetComment" style="" class=""></div>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title21" class="col-md-2">
					<span id="Label26" data-type="SheetLabel" data-datafield="ManageOption" style="">总经理意见</span>
				</div>
				<div id="control21" class="col-md-10">
					<div id="Control26" data-datafield="ManageOption" data-type="SheetComment" style=""></div>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title23" class="col-md-2">
					<span id="Label27" data-type="SheetLabel" data-datafield="RelatedDepartments" style="">相关部门接受任务</span>
				</div>
				<div id="control23" class="col-md-10">
					<div id="Control27" data-datafield="RelatedDepartments" data-type="SheetComment" style=""></div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>