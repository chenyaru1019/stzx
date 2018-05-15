﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EvaluationResult.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.EvaluationResult" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">专家业绩评价</label>
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
						<span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">评价人</span>
					</div>
					<div id="control1" class="col-md-4">
						<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
					</div>
					<div id="title2" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">评价部门</span>
					</div>
					<div id="control2" class="col-md-4">
						<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
					</div>
				</div>
				<div class="row">
					<div id="div901079" class="col-md-2">
						<span id="Label13" data-type="SheetLabel" data-datafield="Pjsj" style="" class="">评价时间</span>
					</div>
					<div id="div585904" class="col-md-4">
						<input id="Control13" type="text" data-datafield="Pjsj" data-type="SheetTime" style="" class="">
					</div>
					<div id="div960137" class="col-md-2"></div>
					<div id="div908084" class="col-md-4"></div>
				</div>


				<div id="" class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divInvInfo" data-en_us="Inventory situation" class="">提名信息</label>
				</div>

				<div class="row">
					<div id="div963334" class="col-md-2">
						<label data-datafield="Zjgzlx" data-type="SheetLabel" id="ctl730805" class="" style="">专家工作类型</label>
					</div>
					<div id="div130361" class="col-md-4">
						<div data-datafield="Zjgzlx" data-type="SheetRadioButtonList" id="ctl594244" class="" style="" data-defaultitems="咨询项目服务;其他类服务" data-repeatcolumns="2"></div>
					</div>
					<div id="div452541" class="col-md-2"></div>
					<div id="div113006" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="title3" class="col-md-2">

						<span id="Label14" data-type="SheetLabel" data-datafield="Xmmc" style="" class="">项目名称</span>
					</div>
					<div id="control3" class="col-md-4">

						<input id="Control14" type="text" data-datafield="Xmmc" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectTask" data-querycode="TaskList" data-outputmappings="Xmmc:ProjectName,Xmbh:ProjectNum">
					</div>
					<div id="title4" class="col-md-2"></div>
					<div id="control4" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="title5" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="Xmbh" style="">项目编号</span>
					</div>
					<div id="control5" class="col-md-4">
						<input id="Control15" type="text" data-datafield="Xmbh" data-type="SheetTextBox" style="">
					</div>
					<div id="title6" class="col-md-2"></div>
					<div id="control6" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div442582" class="col-md-2">
						<span id="Label16" data-type="SheetLabel" data-datafield="Gzmc" style="" class="">工作名称</span>
					</div>
					<div id="div154830" class="col-md-4">
						<input id="Control16" type="text" data-datafield="Gzmc" data-type="SheetTextBox" style="" class="">
					</div>
					<div id="div913714" class="col-md-2"></div>
					<div id="div660472" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div748959" class="col-md-2">
						<label data-datafield="ZYjpj" data-type="SheetLabel" id="ctl847711" class="" style="">业绩评价</label>
					</div>
					<div id="div448135" class="col-md-10">
						<table id="ctl260895" data-datafield="ZYjpj" data-type="SheetGridView" class="SheetGridView" style="">
							<tbody>
								<tr class="header">
									<td id="ctl260895_SerialNo" class="rowSerialNo">序号</td>
									<td id="ctl260895_header0" data-datafield="ZYjpj.Xm" style=""><label id="ctl260895_Label0" data-datafield="ZYjpj.Xm" data-type="SheetLabel" style="">姓名</label></td>
									<td id="ctl260895_header1" data-datafield="ZYjpj.kssj" style=""><label id="ctl260895_Label1" data-datafield="ZYjpj.kssj" data-type="SheetLabel" style="">开始时间</label></td>
									<td id="ctl260895_header2" data-datafield="ZYjpj.Jssj" style=""><label id="ctl260895_Label2" data-datafield="ZYjpj.Jssj" data-type="SheetLabel" style="">结束时间</label></td>
									<td id="ctl260895_header3" data-datafield="ZYjpj.Gznr" style=""><label id="ctl260895_Label3" data-datafield="ZYjpj.Gznr" data-type="SheetLabel" style="">工作内容</label></td>
									<td id="ctl260895_header4" data-datafield="ZYjpj.Pj" style=""><label id="ctl260895_Label4" data-datafield="ZYjpj.Pj" data-type="SheetLabel" style="" class="">业绩评价</label></td>
									<td id="ctl260895_header5" data-datafield="ZYjpj.ExpertId" style="" class=""><label id="ctl260895_Label5" data-datafield="ZYjpj.ExpertId" data-type="SheetLabel" style="" class="">ExpertId</label></td>
									<td class="rowOption">删除</td>
								</tr>
								<tr class="template">
									<td></td>
									<td id="ctl260895_control0" data-datafield="ZYjpj.Xm" data-popupwindow="PopupWindow" data-schemacode="ExpertNomination" data-querycode="zjcx" data-outputmappings="ZYjpj.Xm:EName,ZYjpj.ExpertId:ObjectID" class="" style="width: 20%;"><input type="text" data-datafield="ZYjpj.Xm" data-type="SheetTextBox" id="ctl260895_control0" style="width: 80%;" class="" data-popupwindow="PopupWindow" data-schemacode="ExpertNomination" data-querycode="zjcx" data-outputmappings="ZYjpj.Xm:EName,ZYjpj.ExpertId:ObjectID"></td>
									<td id="ctl260895_control1" data-datafield="ZYjpj.kssj" style=""><input type="text" data-datafield="ZYjpj.kssj" data-type="SheetTime" id="ctl260895_control1" style=""></td>
									<td id="ctl260895_control2" data-datafield="ZYjpj.Jssj" style=""><input type="text" data-datafield="ZYjpj.Jssj" data-type="SheetTime" id="ctl260895_control2" style=""></td>
									<td id="ctl260895_control3" data-datafield="ZYjpj.Gznr" style="width: 20%;" class=""><input type="text" data-datafield="ZYjpj.Gznr" data-type="SheetTextBox" id="ctl260895_control3" style=""></td>
									<td id="ctl260895_control4" data-datafield="ZYjpj.Pj" style="width: 10%;" class=""><select data-datafield="ZYjpj.Pj" data-type="SheetDropDownList" id="ctl877644" class="" style="" data-defaultitems="优秀;良好;一般;差" data-queryable="false"></select></td>
									<td id="ctl260895_control5" data-datafield="ZYjpj.ExpertId" class="" style=""><input type="text" data-datafield="ZYjpj.ExpertId" data-type="SheetTextBox" id="ctl260895_control5" style=""></td>
									<td class="rowOption"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</asp:Content>