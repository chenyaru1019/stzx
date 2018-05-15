<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SLoanApply.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SLoanApply" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
// 页面初始化事件,该事件在获取MVC表单数据，并且在控件初始化之前执行
	    $.MvcSheet.PreInit = function () {
	        // 将提交按钮文字改为同意
	        if ($.MvcSheetUI.SheetInfo.ActivityCode != "Activity2") {
	            $.MvcSheet.SubmitAction.Text = "同意";
                    //$("li[data-action='Submit']").find("span").html("同意");
	        }
	    };
function convertCurrency(currencyDigits) { 
// Constants: 
    var MAXIMUM_NUMBER = 99999999999.99; 
    // Predefine the radix characters and currency symbols for output: 
    var CN_ZERO = "零"; 
    var CN_ONE = "壹"; 
    var CN_TWO = "贰"; 
    var CN_THREE = "叁"; 
    var CN_FOUR = "肆"; 
    var CN_FIVE = "伍"; 
    var CN_SIX = "陆"; 
    var CN_SEVEN = "柒"; 
    var CN_EIGHT = "捌"; 
    var CN_NINE = "玖"; 
    var CN_TEN = "拾"; 
    var CN_HUNDRED = "佰"; 
    var CN_THOUSAND = "仟"; 
    var CN_TEN_THOUSAND = "万"; 
    var CN_HUNDRED_MILLION = "亿"; 
    var CN_SYMBOL = "人民币"; 
    var CN_DOLLAR = "元"; 
    var CN_TEN_CENT = "角"; 
    var CN_CENT = "分"; 
    var CN_INTEGER = "整"; 
     
// Variables: 
    var integral;    // Represent integral part of digit number. 
    var decimal;    // Represent decimal part of digit number. 
    var outputCharacters;    // The output result. 
    var parts; 
    var digits, radices, bigRadices, decimals; 
    var zeroCount; 
    var i, p, d; 
    var quotient, modulus; 
     
// Validate input string: 
    currencyDigits = currencyDigits.toString(); 
    if (currencyDigits == "") { 
        alert("请输入小写金额！"); 
        return ""; 
    } 
    if (currencyDigits.match(/[^,.\d]/) != null) { 
        alert("小写金额含有无效字符！"); 
        return ""; 
    } 
    if ((currencyDigits).match(/^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/) == null) { 
        alert("小写金额的格式不正确！"); 
        return ""; 
    } 
     
// Normalize the format of input digits: 
    currencyDigits = currencyDigits.replace(/,/g, "");    // Remove comma delimiters. 
    currencyDigits = currencyDigits.replace(/^0+/, "");    // Trim zeros at the beginning. 
    // Assert the number is not greater than the maximum number. 
    if (Number(currencyDigits) > MAXIMUM_NUMBER) { 
        alert("金额过大，应小于1000亿元！"); 
        return ""; 
    } 
     
// Process the coversion from currency digits to characters: 
    // Separate integral and decimal parts before processing coversion: 
    parts = currencyDigits.split("."); 
    if (parts.length > 1) { 
        integral = parts[0]; 
        decimal = parts[1]; 
        // Cut down redundant decimal digits that are after the second. 
        decimal = decimal.substr(0, 2); 
    } 
    else { 
        integral = parts[0]; 
        decimal = ""; 
    } 
    // Prepare the characters corresponding to the digits: 
    digits = new Array(CN_ZERO, CN_ONE, CN_TWO, CN_THREE, CN_FOUR, CN_FIVE, CN_SIX, CN_SEVEN, CN_EIGHT, CN_NINE); 
    radices = new Array("", CN_TEN, CN_HUNDRED, CN_THOUSAND); 
    bigRadices = new Array("", CN_TEN_THOUSAND, CN_HUNDRED_MILLION); 
    decimals = new Array(CN_TEN_CENT, CN_CENT); 
    // Start processing: 
    outputCharacters = ""; 
    // Process integral part if it is larger than 0: 
    if (Number(integral) > 0) { 
        zeroCount = 0; 
        for (i = 0; i < integral.length; i++) { 
            p = integral.length - i - 1; 
            d = integral.substr(i, 1); 
            quotient = p / 4; 
            modulus = p % 4; 
            if (d == "0") { 
                zeroCount++; 
            } 
            else { 
                if (zeroCount > 0) 
                { 
                    outputCharacters += digits[0]; 
                } 
                zeroCount = 0; 
                outputCharacters += digits[Number(d)] + radices[modulus]; 
            } 
            if (modulus == 0 && zeroCount < 4) { 
                outputCharacters += bigRadices[quotient]; 
                zeroCount = 0; 
            } 
        } 
        outputCharacters += CN_DOLLAR; 
    } 
    // Process decimal part if there is: 
    if (decimal != "") { 
        for (i = 0; i < decimal.length; i++) { 
            d = decimal.substr(i, 1); 
            if (d != "0") { 
                outputCharacters += digits[Number(d)] + decimals[i]; 
            } 
        } 
    } 
    // Confirm and return the final output string: 
    if (outputCharacters == "") { 
        outputCharacters = CN_ZERO + CN_DOLLAR; 
    } 
    if (decimal == "") { 
        outputCharacters += CN_INTEGER; 
    } 
    outputCharacters = CN_SYMBOL + outputCharacters; 
    return outputCharacters; 
} 
$(document).ready(function() {
       $("#ctl566852").bind("change",function(){
           //var ApplyAmount = $.MvcSheetUI.GetControlValue("ApplyAmount");
           //$("#ctl909720").val(convertCurrency(ApplyAmount));
          });
       });
</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">借款申请</label>
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
				<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateDate" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
			</div>
			<div id="divOriginateDate" class="col-md-4">
				<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateDate" data-bindtype="OnlyData" style=""></label>
			</div>
		</div>
		<div class="row">
			<div id="divOriginateOUNameTitle" class="col-md-2">
				<label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" style="">所属组织</label>
			</div>
			<div id="divOriginateOUName" class="col-md-4">
				<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData" class="" style=""></label>
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
	<div id="ctl00_BodyContent_divSheet" class="divContent">
		<div class="row">
			<div id="title100" class="col-md-2">
				<span id="Label13" data-type="SheetLabel" data-datafield="zhuti" style="">主题</span>
			</div>
			<div id="control100" class="col-md-10">
				<input type="text" data-datafield="zhuti" data-type="SheetTextBox" id="txt_zhuti" class="" style="">
			</div>
		</div>
		<div class="row">
			<div id="title1" class="col-md-2">
				<span id="Label13" data-type="SheetLabel" data-datafield="Applyer" style="">借款人</span>
			</div>
			<div id="control1" class="col-md-4">
				<div id="Control13" data-datafield="Applyer" data-type="SheetUser" class="" data-defaultvalue="{Originator}" style=""></div>
			</div>
			<div id="title2" class="col-md-2">
				<span id="Label12" data-type="SheetLabel" data-datafield="DSFDepartment" class="" style="">部门</span>
			</div>
			<div id="control2" class="col-md-4">
				<div id="Control12" data-datafield="DSFDepartment" data-type="SheetUser" class="" data-defaultvalue="{Originator.OU}" data-orgunitvisible="true" data-uservisible="false" style=""></div>
			</div>
		</div>
		<div class="row tableContent">
			<div id="title5" class="col-md-2">
				<span id="Label14" data-type="SheetLabel" data-datafield="Remark" style="">借款事由</span>
			</div>
			<div id="control5" class="col-md-10">
				<textarea id="Control14" data-datafield="Remark" data-type="SheetRichTextBox" class="" style="">				</textarea>
			</div>
		</div>
		<!--<div class="row">
			<div id="div858371" class="col-md-2">
				<span id="Label13" data-type="SheetLabel" data-datafield="Applyer">借款金额（大写）</span>
			</div>
			<div id="div263993" class="col-md-10">
			<input type="text" data-datafield="ApplyAmount_N" data-type="SheetTextBox" id="ctl909720" class="" style="width: 95%; background-color: rgb(173, 173, 173);" readonly="true"></div>
		</div>-->
		<div class="row">
			<div id="title7" class="col-md-2">
				<span id="Label15" data-type="SheetLabel" data-datafield="ApplyAmount" class="" style="">借款金额</span>
			</div>
			<div id="control7" class="col-md-4">
			    <input type="text" data-datafield="ApplyAmount" data-type="SheetTextBox" id="ctl566852" class="" data-formatrule="{0:N2}" style="">
			</div>
			<div id="title8" class="col-md-2">
				<span id="Label16" data-type="SheetLabel" data-datafield="PayDate" style="">预计报销（还款）日期</span>
			</div>
			<div id="control8" class="col-md-4">
				<input id="Control16" type="text" data-datafield="PayDate" data-type="SheetTime" class="" style="">
			</div>
		</div>
		<div class="row tableContent">
			<div id="title11" class="col-md-2">
				<span id="Label18" data-type="SheetLabel" data-datafield="AuditOpinion" style="">审批意见</span>
			</div>
			<div id="control11" class="col-md-10">
				<div id="Control18" data-datafield="AuditOpinion" data-type="SheetComment" class="" style=""></div>
			</div>
		</div>
	</div>
</div>
</asp:Content>