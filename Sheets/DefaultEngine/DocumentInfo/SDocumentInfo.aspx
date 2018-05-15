<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SDocumentInfo.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SDocumentInfo" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
     // 页面加载完成事件
        $.MvcSheet.Loaded = function (sheetInfo) {

         var DocumentView= $.MvcSheetUI.GetSheetDataItem("DocumentView").V; 
console.log(DocumentView);
console.log(h3url+DocumentView[0].Url);
}

</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">红头文件</label>
		</div>
		<div class="panel-body sheetContainer">
			<div class="nav-icon fa fa-chevron-right bannerTitle hidden">
				<label id="divBasicInfo" data-en_us="Basic information" class="">基本信息</label>
			</div>
			<div class="divContent">
				<div class="row hidden">
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
				<div class="row hidden">
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
				<label id="divSheetInfo" data-en_us="Sheet information" class="">红头文件信息</label>
			</div>
			<div class="divContent" id="divSheet">
				<div class="row">
					<div id="title1" class="col-md-2">
						<span id="Label11" data-type="SheetLabel" data-datafield="FileNum" style="">文件编号</span>
					</div>
					<div id="control1" class="col-md-4">
						<input id="Control11" type="text" data-datafield="FileNum" data-type="SheetTextBox" style="">
					</div>
					<div id="title2" class="col-md-2"></div>
					<div id="control2" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div877713" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="PostingDate" style="" class="">发文日期</span>
					</div>
					<div id="div153547" class="col-md-4">
						<input id="Control12" type="text" data-datafield="PostingDate" data-type="SheetTime" style="" class="" data-defaultvalue="">
					</div>
					<div id="div46743" class="col-md-2"></div>
					<div id="div609862" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="title3" class="col-md-2">
						<span id="Label13" data-type="SheetLabel" data-datafield="DraftDepartment" style="">拟稿部门</span>
					</div>
					<div id="control3" class="col-md-4">
						<input id="Control13" type="text" data-datafield="DraftDepartment" data-type="SheetTextBox" style="">
					</div>
					<div id="title4" class="col-md-2"></div>
					<div id="control4" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div168177" class="col-md-2">
						<span id="Label14" data-type="SheetLabel" data-datafield="FileName" style="" class="">文件名称</span>
					</div>
					<div id="div997387" class="col-md-4">
						<input id="Control14" type="text" data-datafield="FileName" data-type="SheetTextBox" style="" class="">
					</div>
					<div id="div553313" class="col-md-2"></div>
					<div id="div179558" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="title5" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="Num" style="">发放数量</span>
					</div>
					<div id="control5" class="col-md-4">
						<input id="Control15" type="text" data-datafield="Num" data-type="SheetTextBox" style="">
					</div>
					<div id="title6" class="col-md-2"></div>
					<div id="control6" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div200341" class="col-md-2">
						<span id="Label16" data-type="SheetLabel" data-datafield="DocumentStatus" style="" class="">公文状态</span>
					</div>
					<div id="div736321" class="col-md-4">
						<select data-datafield="DocumentStatus" data-type="SheetDropDownList" id="ctl358717" class="" style="" data-defaultitems="有效;无效"></select>
					</div>
					<div id="div406115" class="col-md-2"></div>
					<div id="div40404" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div382525" class="col-md-12">
						<div data-datafield="DocumentView" data-type="SheetOffice" id="ctl349159" class="" style="" data-template="Office/GW.doc" data-redtemplate="Office/GW.doc"></div>
					</div>
				</div><div class="row hidden"><div id="div286183" class="col-md-2"><label data-datafield="DownloadUrl" data-type="SheetLabel" id="ctl143078" class="" style="">红头文件地址</label></div><div id="div369965" class="col-md-10"><input type="text" data-datafield="DownloadUrl" data-type="SheetTextBox" id="ctl326023" class="" style=""></div></div>
				<div class="row">
					<div id="div349236" class="col-md-12">
						<label data-datafield="DistributionInfo" data-type="SheetLabel" id="ctl871596" class="" style="">红头文件发放情况</label>
					</div>
				</div>
				<div class="row">
					<div id="div972559" class="col-md-2">
						<label data-datafield="DistributionInfo" data-type="SheetLabel" id="ctl37049" class="" style="margin: 1px 2px 28px -2px; display: block;">已签收：</label>
					</div>
					<div id="div414359" class="col-md-10">
						<table id="ctl440469" data-datafield="DistributionInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0">
							<tbody>
								<tr class="header">
									<td id="ctl440469_SerialNo" class="rowSerialNo" style="width: 48px">序号</td>
									<td id="ctl440469_header0" data-datafield="DistributionInfo.Department" style=""><label id="ctl440469_Label0" data-datafield="DistributionInfo.Department" data-type="SheetLabel" style="">部门</label></td>
									<td id="ctl440469_header1" data-datafield="DistributionInfo.Receiver" style=""><label id="ctl440469_Label1" data-datafield="DistributionInfo.Receiver" data-type="SheetLabel" style="">签收人</label></td>
									<td id="ctl440469_header2" data-datafield="DistributionInfo.Status" style=""><label id="ctl440469_Label2" data-datafield="DistributionInfo.Status" data-type="SheetLabel" style="">签收状态</label></td>
									<td id="ctl440469_header3" data-datafield="DistributionInfo.ReceiptDate" style=""><label id="ctl440469_Label3" data-datafield="DistributionInfo.ReceiptDate" data-type="SheetLabel" style="">签收日期</label></td>
									<td class="rowOption hidden">删除</td>
								</tr>
								<tr class="template">
									<td class=""></td>
									<td id="ctl440469_control0" data-datafield="DistributionInfo.Department" style=""><input type="text" data-datafield="DistributionInfo.Department" data-type="SheetTextBox" id="ctl440469_control0" style="" class=""></td>
									<td id="ctl440469_control1" data-datafield="DistributionInfo.Receiver" style=""><input type="text" data-datafield="DistributionInfo.Receiver" data-type="SheetTextBox" id="ctl440469_control1" style=""></td>
									<td id="ctl440469_control2" data-datafield="DistributionInfo.Status" style=""><input type="text" data-datafield="DistributionInfo.Status" data-type="SheetTextBox" id="ctl440469_control2" style=""></td>
									<td id="ctl440469_control3" data-datafield="DistributionInfo.ReceiptDate" style=""><input type="text" data-datafield="DistributionInfo.ReceiptDate" data-type="SheetTime" id="ctl440469_control3" style=""></td>
									<td class="rowOption hidden"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="row">
					<div id="div902691" class="col-md-2">
						<label data-datafield="WQS" data-type="SheetLabel" id="ctl117337" class="" style="">未签收：</label>
					</div>
					<div id="div534272" class="col-md-10">
						<table id="ctl642029" data-datafield="WQS" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0">
							<tbody>
								<tr class="header">
									<td id="ctl642029_SerialNo" class="rowSerialNo hidden">序号</td>
									<td id="ctl642029_header0" data-datafield="WQS.Department" style="" class="hidden"><label id="ctl642029_Label0" data-datafield="WQS.Department" data-type="SheetLabel" style="" class="">签收部门</label></td>
									<td id="ctl642029_header1" data-datafield="WQS.Receiver" style="" class="hidden"><label id="ctl642029_Label1" data-datafield="WQS.Receiver" data-type="SheetLabel" style="">签收人</label></td>
									<td id="ctl642029_header2" data-datafield="WQS.ReceiptDate" style="" class="hidden"><label data-datafield="WQS.Status" data-type="SheetLabel" id="ctl917750" class="" style="">签收状态</label></td>
									<td id="ctl642029_header3" data-datafield="WQS.Status" style="" class="hidden"><label data-datafield="WQS.ReceiptDate" data-type="SheetLabel" id="ctl385511" class="" style="">签收日期</label></td>
									<td class="rowOption hidden">删除</td>
								</tr>
								<tr class="template">
									<td class="" style="width: 6%;"></td>
									<td id="ctl642029_control0" data-datafield="WQS.Department" style="" class=""><input type="text" data-datafield="WQS.Department" data-type="SheetTextBox" id="ctl642029_control0" style=""></td>
									<td id="ctl642029_control1" data-datafield="WQS.Receiver" style="" class=""><input type="text" data-datafield="WQS.Receiver" data-type="SheetTextBox" id="ctl642029_control1" style=""></td>
									<td id="ctl642029_control2" data-datafield="WQS.ReceiptDate" style="" class=""><input type="text" data-datafield="WQS.Status" data-type="SheetTextBox" id="ctl986003" class="" style=""></td>
									<td id="ctl642029_control3" data-datafield="WQS.Status" style="" class=""><input type="text" data-datafield="RecyclingInfo.ReceiptDate" data-type="SheetTime" id="ctl425050" class="" style=""></td>
									<td class="rowOption hidden" style="width: 7%;"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>



				<div class="row">
					<div id="div611168" class="col-md-12">
						<span id="ctl478339" data-type="SheetLabel" data-datafield="DistributionInfo" style="" class="">-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</span>
					</div>
				</div>
				<div class="row">
					<div id="div180586" class="col-md-2">
						<label data-datafield="RecyclingInfo" data-type="SheetLabel" id="ctl26268" class="" style="">回收情况</label>
					</div>
					<div id="div85430" class="col-md-10">
						<table id="ctl549028" data-datafield="RecyclingInfo" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0" data-displayadd="false">
							<tbody>
								<tr class="header">
									<td id="ctl549028_SerialNo" class="rowSerialNo">序号</td>
									<td id="ctl549028_header0" data-datafield="RecyclingInfo.Department" style=""><label id="ctl549028_Label0" data-datafield="RecyclingInfo.Department" data-type="SheetLabel" style="">部门</label></td>
									<td id="ctl549028_header1" data-datafield="RecyclingInfo.RecyclingStatus" style=""><label id="ctl549028_Label1" data-datafield="RecyclingInfo.RecyclingStatus" data-type="SheetLabel" style="">回收情况</label></td>
									<td id="ctl549028_header2" data-datafield="RecyclingInfo.Receiver" style=""><label id="ctl549028_Label2" data-datafield="RecyclingInfo.Receiver" data-type="SheetLabel" style="">签收人</label></td>
									<td id="ctl549028_header3" data-datafield="RecyclingInfo.ReceiptDate" style=""><label id="ctl549028_Label3" data-datafield="RecyclingInfo.ReceiptDate" data-type="SheetLabel" style="">日期</label></td>
									<td class="rowOption hidden">删除</td>
								</tr>
								<tr class="template">
									<td class=""></td>
									<td id="ctl549028_control0" data-datafield="RecyclingInfo.Department" style=""><input type="text" data-datafield="RecyclingInfo.Department" data-type="SheetTextBox" id="ctl549028_control0" style=""></td>
									<td id="ctl549028_control1" data-datafield="RecyclingInfo.RecyclingStatus" style=""><input type="text" data-datafield="RecyclingInfo.RecyclingStatus" data-type="SheetTextBox" id="ctl549028_control1" style=""></td>
									<td id="ctl549028_control2" data-datafield="RecyclingInfo.Receiver" style=""><input type="text" data-datafield="RecyclingInfo.Receiver" data-type="SheetTextBox" id="ctl549028_control2" style=""></td>
									<td id="ctl549028_control3" data-datafield="RecyclingInfo.ReceiptDate" style=""><input type="text" data-datafield="RecyclingInfo.ReceiptDate" data-type="SheetTime" id="ctl549028_control3" style=""></td>
									<td class="rowOption hidden"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><div class="row"><div id="div483452" class="col-md-2"><label data-datafield="RecyclingNotSignInfo" data-type="SheetLabel" id="ctl522893" class="" style="">未签收</label></div><div id="div529991" class="col-md-10"><table id="ctl869491" data-datafield="RecyclingNotSignInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0"><tbody><tr class="header"><td id="ctl869491_SerialNo" class="rowSerialNo hidden">序号</td><td id="ctl869491_header0" data-datafield="RecyclingNotSignInfo.Department" style="" class="hidden"><label id="ctl869491_Label0" data-datafield="RecyclingNotSignInfo.Department" data-type="SheetLabel" style="">部门</label></td><td id="ctl869491_header1" data-datafield="RecyclingNotSignInfo.RecyclingStatus" style="" class="hidden"><label id="ctl869491_Label1" data-datafield="RecyclingNotSignInfo.RecyclingStatus" data-type="SheetLabel" style="">回收情况</label></td><td id="ctl869491_header2" data-datafield="RecyclingNotSignInfo.Receiver" style="" class="hidden"><label id="ctl869491_Label2" data-datafield="RecyclingNotSignInfo.Receiver" data-type="SheetLabel" style="">签收人</label></td><td id="ctl869491_header3" data-datafield="RecyclingNotSignInfo.ReceiptDate" style="" class="hidden"><label id="ctl869491_Label3" data-datafield="RecyclingNotSignInfo.ReceiptDate" data-type="SheetLabel" style="">签收日期</label></td><td class="rowOption hidden">删除</td></tr><tr class="template"><td class="" style="width: 7%;"></td><td id="ctl869491_control0" data-datafield="RecyclingNotSignInfo.Department" style=""><input type="text" data-datafield="RecyclingNotSignInfo.Department" data-type="SheetTextBox" id="ctl869491_control0" style=""></td><td id="ctl869491_control1" data-datafield="RecyclingNotSignInfo.RecyclingStatus" style=""><input type="text" data-datafield="RecyclingNotSignInfo.RecyclingStatus" data-type="SheetTextBox" id="ctl869491_control1" style=""></td><td id="ctl869491_control2" data-datafield="RecyclingNotSignInfo.Receiver" style=""><input type="text" data-datafield="RecyclingNotSignInfo.Receiver" data-type="SheetTextBox" id="ctl869491_control2" style=""></td><td id="ctl869491_control3" data-datafield="RecyclingNotSignInfo.ReceiptDate" style=""><input type="text" data-datafield="RecyclingNotSignInfo.ReceiptDate" data-type="SheetTime" id="ctl869491_control3" style=""></td><td class="rowOption hidden" style="width: 7%;"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr></tbody></table></div></div>
			</div>
		</div>
	</asp:Content>