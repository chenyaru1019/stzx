﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectCarRental.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectCarRental" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
	    <script src="SProjectCarRental.js"></script>
	<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">项目租车申请</label>
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
						<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
					</div>
					<div id="title2" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">所属部门</span>
					</div>
					<div id="control2" class="col-md-4">
						<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
					</div>
				</div><div class="row"><div id="div699201" class="col-md-2"><label data-datafield="Title" data-type="SheetLabel" id="ctl415042" class="" style="">标题</label></div><div id="div120405" class="col-md-10"><input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl178052" class="" style=""></div></div><div class="row"><div id="div222240" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号</span></div><div id="div194002" class="col-md-4"><input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum,ProjectName:ProjectName"></div><div id="div888300" class="col-md-2"></div><div id="div230936" class="col-md-4"></div></div><div class="row"><div id="div531572" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称</span></div><div id="div97315" class="col-md-10"><input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="" data-schemacode="ProjectTask" data-querycode="TaskList" data-outputmappings="ProjectName:ProjectName,ProjectId:ObjectID,ProjectNum:ProjectNum" data-onchange="setCarRentalInfo();"></div></div>
				
				<div class="row tableContent">
					<div id="title5" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="ProjectVehicleInfo" style="" class="">项目现有租车信息</span>
					</div>
					<div id="control5" class="col-md-10">
						<table id="Control15" data-datafield="ProjectVehicleInfo" data-type="SheetGridView" class="SheetGridView" data-displayadd="false" data-displaysummary="false">
							<tbody>

								<tr class="header">
									<td id="Control15_SerialNo" class="rowSerialNo">序号</td>
									<td id="Control15_Header3" data-datafield="ProjectVehicleInfo.Typec" class=""><label data-datafield="ProjectVehicleInfo.Type" data-type="SheetLabel" id="ctl882659" class="" style="">车辆型号</label></td>
									<td id="Control15_Header4" data-datafield="ProjectVehicleInfo.Plate"><label id="Control15_Label4" data-datafield="ProjectVehicleInfo.Plate" data-type="SheetLabel" style="">车牌号</label></td>
									<td id="Control15_Header5" data-datafield="ProjectVehicleInfo.Seat"><label id="Control15_Label5" data-datafield="ProjectVehicleInfo.Seat" data-type="SheetLabel" style="">座位数量</label></td>
									<td class="rowOption hidden">删除</td>
								</tr>
								<tr class="template">
									<td id="Control15_Option" class="rowOption"><input type="text" data-datafield="ProjectVehicleInfo.Type" data-type="SheetTextBox" id="ctl134046" class="" style=""></td>
									<td data-datafield="ProjectVehicleInfo.Typec" class=""><input type="text" data-datafield="ProjectVehicleInfo.Type" data-type="SheetTextBox" id="ctl14863" class="" style=""></td>
									<td data-datafield="ProjectVehicleInfo.Plate" class=""><input id="Control15_ctl4" type="text" data-datafield="ProjectVehicleInfo.Plate" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="ProjectVehicleInfo.Seat" class="" style="width: 7%;"><input id="Control15_ctl5" type="text" data-datafield="ProjectVehicleInfo.Seat" data-type="SheetTextBox" style="" class=""></td>
									<td class="rowOption hidden"><a class="delete">
											<div class="fa fa-minus"></div>
									</a> <a class="insert">
											<div class="fa fa-arrow-down"></div>
									</a></td>
								</tr>
								<tr class="footer">
									<td class="rowOption"></td>
									<td data-datafield="ProjectVehicleInfo.Typec"></td>
									<td data-datafield="ProjectVehicleInfo.Plate"></td>
									<td data-datafield="ProjectVehicleInfo.Seat"><label id="Control15_stat5" data-datafield="ProjectVehicleInfo.Seat" data-type="SheetCountLabel" style=""></label></td>
									<td class="rowOption hidden"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row tableContent">
					<div id="title7" class="col-md-2">
						<span id="Label16" data-type="SheetLabel" data-datafield="ApplyerCarInfo" style="">本次申请租车信息</span>
					</div>
					<div id="control7" class="col-md-10">
						<table id="Control16" data-datafield="ApplyerCarInfo" data-type="SheetGridView" class="SheetGridView">
							<tbody>

								<tr class="header">
									<td id="Control16_SerialNo" class="rowSerialNo">序号</td>
									<td id="Control16_Header3" data-datafield="ApplyerCarInfo.Type" class="">
										<label id="Control16_Label3" data-datafield="ApplyerCarInfo.Type" data-type="SheetLabel" style="">车辆型号</label>
									</td>
									<td id="Control16_Header4" data-datafield="ApplyerCarInfo.Plate"><label id="Control16_Label4" data-datafield="ApplyerCarInfo.Plate" data-type="SheetLabel" style="">车牌号码</label></td>
									<td id="Control16_Header5" data-datafield="ApplyerCarInfo.Seat">
										<label id="Control16_Label5" data-datafield="ApplyerCarInfo.Seat" data-type="SheetLabel" style="">座位数量</label>
									</td>
									<td id="Control16_Header6" data-datafield="ApplyerCarInfo.MonthlyRent"><label id="Control16_Label6" data-datafield="ApplyerCarInfo.MonthlyRent" data-type="SheetLabel" style="">月租金（元）</label></td>
									<td id="Control16_Header7" data-datafield="ApplyerCarInfo.PaymentCycle"><label id="Control16_Label7" data-datafield="ApplyerCarInfo.PaymentCycle" data-type="SheetLabel" style="">支付周期</label></td>
									<td id="Control16_Header8" data-datafield="ApplyerCarInfo.DriverFee"><label id="Control16_Label8" data-datafield="ApplyerCarInfo.DriverFee" data-type="SheetLabel" style="">是否包含司机费用</label></td>
									<td id="Control16_Header9" data-datafield="ApplyerCarInfo.Unit">
										<label id="Control16_Label9" data-datafield="ApplyerCarInfo.Unit" data-type="SheetLabel" style="">对方单位</label>
									</td>
									<td class="rowOption">删除</td>
								</tr>
								<tr class="template">
									<td id="Control16_Option" class="rowOption"></td>
									<td data-datafield="ApplyerCarInfo.Type"><input id="Control16_ctl3" type="text" data-datafield="ApplyerCarInfo.Type" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="ApplyerCarInfo.Plate"><input id="Control16_ctl4" type="text" data-datafield="ApplyerCarInfo.Plate" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="ApplyerCarInfo.Seat" class="" style="width: 6%;"><input id="Control16_ctl5" type="text" data-datafield="ApplyerCarInfo.Seat" data-type="SheetTextBox" style="" class="" data-regularexpression="/^[1-9]\d*$/" data-regularinvalidtext="请正确输入座位数！"></td>
									<td data-datafield="ApplyerCarInfo.MonthlyRent"><input id="Control16_ctl6" type="text" data-datafield="ApplyerCarInfo.MonthlyRent" data-type="SheetTextBox" style=""></td>
									<td data-datafield="ApplyerCarInfo.PaymentCycle"><input id="Control16_ctl7" type="text" data-datafield="ApplyerCarInfo.PaymentCycle" data-type="SheetTextBox" style=""></td>
									<td data-datafield="ApplyerCarInfo.DriverFee" class="" style="width: 6%;"><select data-datafield="ApplyerCarInfo.DriverFee" data-type="SheetDropDownList" id="ctl637911" class="" style="" data-defaultitems="是;否" data-queryable="false"></select></td>
									<td data-datafield="ApplyerCarInfo.Unit"><input id="Control16_ctl9" type="text" data-datafield="ApplyerCarInfo.Unit" data-type="SheetTextBox" style=""></td>
									<td class="rowOption"><a class="delete">
											<div class="fa fa-minus"></div>
									</a> <a class="insert">
											<div class="fa fa-arrow-down"></div>
									</a></td>
								</tr>
								<tr class="footer">
									<td class="rowOption"></td>
									<td data-datafield="ApplyerCarInfo.Type"></td>
									<td data-datafield="ApplyerCarInfo.Plate"></td>
									<td data-datafield="ApplyerCarInfo.Seat"><label id="Control16_stat5" data-datafield="ApplyerCarInfo.Seat" data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="ApplyerCarInfo.MonthlyRent"><label id="Control16_stat6" data-datafield="ApplyerCarInfo.MonthlyRent" data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="ApplyerCarInfo.PaymentCycle"></td>
									<td data-datafield="ApplyerCarInfo.DriverFee"></td>
									<td data-datafield="ApplyerCarInfo.Unit"></td>
									<td class="rowOption"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><div class="row hidden"><div id="div759242" class="col-md-2"><label data-datafield="ProjectId" data-type="SheetLabel" id="ctl435991" class="" style="">项目id</label></div><div id="div985820" class="col-md-4"><input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl146332" class="" style=""></div><div id="div75288" class="col-md-2"></div><div id="div906160" class="col-md-4"></div></div>
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
			    </div>
				
				
				<div class="row">
					<div id="div207006" class="col-md-2">
						<label data-datafield="Related_items" data-type="SheetLabel" id="ctl780373" class="" style="">关联项目</label>
					</div>
					<div id="div930174" class="col-md-4">
						<input type="text" data-datafield="Related_items" data-type="SheetTextBox" id="ctl380781" class="" style="">
					</div>
					<div id="div658414" class="col-md-2"></div>
					<div id="div677969" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div39479" class="col-md-2">
						<label data-datafield="Workflow" data-type="SheetLabel" id="ctl126270" class="" style="">关联流程</label>
					</div>
					<div id="div911069" class="col-md-4">
						<input type="text" data-datafield="Workflow" data-type="SheetTextBox" id="ctl936377" class="" style="">
					</div>
					<div id="div983988" class="col-md-2"></div>
					<div id="div653005" class="col-md-4"></div>
				</div><div class="row"><div id="div394996" class="col-md-2"><label data-datafield="Attachment" data-type="SheetLabel" id="ctl412157" class="" style="">附件</label></div><div id="div988099" class="col-md-10"><div data-datafield="Attachment" data-type="SheetAttachment" id="ctl15991" class="" style=""></div></div></div>

				
				<div class="nav-icon fa  fa-chevron-right bannerTitle" id = "Opinion">
			       <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
		        </div>
				
				<div class="row tableContent">
					<div id="title11" class="col-md-2">
						<span id="Label18" data-type="SheetLabel" data-datafield="ProjectManagement" style="">项目管理部意见</span>
					</div>
					<div id="control11" class="col-md-10">
						<div id="Control18" data-datafield="ProjectManagement" data-type="SheetComment" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div530181" class="col-md-2">
						<label data-datafield="BusinessDepart" data-type="SheetLabel" id="ctl863870" class="" style="">业务部门主管意见</label>
					</div>
					<div id="div111211" class="col-md-10">
						<div data-datafield="BusinessDepart" data-type="SheetComment" id="ctl945400" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div865740" class="col-md-2">
						<label data-datafield="MarketingDepart" data-type="SheetLabel" id="ctl722053" class="" style="">市场部主管意见</label>
					</div>
					<div id="div900095" class="col-md-10">
						<div data-datafield="MarketingDepart" data-type="SheetComment" id="ctl608064" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div197021" class="col-md-2">
						<label data-datafield="IntegratedOffice" data-type="SheetLabel" id="ctl684752" class="" style="">综合办主管意见</label>
					</div>
					<div id="div920206" class="col-md-10">
						<div data-datafield="IntegratedOffice" data-type="SheetComment" id="ctl890995" class="" style=""></div>
					</div>
				</div>

				<div class="row tableContent">
					<div id="title15" class="col-md-2">
						<span id="Label20" data-type="SheetLabel" data-datafield="ManagerOption" style="">公司总经理意见</span>
					</div>
					<div id="control15" class="col-md-10">
						<div id="Control20" data-datafield="ManagerOption" data-type="SheetComment" style=""></div>
					</div>
				</div>
				
			</div>
		</div>
	</asp:Content>