<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SDocumentVoid.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SDocumentVoid" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
	$.MvcSheet.PreInit = function() {
		$('#Control11').attr("disabled", true); //设置经办人和所属部门无法修改
		$('#Control12').attr("disabled", true);


		$("<span style='color:#F00' >*</span>").appendTo('#Label13');

		var ReleaseSituation = $.MvcSheetUI.GetControlValue("ReleaseSituation");
		if (ReleaseSituation == "已下发") {
			$("#yff").find('.row').css('display', 'block');
			$("#yff").css('display', 'block');

		} else {

			$("#yff ").find('.row').css('display', 'none');
			$.MvcSheetUI.SetControlValue("ReleaseNum", 0);
			$.MvcSheetUI.SetControlValue("AfterVoid", '');
			$.MvcSheetUI.SetControlValue("RecallNum", 0);

		}
	};
</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">公文作废</label>
		</div>
		<div class="panel-body sheetContainer">
			<div class="nav-icon fa fa-chevron-right bannerTitle">
				<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
			</div>
			<div class="divContent">
				<div class="row">
					<div id="divFullNameTitle" class="col-md-2">
						<label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="" class="">发起人：</label>
					</div>
					<div id="divFullName" class="col-md-4">
						<label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>
					</div>
					<div id="divOriginateDateTitle" class="col-md-2">
						<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="" class="">发起时间：</label>
					</div>
					<div id="divOriginateDate" class="col-md-4">
						<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>
					</div>
				</div>
				<div class="row">
					<div id="divOriginateOUNameTitle" class="col-md-2">
						<label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" style="" class="">所属组织：</label>
					</div>
					<div id="divOriginateOUName" class="col-md-4">
						<!--					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">
<span class="OnlyDesigner">Originator.OUName</span>
					</label>-->
						<select data-datafield="Originator.OUName" data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class="" style="">
						</select>
					</div>
					<div id="divSequenceNoTitle" class="col-md-2">
						<label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="" class="">流水号：</label>
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
						<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.UserName}" style="">
					</div>
					<div id="title2" class="col-md-2">
						
					</div>
					<div id="control2" class="col-md-4">
						
					</div>
				</div><div class="row"><div id="div451375" class="col-md-2"><span id="Label12" data-type="SheetLabel" data-datafield="Department" style="" class="">所属部门：</span></div><div id="div40176" class="col-md-4"><input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.OUName}" style=""></div><div id="div38765" class="col-md-2"></div><div id="div109461" class="col-md-4"></div></div>
				<div class="row">
					<div id="title3" class="col-md-2">
						<span id="Label13" data-type="SheetLabel" data-datafield="FileNumber" style="" class="">文件号：</span>
					</div>
					<div id="control3" class="col-md-4">
						<input id="Control13" type="text" data-datafield="FileNumber" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="DocumentInfo" data-querycode="gwzf" data-outputmappings="FileNumber:FileNum,GWId:ObjectID,ReleaseNum:Num,DocumentName:FileName" data-inputmappings="有效:DocumentStatus">
					</div>
					<div id="title4" class="col-md-2"></div>
					<div id="control4" class="col-md-4"></div>
				</div><div class="row hidden"><div id="div950962" class="col-md-2"><label data-datafield="GWId" data-type="SheetLabel" id="ctl292865" class="" style="">GWId</label></div><div id="div632068" class="col-md-4"><input type="text" data-datafield="GWId" data-type="SheetTextBox" id="ctl832169" class="" style=""></div><div id="div964766" class="col-md-2"></div><div id="div29333" class="col-md-4"></div></div><div class="row"><div id="div876857" class="col-md-2"><label data-datafield="DocumentName" data-type="SheetLabel" id="ctl339429" class="" style="">文件名称</label></div><div id="div315038" class="col-md-10"><input type="text" data-datafield="DocumentName" data-type="SheetTextBox" id="ctl747243" class="" style="" data-onchange="	var gwid = $.MvcSheetUI.GetControlValue(&quot;GWId&quot;);
	$.MvcSheetUI.GetElement(&quot;SignUpInfo&quot;).SheetGridView()._Clear();

	$.MvcSheetUI.GetElement(&quot;NotSignUpInfo&quot;).SheetGridView()._Clear();

	$.MvcSheet.Action({
		Action : &quot;GetDocumentSigned&quot;, // 后台方法名称
		Datas : [ gwid ], // 输入参数，格式 [&quot;{数据项名称}&quot;,&quot;String值&quot;,&quot;控件ID&quot;]，当包含数据项名称时 LoadControlValue必须为true
		LoadControlValue : true, // 是否获取表单数据
		PostSheetInfo : false, // 是否获取已经改变的表单数据
		OnActionDone : function(e) {
			if (e != null) {
				var result = e[0].Table;
				var dtl = $.MvcSheetUI.GetElement(&quot;SignUpInfo&quot;)
						.SheetGridView();
				for (var i = 0; i < result.length; i++) {
					dtl._AddRow();
				}
				$.each(result, function(index, term) {
					//遍历，给子表赋值
					$.MvcSheetUI.SetControlValue(&quot;SignUpInfo.SignDepartment&quot;,
							term.Department, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;SignUpInfo.Receiver&quot;,
							term.Receiver, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;SignUpInfo.Status&quot;, &quot;已签收&quot;,
							index + 1);
					$.MvcSheetUI.SetControlValue(&quot;SignUpInfo.ReceiptDate&quot;,
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
				var dtl = $.MvcSheetUI.GetElement(&quot;NotSignUpInfo&quot;).SheetGridView();
				for (var i = 0; i < result.length; i++) {
					dtl._AddRow();
				}
				$.each(result, function(index, term) {
					//遍历，给子表赋值
				$.MvcSheetUI.SetControlValue(&quot;NotSignUpInfo.SignDepartment&quot;,
							term.Department, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;NotSignUpInfo.Receiver&quot;,
							term.Receiver, index + 1);
					$.MvcSheetUI.SetControlValue(&quot;NotSignUpInfo.Status&quot;, &quot;未签收&quot;,
							index + 1);

				})
			}
		}
	})"></div></div>
				<div class="row">
					<div id="div2463" class="col-md-2">
						<span id="Label14" data-type="SheetLabel" data-datafield="ProductionNum" class="" style="">制作份数：</span>
					</div>
					<div id="div681875" class="col-md-4">
						<input id="Control14" type="text" data-datafield="ProductionNum" data-type="SheetTextBox" class="" data-regularexpression="/^[0-9]\d*$/" data-regularinvalidtext="请输入正确数量！" style="">
					</div>
					<div id="div378173" class="col-md-2"></div>
					<div id="div188818" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div681395" class="col-md-2">
						<span id="Label16" data-type="SheetLabel" data-datafield="ReleaseSituation" class="" style="">发放情况：</span>
					</div>
					<div id="div742526" class="col-md-4">
						<div data-datafield="ReleaseSituation" data-type="SheetRadioButtonList" id="ctl550930" class="" data-defaultitems="已下发;未下发" data-onchange="var ReleaseSituation  =  $.MvcSheetUI.GetControlValue(&quot;ReleaseSituation&quot;);  
if(ReleaseSituation  ==&quot;已下发&quot;){
console.log('已发放')
$(&quot;#yff&quot;).find('.row').css('display','block');   
$(&quot;#yff&quot;).css('display','block');   

}else{
console.log('未下发')
    $(&quot;#yff &quot;).find('.row').css('display','none');    
    $.MvcSheetUI.SetControlValue(&quot;ReleaseNum&quot;,0);  
    $.MvcSheetUI.SetControlValue(&quot;AfterVoid&quot;,''); 
    $.MvcSheetUI.SetControlValue(&quot;RecallNum&quot;,0); 

}" style=""></div>
					</div>
					<div id="div749320" class="col-md-2"></div>
					<div id="div720238" class="col-md-4"></div>
				</div>
				
			
				<div id="yff" style="display:none;">
					
				<div class="row">
					<div id="div109021" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="ReleaseNum" class="" style="">发放份数</span>
					</div>
					<div id="div568466" class="col-md-4">

						<input id="Control15" type="text" data-datafield="ReleaseNum" data-type="SheetTextBox" class="" data-regularexpression="/^[0-9]\d*$/" data-regularinvalidtext="请输入正确数量！" style="">
					</div>
					<div id="div186982" class="col-md-2"></div>
					<div id="div736752" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div541256" class="col-md-2">
						<span id="Label17" data-type="SheetLabel" data-datafield="AfterVoid" class="" style="">作废后情况</span>
					</div>
					<div id="div774112" class="col-md-4">
						<div data-datafield="AfterVoid" data-type="SheetRadioButtonList" id="ctl861987" class="" data-defaultitems="保留;销毁" data-defaultselected="false" style=""></div>
					</div>
					<div id="div868022" class="col-md-2"></div>
					<div id="div443867" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div222291" class="col-md-2">

						<span id="Label22" data-type="SheetLabel" data-datafield="RecallNum" class="" style="">召回份数</span>
					</div>
					<div id="div180671" class="col-md-4">

						<input id="Control22" type="text" data-datafield="RecallNum" data-type="SheetTextBox" class="" data-regularexpression="/^[0-9]\d*$/" data-regularinvalidtext="请输入正确数量！" style="">
					</div>
					<div id="div750431" class="col-md-2"></div>
					<div id="div622048" class="col-md-4"></div>
				</div>
				
				</div>
				
				<div class="row">
					<div id="div444188" class="col-md-2">
						<span id="Label18" data-type="SheetLabel" data-datafield="VoidDate" class="" style="">作废日期：</span>
					</div>
					<div id="div371873" class="col-md-4">
						<input id="Control18" type="text" data-datafield="VoidDate" data-type="SheetTime" class="" data-defaultvalue="" style="">
					</div>
					<div id="div194646" class="col-md-2"></div>
					<div id="div820590" class="col-md-4"></div>
				</div><div class="row"><div id="div152912" class="col-md-2"><label data-datafield="Receivers" data-type="SheetLabel" id="ctl840141" class="" style="">回收确认对象</label></div><div id="div491225" class="col-md-4"><div data-datafield="Receivers" data-type="SheetUser" id="ctl534594" class="" style=""></div></div><div id="div35657" class="col-md-2"></div><div id="div742398" class="col-md-4"></div></div>

				<div class="row tableContent">
					<div id="title9" class="col-md-2">
						<span id="Label19" data-type="SheetLabel" data-datafield="VoidReason" style="" class="">作废原因：</span>
					</div>
					<div id="control9" class="col-md-10">
						<textarea id="Control19" data-datafield="VoidReason" data-type="SheetRichTextBox" style="">					</textarea>
					</div>
				</div><div class="row"><div id="div887390" class="col-md-2"><label data-datafield="SignUpInfo" data-type="SheetLabel" id="ctl634298" class="" style="">公文已签收</label></div><div id="div572096" class="col-md-10"><table id="ctl742950" data-datafield="SignUpInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false"><tbody><tr class="header"><td id="ctl742950_SerialNo" class="rowSerialNo">序号</td><td id="ctl742950_header0" data-datafield="SignUpInfo.SignDepartment" style="" class=""><label id="ctl742950_Label0" data-datafield="SignUpInfo.SignDepartment" data-type="SheetLabel" style="">签收部门</label></td><td id="ctl742950_header1" data-datafield="SignUpInfo.Receiver" style="" class=""><label id="ctl742950_Label1" data-datafield="SignUpInfo.Receiver" data-type="SheetLabel" style="">签收人</label></td><td id="ctl742950_header2" data-datafield="SignUpInfo.Status" style="" class=""><label id="ctl742950_Label2" data-datafield="SignUpInfo.Status" data-type="SheetLabel" style="" class="">签收状态</label></td><td id="ctl742950_header3" data-datafield="SignUpInfo.ReceiptDate" style=""><label id="ctl742950_Label3" data-datafield="SignUpInfo.ReceiptDate" data-type="SheetLabel" style="">签收日期</label></td><td class="rowOption hidden">删除</td></tr><tr class="template"><td></td><td id="ctl742950_control0" data-datafield="SignUpInfo.SignDepartment" style=""><input type="text" data-datafield="SignUpInfo.SignDepartment" data-type="SheetTextBox" id="ctl742950_control0" style="" class=""></td><td id="ctl742950_control1" data-datafield="SignUpInfo.Receiver" style=""><input type="text" data-datafield="SignUpInfo.Receiver" data-type="SheetTextBox" id="ctl742950_control1" style="" class=""></td><td id="ctl742950_control2" data-datafield="SignUpInfo.Status" style=""><input type="text" data-datafield="SignUpInfo.Status" data-type="SheetTextBox" id="ctl742950_control2" style="" class=""></td><td id="ctl742950_control3" data-datafield="SignUpInfo.ReceiptDate" style="" data-defaultvalue=""><input type="text" data-datafield="SignUpInfo.ReceiptDate" data-type="SheetTime" id="ctl742950_control3" style="" class="" data-defaultvalue=""></td><td class="rowOption hidden"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr></tbody></table></div></div><div class="row"><div id="div340651" class="col-md-2"><label data-datafield="NotSignUpInfo" data-type="SheetLabel" id="ctl410765" class="" style="">公文未签收</label></div><div id="div516083" class="col-md-10"><table id="ctl46710" data-datafield="NotSignUpInfo" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0" data-displayadd="false"><tbody><tr class="header"><td id="ctl46710_SerialNo" class="rowSerialNo hidden">序号</td><td id="ctl46710_header0" data-datafield="NotSignUpInfo.SignDepartment" style="" class="hidden"><label id="ctl46710_Label0" data-datafield="NotSignUpInfo.SignDepartment" data-type="SheetLabel" style="">签收部门</label></td><td id="ctl46710_header1" data-datafield="NotSignUpInfo.Receiver" style="" class="hidden"><label id="ctl46710_Label1" data-datafield="NotSignUpInfo.Receiver" data-type="SheetLabel" style="">签收人</label></td><td id="ctl46710_header2" data-datafield="NotSignUpInfo.Status" style="" class="hidden"><label id="ctl46710_Label2" data-datafield="NotSignUpInfo.Status" data-type="SheetLabel" style="">签收状态</label></td><td id="ctl46710_header3" data-datafield="NotSignUpInfo.ReceiptDate" style="" class="hidden"><label id="ctl46710_Label3" data-datafield="NotSignUpInfo.ReceiptDate" data-type="SheetLabel" style="">签收日期</label></td><td class="rowOption hidden">删除</td></tr><tr class="template"><td class="" style="width: 7%;"></td><td id="ctl46710_control0" data-datafield="NotSignUpInfo.SignDepartment" style=""><input type="text" data-datafield="NotSignUpInfo.SignDepartment" data-type="SheetTextBox" id="ctl46710_control0" style="" class=""></td><td id="ctl46710_control1" data-datafield="NotSignUpInfo.Receiver" style=""><input type="text" data-datafield="NotSignUpInfo.Receiver" data-type="SheetTextBox" id="ctl46710_control1" style=""></td><td id="ctl46710_control2" data-datafield="NotSignUpInfo.Status" style=""><input type="text" data-datafield="NotSignUpInfo.Status" data-type="SheetTextBox" id="ctl46710_control2" style=""></td><td id="ctl46710_control3" data-datafield="NotSignUpInfo.ReceiptDate" style="" class="" data-defaultvalue=""><input type="text" data-datafield="NotSignUpInfo.ReceiptDate" data-type="SheetTime" id="ctl46710_control3" style="" class="" data-defaultvalue=""></td><td class="rowOption hidden"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr></tbody></table></div></div>
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
			       <label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
		        </div>
				
				
				<div class="row"><div id="div781966" class="col-md-2"><label data-datafield="RelatedItems" data-type="SheetLabel" id="ctl673525" class="" style="">关联项目：</label></div><div id="div366561" class="col-md-4"><input type="text" data-datafield="RelatedItems" data-type="SheetTextBox" id="ctl812978" class="" style=""></div><div id="div261109" class="col-md-2"></div><div id="div520367" class="col-md-4"></div></div><div class="row"><div id="div478405" class="col-md-2"><label data-datafield="Workflow" data-type="SheetLabel" id="ctl363959" class="" style="">关联流程：</label></div><div id="div41281" class="col-md-4"><input type="text" data-datafield="Workflow" data-type="SheetTextBox" id="ctl321615" class="" style=""></div><div id="div193369" class="col-md-2"></div><div id="div631649" class="col-md-4"></div></div><div class="row"><div id="div78403" class="col-md-2"><label data-datafield="Attachment" data-type="SheetLabel" id="ctl985775" class="" style="">附件：</label></div><div id="div424021" class="col-md-10"><div data-datafield="Attachment" data-type="SheetAttachment" id="ctl835498" class="" style=""></div></div></div>
				
				<div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
			       <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
		        </div>
			
				
				<div class="row tableContent">
					<div id="title11" class="col-md-2">
						<span id="Label20" data-type="SheetLabel" data-datafield="DepartmentSuggess" style="" class="">部门领导意见：</span>
					</div>
					<div id="control11" class="col-md-10">
						<div id="Control20" data-datafield="DepartmentSuggess" data-type="SheetComment" style=""></div>
					</div>
				</div>
				<div class="row tableContent">
					<div id="title13" class="col-md-2">
						<span id="Label21" data-type="SheetLabel" data-datafield="LeaderSuggess" style="" class="">公司领导意见：</span>
					</div>
					<div id="control13" class="col-md-10">
						<div id="Control21" data-datafield="LeaderSuggess" data-type="SheetComment" style=""></div>
					</div>
				</div>

			</div>
		</div>
	</asp:Content>