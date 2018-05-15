<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SNewNotice.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SNewNotice" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">公告显示</label>
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
				<label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style="">

				</label>
			</div>
			<div id="divOriginateDateTitle" class="col-md-2">
				<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
			</div>
			<div id="divOriginateDate" class="col-md-4">
				<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style="">

				</label>
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
					<label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style="">

					</label>
				</div>
			</div>
		</div>
		<div class="nav-icon fa  fa-chevron-right bannerTitle">
			<label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
		</div>
		<div class="divContent" id="divSheet">
			<div class="row">
				<div id="title1" class="col-md-2">
					<span id="Label11" data-type="SheetLabel" data-datafield="Title" style="">标题</span>
				</div>
				<div id="control1" class="col-md-4">
					<input id="Control11" type="text" data-datafield="Title" data-type="SheetTextBox" style="">
				</div>
				<div id="title2" class="col-md-2">
					<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">发布部门</span>
				</div>
				<div id="control2" class="col-md-4">
					<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="">
				</div>
			</div>
			<div class="row tableContent">
				<div id="title3" class="col-md-2">
					<span id="Label13" data-type="SheetLabel" data-datafield="Content" style="">正文</span>
				</div>
				<div id="control3" class="col-md-10">
					<textarea id="Control13" data-datafield="Content" data-richtextbox="true" data-type="SheetRichTextBox" style="">					</textarea>
				</div>
			</div>
			<div class="row">
				<div id="title5" class="col-md-2">
					<span id="Label14" data-type="SheetLabel" data-datafield="PublishTime" style="">发布日期</span>
				</div>
				<div id="control5" class="col-md-4">
					<input id="Control14" type="text" data-datafield="PublishTime" data-type="SheetTime" style="">
				</div>
				<div id="space6" class="col-md-2">
				</div>
				<div id="spaceControl6" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="title7" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="Attachment" style="">附件</span>
				</div>
				<div id="control7" class="col-md-10">
					<div id="Control15" data-datafield="Attachment" data-type="SheetAttachment" style="">
						
					</div>
				</div>
			</div><div class="row"><div id="div392992" class="col-md-2"><label data-datafield="Status" data-type="SheetLabel" id="ctl468464" class="" style="">公告状态</label></div><div id="div799520" class="col-md-4"><div data-datafield="Status" data-type="SheetRadioButtonList" id="ctl590052" class="" style="" data-defaultitems="上线;下架"></div></div><div id="div158765" class="col-md-2"></div><div id="div261982" class="col-md-4"></div></div>
			
		</div>
	</div>
</asp:Content>