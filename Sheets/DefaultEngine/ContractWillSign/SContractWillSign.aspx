<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SContractWillSign.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SContractWillSign" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">合同会签111111</label>
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
				<div id="div590662" class="col-md-2">
					<span id="Label13" data-type="SheetLabel" data-datafield="Title" style="" class="">标题</span>
				</div>
				<div id="div805068" class="col-md-8">
					<input id="Control13" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="div757234" class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div id="div948430" class="col-md-2">
					<span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号</span>
				</div>
				<div id="div923641" class="col-md-4">
					<input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum" data-onchange="setProjectDepart();">
				</div>
				<div id="div749980" class="col-md-2">
				</div>
				<div id="div439245" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="div974727" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称</span>
				</div>
				<div id="div540080" class="col-md-8">
					<input id="Control15" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="div69802" class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div id="title3" class="col-md-2">
					<span id="Label16" data-type="SheetLabel" data-datafield="ContractNum" style="" class="">合同编号</span>
				</div>
				<div id="control3" class="col-md-4">
					<input id="Control16" type="text" data-datafield="ContractNum" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="title4" class="col-md-2">
				</div>
				<div id="control4" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="title5" class="col-md-2">
					<span id="Label17" data-type="SheetLabel" data-datafield="ContractName" style="" class="">合同名称</span>
				</div>
				<div id="control5" class="col-md-4">
					<input id="Control17" type="text" data-datafield="ContractName" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="title6" class="col-md-2">
				</div>
				<div id="control6" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="title7" class="col-md-2">
					<span id="Label18" data-type="SheetLabel" data-datafield="OtherUnit" style="" class="">对方单位</span>
				</div>
				<div id="control7" class="col-md-4">
					<input id="Control18" type="text" data-datafield="OtherUnit" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="title8" class="col-md-2">
                    <div id="div218708" class="col-md-2">
                        <span id="Label20" data-type="SheetLabel" data-datafield="Amount" style="" class="">合同金额</span>
                    </div>
                    <div id="div891335" class="col-md-4">
                        <input id="Control20" type="text" data-datafield="Amount" data-type="SheetTextBox" style="" class="">
                    </div>
				</div>
				<div id="control8" class="col-md-4">
				    <div class="col-md-12">
	    				<div id="title9" class="col-md-2">
        					<span id="Label19" data-type="SheetLabel" data-datafield="ContractType" style="">合同类型</span>
        				</div>
        				<div id="control9" class="col-md-4">
        				    <div data-datafield="ContractType" data-type="SheetRadioButtonList" id="ctl977603" class="" style="" data-defaultitems="承接;委外;租赁" data-defaultselected="false" data-repeatcolumns="6"></div>
        				</div>
                    </div>
				    <div class="col-md-12">
						<div id="title11" class="col-md-2">
        					<span id="Label21" data-type="SheetLabel" data-datafield="Contractvalidity" style="">合同有效期</span>
        				</div>
        				<div id="control11" class="col-md-4">
        					<input id="Control21" type="text" data-datafield="Contractvalidity" data-type="SheetTime" style="" class="">
        				</div>
                    </div>
				</div>
			</div>
			<div class="row">

				<div id="title10" class="col-md-2">
				</div>
				<div id="control10" class="col-md-4">
				</div>
			</div>
			<div class="row">

				<div id="div361497" class="col-md-2">
				</div>
				<div id="div601843" class="col-md-4">
				</div>
			</div>
			<div class="row">

				<div id="space12" class="col-md-2">
				</div>
				<div id="spaceControl12" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="title13" class="col-md-2">
					<span id="Label22" data-type="SheetLabel" data-datafield="Attachment" style="">附件</span>
				</div>
				<div id="control13" class="col-md-10">
					<div id="Control22" data-datafield="Attachment" data-type="SheetAttachment" style="">
						
					</div>
				</div>
			</div><div class="row hidden"><div id="div434910" class="col-md-2"><label data-datafield="ProjectId" data-type="SheetLabel" id="ctl174330" class="" style="">项目id</label></div><div id="div990913" class="col-md-4"><input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl789992" class="" style=""></div><div id="div473875" class="col-md-2"><label data-datafield="xmfzr" data-type="SheetLabel" id="ctl893040" class="" style="">项目经理</label></div><div id="div623111" class="col-md-4"><div data-datafield="xmfzr" data-type="SheetUser" id="ctl705643" class="" style=""></div></div></div><div class="row hidden"><div id="div8731" class="col-md-2"><label data-datafield="ywbmzg" data-type="SheetLabel" id="ctl543483" class="" style="">业务部门主管</label></div><div id="div138788" class="col-md-4"><div data-datafield="ywbmzg" data-type="SheetUser" id="ctl747616" class="" style=""></div></div><div id="div719138" class="col-md-2"><label data-datafield="fgld" data-type="SheetLabel" id="ctl283845" class="" style="">分管领导</label></div><div id="div657721" class="col-md-4"><div data-datafield="fgld" data-type="SheetUser" id="ctl699299" class="" style=""></div></div></div><div class="row"><div id="div407649" class="col-md-2"><label data-datafield="xmjlyj" data-type="SheetLabel" id="ctl498831" class="" style="">项目经理意见</label></div><div id="div686156" class="col-md-10"><div data-datafield="xmjlyj" data-type="SheetComment" id="ctl705967" class="" style=""></div></div></div><div class="row"><div id="div414421" class="col-md-2"><label data-datafield="ywbmzgyj" data-type="SheetLabel" id="ctl824306" class="" style="">业务部门主管意见</label></div><div id="div412794" class="col-md-10"><div data-datafield="ywbmzgyj" data-type="SheetComment" id="ctl345792" class="" style=""></div></div></div><div class="row"><div id="div798177" class="col-md-2"><label data-datafield="scbzgyj" data-type="SheetLabel" id="ctl219320" class="" style="">市场部主管意见</label></div><div id="div31693" class="col-md-10"><div data-datafield="scbzgyj" data-type="SheetComment" id="ctl752481" class="" style=""></div></div></div><div class="row"><div id="div962681" class="col-md-2"><label data-datafield="zhbzgyj" data-type="SheetLabel" id="ctl376372" class="" style="">综合办主管意见</label></div><div id="div128677" class="col-md-10"><div data-datafield="zhbzgyj" data-type="SheetComment" id="ctl441054" class="" style=""></div></div></div><div class="row"><div id="div837650" class="col-md-2"><label data-datafield="fgldyj" data-type="SheetLabel" id="ctl565300" class="" style="">分管领导意见</label></div><div id="div558737" class="col-md-10"><div data-datafield="fgldyj" data-type="SheetComment" id="ctl831798" class="" style=""></div></div></div><div class="row"><div id="div13853" class="col-md-2"><label data-datafield="zjlyj" data-type="SheetLabel" id="ctl284205" class="" style="">总经理意见</label></div><div id="div993692" class="col-md-10"><div data-datafield="zjlyj" data-type="SheetComment" id="ctl604623" class="" style=""></div></div></div><div class="row"><div id="div115312" class="col-md-2"><label data-datafield="dszyj" data-type="SheetLabel" id="ctl539276" class="" style="">董事长意见</label></div><div id="div398317" class="col-md-10"><div data-datafield="dszyj" data-type="SheetComment" id="ctl94971" class="" style=""></div></div></div>
		</div>
	</div>
</asp:Content>