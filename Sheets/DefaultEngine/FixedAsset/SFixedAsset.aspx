﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SFixedAsset.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SFixedAsset" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
	$.MvcSheet.PreInit = function() {

		$('#Control15').attr("disabled", true); //设置资产编号不可编辑  
		$('#Control11').attr("disabled", true);
		$("<span style='color:#F00' >*</span>").appendTo('#Label12');
		$("<span style='color:#F00' >*</span>").appendTo('#Label13');
		$("<span style='color:#F00' >*</span>").appendTo('#Label16');
		$("<span style='color:#F00' >*</span>").appendTo('#Label17');
		$("<span style='color:#F00' >*</span>").appendTo('#Label18');
		$("<span style='color:#F00' >*</span>").appendTo('#Label19');
		$("<span style='color:#F00' >*</span>").appendTo('#Label20');
		$("<span style='color:#F00' >*</span>").appendTo('#Label21');
		$("<span style='color:#F00' >*</span>").appendTo('#Label22');
		$("<span style='color:#F00' >*</span>").appendTo('#Label23');
		$("<span style='color:#F00' >*</span>").appendTo('#Label24');
		$("<span style='color:#F00' >*</span>").appendTo('#Label26');
		$("<span style='color:#F00' >*</span>").appendTo('#ctl864754');




		var smallType = $.MvcSheetUI.GetControlValue("SmallType");

		if (smallType == "0301" || smallType == "0302") {
			$("#Ebt ").css('display', 'block');
			$("#Ebt ").find('.row').css('display', 'block');
		}

		//初始化页面时获取卡片编号
		$.ajax({
			type : "GET",
			async : false,
			url : formUrl + "/numlibrary/getfanumber?type=CardNum",
			dataType : "jsonp",//加入这个选项即可
			success : function(data) {

				if (data.status == "success") {

					$.MvcSheetUI.SetControlValue("bz", data.Sequencenum);

				}

			}
		})
	};

	// 保存前事件校验必填项
	$.MvcSheet.SaveAction.OnActionPreDo = function() {

		var UseStatus = $.MvcSheetUI.GetControlValue("UseStatus"); //状态
		var Model = $.MvcSheetUI.GetControlValue("Model"); //型号
		var Num = $.MvcSheetUI.GetControlValue("Num"); //数量
		var Unit = $.MvcSheetUI.GetControlValue("Unit"); //计量单位
		var StartTime = $.MvcSheetUI.GetControlValue("StartTime"); //开始使用时间
		var OriginalPrice = $.MvcSheetUI.GetControlValue("OriginalPrice"); //原值
		var Department = $.MvcSheetUI.GetControlValue("Department"); //部门
		var Organization = $.MvcSheetUI.GetControlValue("Organization"); //组织
		var UserName = $.MvcSheetUI.GetControlValue("UserName"); //使用人
		var StorageLocation = $.MvcSheetUI.GetControlValue("StorageLocation"); //存放地点
		var smallType = $.MvcSheetUI.GetControlValue("SmallType"); //小类别
		var LargeType = $.MvcSheetUI.GetControlValue("LargeType"); //大类别
		var FANumber = $.MvcSheetUI.GetControlValue("FANumber"); //编号
		if (smallType == "" || LargeType == "" || !UseStatus || !Model || !Num
				|| !Unit || !StartTime || !OriginalPrice || !Department
				|| !Organization || !UserName || !StorageLocation) {
			//校验必填 
			$('#message-module')
					.find('.modal-body')
					.html(
							'<h4 style="text-align: center;padding: 50px;">请将信息补充完整</h4>');
			$('#message-module').modal({
				keyboard : true,
				show : true,
				backdrop : true
			});
			return false;
		} else {
			var CardNumber = $.MvcSheetUI.GetControlValue("CardNumber");
			if (CardNumber == "" || CardNumber == null) {
				var bz = $.MvcSheetUI.GetControlValue("bz");
				$.MvcSheetUI.SetControlValue("CardNumber", "SRC-GZ-" + bz);
				$.ajax({
					type : "GET",
					async : false,
					url : formUrl + "/numlibrary/updatefanumber?type=CardNum",
					dataType : "jsonp",//加入这个选项即可
					success : function(data) {

					}
				})

			}

			var ss = $.MvcSheetUI.GetControlValue("ss");
			if (smallType != ss) {
				var xuhao = $.MvcSheetUI.GetControlValue("xuhao");
				var bno = smallType.substring(0, 2);
				var sno = smallType.substring(2, 4);
				var bh = "STZX-" + bno + "-" + sno + "-" + xuhao
				$.MvcSheetUI.SetControlValue("FANumber", bh);
				$.MvcSheetUI.SetControlValue("ss", smallType);

				$.ajax({
					type : "GET",
					async : false,
					url : formUrl
							+ "/numlibrary/updatefanumber?type=FA&&smallNum="
							+ smallType,
					dataType : "jsonp",//加入这个选项即可
					success : function(data) {

					}
				})

			}

		}

	}



	


 
       

            


</script>
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">固定资产库</label>
    </div>
    <div class="panel-body sheetContainer">
        <div class="nav-icon fa fa-chevron-right bannerTitle hidden">
            <label id="divBasicInfo" data-en_us="Basic information" class="">基本信息</label>
        </div>
        <div class="divContent">
            <div class="row hidden">
                <div id="divFullNameTitle" class="col-md-2 hidden">
                    <label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="">发起人</label>
                </div>
                <div id="divFullName" class="col-md-4">
                    <label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>
                </div>
                <div id="divOriginateDateTitle" class="col-md-2">
                    <label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" class="" style="">发起时间</label>
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
            <label id="divSheetInfo" data-en_us="Sheet information" class="">资产信息：</label>
        </div>
        <div class="divContent" id="divSheet">

            <div class="row">
                <div id="title1" class="col-md-2">

                    <span id="Label11" data-type="SheetLabel" data-datafield="CardNumber" class="" style="">卡片编号：</span>
                </div>
                <div id="control1" class="col-md-4">

                    <input id="Control11" type="text" data-datafield="CardNumber" data-type="SheetTextBox" class="" style="">
                </div>
                <div id="title2" class="col-md-2">

                    <span id="Label15" data-type="SheetLabel" data-datafield="FANumber" class="" style="">固定资产编号：</span>
                </div>
                <div id="control2" class="col-md-4">

                    <input id="Control15" type="text" data-datafield="FANumber" data-type="SheetTextBox" class="" style="">
                </div>
            </div>
            <div class="row">
                <div id="div901525" class="col-md-2">
                    <span id="Label14" data-type="SheetLabel" data-datafield="OldNumber" class="" style="">旧编号：</span>
                </div>
                <div id="div483724" class="col-md-4">
                    <input id="Control14" type="text" data-datafield="OldNumber" data-type="SheetTextBox" class="" style="">
                </div>
                <div id="div653546" class="col-md-2">
                    <span id="Label16" data-type="SheetLabel" data-datafield="MaterialName" class="" style="">固定资产名称：</span>
                </div>
                <div id="div262880" class="col-md-4">
                    
                <select data-datafield="MaterialName" data-type="SheetDropDownList" id="ctl238827" class="" style="" data-defaultitems="sdsds"></select></div>
            </div>
            <div class="row">
                <div id="title3" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="LargeType" class="" style="">大类别名称：</span>
                </div>
                <div id="control3" class="col-md-4">

                    <select data-datafield="LargeType" data-type="SheetDropDownList" id="ctl211585" class="" data-schemacode="FACategory" data-querycode="CategoryQuery" data-filter="0:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-displayemptyitem="true" data-emptyitemtext="请选择" data-onchange="var LargeType =  $.MvcSheetUI.GetControlValue(&quot;LargeType&quot;);
$.MvcSheetUI.SetControlValue(&quot;dlb&quot;,LargeType );
" style=""></select>
                </div>
                <div id="title4" class="col-md-2">
                    <span id="Label13" data-type="SheetLabel" data-datafield="SmallType" class="" style="">小类别名称：</span>
                </div>
                <div id="control4" class="col-md-4">

                    <select data-datafield="SmallType" data-type="SheetDropDownList" id="ctl507274" class="" data-schemacode="FACategory" data-querycode="CategoryQuery" data-filter="LargeType:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-onchange="//$.MvcSheetUI.SetControlValue(&quot;xuhao&quot;,&quot;&quot;);
var smallType= $.MvcSheetUI.GetControlValue(&quot;SmallType&quot;);

if(smallType==&quot;0301&quot;||smallType==&quot;0302&quot;){
    $(&quot;#Ebt &quot;).css('display','block');
$(&quot;#Ebt &quot;).find('.row').css('display','block');
   // $(&quot;#Ebt &quot;).show()

}else{
    $(&quot;#Ebt&quot;).css('display','none');

}

$.ajax({
       type: &quot;GET&quot;,
       async: false,
       url: formUrl+&quot;/numlibrary/getfanumber?type=FA&amp;&amp;smallNum=&quot;+smallType,
           dataType: &quot;jsonp&quot;,//加入这个选项即可
            success: function (data) {
                if(data.status==&quot;success&quot;){
                      $.MvcSheetUI.SetControlValue(&quot;xuhao&quot;,data.Sequencenum);

                        }else{
                       $.MvcSheetUI.SetControlValue(&quot;xuhao&quot;,&quot;&quot;);
                      }
            }
      })
var SmallType=  $.MvcSheetUI.GetControlValue(&quot;SmallType&quot;);
$.MvcSheetUI.SetControlValue(&quot;xlb&quot;,SmallType);  " data-emptyitemtext="请选择" style="" data-displayemptyitem="true" data-defaultitems="sdsds"></select>
                </div>
            </div>

            <div class="row">
                <div id="title7" class="col-md-2">
                    <span id="Label17" data-type="SheetLabel" data-datafield="UseStatus" class="" style="">使用状态：</span>
                </div>
                <div id="control7" class="col-md-4">

                    <select data-datafield="UseStatus" data-type="SheetDropDownList" id="ctl171408" class="" data-defaultitems="使用中;已报废;维修中;闲置中" style="" data-onchange="$.MvcSheetUI.SetControlValue(&quot;Status&quot;,&quot;0&quot;);
var UseStatus=  $.MvcSheetUI.GetControlValue(&quot;UseStatus&quot;);
if(UseStatus==&quot;已报废&quot;){
$.MvcSheetUI.SetControlValue(&quot;Status&quot;,&quot;1&quot;);
}

if(UseStatus==&quot;维修中&quot;){
$.MvcSheetUI.SetControlValue(&quot;Status&quot;,&quot;2&quot;);
}"></select>
                </div>
                <div id="title8" class="col-md-2">

                    <span id="Label18" data-type="SheetLabel" data-datafield="Model" class="" style="">规格型号：</span>
                </div>
                <div id="control8" class="col-md-4">

                    <input id="Control18" type="text" data-datafield="Model" data-type="SheetTextBox" class="" style="">
                </div>
            </div>
            <div class="row">
                <div id="div800370" class="col-md-2">
                    <span id="Label19" data-type="SheetLabel" data-datafield="Num" class="" style="">数量：</span>
                </div>
                <div id="div694499" class="col-md-4">
                    <input id="Control19" type="text" data-datafield="Num" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="div754845" class="col-md-2">
                    <span id="Label20" data-type="SheetLabel" data-datafield="Unit" class="" style="">计量单位：</span>
                </div>
                <div id="div743733" class="col-md-4">
                    <input id="Control20" type="text" data-datafield="Unit" data-type="SheetTextBox" style="" class="">
                </div>
            </div>
            <div class="row">
                <div id="title11" class="col-md-2">
                    <span id="Label21" data-type="SheetLabel" data-datafield="StartTime" class="" style="">开始使用日期：</span>
                </div>
                <div id="control11" class="col-md-4">
                    <input id="Control21" type="text" data-datafield="StartTime" data-type="SheetTime" style="" class="" data-defaultvalue="">
                </div>
                <div id="title12" class="col-md-2">

                    <span id="Label22" data-type="SheetLabel" data-datafield="OriginalPrice" class="" style="">原值（元）：</span>
                </div>
                <div id="control12" class="col-md-4">

                    <input id="Control22" type="text" data-datafield="OriginalPrice" data-type="SheetTextBox" style="" class="">
                </div>
            </div>
            <div class="row">
                <div id="div927857" class="col-md-2">
                    <span id="Label23" data-type="SheetLabel" data-datafield="Department" class="" style="">使用部门：</span>
                </div>
                <div id="div204224" class="col-md-4">
                    <select data-datafield="Department" data-type="SheetDropDownList" id="ctl729095" class="" data-schemacode="QueryDepartment" data-querycode="queryDepart" data-datavaluefield="Name1" data-datatextfield="Name1" style="" data-queryable="false"></select>
                </div>
                <div id="div996547" class="col-md-2">
                    <span id="Label26" data-type="SheetLabel" data-datafield="UserName" class="" style="">使用人：</span>
                </div>
                <div id="div739062" class="col-md-4">
                    <input type="text" data-datafield="UserName" data-type="SheetTextBox" id="ctl926369" class="" style="">
                </div>
            </div>
            <div class="row">
                <div id="title13" class="col-md-2">

                    <label data-datafield="Organization" data-type="SheetLabel" id="ctl864754" class="" style="width: 100%;">拥有者组织：</label>
                </div>
                <div id="control13" class="col-md-4">

                    <input type="text" data-datafield="Organization" data-type="SheetTextBox" id="ctl484893" class="" style="" data-defaultvalue="申通咨询公司">
                </div>
                <div id="title14" class="col-md-2">
                    <span id="Label24" data-type="SheetLabel" data-datafield="StorageLocation" class="" style="">存放地点：</span>
                </div>
                <div id="control14" class="col-md-4">
                    <input id="Control24" type="text" data-datafield="StorageLocation" data-type="SheetTextBox" class="" style="">
                </div>
            </div>
            <div class="row">
                <div id="div728835" class="col-md-2"><label data-datafield="AssetsChanges" data-type="SheetLabel" id="ctl722801" class="" style="">资产变动情况</label></div>
                <div id="div282335" class="col-md-10">
                    <table id="ctl256275" data-datafield="AssetsChanges" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0" data-displayexport="true">
                        <tbody>
                        <tr class="header">
                            <td id="ctl256275_SerialNo" class="rowSerialNo">序号</td>
                            <td id="ctl256275_header0" data-datafield="AssetsChanges.ChangeDate" style=""><label id="ctl256275_Label0" data-datafield="AssetsChanges.ChangeDate" data-type="SheetLabel" style="">变动日期</label></td>
                            <td id="ctl256275_header1" data-datafield="AssetsChanges.BDepartment" style=""><label id="ctl256275_Label1" data-datafield="AssetsChanges.BDepartment" data-type="SheetLabel" style="">变动前部门</label></td>
                            <td id="ctl256275_header2" data-datafield="AssetsChanges.BUserName" style=""><label id="ctl256275_Label2" data-datafield="AssetsChanges.BUserName" data-type="SheetLabel" style="">变更前管理员</label></td>
                            <td id="ctl256275_header3" data-datafield="AssetsChanges.ADepartment" style=""><label id="ctl256275_Label3" data-datafield="AssetsChanges.ADepartment" data-type="SheetLabel" style="">变动后部门</label></td>
                            <td id="ctl256275_header4" data-datafield="AssetsChanges.AUserName" style=""><label id="ctl256275_Label4" data-datafield="AssetsChanges.AUserName" data-type="SheetLabel" style="">变更后管理员</label></td>
                            <td id="ctl256275_header5" data-datafield="AssetsChanges.Resson" style=""><label id="ctl256275_Label5" data-datafield="AssetsChanges.Resson" data-type="SheetLabel" style="">变动原因</label></td>
                            <td class="rowOption hidden">删除</td>
                        </tr>
                        <tr class="template">
                            <td class=""></td>
                            <td id="ctl256275_control0" data-datafield="AssetsChanges.ChangeDate" style="" class="">
                                <input type="text" onfocus="this.blur()" data-datafield="AssetsChanges.ChangeDate" data-type="SheetTime" id="ctl256275_control0" style="" class=""></td>
                            <td id="ctl256275_control1" data-datafield="AssetsChanges.BDepartment" style="width: 18%;" class=""><select data-datafield="AssetsChanges.BDepartment" data-type="SheetDropDownList" id="ctl865526" class="" style="" data-displayemptyitem="true" data-schemacode="QueryDepartment" data-querycode="queryDepart" data-datavaluefield="ObjectID1" data-datatextfield="Name1"></select></td>
                            <td id="ctl256275_control2" data-datafield="AssetsChanges.BUserName" style="" class="">
                                <input type="text" onfocus="this.blur()" data-datafield="AssetsChanges.BUserName" data-type="SheetTextBox" id="ctl256275_control2" style="" class=""></td>
                            <td id="ctl256275_control3" data-datafield="AssetsChanges.ADepartment" style="width: 18%;" class=""><select data-datafield="AssetsChanges.ADepartment" data-type="SheetDropDownList" id="ctl282462" class="" style="" data-schemacode="QueryDepartment" data-querycode="queryDepart" data-datavaluefield="ObjectID1" data-datatextfield="Name1" data-displayemptyitem="true"></select></td>
                            <td id="ctl256275_control4" data-datafield="AssetsChanges.AUserName" style="" class="">
                                <input type="text" onfocus="this.blur()" data-datafield="AssetsChanges.AUserName" data-type="SheetTextBox" id="ctl256275_control4" style="" class=""></td>
                            <td id="ctl256275_control5" data-datafield="AssetsChanges.Resson" style=""><textarea data-datafield="AssetsChanges.Resson" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl256275_control5"></textarea></td>
                            <td class="rowOption hidden"><a class="delete">
                                <div class="fa fa-minus"></div>
                            </a><a class="insert">
                                <div class="fa fa-arrow-down"></div>
                            </a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>


            <div id="Ebt" style="display: none">
                <div id="" class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
                    <label id="divInvInfo" data-en_us="Inventory situation" class="">信息化设备详情</label>
                </div>
                <div class="row">
                    <div id="div435977" class="col-md-2">
                        <label data-datafield="DeviceId" data-type="SheetLabel" id="ctl61793" class="" style="">设备编号</label>
                    </div>
                    <div id="div678112" class="col-md-4">
                        <input type="text" data-datafield="DeviceId" data-type="SheetTextBox" id="ctl387308" class="" style="">
                    </div>
                    <div id="div196228" class="col-md-2">
                        <label data-datafield="SerialNumber" data-type="SheetLabel" id="ctl352679" class="" style="">设备串号</label>
                    </div>
                    <div id="div244558" class="col-md-4">
                        <input type="text" data-datafield="SerialNumber" data-type="SheetTextBox" id="ctl134110" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div18622" class="col-md-2">
                        <label data-datafield="Building" data-type="SheetLabel" id="ctl612419" class="" style="">大楼</label>
                    </div>
                    <div id="div513255" class="col-md-4">
                        <input type="text" data-datafield="Building" data-type="SheetTextBox" id="ctl53882" class="" style="">
                    </div>
                    <div id="div656442" class="col-md-2">
                        <label data-datafield="Room" data-type="SheetLabel" id="ctl408561" class="" style="">房间</label>
                    </div>
                    <div id="div459556" class="col-md-4">
                        <input type="text" data-datafield="Room" data-type="SheetTextBox" id="ctl97537" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div446306" class="col-md-2">
                        <label data-datafield="Description" data-type="SheetLabel" id="ctl419410" class="" style="">描述</label>
                    </div>
                    <div id="div588616" class="col-md-4">
                        <input type="text" data-datafield="Description" data-type="SheetTextBox" id="ctl17240" class="" style="">
                    </div>
                    <div id="div383014" class="col-md-2">
                        <label data-datafield="BusinessLevel" data-type="SheetLabel" id="ctl200982" class="" style="">业务级别</label>
                    </div>
                    <div id="div583713" class="col-md-4">
                        <input type="text" data-datafield="BusinessLevel" data-type="SheetTextBox" id="ctl122383" class="" style="">
                    </div>
                </div>

                <div class="row">
                    <div id="div333552" class="col-md-2">
                        <label data-datafield="ConsultationCode" data-type="SheetLabel" id="ctl612103" class="" style="">咨询编码</label>
                    </div>
                    <div id="div816069" class="col-md-4">
                        <input type="text" data-datafield="ConsultationCode" data-type="SheetTextBox" id="ctl339639" class="" style="">
                    </div>
                    <div id="div323426" class="col-md-2">

                        <label data-datafield="PurchaseDate" data-type="SheetLabel" id="ctl560974" class="" style="">采购日期</label>
                    </div>
                    <div id="div601392" class="col-md-4">

                        <input type="text" data-datafield="PurchaseDate" data-type="SheetTime" id="ctl224291" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div455126" class="col-md-2">
                        <label data-datafield="Brand" data-type="SheetLabel" id="ctl756777" class="" style="">品牌</label>
                    </div>
                    <div id="div706093" class="col-md-4">
                        <input type="text" data-datafield="Brand" data-type="SheetTextBox" id="ctl781051" class="" style="">
                    </div>
                    <div id="div674464" class="col-md-2">

                        <label data-datafield="UseDate" data-type="SheetLabel" id="ctl465163" class="" style="">投入使用日期</label>
                    </div>
                    <div id="div910178" class="col-md-4">

                        <input type="text" data-datafield="UseDate" data-type="SheetTime" id="ctl54979" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div858350" class="col-md-2">
                        <label data-datafield="HardCapacity" data-type="SheetLabel" id="ctl559639" class="" style="">硬盘容量</label>
                    </div>
                    <div id="div758847" class="col-md-4">
                        <input type="text" data-datafield="HardCapacity" data-type="SheetTextBox" id="ctl624248" class="" style="">
                    </div>
                    <div id="div133269" class="col-md-2">

                        <label data-datafield="OverdueDate" data-type="SheetLabel" id="ctl628353" class="" style="">过保日期</label>
                    </div>
                    <div id="div311536" class="col-md-4">

                        <input type="text" data-datafield="OverdueDate" data-type="SheetTime" id="ctl66541" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div505304" class="col-md-2">
                        <label data-datafield="HardSpace" data-type="SheetLabel" id="ctl859788" class="" style="">硬盘空间</label>
                    </div>
                    <div id="div441593" class="col-md-4">
                        <input type="text" data-datafield="HardSpace" data-type="SheetTextBox" id="ctl624788" class="" style="">
                    </div>
                    <div id="div108037" class="col-md-2">

                        <label data-datafield="MemoryType" data-type="SheetLabel" id="ctl655236" class="" style="">内存类型</label>
                    </div>
                    <div id="div734257" class="col-md-4">

                        <input type="text" data-datafield="MemoryType" data-type="SheetTextBox" id="ctl944105" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div154680" class="col-md-2">

                        <label data-datafield="CPU" data-type="SheetLabel" id="ctl455636" class="" style="">CPU</label>
                    </div>
                    <div id="div573470" class="col-md-4">

                        <input type="text" data-datafield="CPU" data-type="SheetTextBox" id="ctl137527" class="" style="">
                    </div>
                    <div id="div654978" class="col-md-2">

                        <label data-datafield="CPUModel" data-type="SheetLabel" id="ctl166350" class="" style="">CPU型号</label>
                    </div>
                    <div id="div732615" class="col-md-4">

                        <input type="text" data-datafield="CPUModel" data-type="SheetTextBox" id="ctl435779" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div174017" class="col-md-2">
                        <label data-datafield="SystemCategory" data-type="SheetLabel" id="ctl260288" class="" style="">操作系统类别</label>
                    </div>
                    <div id="div313694" class="col-md-4">
                        <input type="text" data-datafield="SystemCategory" data-type="SheetTextBox" id="ctl667821" class="" style="">
                    </div>
                    <div id="div716086" class="col-md-2">
                        <label data-datafield="SystemVersion" data-type="SheetLabel" id="ctl377754" class="" style="">操作系统版本</label>
                    </div>
                    <div id="div229556" class="col-md-4">
                        <input type="text" data-datafield="SystemVersion" data-type="SheetTextBox" id="ctl462832" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div181887" class="col-md-2">
                        <label data-datafield="HardModel" data-type="SheetLabel" id="ctl722402" class="" style="">硬盘型号</label>
                    </div>
                    <div id="div500527" class="col-md-4">
                        <input type="text" data-datafield="HardModel" data-type="SheetTextBox" id="ctl999395" class="" style="">
                    </div>
                    <div id="div650420" class="col-md-2">

                        <label data-datafield="HardDisk" data-type="SheetLabel" id="ctl571780" class="" style="">硬盘</label>
                    </div>
                    <div id="div316213" class="col-md-4">

                        <input type="text" data-datafield="HardDisk" data-type="SheetTextBox" id="ctl338518" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div167232" class="col-md-2">
                        <label data-datafield="DisplayType" data-type="SheetLabel" id="ctl39144" class="" style="">显示器类型</label>
                    </div>
                    <div id="div371432" class="col-md-4">
                        <input type="text" data-datafield="DisplayType" data-type="SheetTextBox" id="ctl799125" class="" style="">
                    </div>
                    <div id="div606790" class="col-md-2">

                        <label data-datafield="Series" data-type="SheetLabel" id="ctl846393" class="" style="">系列</label>
                    </div>
                    <div id="div648114" class="col-md-4">

                        <input type="text" data-datafield="Series" data-type="SheetTextBox" id="ctl47578" class="" style="">
                    </div>
                </div>
                <div class="row">
                    <div id="div362566" class="col-md-2">
                        <label data-datafield="DisplaySize" data-type="SheetLabel" id="ctl583251" class="" style="">显示器尺寸（吋）</label>
                    </div>
                    <div id="div795997" class="col-md-4">
                        <input type="text" data-datafield="DisplaySize" data-type="SheetTextBox" id="ctl789306" class="" style="">
                    </div>
                    <div id="div335114" class="col-md-2">
                        <label data-datafield="OutsideUnit" data-type="SheetLabel" id="ctl191637" class="" style="">委外单位</label>
                    </div>
                    <div id="div614038" class="col-md-4">
                        <input type="text" data-datafield="OutsideUnit" data-type="SheetTextBox" id="ctl327851" class="" style="">
                    </div>
                </div>

            </div>


            <div class="row hidden">
                <div id="div290340" class="col-md-2">
                    <span id="Label30" data-type="SheetLabel" data-datafield="xuhao" class="" style="">类别序号</span>
                </div>
                <div id="div114749" class="col-md-2">
                    <input id="Control30" type="text" data-datafield="xuhao" data-type="SheetTextBox" class="" style="">
                </div>
                <div id="div388366" class="col-md-2">
                    <label data-datafield="dlb" data-type="SheetLabel" id="ctl682278" class="" style="">大类别</label>
                </div>
                <div id="div627909" class="col-md-2">
                    <input type="text" data-datafield="dlb" data-type="SheetTextBox" id="ctl121927" class="" style="">
                </div>
                <div id="div499204" class="col-md-2">
                    <label data-datafield="xlb" data-type="SheetLabel" id="ctl533041" class="" style="">小类别</label>
                </div>
                <div id="div34407" class="col-md-2">
                    <input type="text" data-datafield="xlb" data-type="SheetTextBox" id="ctl765029" class="" style="">
                </div>
            </div>
            <div class="row hidden">
                <div id="div908548" class="col-md-2">
                    <label data-datafield="bz" data-type="SheetLabel" id="ctl235118" class="" style="">卡片編號</label>
                </div>
                <div id="div72720" class="col-md-4">
                    <input type="text" data-datafield="bz" data-type="SheetTextBox" id="ctl896168" class="" style="">
                </div>
                <div id="div766602" class="col-md-2">
                    <label data-datafield="ss" data-type="SheetLabel" id="ctl33477" class="" style="">ss</label>
                </div>
                <div id="div57721" class="col-md-4">
                    <input type="text" data-datafield="ss" data-type="SheetTextBox" id="ctl714601" class="" style="">
                </div>
            </div>
            <div class="row hidden">
                <div id="div839664" class="col-md-2">
                    <label data-datafield="Status" data-type="SheetLabel" id="ctl776608" class="" style="">status</label>
                </div>
                <div id="div477832" class="col-md-4">
                    <input type="text" data-datafield="Status" data-type="SheetTextBox" id="ctl378385" class="" style="">
                </div>
                <div id="div328648" class="col-md-2"></div>
                <div id="div763920" class="col-md-4"></div>
            </div>
        </div>
    </div>
</asp:Content>