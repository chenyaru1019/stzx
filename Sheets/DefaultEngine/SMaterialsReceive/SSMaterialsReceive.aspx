<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSMaterialsReceive.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SSMaterialsReceive" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">专项物资领用单</label>
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
						<span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="" class="">申请人：</span>
					</div>
					<div id="control1" class="col-md-4">
						<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
					</div>
					<div id="title2" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="" class="">所属部门：</span>
					</div>
					<div id="control2" class="col-md-4">
						<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
					</div>
				</div><div class="row"><div id="div809043" class="col-md-2"><label data-datafield="Title" data-type="SheetLabel" id="ctl574632" class="" style="">标题：</label></div><div id="div997124" class="col-md-10"><input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl416779" class="" style=""></div></div><div class="row"><div id="div479432" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="SMaterials" style="" class="">领用物资查询：</span></div><div id="div21544" class="col-md-8"><input id="Control13" type="text" data-datafield="SMaterials" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="SpecialMaterials" data-querycode="zxwzlycx" data-outputmappings="SMaterials:Title,SMId:ObjectID"></div><div id="div13909" class="col-md-2"></div></div>
				<div class="row"><div id="div547679" class="col-md-2"><label data-datafield="Receiver" data-type="SheetLabel" id="ctl898830" class="" style="">领料部门内业：</label></div><div id="div908232" class="col-md-4"><div data-datafield="Receiver" data-type="SheetUser" id="ctl805563" class="" style="" data-groupvisible="true" data-rootunitid="cc96c88d-5ef7-42dd-8113-178b454228ef"></div></div><div id="div237803" class="col-md-2"></div><div id="div734512" class="col-md-4"></div></div>
				<div class="row"><div id="div689062" class="col-md-12"><span id="Label14" data-type="SheetLabel" data-datafield="SMReceiveDetails" style="" class="">领用物资明细：</span></div></div><div class="row"><div id="div768985" class="col-md-12"><table id="Control14" data-datafield="SMReceiveDetails" data-type="SheetGridView" class="SheetGridView">
							<tbody>

								<tr class="header">
									<td id="Control14_SerialNo" class="rowSerialNo">序号</td>
									<td id="Control14_Header3" data-datafield="SMReceiveDetails.Type"><label id="Control14_Label3" data-datafield="SMReceiveDetails.Type" data-type="SheetLabel" style="">类别</label></td>
									<td id="Control14_Header4" data-datafield="SMReceiveDetails.MaterialName"><label id="Control14_Label4" data-datafield="SMReceiveDetails.MaterialName" data-type="SheetLabel" style="">物资名称</label></td>
									<td id="Control14_Header5" data-datafield="SMReceiveDetails.Model"><label id="Control14_Label5" data-datafield="SMReceiveDetails.Model" data-type="SheetLabel" style="">规格型号</label></td>
									<td id="Control14_Header6" data-datafield="SMReceiveDetails.Brand" class=""><label data-datafield="SMReceiveDetails.Note" data-type="SheetLabel" id="ctl647156" class="" style="">备注</label></td>
									<td id="Control14_Header7" data-datafield="SMReceiveDetails.Num"><label id="Control14_Label7" data-datafield="SMReceiveDetails.Num" data-type="SheetLabel" style="">领用物资数量</label></td>
									<td id="Control14_Header8" data-datafield="SMReceiveDetails.Price"><label id="Control14_Label8" data-datafield="SMReceiveDetails.Price" data-type="SheetLabel" style="">物资单价（元）</label></td>
									<td id="Control14_Header9" data-datafield="SMReceiveDetails.Cost"><label id="Control14_Label9" data-datafield="SMReceiveDetails.Cost" data-type="SheetLabel" style="">本次费用（元）</label></td>
									<td class="rowOption">删除</td>
								</tr>
								<tr class="template">
									<td id="Control14_Option" class="rowOption"></td> 
									<td data-datafield="SMReceiveDetails.Type"><input onfocus="this.blur()" id="Control14_ctl3" type="text" data-datafield="SMReceiveDetails.Type" data-type="SheetTextBox" style=""></td>
									<td data-datafield="SMReceiveDetails.MaterialName"><input onfocus="this.blur()" id="Control14_ctl4" type="text" data-datafield="SMReceiveDetails.MaterialName" data-type="SheetTextBox" style=""></td>
									<td data-datafield="SMReceiveDetails.Model"><input onfocus="this.blur()" id="Control14_ctl5" type="text" data-datafield="SMReceiveDetails.Model" data-type="SheetTextBox" style=""></td>
									<td data-datafield="SMReceiveDetails.Brand"><input type="text" data-datafield="SMReceiveDetails.Note" data-type="SheetTextBox" id="ctl353436" class="" style=""></td>
									<td data-datafield="SMReceiveDetails.Num"><input onfocus="this.blur()" id="Control14_ctl7" type="text" data-datafield="SMReceiveDetails.Num" data-type="SheetTextBox" style=""></td>
									<td data-datafield="SMReceiveDetails.Price"><input onfocus="this.blur()" id="Control14_ctl8" type="text" data-datafield="SMReceiveDetails.Price" data-type="SheetTextBox" style=""></td>
									<td data-datafield="SMReceiveDetails.Cost"><input onfocus="this.blur()" id="Control14_ctl9" type="text" data-datafield="SMReceiveDetails.Cost" data-type="SheetTextBox" style=""></td>
									<td class="rowOption"><a class="delete">
											<div class="fa fa-minus"></div>
									</a> <a class="insert">
											<div class="fa fa-arrow-down"></div>
									</a></td>
								</tr>
								<tr class="footer">
									<td class="rowOption"></td>
									<td data-datafield="SMReceiveDetails.Type"></td>
									<td data-datafield="SMReceiveDetails.MaterialName"></td>
									<td data-datafield="SMReceiveDetails.Model"></td>
									<td data-datafield="SMReceiveDetails.Brand"></td>
									<td data-datafield="SMReceiveDetails.Num"><label id="Control14_stat7" data-datafield="SMReceiveDetails.Num" data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="SMReceiveDetails.Price"><label id="Control14_stat8" data-datafield="SMReceiveDetails.Price" data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="SMReceiveDetails.Cost"><label id="Control14_stat9" data-datafield="SMReceiveDetails.Cost" data-type="SheetCountLabel" style=""></label></td>
									<td class="rowOption"></td>
								</tr>
							</tbody>
						</table></div></div>
				<div class="row hidden">
					<div id="title7" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="SMId" style="">专项物资id</span>
					</div>
					<div id="control7" class="col-md-4">
						<input id="Control15" type="text" data-datafield="SMId" data-type="SheetTextBox" style="" class="" data-onchange="var smid= $.MvcSheetUI.GetControlValue(&quot;SMId&quot;);
	var dtl = $.MvcSheetUI.GetElement(&quot;SMReceiveDetails&quot;).SheetGridView();
	dtl._Clear();
	$.MvcSheet.Action({
		Action : &quot;GetSpecialMaterials&quot;, // 后台方法名称
		Datas : [ smid], // 输入参数，格式 [&quot;{数据项名称}&quot;,&quot;String值&quot;,&quot;控件ID&quot;]，当包含数据项名称时 LoadControlValue必须为true
		LoadControlValue : true, // 是否获取表单数据
		PostSheetInfo : false, // 是否获取已经改变的表单数据
		OnActionDone : function(e) {
			if (e != null) {
				var result = e[0].Table;
				for (var i = 0; i < result.length; i++) {
					dtl._AddRow();
				}
				$.each(result, function(index, term) {
					//遍历，给子表赋值
					 $.MvcSheetUI.SetControlValue(&quot;SMReceiveDetails.Type&quot;,
							term.Type, index + 1);
					 $.MvcSheetUI.SetControlValue(&quot;SMReceiveDetails.MaterialName&quot;,
					 		term.MaterialName, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMReceiveDetails.Model&quot;,
					 		term.Model, index + 1);
					 $.MvcSheetUI.SetControlValue(&quot;SMReceiveDetails.Note&quot;,
							term.Note, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMReceiveDetails.Num&quot;,
							term.Num, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMReceiveDetails.Price&quot;,
							term.Price, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMReceiveDetails.Cost&quot;,
							term.Cost, index + 1);
				})

			}
		}
	})">
					</div>
					<div id="space8" class="col-md-2"></div>
					<div id="spaceControl8" class="col-md-4"></div>
				</div>
				
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
				</div>
				
				
				
				<div class="row">
					<div id="div621396" class="col-md-2">
						<label data-datafield="Related_items" data-type="SheetLabel" id="ctl8654" class="" style="">关联项目</label>
					</div>
					<div id="div105351" class="col-md-4">
						<input type="text" data-datafield="Related_items" data-type="SheetTextBox" id="ctl208797" class="" style="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="Related_items:ProjectNum">
					</div>
					<div id="div224255" class="col-md-2"></div>
					<div id="div620366" class="col-md-4"></div>
				</div>
				
				<div class="row">
					<div id="div602803" class="col-md-2">
						<label data-datafield="Attachment" data-type="SheetLabel" id="ctl264809" class="" style="">附件</label>
					</div>
					<div id="div163064" class="col-md-10">
						<div data-datafield="Attachment" data-type="SheetAttachment" id="ctl135336" class="" style=""></div>
					</div>
				</div>
				
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
				</div>
				
				
				<div class="row">
					<div id="div318383" class="col-md-2">
						<label data-datafield="DepartmentSuggess" data-type="SheetLabel" id="ctl118316" class="" style="">部门主管意见：</label>
					</div>
					<div id="div104732" class="col-md-10">
						<div data-datafield="DepartmentSuggess" data-type="SheetComment" id="ctl2948" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div428817" class="col-md-2">
						<label data-datafield="ConsumableAdmin" data-type="SheetLabel" id="ctl712880" class="" style="">办公用品管理员意见：</label>
					</div>
					<div id="div268896" class="col-md-10">
						<div data-datafield="ConsumableAdmin" data-type="SheetComment" id="ctl357284" class="" style=""></div>
					</div>
				</div>
			</div>
		</div>
	</asp:Content>