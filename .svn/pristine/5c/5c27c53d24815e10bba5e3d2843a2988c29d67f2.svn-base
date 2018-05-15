<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SBottledWater.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SBottledWater" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
    $.MvcSheet.PreInit = function () {
                  $('#Control11').attr("disabled",true); //设置经办人和所属部门无法修改
                  $('#Control12').attr("disabled",true); 
                  $("<span style='color:#F00' >*</span>").appendTo('#Label13');
                  $("<span style='color:#F00' >*</span>").appendTo('#Label14');

        };
   

  // 表单验证接口
        $.MvcSheet.Validate = function () {
            // this.Action 表示当前操作的按钮名称
            var Reason= $.MvcSheetUI.GetControlValue("Reason");    // 根据数据项编码获取页面控件的值
            // 填写申请单环节，设置 mvcName 必填
            if ($.MvcSheetUI.SheetInfo.ActivityCode == "Activity2") {
                if (this.Action == "Submit"||this.Action == "Save") {
	          var str = "<(\S*?)[^>]*>.*?|<.*? />";  
	         var reg = new RegExp(str);
	         if(reg.test(Reason)){
                   alert("输入内容包含非法字符,请重新输入!");
	          return false;
       }
                }
            }
            return true;
        }
</script>
	
	
	
	
	
	
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">瓶装水申请</label>
    </div>
    <div class="panel-body sheetContainer">
        <div class="nav-icon fa fa-chevron-right bannerTitle">
            <label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
        </div>
        <div class="divContent">
            <div class="row">
                <div id="divFullNameTitle" class="col-md-2">
                    <label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="">发起人：</label>
                </div>
                <div id="divFullName" class="col-md-4">
                    <label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>
                </div>
                <div id="divOriginateDateTitle" class="col-md-2">
                    <label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间：</label>
                </div>
                <div id="divOriginateDate" class="col-md-4">
                    <label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>
                </div>
            </div>
            <div class="row">
                <div id="divOriginateOUNameTitle" class="col-md-2">
                    <label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" class="" style="">所属组织：</label>
                </div>
                <div id="divOriginateOUName" class="col-md-4">
                    <!--					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">
    <span class="OnlyDesigner">Originator.OUName</span>
                        </label>-->
                    <select data-datafield="Originator.OUName" data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class="" style="">
                    </select>
                </div>
                <div id="divSequenceNoTitle" class="col-md-2">
                    <label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号：</label>
                </div>
                <div id="divSequenceNo" class="col-md-4">
                    <label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>
                </div>
            </div>
        </div>
        <div class="nav-icon fa  fa-chevron-right bannerTitle">
            <label id="divSheetInfo" data-en_us="Sheet information" class="">表单信息</label>
        </div>
        <div class="divContent" id="divSheet">
            <div class="row">
                <div id="title1" class="col-md-2">
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" class="" style="">申请人：</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.UserName}" style="">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" class="" style="">申请部门：</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.OUName}" style="">
                </div>
            </div>
            <div class="row"><div id="div272042" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="Reason" class="" style="">申请事由：</span></div><div id="div983498" class="col-md-10"><textarea id="Control13" data-datafield="Reason" data-type="SheetRichTextBox" class="" data-autotrim="true" data-placeholder="请填写用水事由" style=""></textarea></div></div><div class="row"><div id="div399821" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="num" class="" style="">申请数量：</span></div><div id="div752120" class="col-md-4"><input id="Control14" type="text" data-datafield="num" data-type="SheetTextBox" class="" data-regularexpression="/^[1-9]\d*$/" data-regularinvalidtext="请正确输入申请数量。" data-placeholder="请填写申请用水数量" style=""></div><div id="div35805" class="col-md-2"></div><div id="div956269" class="col-md-4"></div></div>
            <div class="row">
                <div id="div870743" class="col-md-2">
                    
                </div>
                <div id="div32537" class="col-md-4">
                    
                    
                <select data-datafield="Type" data-type="SheetDropDownList" id="ctl696350" class="" data-defaultitems="箱;瓶" data-queryable="false" style=""></select></div>
                <div id="div26948" class="col-md-2"></div>
                <div id="div609223" class="col-md-4"></div>
            </div>


        </div>
        <div class="nav-icon fa  fa-chevron-right bannerTitle">
            <label id="divAssInfo" data-en_us="Associated information" class="">关联信息</label>
        </div>
        <div class="divContent">
            <div class="row">
                <div id="title5" class="col-md-2">

                    <span id="Label15" data-type="SheetLabel" data-datafield="RelatedItems" class="" style="">关联项目：</span></div>
                <div id="control5" class="col-md-4">

                    <input id="Control15" type="text" data-datafield="RelatedItems" data-type="SheetTextBox" class="" data-placeholder="可关联相关项目编号" style=""></div>
                <div id="title6" class="col-md-2">

                </div>
                <div id="control6" class="col-md-4">

                </div>
            </div>
            <div class="row">
                <div id="title7" class="col-md-2">
                    <span id="Label16" data-type="SheetLabel" data-datafield="Workflow" class="" style="">关联流程：</span>
                </div>
                <div id="control7" class="col-md-4">
                    <input id="Control16" type="text" data-datafield="Workflow" data-type="SheetTextBox" class="" data-placeholder="可关联相关业务流程" style="">
                </div>
                <div id="space8" class="col-md-2">
                </div>
                <div id="spaceControl8" class="col-md-4">
                </div>
            </div>
            <div class="row">
                <div id="title9" class="col-md-2">
                    <span id="Label17" data-type="SheetLabel" data-datafield="Attachment" class="" style="">附件：</span>
                </div>
                <div id="control9" class="col-md-10">
                    <div id="Control17" data-datafield="Attachment" data-type="SheetAttachment" style=""></div>
                </div>
            </div>
        </div>
        <div class="nav-icon fa  fa-chevron-right bannerTitle">
            <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
        </div>
        <div class="divContent">
            <div class="row tableContent">
                <div id="title11" class="col-md-2">
                    <span id="Label18" data-type="SheetLabel" data-datafield="DepartmentSignature" class="" style="">申请部门主管意见：</span>
                </div>
                <div id="control11" class="col-md-10">
                    <div id="Control18" data-datafield="DepartmentSignature" data-type="SheetComment" class="" style=""></div>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title13" class="col-md-2">
                    <span id="Label19" data-type="SheetLabel" data-datafield="IntegratedOffice" class="" style="">综合办瓶装水管理员意见：</span>
                </div>
                <div id="control13" class="col-md-10">
                    <div id="Control19" data-datafield="IntegratedOffice" data-type="SheetComment" class="" style=""></div>
                </div>
            </div>
        </div>
    </div>
	
	
	
</asp:Content>