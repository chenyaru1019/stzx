<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Driver.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.Driver" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
$.MvcSheet.PreInit = function () {

              $('#ctl581739').attr("disabled",true); 
              $("<span style='color:#F00' >*</span>").appendTo('#ctl524432');
              $("<span style='color:#F00' >*</span>").appendTo('#Label12');
              $("<span style='color:#F00' >*</span>").appendTo('#Label14');
              $("<span style='color:#F00' >*</span>").appendTo('#Label15');
              $("<span style='color:#F00' >*</span>").appendTo('#Label16');
              $("<span style='color:#F00' >*</span>").appendTo('#Label20');
              var DriverName= $.MvcSheetUI.GetControlValue("DriverName");
    $.ajax({
            type: "GET",
            async: false,
            url: "http://192.168.17.44:8080/driver/getEvaluation/"+DriverName,
            dataType: "jsonp",//加入这个选项即可
            success: function (data) {	
                if(data.status=="success"){
                     $.MvcSheetUI.SetControlValue("Evaluation",data.evaluation);       
                    }
            }
      })

};

        // 保存前事件
        $.MvcSheet.SaveAction.OnActionPreDo = function () {
        var txtCode = $("#ctl359804").SheetUIManager();
        if(txtCode.GetValue() =="" || txtCode.GetValue()  ==null){
            alert("请输入驾驶员姓名");
           return false;
           }
        }
</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">驾驶员信息</label>
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
				<label id="divSheetInfo" data-en_us="Sheet information" class="">驾驶员信息</label>
			</div>
			<div class="divContent" id="divSheet">
				<div class="row">
					<div id="title1" class="col-md-2">

						<label data-datafield="Driver" data-type="SheetLabel" id="ctl524432" class="" style="">驾驶员：</label>
					</div>
					<div id="control1" class="col-md-4">

						<div data-datafield="Driver" data-type="SheetUser" id="ctl359804" class="" data-onchange="

   " data-mappingcontrols="DriverName:Name" style=""></div>
					</div>
					<div id="title2" class="col-md-2"></div>
					<div id="control2" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div750051" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="Age" class="" style="">年龄：</span>
					</div>
					<div id="div137346" class="col-md-4">
						<input id="Control12" type="text" data-datafield="Age" data-type="SheetTextBox" class="" style="">
					</div>
					<div id="div399034" class="col-md-2"></div>
					<div id="div752562" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div9345" class="col-md-2">
						<span id="Label14" data-type="SheetLabel" data-datafield="TelephoneNum" class="" style="">联系方式：</span>
					</div>
					<div id="div862202" class="col-md-4">
						<input id="Control14" type="text" data-datafield="TelephoneNum" data-type="SheetTextBox" class="" style="">
					</div>
					<div id="div750415" class="col-md-2"></div>
					<div id="div844763" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div511897" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="DrivingAge" class="" style="">驾龄：</span>
					</div>
					<div id="div385297" class="col-md-4">
						<input id="Control15" type="text" data-datafield="DrivingAge" data-type="SheetTextBox" class="" style="">
					</div>
					<div id="div419973" class="col-md-2"></div>
					<div id="div685633" class="col-md-4"></div>
				</div>

				
				<div class="row">
					<div id="title7" class="col-md-2">
						<span id="Label16" data-type="SheetLabel" data-datafield="DrivingNum" class="" style="">驾驶证编号：</span>
					</div>
					<div id="control7" class="col-md-4">
						<input id="Control16" type="text" data-datafield="DrivingNum" data-type="SheetTextBox" class="" style="">
					</div>
					<div id="title8" class="col-md-2"></div>
					<div id="control8" class="col-md-4"></div>
				</div>

				<div class="row">
					<div id="title11" class="col-md-2">
						<span id="Label20" data-type="SheetLabel" data-datafield="Enable" class="" style="">是否启用：</span>
					</div>
					<div id="control11" class="col-md-4">

						<div data-datafield="Enable" data-type="SheetRadioButtonList" id="ctl959114" class="" data-defaultitems="是;否" data-repeatcolumns="1" style=""></div>
					</div>
					<div id="space12" class="col-md-2"></div>
					<div id="spaceControl12" class="col-md-4"></div>
				</div>
				<div class="row"><div id="div219983" class="col-md-2"><label data-datafield="Evaluation" data-type="SheetLabel" id="ctl216651" class="" style="">评分</label></div><div id="div302895" class="col-md-4"><input type="text" data-datafield="Evaluation" data-type="SheetTextBox" id="ctl581739" class="" style=""></div><div id="div342199" class="col-md-2"></div><div id="div314567" class="col-md-4"></div></div><div class="row">
					<div id="div218758" class="col-md-2">
						<span id="Label13" data-type="SheetLabel" data-datafield="Photo" class="" style="">头像：</span>
					</div>
					<div id="div617057" class="col-md-4">
						<textarea id="Control13" data-datafield="Photo" data-richtextbox="true" data-type="SheetRichTextBox" class="" style="margin-top: 0px; margin-bottom: 0px; height: 80px;">					</textarea>
					</div>
					<div id="div46306" class="col-md-2"></div>
					<div id="div39360" class="col-md-4"></div>
				</div>
				<div class="row hidden"><div id="div181586" class="col-md-2"><label data-datafield="DriverName" data-type="SheetLabel" id="ctl184716" class="" style="">DriverName</label></div><div id="div445074" class="col-md-4"><input type="text" data-datafield="DriverName" data-type="SheetTextBox" id="ctl352942" class="" style=""></div><div id="div121426" class="col-md-2"></div><div id="div691698" class="col-md-4"></div></div>
				
			</div>
		</div>
	</asp:Content>