<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSMaterialsAcceptance.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SSMaterialsAcceptance" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">专项物资验收</label>
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
						<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
					</div>
					<div id="title2" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">申请部门</span>
					</div>
					<div id="control2" class="col-md-4">
						<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
					</div>
				</div><div class="row"><div id="div406131" class="col-md-2"><label data-datafield="Title" data-type="SheetLabel" id="ctl103762" class="" style="">标题</label></div><div id="div90463" class="col-md-10"><input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl542847" class="" style=""></div></div>
				<div class="row">
					<div id="div739625" class="col-md-2">
						<label data-datafield="SMaterials" data-type="SheetLabel" id="ctl969659" class="" style="">专项物资查询</label>
					</div>
					<div id="div420304" class="col-md-4">
						<input type="text" data-datafield="SMaterials" data-type="SheetTextBox" id="ctl259835" class="" style="" data-popupwindow="PopupWindow" data-schemacode="SpecialMaterials" data-querycode="zxwzcx" data-outputmappings="SMaterials:Title,SMId:ObjectID">
					</div>
					<div id="div879604" class="col-md-2"></div>
					<div id="div231225" class="col-md-4"></div>
				</div><div class="row"><div id="div1572" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="SMADetails" style="" class="">验收物资明细：</span></div><div id="div778393" class="col-md-10"><table id="Control13" data-datafield="SMADetails" data-type="SheetGridView" class="SheetGridView" data-displayadd="false" data-displaysummary="false">
							<tbody>

								<tr class="header">
									<td id="Control13_SerialNo" class="rowSerialNo">序号</td>
									<td id="Control13_Header3" data-datafield="SMADetails.Type" class="">
										
									<label data-datafield="SMADetails.MaterialName" data-type="SheetLabel" id="ctl340067" class="" style="">物资名称</label></td>
									<td id="Control13_Header4" data-datafield="SMADetails.MaterialName" class=""><label id="Control13_Label3" data-datafield="SMADetails.Type" data-type="SheetLabel" style="" class="">类别</label></td>
									<td id="Control13_Header5" data-datafield="SMADetails.Model">
										<label id="Control13_Label5" data-datafield="SMADetails.Model" data-type="SheetLabel" style="">规格型号</label>
									</td>
									<td id="Control13_Header6" data-datafield="SMADetails.Brand" class="">
										
									<label data-datafield="SMADetails.Note" data-type="SheetLabel" id="ctl648434" class="" style="">备注</label></td>
									<td id="Control13_Header7" data-datafield="SMADetails.Num" class="">
										<label id="Control13_Label7" data-datafield="SMADetails.Num" data-type="SheetLabel" style="">物资数量</label>
									</td>
									<td id="Control13_Header8" data-datafield="SMADetails.Price">
										<label id="Control13_Label8" data-datafield="SMADetails.Price" data-type="SheetLabel" style="">物资单价（元）</label>
									</td>
									<td id="Control13_Header9" data-datafield="SMADetails.Cost">
										<label id="Control13_Label9" data-datafield="SMADetails.Cost" data-type="SheetLabel" style="">本次费用（元）</label>
									</td>
									<td class="rowOption hidden">删除</td>
								</tr>
								<tr class="template">
									<td id="Control13_Option" class="rowOption"></td>
									<td data-datafield="SMADetails.Type" class=""><input type="text" data-datafield="SMADetails.MaterialName" onfocus="this.blur()" data-type="SheetTextBox" id="ctl229175" class="" style=""></td>
									<td data-datafield="SMADetails.MaterialName" class="" style="width: 8%;"><input onfocus="this.blur()" id="Control13_ctl3" type="text" data-datafield="SMADetails.Type" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="SMADetails.Model"><input onfocus="this.blur()" id="Control13_ctl5" type="text" data-datafield="SMADetails.Model" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="SMADetails.Brand"><input type="text" onfocus="this.blur()" data-datafield="SMADetails.Note" data-type="SheetTextBox" id="ctl910715" class="" style=""></td>
									<td data-datafield="SMADetails.Num" class="" style="width: 7%;"><input onfocus="this.blur()" id="Control13_ctl7" type="text" data-datafield="SMADetails.Num" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="SMADetails.Price" class="" style="width: 8%;"><input onfocus="this.blur()" id="Control13_ctl8" type="text" data-datafield="SMADetails.Price" data-type="SheetTextBox" style="" class=""></td>
									<td data-datafield="SMADetails.Cost" class="" style="width: 8%;"><input onfocus="this.blur()" id="Control13_ctl9" type="text" data-datafield="SMADetails.Cost" data-type="SheetTextBox" style="" class=""></td>
									<td class="rowOption hidden"><a class="delete">
											<div class="fa fa-minus"></div>
									</a> <a class="insert">
											<div class="fa fa-arrow-down"></div>
									</a></td>
								</tr>
								<tr class="footer">
									<td class="rowOption"></td>
									<td data-datafield="SMADetails.Type"></td>
									<td data-datafield="SMADetails.MaterialName"></td>
									<td data-datafield="SMADetails.Model"></td>
									<td data-datafield="SMADetails.Brand"></td>
									<td data-datafield="SMADetails.Num"><label id="Control13_stat7" data-datafield="SMADetails.Num" data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="SMADetails.Price"><label id="Control13_stat8" data-datafield="SMADetails.Price" data-type="SheetCountLabel" style=""></label></td>
									<td data-datafield="SMADetails.Cost"><label id="Control13_stat9" data-datafield="SMADetails.Cost" data-type="SheetCountLabel" style=""></label></td>
									<td class="rowOption hidden"></td>
								</tr>
							</tbody>
						</table></div></div>

				<div class="row"><div id="div161961" class="col-md-12"></div></div>
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
				</div>
				
				<div class="row">
					<div id="div306584" class="col-md-2">
						<label data-datafield="Related_items" data-type="SheetLabel" id="ctl621416" class="" style="">关联项目</label>
					</div>
					<div id="div505202" class="col-md-4">
						<input type="text" data-datafield="Related_items" data-type="SheetTextBox" id="ctl930291" class="" style="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="Related_items:ProjectNum">
					</div>
					<div id="div163890" class="col-md-2"></div>
					<div id="div985387" class="col-md-4"></div>
				</div>
				
				<div class="row">
					<div id="div45025" class="col-md-2">
						<label data-datafield="Attachment" data-type="SheetLabel" id="ctl404433" class="" style="">附件</label>
					</div>
					<div id="div920000" class="col-md-10">
						<div data-datafield="Attachment" data-type="SheetAttachment" id="ctl493051" class="" style=""></div>
					</div>
				</div>
				<div class="row hidden">
					<div id="title5" class="col-md-2">
						<span id="Label14" data-type="SheetLabel" data-datafield="SMId" style="">专项物资id</span>
					</div>
					<div id="control5" class="col-md-4">
						<input id="Control14" type="text" data-datafield="SMId" data-type="SheetTextBox" style="" class="" data-onchange="	var smid= $.MvcSheetUI.GetControlValue(&quot;SMId&quot;);
	var dtl = $.MvcSheetUI.GetElement(&quot;SMADetails&quot;).SheetGridView();
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
					 $.MvcSheetUI.SetControlValue(&quot;SMADetails.Type&quot;,
							term.Type, index + 1);
					 $.MvcSheetUI.SetControlValue(&quot;SMADetails.MaterialName&quot;,
					 		term.MaterialName, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMADetails.Model&quot;,
					 		term.Model, index + 1);
					 $.MvcSheetUI.SetControlValue(&quot;SMADetails.Note&quot;,
							term.Note, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMADetails.Num&quot;,
							term.Num, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMADetails.Price&quot;,
							term.Price, index + 1);
	                                 $.MvcSheetUI.SetControlValue(&quot;SMADetails.Cost&quot;,
							term.Cost, index + 1);
				})

			}
		}
	})">
					</div>
					<div id="space6" class="col-md-2"></div>
					<div id="spaceControl6" class="col-md-4"></div>
				</div>
				
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle">
					<label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
				</div>

				
				
				<div class="row">
					<div id="div905675" class="col-md-2">
						<label data-datafield="Ckgly" data-type="SheetLabel" id="ctl658830" class="" style="">仓库管理员意见</label>
					</div>
					<div id="div44050" class="col-md-10">
						<div data-datafield="Ckgly" data-type="SheetComment" id="ctl499150" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div614035" class="col-md-2">
						<label data-datafield="AcceptanceSuggess" data-type="SheetLabel" id="ctl384932" class="" style="">综合办行政验收人意见</label>
					</div>
					<div id="div980837" class="col-md-10">
						<div data-datafield="AcceptanceSuggess" data-type="SheetComment" id="ctl672972" class="" style=""></div>
					</div>
				</div>
				<div class="row">
					<div id="div304443" class="col-md-2">
						<label data-datafield="IntegratedOffice" data-type="SheetLabel" id="ctl970340" class="" style="">综合办主管意见</label>
					</div>
					<div id="div227580" class="col-md-10">
						<div data-datafield="IntegratedOffice" data-type="SheetComment" id="ctl216577" class="" style=""></div>
					</div>
				</div>
			</div>
		</div>
	</asp:Content>