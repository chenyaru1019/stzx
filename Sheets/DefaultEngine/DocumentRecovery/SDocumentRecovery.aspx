<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SDocumentRecovery.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SDocumentRecovery" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">公文回收</label>
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
					<span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">经办人</span>
				</div>
				<div id="control1" class="col-md-4">
					<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
				</div>
				<div id="title2" class="col-md-2">
				</div>
				<div id="control2" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="div564153" class="col-md-2">
					<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="" class="">所属部门</span>
				</div>
				<div id="div178328" class="col-md-4">
					<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
				</div>
				<div id="div135791" class="col-md-2">
				</div>
				<div id="div492955" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="title3" class="col-md-2">
					<span id="Label13" data-type="SheetLabel" data-datafield="FileNum" style="">文件编号</span>
				</div>
				<div id="control3" class="col-md-4">
					<input id="Control13" type="text" data-datafield="FileNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="DocumentInfo" data-querycode="gwcxlb" data-outputmappings="FileNum:FileNum,GWObjectId:ObjectID,FileName:FileName,PostingDate:PostingDate,ReleaseNum:Num">
				</div>
				<div id="title4" class="col-md-2">
				</div>
				<div id="control4" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="div424490" class="col-md-2">
					<span id="Label14" data-type="SheetLabel" data-datafield="FileName" style="" class="">文件名称</span>
				</div>
				<div id="div183595" class="col-md-10">
					<input id="Control14" type="text" data-datafield="FileName" data-type="SheetTextBox" style="" class="" data-onchange="	var gwid = $.MvcSheetUI.GetControlValue(&quot;GWObjectId&quot;);
	$.MvcSheetUI.GetElement(&quot;RecycleInfo&quot;).SheetGridView()._Clear();

	$.MvcSheetUI.GetElement(&quot;NotSigned&quot;).SheetGridView()._Clear();

	$.MvcSheet.Action({
		Action : &quot;GetDocumentSigned&quot;, // 后台方法名称
		Datas : [ gwid ], // 输入参数，格式 [&quot;{数据项名称}&quot;,&quot;String值&quot;,&quot;控件ID&quot;]，当包含数据项名称时 LoadControlValue必须为true
		LoadControlValue : true, // 是否获取表单数据
		PostSheetInfo : false, // 是否获取已经改变的表单数据
		OnActionDone : function(e) {
			if (e != null) {
				var result = e[0].Table;
				var dtl = $.MvcSheetUI.GetElement(&quot;RecycleInfo&quot;)
						.SheetGridView();
				for (var i = 0; i < result.length; i++) {
					dtl._AddRow();
				}
				$.each(result, function(index, term) {
					//遍历，给子表赋值
					$.MvcSheetUI.SetControlValue(&quot;RecycleInfo.Depart&quot;,
							term.Department, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;RecycleInfo.Receiver&quot;,
							term.Receiver, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;RecycleInfo.Status&quot;, &quot;已签收&quot;,
							index + 1);
					$.MvcSheetUI.SetControlValue(&quot;RecycleInfo.ReceiptDate&quot;,
							term.ReceiptDate, index + 1);

				})
			}
		}
	})

	$.MvcSheet.Action({
		Action : &quot;GetDocumentNotSigned&quot;, // 后台方法名称
		Datas : [ gwid ], // 输入参数，格式 [&quot;{数据项名称}&quot;,&quot;String值&quot;,&quot;控件ID&quot;]，当包含数据项名称时 LoadControlValue必须为true
		LoadControlValue : true, // 是否获取表单数据
		PostSheetInfo : false, // 是否获取已经改变的表单数据
		OnActionDone : function(e) {
			if (e != null) {
				var result = e[0].Table;
				var dtl = $.MvcSheetUI.GetElement(&quot;NotSigned&quot;).SheetGridView();
				for (var i = 0; i < result.length; i++) {
					dtl._AddRow();
				}
				$.each(result, function(index, term) {
					//遍历，给子表赋值
					$.MvcSheetUI.SetControlValue(&quot;NotSigned.Depart&quot;,
							term.Department, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;NotSigned.Receiver&quot;,
							term.Receiver, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;NotSigned.Status&quot;, &quot;未签收&quot;,
							index + 1);

				})
			}
		}
	})">
				</div>
			</div>
			<div class="row">
				<div id="title5" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="PostingDate" style="">发文日期</span>
				</div>
				<div id="control5" class="col-md-4">
					<input id="Control15" type="text" data-datafield="PostingDate" data-type="SheetTime" style="">
				</div>
				<div id="title6" class="col-md-2">
				</div>
				<div id="control6" class="col-md-4">
				</div>
			</div>
			<div class="row">
				<div id="div456470" class="col-md-2">
					<span id="Label16" data-type="SheetLabel" data-datafield="ReleaseNum" style="" class="">发放数量</span>
				</div>
				<div id="div504305" class="col-md-4">
					<input id="Control16" type="text" data-datafield="ReleaseNum" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="div658589" class="col-md-2">
				</div>
				<div id="div974620" class="col-md-4">
				</div>
			</div><div class="row"><div id="div954108" class="col-md-2"><label data-datafield="GWObjectId" data-type="SheetLabel" id="ctl935752" class="" style="">公文id</label></div><div id="div584158" class="col-md-4"><input type="text" data-datafield="GWObjectId" data-type="SheetTextBox" id="ctl78" class="" style=""></div><div id="div162575" class="col-md-2"></div><div id="div689297" class="col-md-4"></div></div>
			<div class="row tableContent">
				<div id="title7" class="col-md-2">
					<span id="Label17" data-type="SheetLabel" data-datafield="RecycleInfo" style="" class="">发放已签收</span>
				</div>
				<div id="control7" class="col-md-10">
					<table id="Control17" data-datafield="RecycleInfo" data-type="SheetGridView" class="SheetGridView" data-displayadd="false" data-defaultrowcount="0">
						<tbody>
							
							<tr class="header">
								<td id="Control17_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control17_Header3" data-datafield="RecycleInfo.Depart">
									<label id="Control17_Label3" data-datafield="RecycleInfo.Depart" data-type="SheetLabel" style="">部门</label>
								</td>
								<td id="Control17_Header4" data-datafield="RecycleInfo.Receiver">
									<label id="Control17_Label4" data-datafield="RecycleInfo.Receiver" data-type="SheetLabel" style="">签收人</label>
								</td>
								<td id="Control17_Header5" data-datafield="RecycleInfo.Status">
									<label id="Control17_Label5" data-datafield="RecycleInfo.Status" data-type="SheetLabel" style="">签收状态</label>
								</td>
								<td id="Control17_Header6" data-datafield="RecycleInfo.ReceiptDate">
									<label id="Control17_Label6" data-datafield="RecycleInfo.ReceiptDate" data-type="SheetLabel" style="">签收日期</label>
								</td>
								<td id="Control17_Header7" data-datafield="RecycleInfo.Recycling">
									<label id="Control17_Label7" data-datafield="RecycleInfo.Recycling" data-type="SheetLabel" style="">回收情况</label>
								</td>
								<td id="Control17_Header8" data-datafield="RecycleInfo.RecycleReceiver">
									<label id="Control17_Label8" data-datafield="RecycleInfo.RecycleReceiver" data-type="SheetLabel" style="">签收人</label>
								</td>
								<td id="Control17_Header9" data-datafield="RecycleInfo.RecycleDate">
									<label id="Control17_Label9" data-datafield="RecycleInfo.RecycleDate" data-type="SheetLabel" style="">回收日期</label>
								</td>
								<td class="rowOption hidden">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control17_Option" class="rowOption">
								</td>
								<td data-datafield="RecycleInfo.Depart">
									<input id="Control17_ctl3" type="text" data-datafield="RecycleInfo.Depart" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="RecycleInfo.Receiver">
									<input id="Control17_ctl4" type="text" data-datafield="RecycleInfo.Receiver" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="RecycleInfo.Status">
									<input id="Control17_ctl5" type="text" data-datafield="RecycleInfo.Status" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="RecycleInfo.ReceiptDate">
									<input id="Control17_ctl6" type="text" data-datafield="RecycleInfo.ReceiptDate" data-type="SheetTime" class="" style="" data-defaultvalue="">
								</td>
								<td data-datafield="RecycleInfo.Recycling">
									<input id="Control17_ctl7" type="text" data-datafield="RecycleInfo.Recycling" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="RecycleInfo.RecycleReceiver">
									<input id="Control17_ctl8" type="text" data-datafield="RecycleInfo.RecycleReceiver" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="RecycleInfo.RecycleDate">
									<input id="Control17_ctl9" type="text" data-datafield="RecycleInfo.RecycleDate" data-type="SheetTime" style="" class="" data-defaultvalue="">
								</td>
								<td class="rowOption hidden">
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
								<td data-datafield="RecycleInfo.Depart">
								</td>
								<td data-datafield="RecycleInfo.Receiver">
								</td>
								<td data-datafield="RecycleInfo.Status">
								</td>
								<td data-datafield="RecycleInfo.ReceiptDate">
								</td>
								<td data-datafield="RecycleInfo.Recycling">
								</td>
								<td data-datafield="RecycleInfo.RecycleReceiver">
								</td>
								<td data-datafield="RecycleInfo.RecycleDate">
								</td>
								<td class="rowOption hidden">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div><div class="row"><div id="div596972" class="col-md-2"><label data-datafield="NotSigned" data-type="SheetLabel" id="ctl720496" class="" style="">发放未签收</label></div><div id="div256188" class="col-md-10"><table id="ctl58251" data-datafield="NotSigned" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0"><tbody><tr class="header"><td id="ctl58251_SerialNo" class="rowSerialNo hidden">序号</td><td id="ctl58251_header0" data-datafield="NotSigned.Depart" style="" class="hidden"><label id="ctl58251_Label0" data-datafield="NotSigned.Depart" data-type="SheetLabel" style="">部门</label></td><td id="ctl58251_header1" data-datafield="NotSigned.Receiver" style="" class="hidden"><label id="ctl58251_Label1" data-datafield="NotSigned.Receiver" data-type="SheetLabel" style="">签收人</label></td><td id="ctl58251_header2" data-datafield="NotSigned.Status" style="" class="hidden"><label id="ctl58251_Label2" data-datafield="NotSigned.Status" data-type="SheetLabel" style="">签收状态</label></td><td id="ctl58251_header3" data-datafield="NotSigned.ReceiptDate" style="" class="hidden"><label id="ctl58251_Label3" data-datafield="NotSigned.ReceiptDate" data-type="SheetLabel" style="">签收日期</label></td><td id="ctl58251_header4" data-datafield="NotSigned.Recycling" style="" class="hidden"><label id="ctl58251_Label4" data-datafield="NotSigned.Recycling" data-type="SheetLabel" style="">回收情况</label></td><td id="ctl58251_header5" data-datafield="NotSigned.RecycleReceiver" style="" class="hidden"><label id="ctl58251_Label5" data-datafield="NotSigned.RecycleReceiver" data-type="SheetLabel" style="">签收人</label></td><td id="ctl58251_header6" data-datafield="NotSigned.RecycleDate" style="" class="hidden"><label id="ctl58251_Label6" data-datafield="NotSigned.RecycleDate" data-type="SheetLabel" style="">签收日期</label></td><td class="rowOption hidden">删除</td></tr><tr class="template"><td class="" style="width: 7%;"></td><td id="ctl58251_control0" data-datafield="NotSigned.Depart" style="" class=""><input type="text" data-datafield="NotSigned.Depart" data-type="SheetTextBox" id="ctl58251_control0" style="" class=""></td><td id="ctl58251_control1" data-datafield="NotSigned.Receiver" style=""><input type="text" data-datafield="NotSigned.Receiver" data-type="SheetTextBox" id="ctl58251_control1" style=""></td><td id="ctl58251_control2" data-datafield="NotSigned.Status" style=""><input type="text" data-datafield="NotSigned.Status" data-type="SheetTextBox" id="ctl58251_control2" style=""></td><td id="ctl58251_control3" data-datafield="NotSigned.ReceiptDate" style="" class="" data-defaultvalue=""><input type="text" data-datafield="NotSigned.ReceiptDate" data-type="SheetTime" id="ctl58251_control3" style="" class="" data-defaultvalue=""></td><td id="ctl58251_control4" data-datafield="NotSigned.Recycling" style=""><input type="text" data-datafield="NotSigned.Recycling" data-type="SheetTextBox" id="ctl58251_control4" style=""></td><td id="ctl58251_control5" data-datafield="NotSigned.RecycleReceiver" style=""><input type="text" data-datafield="NotSigned.RecycleReceiver" data-type="SheetTextBox" id="ctl58251_control5" style=""></td><td id="ctl58251_control6" data-datafield="NotSigned.RecycleDate" style="" data-defaultvalue=""><input type="text" data-datafield="NotSigned.RecycleDate" data-type="SheetTime" id="ctl58251_control6" style="" class="" data-defaultvalue=""></td><td class="rowOption hidden"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr></tbody></table></div></div>
		</div>
	</div>
</asp:Content>