<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSubsidyEnabled.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SSubsidyEnabled" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<style>
#AccountMsg .col-md-10 {
padding: 0px;
}
#AccountMsg .col-md-10 .col-md-12 {
padding: 0px;
border-bottom: 1px solid #E3E3E3;
}
</style>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">项目部伙食费补贴账户启用申请表</label>
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
			</div><div class="row"><div id="div182789" class="col-md-2"><label data-datafield="Title" data-type="SheetLabel" id="ctl873762" class="" style="">标题</label></div><div id="div654382" class="col-md-10"><input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl413233" class="" style=""></div></div>
			<div class="row"><div id="div369984" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号</span></div><div id="div389547" class="col-md-4"><input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectNum:ProjectNum,ProjectName:ProjectName"></div><div id="div123074" class="col-md-2" style='border-left:1px solid #E3E3E3'><span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称</span></div><div id="div473519" class="col-md-4"><input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class=""></div></div>
			<div class="row">
				<div id="title5" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="Administrator" style="">伙食费补贴管理人</span>
				</div>
				<div id="control5" class="col-md-4">
					<div id="Control15" data-datafield="Administrator" data-type="SheetUser" style=""></div>
				</div>
			</div>
			<div class="row" id='AccountMsg'>
			    <div class="col-md-2" style='font-size: 12px;'>伙食费补贴银行卡专户信息</div>
			    <div class="col-md-10">
			        <div class="col-md-12">
			            <div id="title6" class="col-md-2" style='border-left: 0px'>
                            <span id="Label16" data-type="SheetLabel" data-datafield="AccountName" style="">户名</span>
                        </div>
                        <div id="control6" class="col-md-4">
                            <input id="Control16" type="text" data-datafield="AccountName" data-type="SheetTextBox" style="">
                        </div>
                        <div id="title8" class="col-md-2">
                            <span id="Label18" data-type="SheetLabel" data-datafield="OpenBank" style="">开户银行</span>
                        </div>
                        <div id="control8" class="col-md-4">
                            <input id="Control18" type="text" data-datafield="OpenBank" data-type="SheetTextBox" style="">
                        </div>
                    </div>
			        <div class="col-md-12" style='border-bottom: 0;'>
				        <div id="title7" class="col-md-2">
				        	<span id="Label17" data-type="SheetLabel" data-datafield="AccountNumber" style="">账号</span>
				        </div>
				        <div id="control7" class="col-md-4">
				        	<input id="Control17" type="text" data-datafield="AccountNumber" data-type="SheetTextBox" style="">
				        </div>
						<div id="title9" class="col-md-2" style='border-left: 1px solid #E3E3E3;'>
        					<span id="Label19" data-type="SheetLabel" data-datafield="EnableDate" style="">账户启用日期</span>
        				</div>
        				<div id="control9" class="col-md-4">
        					<input id="Control19" type="text" data-datafield="EnableDate" data-type="SheetTime" style="">
        				</div>
                    </div>
                </div>
			</div>
			<!--<div class="row">-->

				<!--<div id="space10" class="col-md-2">-->
				<!--</div>-->
				<!--<div id="spaceControl10" class="col-md-4">-->
				<!--</div>-->
			<!--</div>-->
			<div class="row tableContent">
				<div id="title11" class="col-md-2">
					<span id="Label20" data-type="SheetLabel" data-datafield="Description" style="">说明</span>
				</div>
				<div id="control11" class="col-md-10">
					<textarea id="Control20" data-datafield="Description" data-type="SheetRichTextBox" style="">					</textarea>
				</div>
			</div>
			
			<div class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
			</div>
			
			<div class="row"><div id="div392384" class="col-md-2"><label data-datafield="Related_items" data-type="SheetLabel" id="ctl40011" class="" style="">关联项目</label></div><div id="div659963" class="col-md-4"><input type="text" data-datafield="Related_items" data-type="SheetTextBox" id="ctl654862" class="" style=""></div><div id="div103721" class="col-md-2"></div><div id="div265198" class="col-md-4"></div></div><div class="row"><div id="div592073" class="col-md-2"><label data-datafield="Workflow" data-type="SheetLabel" id="ctl895225" class="" style="">关联流程</label></div><div id="div720797" class="col-md-4"><input type="text" data-datafield="Workflow" data-type="SheetTextBox" id="ctl111364" class="" style=""></div><div id="div724348" class="col-md-2"></div><div id="div688043" class="col-md-4"></div></div><div class="row"><div id="div74441" class="col-md-2"><label data-datafield="Attachment" data-type="SheetLabel" id="ctl613388" class="" style="">附件</label></div><div id="div247370" class="col-md-10"><div data-datafield="Attachment" data-type="SheetAttachment" id="ctl880252" class="" style=""></div></div></div>
			
			
			<div class="nav-icon fa  fa-chevron-right bannerTitle">
				<label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
			</div>
			
			
			<div class="row tableContent">
				<div id="title13" class="col-md-2">
					<span id="Label21" data-type="SheetLabel" data-datafield="ProjectManager" style="">项目经理意见</span>
				</div>
				<div id="control13" class="col-md-10">
					<div id="Control21" data-datafield="ProjectManager" data-type="SheetComment" style=""></div>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title15" class="col-md-2">
					
				<label data-datafield="ywbmzgyj" data-type="SheetLabel" id="ctl788297" class="" style="">业务部门主管意见</label></div>
				<div id="control15" class="col-md-10">
					
				<div data-datafield="ywbmzgyj" data-type="SheetComment" id="ctl90102" class="" style=""></div></div>
			</div>
			<div class="row tableContent">
				<div id="title17" class="col-md-2">
					<span id="Label23" data-type="SheetLabel" data-datafield="IntegratedOffice" style="">综合办主管意见</span>
				</div>
				<div id="control17" class="col-md-10">
					<div id="Control23" data-datafield="IntegratedOffice" data-type="SheetComment" style=""></div>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title19" class="col-md-2">
					<span id="Label24" data-type="SheetLabel" data-datafield="GeneralManage" style="">总经理审批意见</span>
				</div>
				<div id="control19" class="col-md-10">
					<div id="Control24" data-datafield="GeneralManage" data-type="SheetComment" style=""></div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>