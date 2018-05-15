<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectCost.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectCost" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">项目驻外费用发放单</label>
</div>
<div class="panel-body sheetContainer">
	<!--<div class="nav-icon fa fa-chevron-right bannerTitle">-->
		<!--<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>-->
	<!--</div>-->
	<!--<div class="divContent">-->
		<!--<div class="row">-->
			<!--<div id="divFullNameTitle" class="col-md-2">-->
				<!--<label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="">发起人</label>-->
			<!--</div>-->
			<!--<div id="divFullName" class="col-md-4">-->
				<!--<label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>-->
			<!--</div>-->
			<!--<div id="divOriginateDateTitle" class="col-md-2">-->
				<!--<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>-->
			<!--</div>-->
			<!--<div id="divOriginateDate" class="col-md-4">-->
				<!--<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>-->
			<!--</div>-->
		<!--</div>-->
		<!--<div class="row">-->
			<!--<div id="divOriginateOUNameTitle" class="col-md-2">-->
				<!--<label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" style="">所属组织</label>-->
			<!--</div>-->
			<!--<div id="divOriginateOUName" class="col-md-4">-->
				<!--&lt;!&ndash;					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">-->
<!--<span class="OnlyDesigner">Originator.OUName</span>-->
					<!--</label>&ndash;&gt;-->
					<!--<select data-datafield="Originator.OUName" data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class="" style="">-->
					<!--</select>-->
				<!--</div>-->
				<!--<div id="divSequenceNoTitle" class="col-md-2">-->
					<!--<label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号</label>-->
				<!--</div>-->
				<!--<div id="divSequenceNo" class="col-md-4">-->
					<!--<label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>-->
				<!--</div>-->
			<!--</div>-->
		<!--</div>-->
		<div class="nav-icon fa  fa-chevron-right bannerTitle">
			<label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
		</div>
		<div class="divContent" id="divSheet">
		    <div class="row">
			    <div id="divOriginateDateTitle" class="col-md-2">
			    	<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
			    </div>
			    <div id="divOriginateDate" class="col-md-4">
			    	<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>
			    </div>
				<div id="divSequenceNoTitle" class="col-md-2">
					<label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号</label>
				</div>
				<div id="divSequenceNo" class="col-md-4">
					<label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>
				</div>
            </div>
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
			</div><div class="row"><div id="div608157" class="col-md-2"><label data-datafield="Title" data-type="SheetLabel" id="ctl326671" class="" style="">标题</label></div><div id="div994316" class="col-md-10"><input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl583771" class="" style=""></div></div>
			<div class="row"><div id="div197521" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号</span></div><div id="div262968" class="col-md-4"><input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectNum:ProjectNum,ProjectName:ProjectName"></div><div id="div525586" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称</span></div><div id="div654829" class="col-md-4"><input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class=""></div></div>
			<div class="row tableContent">
				<div id="title5" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="ZProjectCostList" style="">正式员工发放单明细</span>
				</div>
				<div id="control5" class="col-md-10">
					<table id="Control15" data-datafield="ZProjectCostList" data-type="SheetGridView" class="SheetGridView">
						<tbody>
							
							<tr class="header">
								<td id="Control15_SerialNo" class="rowSerialNo" rowspan='2'>
序号								</td>
								<td id="Control15_Header3" data-datafield="ZProjectCostList.Type" rowspan='2'>
									<label id="Control15_Label3" data-datafield="ZProjectCostList.Type" data-type="SheetLabel" style="">人员类别</label>
								</td>
								<td id="Control15_Header4" data-datafield="ZProjectCostList.Department" rowspan='2'>
									<label id="Control15_Label4" data-datafield="ZProjectCostList.Department" data-type="SheetLabel" style="">部门</label>
								</td>
								<td id="Control15_Header5" data-datafield="ZProjectCostList.ZName" rowspan='2'>
									<label id="Control15_Label5" data-datafield="ZProjectCostList.ZName" data-type="SheetLabel" style="">姓名</label>
								</td>
								<td id="Control15_Header6" data-datafield="ZProjectCostList.TravelExpenses" rowspan='2'>
									<label id="Control15_Label6" data-datafield="ZProjectCostList.TravelExpenses" data-type="SheetLabel" style="">差旅费</label>
								</td>
								<td id="Control15_Header7" data-datafield="ZProjectCostList.ForeignAllowance" class="" colspan='2'>
									<label id="Control15_Label7" data-datafield="ZProjectCostList.ForeignAllowance" data-type="SheetLabel" style="" class="">岗位津贴</label>
								</td>
								<!--<td id="Control15_Header8" data-datafield="ZProjectCostList.CommunicationFee">-->
									<!--<label id="Control15_Label8" data-datafield="ZProjectCostList.CommunicationFee" data-type="SheetLabel" style="">通讯费</label>-->
								<!--</td>-->
								<td id="Control15_Header9" data-datafield="ZProjectCostList.LastMonthTax" rowspan='2'>
									<label id="Control15_Label9" data-datafield="ZProjectCostList.LastMonthTax" data-type="SheetLabel" style="">上月税</label>
								</td>
								<td id="Control15_Header10" data-datafield="ZProjectCostList.Total" rowspan='2'>
									<label id="Control15_Label10" data-datafield="ZProjectCostList.Total" data-type="SheetLabel" style="">总额</label>
								</td>
								<td class="rowOption" rowspan='2'>
删除								</td>
							</tr>
							<tr class="header">
                                <td id="Control15_Header7" data-datafield="ZProjectCostList.ForeignAllowance" class="">
                                    <label id="Control15_Label7" data-datafield="ZProjectCostList.ForeignAllowance" data-type="SheetLabel" style="" class="">岗位津贴</label>
                                </td>
                                <td id="Control15_Header8" data-datafield="ZProjectCostList.CommunicationFee">
                                    <label id="Control15_Label8" data-datafield="ZProjectCostList.CommunicationFee" data-type="SheetLabel" style="">通讯费</label>
                                </td>
                            </tr>
							<tr class="template">
								<td id="Control15_Option" class="rowOption">
								</td>
								<td data-datafield="ZProjectCostList.Type">
									<input id="Control15_ctl3" type="text" data-datafield="ZProjectCostList.Type" data-type="SheetTextBox" style="" class="" data-defaultvalue="正式职工">
								</td>
								<td data-datafield="ZProjectCostList.Department">
									<input id="Control15_ctl4" type="text" data-datafield="ZProjectCostList.Department" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ZProjectCostList.ZName">
									<input id="Control15_ctl5" type="text" data-datafield="ZProjectCostList.ZName" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ZProjectCostList.TravelExpenses">
									<input id="Control15_ctl6" type="text" data-datafield="ZProjectCostList.TravelExpenses" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ZProjectCostList.ForeignAllowance">
									<input id="Control15_ctl7" type="text" data-datafield="ZProjectCostList.ForeignAllowance" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="ZProjectCostList.CommunicationFee">
									<input id="Control15_ctl8" type="text" data-datafield="ZProjectCostList.CommunicationFee" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ZProjectCostList.LastMonthTax">
									<input id="Control15_ctl9" type="text" data-datafield="ZProjectCostList.LastMonthTax" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="ZProjectCostList.Total">
									<input id="Control15_ctl10" type="text" data-datafield="ZProjectCostList.Total" data-type="SheetTextBox" style="" class="" data-computationrule="{ZProjectCostList.TravelExpenses}+{ZProjectCostList.ForeignAllowance}+{ZProjectCostList.CommunicationFee}+{ZProjectCostList.LastMonthTax}">
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
								<td data-datafield="ZProjectCostList.Type">
								</td>
								<td data-datafield="ZProjectCostList.Department">
								</td>
								<td data-datafield="ZProjectCostList.ZName">
								</td>
								<td data-datafield="ZProjectCostList.TravelExpenses">
									<label id="Control15_stat6" data-datafield="ZProjectCostList.TravelExpenses" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="ZProjectCostList.ForeignAllowance">
									<label id="Control15_stat7" data-datafield="ZProjectCostList.ForeignAllowance" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="ZProjectCostList.CommunicationFee">
									<label id="Control15_stat8" data-datafield="ZProjectCostList.CommunicationFee" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="ZProjectCostList.LastMonthTax">
									<label id="Control15_stat9" data-datafield="ZProjectCostList.LastMonthTax" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="ZProjectCostList.Total">
									<label id="Control15_stat10" data-datafield="ZProjectCostList.Total" data-type="SheetCountLabel" style=""></label>
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div id="title7" class="col-md-2">
					<span id="Label16" data-type="SheetLabel" data-datafield="ZTotalAmount" style="">小计</span>
				</div>
				<div id="control7" class="col-md-4">
					<input id="Control16" type="text" data-datafield="ZTotalAmount" data-type="SheetTextBox" style="" class="" data-computationrule="SUM({ZProjectCostList.Total})">
				</div>
				<div id="space8" class="col-md-2">
				</div>
				<div id="spaceControl8" class="col-md-4">
				</div>
			</div>
			<div class="row tableContent">
				<div id="title9" class="col-md-2">
					<span id="Label17" data-type="SheetLabel" data-datafield="PProjectCostList" style="">聘用工发放单明细</span>
				</div>
				<div id="control9" class="col-md-10">
					<table id="Control17" data-datafield="PProjectCostList" data-type="SheetGridView" class="SheetGridView">
						<tbody>
							
							<tr class="header">
								<td id="Control17_SerialNo" class="rowSerialNo" rowspan='2'>
序号								</td>
								<td id="Control17_Header3" data-datafield="PProjectCostList.Type" rowspan='2'>
									<label id="Control17_Label3" data-datafield="PProjectCostList.Type" data-type="SheetLabel" style="">人员类别</label>
								</td>
								<td id="Control17_Header4" data-datafield="PProjectCostList.Department" rowspan='2'>
									<label id="Control17_Label4" data-datafield="PProjectCostList.Department" data-type="SheetLabel" style="">部门</label>
								</td>
								<td id="Control17_Header5" data-datafield="PProjectCostList.ZName" rowspan='2'>
									<label id="Control17_Label5" data-datafield="PProjectCostList.ZName" data-type="SheetLabel" style="">姓名</label>
								</td>
								<td id="Control17_Header6" data-datafield="PProjectCostList.TravelExpenses" rowspan='2'>
									<label id="Control17_Label6" data-datafield="PProjectCostList.TravelExpenses" data-type="SheetLabel" style="">差旅费</label>
								</td>
								<td id="Control17_Header7" data-datafield="PProjectCostList.ForeignAllowance" colspan='2'>
									<label id="Control17_Label7" data-datafield="PProjectCostList.ForeignAllowance" data-type="SheetLabel" style="" class="">岗位津贴</label>
								</td>
								<!--<td id="Control17_Header8" data-datafield="PProjectCostList.CommunicationFee">-->
									<!--<label id="Control17_Label8" data-datafield="PProjectCostList.CommunicationFee" data-type="SheetLabel" style="">通讯费</label>-->
								<!--</td>-->
								<td id="Control17_Header9" data-datafield="PProjectCostList.LastMonthTax" rowspan='2'>
									<label id="Control17_Label9" data-datafield="PProjectCostList.LastMonthTax" data-type="SheetLabel" style="">上月税</label>
								</td>
								<td id="Control17_Header10" data-datafield="PProjectCostList.Total" rowspan='2'>
									<label id="Control17_Label10" data-datafield="PProjectCostList.Total" data-type="SheetLabel" style="">总额</label>
								</td>
								<td class="rowOption" rowspan='2'>
删除								</td>
							</tr>
							<tr class="header">

                                <td id="Control17_Header7" data-datafield="PProjectCostList.ForeignAllowance">
                                    <label id="Control17_Label7" data-datafield="PProjectCostList.ForeignAllowance" data-type="SheetLabel" style="" class="">岗位津贴</label>
                                </td>
                                <td id="Control17_Header8" data-datafield="PProjectCostList.CommunicationFee">
                                    <label id="Control17_Label8" data-datafield="PProjectCostList.CommunicationFee" data-type="SheetLabel" style="">通讯费</label>
                                </td>

                            </tr>
							<tr class="template">
								<td id="Control17_Option" class="rowOption">
								</td>
								<td data-datafield="PProjectCostList.Type" class="">
									<input id="Control17_ctl3" type="text" data-datafield="PProjectCostList.Type" data-type="SheetTextBox" style="" class="" data-defaultvalue="项目聘用">
								</td>
								<td data-datafield="PProjectCostList.Department">
									<input id="Control17_ctl4" type="text" data-datafield="PProjectCostList.Department" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="PProjectCostList.ZName">
									<input id="Control17_ctl5" type="text" data-datafield="PProjectCostList.ZName" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="PProjectCostList.TravelExpenses">
									<input id="Control17_ctl6" type="text" data-datafield="PProjectCostList.TravelExpenses" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="PProjectCostList.ForeignAllowance">
									<input id="Control17_ctl7" type="text" data-datafield="PProjectCostList.ForeignAllowance" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="PProjectCostList.CommunicationFee">
									<input id="Control17_ctl8" type="text" data-datafield="PProjectCostList.CommunicationFee" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="PProjectCostList.LastMonthTax">
									<input id="Control17_ctl9" type="text" data-datafield="PProjectCostList.LastMonthTax" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="PProjectCostList.Total">
									<input id="Control17_ctl10" type="text" data-datafield="PProjectCostList.Total" data-type="SheetTextBox" style="" class="" data-computationrule="{PProjectCostList.TravelExpenses}+{PProjectCostList.ForeignAllowance}+{PProjectCostList.CommunicationFee}+{PProjectCostList.LastMonthTax}">
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
								<td data-datafield="PProjectCostList.Type">
								</td>
								<td data-datafield="PProjectCostList.Department">
								</td>
								<td data-datafield="PProjectCostList.ZName">
								</td>
								<td data-datafield="PProjectCostList.TravelExpenses">
									<label id="Control17_stat6" data-datafield="PProjectCostList.TravelExpenses" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="PProjectCostList.ForeignAllowance">
									<label id="Control17_stat7" data-datafield="PProjectCostList.ForeignAllowance" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="PProjectCostList.CommunicationFee">
									<label id="Control17_stat8" data-datafield="PProjectCostList.CommunicationFee" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="PProjectCostList.LastMonthTax">
									<label id="Control17_stat9" data-datafield="PProjectCostList.LastMonthTax" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="PProjectCostList.Total">
									<label id="Control17_stat10" data-datafield="PProjectCostList.Total" data-type="SheetCountLabel" style=""></label>
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div id="title11" class="col-md-2">
					<span id="Label18" data-type="SheetLabel" data-datafield="PTotalAmount" style="">小计</span>
				</div>
				<div id="control11" class="col-md-4">
					<input id="Control18" type="text" data-datafield="PTotalAmount" data-type="SheetTextBox" style="" class="" data-computationrule="SUM({PProjectCostList.Total})">
				</div>
				<div id="title12" class="col-md-2">
				</div>
				<div id="control12" class="col-md-4">
				</div>
			</div>
			<div class="row">
			    <div id="div149380" class="col-md-2">
			        <label data-datafield="JProjectCostList" data-type="SheetLabel" id="ctl600970" class="" style="">借用员工发放单明细</label>
                </div>
                <div id="div13852" class="col-md-10">
                    <table id="ctl625394" data-datafield="JProjectCostList" data-type="SheetGridView" class="SheetGridView" style="">
                        <tbody>
                        <tr class="header">
                            <td id="ctl625394_SerialNo" class="rowSerialNo" rowspan='2'>序号</td>
                            <td id="ctl625394_header0" data-datafield="JProjectCostList.Type" style="" rowspan='2'>
                                <label id="ctl625394_Label0" data-datafield="JProjectCostList.Type" data-type="SheetLabel" style="">类别</label>
                            </td>
                            <td id="ctl625394_header1" data-datafield="JProjectCostList.Department" style="" rowspan='2'>
                                <label id="ctl625394_Label1" data-datafield="JProjectCostList.Department" data-type="SheetLabel" style="">部门</label>
                            </td>
                            <td id="ctl625394_header2" data-datafield="JProjectCostList.ZName" style="" rowspan='2'>
                                <label id="ctl625394_Label2" data-datafield="JProjectCostList.ZName" data-type="SheetLabel" style="">姓名</label>
                            </td>
                            <td id="ctl625394_header3" data-datafield="JProjectCostList.TravelExpenses" style="" rowspan='2'>
                                <label id="ctl625394_Label3" data-datafield="JProjectCostList.TravelExpenses" data-type="SheetLabel" style="">差旅费</label>
                            </td>
                            <td id="ctl625394_header4" data-datafield="JProjectCostList.ForeignAllowance" style="" colspan='2'>
                                <label id="ctl625394_Label4" data-datafield="JProjectCostList.ForeignAllowance" data-type="SheetLabel" style="">岗位津贴</label>
                            </td>
                            <!--<td id="ctl625394_header5" data-datafield="JProjectCostList.CommunicationFee" style="">-->
                                <!--<label id="ctl625394_Label5" data-datafield="JProjectCostList.CommunicationFee" data-type="SheetLabel" style="">通讯费</label>-->
                            <!--</td>-->
                            <td id="ctl625394_header6" data-datafield="JProjectCostList.LastMonthTax" style="" rowspan='2'>
                                <label id="ctl625394_Label6" data-datafield="JProjectCostList.LastMonthTax" data-type="SheetLabel" style="">上月税</label>
                            </td>
                            <td id="ctl625394_header7" data-datafield="JProjectCostList.Total" style="" rowspan='2'>
                                <label id="ctl625394_Label7" data-datafield="JProjectCostList.Total" data-type="SheetLabel" style="">总额</label>
                            </td>
                            <td class="rowOption" rowspan='2'>删除</td>
                        </tr>
                        <tr class="header">

                            <td id="ctl625394_header4" data-datafield="JProjectCostList.ForeignAllowance" style="">
                                <label id="ctl625394_Label4" data-datafield="JProjectCostList.ForeignAllowance" data-type="SheetLabel" style="">岗位津贴</label>
                            </td>
                            <td id="ctl625394_header5" data-datafield="JProjectCostList.CommunicationFee" style="">
                                <label id="ctl625394_Label5" data-datafield="JProjectCostList.CommunicationFee" data-type="SheetLabel" style="">通讯费</label>
                            </td>
                        </tr>
                        <tr class="template"><td class="rowOption"></td><td id="ctl625394_control0" data-datafield="JProjectCostList.Type" style=""><input type="text" data-datafield="JProjectCostList.Type" data-type="SheetTextBox" id="ctl625394_control0" style=""></td><td id="ctl625394_control1" data-datafield="JProjectCostList.Department" style=""><input type="text" data-datafield="JProjectCostList.Department" data-type="SheetTextBox" id="ctl625394_control1" style=""></td><td id="ctl625394_control2" data-datafield="JProjectCostList.ZName" style=""><input type="text" data-datafield="JProjectCostList.ZName" data-type="SheetTextBox" id="ctl625394_control2" style=""></td><td id="ctl625394_control3" data-datafield="JProjectCostList.TravelExpenses" style=""><input type="text" data-datafield="JProjectCostList.TravelExpenses" data-type="SheetTextBox" id="ctl625394_control3" style=""></td><td id="ctl625394_control4" data-datafield="JProjectCostList.ForeignAllowance" style=""><input type="text" data-datafield="JProjectCostList.ForeignAllowance" data-type="SheetTextBox" id="ctl625394_control4" style=""></td><td id="ctl625394_control5" data-datafield="JProjectCostList.CommunicationFee" style=""><input type="text" data-datafield="JProjectCostList.CommunicationFee" data-type="SheetTextBox" id="ctl625394_control5" style=""></td><td id="ctl625394_control6" data-datafield="JProjectCostList.LastMonthTax" style=""><input type="text" data-datafield="JProjectCostList.LastMonthTax" data-type="SheetTextBox" id="ctl625394_control6" style=""></td><td id="ctl625394_control7" data-datafield="JProjectCostList.Total" style="" class="" data-computationrule="{JProjectCostList.TravelExpenses}+{JProjectCostList.ForeignAllowance}+{JProjectCostList.CommunicationFee}+{JProjectCostList.LastMonthTax}"><input type="text" data-datafield="JProjectCostList.Total" data-type="SheetTextBox" id="ctl625394_control7" style="" class="" data-computationrule="{JProjectCostList.TravelExpenses}+{JProjectCostList.ForeignAllowance}+{JProjectCostList.CommunicationFee}+{JProjectCostList.LastMonthTax}"></td><td class="rowOption"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr><tr class="footer"><td></td><td id="ctl625394_Stat0" data-datafield="JProjectCostList.Type" style=""></td><td id="ctl625394_Stat1" data-datafield="JProjectCostList.Department" style=""></td><td id="ctl625394_Stat2" data-datafield="JProjectCostList.ZName" style=""></td><td id="ctl625394_Stat3" data-datafield="JProjectCostList.TravelExpenses" style=""><label id="ctl625394_StatControl3" data-datafield="JProjectCostList.TravelExpenses" data-type="SheetCountLabel" style=""></label></td><td id="ctl625394_Stat4" data-datafield="JProjectCostList.ForeignAllowance" style=""><label id="ctl625394_StatControl4" data-datafield="JProjectCostList.ForeignAllowance" data-type="SheetCountLabel" style=""></label></td><td id="ctl625394_Stat5" data-datafield="JProjectCostList.CommunicationFee" style=""><label id="ctl625394_StatControl5" data-datafield="JProjectCostList.CommunicationFee" data-type="SheetCountLabel" style=""></label></td><td id="ctl625394_Stat6" data-datafield="JProjectCostList.LastMonthTax" style=""><label id="ctl625394_StatControl6" data-datafield="JProjectCostList.LastMonthTax" data-type="SheetCountLabel" style=""></label></td><td id="ctl625394_Stat7" data-datafield="JProjectCostList.Total" style=""><label id="ctl625394_StatControl7" data-datafield="JProjectCostList.Total" data-type="SheetCountLabel" style=""></label></td><td></td></tr></tbody></table></div></div><div class="row"><div id="div748168" class="col-md-2"><label data-datafield="JTotalAmount" data-type="SheetLabel" id="ctl144325" class="" style="">小计</label></div><div id="div616163" class="col-md-4"><input type="text" data-datafield="JTotalAmount" data-type="SheetTextBox" id="ctl385059" class="" style="" data-computationrule="SUM({JProjectCostList.Total})"></div><div id="div199645" class="col-md-2"></div><div id="div651342" class="col-md-4"></div></div>
			<div class="row">
				<div id="div405345" class="col-md-2">
					<span id="Label19" data-type="SheetLabel" data-datafield="TotalAmount" class="" style="">合计（大写）</span>
				</div>
				<div id="div322040" class="col-md-4">
					<input id="Control19" type="text" data-datafield="TotalAmount" data-type="SheetTextBox" class="" style="" data-computationrule="{ZTotalAmount}+{PTotalAmount}+{JTotalAmount}" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectNum:ProjectNum,ProjectName:ProjectName">
				</div>
				<div id="div885655" class="col-md-2">
				</div>
				<div id="div223787" class="col-md-4">
				</div>
			</div>
			<div class="nav-icon fa  fa-chevron-right bannerTitle">
			     <label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
			</div>
			
			<div class="row"><div id="div413689" class="col-md-2"><label data-datafield="Related_items" data-type="SheetLabel" id="ctl516743" class="" style="">关联项目</label></div><div id="div693776" class="col-md-4"><input type="text" data-datafield="Related_items" data-type="SheetTextBox" id="ctl277294" class="" style=""></div><div id="div619564" class="col-md-2"></div><div id="div185938" class="col-md-4"></div></div><div class="row"><div id="div240682" class="col-md-2"><label data-datafield="Workflow" data-type="SheetLabel" id="ctl882074" class="" style="">关联流程</label></div><div id="div509889" class="col-md-4"><input type="text" data-datafield="Workflow" data-type="SheetTextBox" id="ctl419183" class="" style=""></div><div id="div350720" class="col-md-2"></div><div id="div326945" class="col-md-4"></div></div><div class="row"><div id="div251055" class="col-md-2"><label data-datafield="Attachment" data-type="SheetLabel" id="ctl7782" class="" style="">附件</label></div><div id="div899678" class="col-md-10"><div data-datafield="Attachment" data-type="SheetAttachment" id="ctl760675" class="" style=""></div></div></div>
			
			
			<div class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
				</div>
			<div class="row tableContent">
				<div id="title13" class="col-md-2">
					<span id="Label20" data-type="SheetLabel" data-datafield="ProjectManager" style="">项目经理意见</span>
				</div>
				<div id="control13" class="col-md-10">
					<div id="Control20" data-datafield="ProjectManager" data-type="SheetComment" style=""></div>
				</div>
			</div><div class="row"><div id="div743000" class="col-md-2"><label data-datafield="ywbmzgyj" data-type="SheetLabel" id="ctl183738" class="" style="">业务部门主管意见</label></div><div id="div716803" class="col-md-10"><div data-datafield="ywbmzgyj" data-type="SheetComment" id="ctl273015" class="" style=""></div></div></div>
			
			<div class="row tableContent">
				<div id="title17" class="col-md-2">
					<span id="Label22" data-type="SheetLabel" data-datafield="FDOption" style="" class="">综合办财务负责人意见</span>
				</div>
				<div id="control17" class="col-md-10">
					<div id="Control22" data-datafield="FDOption" data-type="SheetComment" style=""></div>
				</div>
			</div><div class="row"><div id="div361457" class="col-md-2"><label data-datafield="zhbzgyj" data-type="SheetLabel" id="ctl713785" class="" style="">综合办主管意见</label></div><div id="div170696" class="col-md-10"><div data-datafield="zhbzgyj" data-type="SheetComment" id="ctl779216" class="" style=""></div></div></div>
			<div class="row tableContent">
				<div id="title19" class="col-md-2">
					<span id="Label23" data-type="SheetLabel" data-datafield="GeneralManage" style="">总经理意见</span>
				</div>
				<div id="control19" class="col-md-10">
					<div id="Control23" data-datafield="GeneralManage" data-type="SheetComment" style=""></div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>