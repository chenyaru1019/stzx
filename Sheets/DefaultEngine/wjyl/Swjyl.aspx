<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Swjyl.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.Swjyl" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div class="DragContainer" style="text-align: center;">
	<label class="panel-title" id="lblTitle">文件预览</label>
</div>
<div class="panel-body sheetContainer">
	<div class="nav-icon fa fa-chevron-right bannerTitle">
		<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
	</div>
	<div class="divContent">
		<div class="row">
			<div class="col-md-2" id="divFullNameTitle">
				<label id="lblFullNameTitle" data-type="SheetLabel" data-en_us="Originator" data-bindtype="OnlyVisiable" data-datafield="Originator.UserName">发起人</label>
			</div>
			<div class="col-md-4" id="divFullName">
				<label id="lblFullName" data-type="SheetLabel" data-bindtype="OnlyData" data-datafield="Originator.UserName">

				</label>
			</div>
			<div class="col-md-2" id="divOriginateDateTitle">
				<label id="lblOriginateDateTitle" data-type="SheetLabel" data-en_us="Originate Date" data-bindtype="OnlyVisiable" data-datafield="OriginateTime">发起时间</label>
			</div>
			<div class="col-md-4" id="divOriginateDate">
				<label id="lblOriginateDate" data-type="SheetLabel" data-bindtype="OnlyData" data-datafield="OriginateTime">

				</label>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2" id="divOriginateOUNameTitle">
				<label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" data-datafield="Originator.OUName">所属组织</label>
			</div>
			<div class="col-md-4" id="divOriginateOUName">
				<!--					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">
<span class="OnlyDesigner">Originator.OUName</span>
					</label>-->
					<select id="ctlOriginaotrOUName" data-type="SheetOriginatorUnit" data-datafield="Originator.OUName">
					</select>
				</div>
				<div class="col-md-2" id="divSequenceNoTitle">
					<label id="lblSequenceNoTitle" data-type="SheetLabel" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" data-datafield="SequenceNo">流水号</label>
				</div>
				<div class="col-md-4" id="divSequenceNo">
					<label id="lblSequenceNo" data-type="SheetLabel" data-bindtype="OnlyData" data-datafield="SequenceNo">

					</label>
				</div>
			</div>
		</div>
		<div class="nav-icon fa  fa-chevron-right bannerTitle">
			<label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
		</div>
		<div class="divContent" id="divSheet">
			<div class="row">
				<div class="col-md-2" id="title1">
					<span id="Label11" data-type="SheetLabel" data-datafield="fwbh">发文编号</span>
				</div>
				<div class="col-md-4" id="control1">
					<input id="Control11" type="text" data-type="SheetTextBox" data-datafield="fwbh">
				</div>
				<div class="col-md-2" id="title2">
				</div>
				<div class="col-md-4" id="control2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="div83574">
					<span id="Label12" data-type="SheetLabel" data-datafield="fwrq">发文日期</span>
				</div>
				<div class="col-md-4" id="div553139">
					<input id="Control12" type="text" data-type="SheetTime" data-datafield="fwrq">
				</div>
				<div class="col-md-2" id="div55679">
				</div>
				<div class="col-md-4" id="div414106">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="title3">
					<span id="Label13" data-type="SheetLabel" data-datafield="fwbm">发文部门</span>
				</div>
				<div class="col-md-4" id="control3">
					<input id="Control13" type="text" data-type="SheetTextBox" data-datafield="fwbm">
				</div>
				<div class="col-md-2" id="title4">
				</div>
				<div class="col-md-4" id="control4">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="div653173">
					<span id="Label14" data-type="SheetLabel" data-datafield="wjm">文件名</span>
				</div>
				<div class="col-md-4" id="div39770">
					<input id="Control14" type="text" data-type="SheetTextBox" data-datafield="wjm">
				</div>
				<div class="col-md-2" id="div948383">
				</div>
				<div class="col-md-4" id="div950170">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" id="div52042">
					<div id="ctl792893" data-type="SheetOffice" data-datafield="wj">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>