﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSpareMoney.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SSpareMoney" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script type="text/javascript">

</script>
<style type='text/css'>
#pettyCash .col-md-5 {
    padding: 0;
}
#pettyCash .col-md-5 .col-md-12 {
    padding: 0;
}
#pettyCash .col-md-5 .col-md-12:first-child {
    border-bottom: 1px solid #E3E3E3;
}
#pettyCash .col-md-5 .col-md-12 .col-md-3{
    border-right: 1px solid #E3E3E3;
    border-left: 0;
}
#bankCard_msg .col-md-10 {
    padding: 0;
}
#bankCard_msg .col-md-10 .col-md-12 {
    padding: 0;
}
#bankCard_msg .col-md-10 .col-md-12:first-child {
    padding: 0;
    border-bottom: 1px solid #E3E3E3;
}
#WriteOff .col-md-7 {
    padding: 0;
    border-left: 1px solid #E3E3E3;
}
#WriteOff .col-md-7 .col-md-12 {
    padding: 0;
    border-bottom: 1px solid #E3E3E3;
}
#WriteOff .col-md-7 .col-md-12 .col-md-3 {
    border-right:1px solid #E3E3E3 ;
}
#title2, #title4, #title6, #title8, #title10, #div227650, #div53469, #div377218, #div325020, #div851612, #div140375 {
    border-left:0px;
}

</style>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">项目备用金审批</label>
    </div>
    <div class="panel-body sheetContainer">
        <!--<div class="nav-icon fa fa-chevron-right bannerTitle">-->
            <!--<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>-->
        <!--</div>-->
        <!--<div class="divContent">-->
            <!--<div class="row">-->
                <!--<div id="divFullNameTitle" class="col-md-2">-->
                    <!--<label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="">发起人</label>-->
                <!--</div>-->
                <!--<div id="divFullName" class="col-md-4">-->
                    <!--<label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>-->
                <!--</div>-->
                <!--<div id="divOriginateDateTitle" class="col-md-2">-->
                    <!--<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>-->
                <!--</div>-->
                <!--<div id="divOriginateDate" class="col-md-4">-->
                    <!--<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>-->
                <!--</div>-->
            <!--</div>-->
            <!--<div class="row">-->
                <!--<div id="divOriginateOUNameTitle" class="col-md-2">-->
                    <!--<label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" style="">所属组织</label>-->
                <!--</div>-->
                <!--<div id="divOriginateOUName" class="col-md-4">-->
                    <!--&lt;!&ndash;					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">-->
<!--<span class="OnlyDesigner">Originator.OUName</span>-->
					<!--</label>&ndash;&gt;-->
                    <!--<select data-datafield="Originator.OUName" data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class="" style="">-->
                    <!--</select>-->
                <!--</div>-->
                <!--<div id="divSequenceNoTitle" class="col-md-2">-->
                    <!--<label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号</label>-->
                <!--</div>-->
                <!--<div id="divSequenceNo" class="col-md-4">-->
                    <!--<label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>-->
                <!--</div>-->
            <!--</div>-->
        <!--</div>-->
        <div class="nav-icon fa  fa-chevron-right bannerTitle">
            <label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
        </div>
        <div class="divContent" id="divSheet">
            <div class="row">
                  <div id="divOriginateDateTitle" class="col-md-2">
                      <label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
                  </div>
                  <div id="divOriginateDate" class="col-md-4">
                      <label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>
                  </div>
                   <div id="divSequenceNoTitle" class="col-md-2">
                       <label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号</label>
                   </div>
                   <div id="divSequenceNo" class="col-md-4">
                       <label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>
                   </div>
            </div>
            <div class="row">
                <div id="title1" class="col-md-2">
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">申请人</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">所属部门</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="">
                </div>
            </div>
            <div class="row">
                <div id="div425920" class="col-md-2">
                    <label data-datafield="Title" data-type="SheetLabel" id="ctl747196" class="" style="">标题</label></div>
                <div id="div62568" class="col-md-10">
                    <input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl164540" class="" style=""></div>
            </div>
            <div class="row">
                <div id="div74264" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号</span></div>
                <div id="div951831" class="col-md-4">
                    <input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum" data-onchange="setProjectDepart() ;"></div>
                <div id="div316947" class="col-md-2"></div>
                <div id="div788357" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div588045" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称</span></div>
                <div id="div87172" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class=""></div>
                <div id="div503749" class="col-md-2"></div>
            </div>
            <div class="row" id="pettyCash">
                <div id="title5" class="col-md-2">
                    <span id="Label15" data-type="SheetLabel" data-datafield="Administrator" style="">备用金管理员</span>
                </div>
                <div id="control5" class="col-md-3" style="height: 81px;border-left: 1px solid #E3E3E3;border-right: 1px solid #E3E3E3;">
                    <div id="Control15" data-datafield="Administrator" data-type="SheetUser" style=""></div>
                </div>
                <div class="col-md-2">申请金额(元)</div>
                <div class="col-md-5">
                    <div class="col-md-12">
                        <div id="title6" class="col-md-3">
                            <span id="Label16" data-type="SheetLabel" data-datafield="XAmount" style="">申请金额小写</span>
                        </div>
                        <div id="control6" class="col-md-9">
                            <input id="Control16" type="text" data-datafield="XAmount" data-type="SheetTextBox" style="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title7" class="col-md-3">
                            <span id="Label17" data-type="SheetLabel" data-datafield="DAmount" style="">申请金额大写</span>
                        </div>
                        <div id="control7" class="col-md-9">
                            <input id="Control17" type="text" data-datafield="DAmount" data-type="SheetTextBox" style="">
                        </div>
                    </div>
                </div>

            </div>

            <div class="row" id="bankCard_msg">

                <div id="title8" class="col-md-2">
                    <span id="Label18" data-type="SheetLabel" data-datafield="BCInfo" style="">备用金银行卡专户信息</span>
                </div>
                <div id="control8" class="col-md-10">
                    <div class="col-md-12">
                        <div id="title9" class="col-md-2">
                            <span id="Label19" data-type="SheetLabel" data-datafield="AccountName" style="">户名</span>
                        </div>
                        <div id="control9" class="col-md-4">
                            <input id="Control19" type="text" data-datafield="AccountName" data-type="SheetTextBox" style="">
                        </div>
                        <div id="title11" class="col-md-2" style="border-left: 1px solid #E3E3E3;">
                            <span id="Label21" data-type="SheetLabel" data-datafield="OpenBank" style="">开户银行</span>
                        </div>
                        <div id="control11" class="col-md-4">
                            <input id="Control21" type="text" data-datafield="OpenBank" data-type="SheetTextBox" style="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title10" class="col-md-2">
                             <span id="Label20" data-type="SheetLabel" data-datafield="AccountNumber" style="">账号</span>
                         </div>
                         <div id="control10" class="col-md-4">
                             <input id="Control20" type="text" data-datafield="AccountNumber" data-type="SheetTextBox" style="">
                         </div>
                         <div id="title12" class="col-md-2" style="border-left: 1px solid #E3E3E3;">
                             <span id="Label22" data-type="SheetLabel" data-datafield="EnableDate" style="">账户启用日期</span>
                         </div>
                         <div id="control12" class="col-md-4">
                             <input id="Control22" type="text" data-datafield="EnableDate" data-type="SheetTime" style="">
                         </div>
                    </div>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title13" class="col-md-2">
                    <span id="Label23" data-type="SheetLabel" data-datafield="Description" style="">说明</span>
                </div>
                <div id="control13" class="col-md-10">
                    <textarea id="Control23" data-datafield="Description" data-type="SheetRichTextBox" style="">					</textarea>
                </div>
            </div>
            <div class="row" id="WriteOff">
                <div id="title15" class="col-md-2">
                       <span id="Label24" data-type="SheetLabel" data-datafield="PaymentMethod" style="">付款方式</span>
                </div>
                <div id="control15" class="col-md-2" style="height: 164px;border-left: 1px solid #E3E3E3;">
                    <div data-datafield="PaymentMethod" data-type="SheetRadioButtonList" id="ctl754046" class="Pay" style="" data-defaultitems="现金;企业银行" data-defaultselected="false"></div>
                </div>
                <div class="col-md-1" style="height: 164px;border-left: 1px solid #E3E3E3;">销账记录</div>
                <div class="col-md-7">
                    <div class="col-md-12">
                        <div id="title16" class="col-md-3">
                            <span id="Label25" data-type="SheetLabel" data-datafield="XDate" style="">销账日期</span>
                        </div>
                        <div id="control16" class="col-md-9">
                            <input id="Control25" type="text" data-datafield="XDate" data-type="SheetTime" style="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title17" class="col-md-3">
                            <span id="Label26" data-type="SheetLabel" data-datafield="ReallyMoney" style="">实报金额</span>
                        </div>
                        <div id="control17" class="col-md-9">
                            <input id="Control26" type="text" data-datafield="ReallyMoney" data-type="SheetTextBox" style="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title18" class="col-md-3">
                            <span id="Label27" data-type="SheetLabel" data-datafield="TorB" style="">退或补</span>
                        </div>
                        <div id="control18" class="col-md-9">
                            <input id="Control27" type="text" data-datafield="TorB" data-type="SheetTextBox" style="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title19" class="col-md-3">
                            <span id="Label28" data-type="SheetLabel" data-datafield="Auditor" style="">核销人</span>
                        </div>
                        <div id="control19" class="col-md-9">
                            <div id="Control28" data-datafield="Auditor" data-type="SheetUser" style=""></div>
                        </div>
                    </div>
                </div>

            </div>


            <div class="row">
                <div id="div526538" class="col-md-2">
                    <label data-datafield="Attachment" data-type="SheetLabel" id="ctl403448" class="" style="">附件</label></div>
                <div id="div674186" class="col-md-10">
                    <div data-datafield="Attachment" data-type="SheetAttachment" id="ctl129044" class="" style=""></div>
                </div>
            </div>
            <div class="row hidden">
                <div id="div230426" class="col-md-2">
                    <label data-datafield="ProjectId" data-type="SheetLabel" id="ctl792379" class="" style="">项目id</label></div>
                <div id="div577741" class="col-md-2">
                    <input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl410982" class="" style=""></div>
                <div id="div506025" class="col-md-2">
                    <label data-datafield="xmfzr" data-type="SheetLabel" id="ctl128885" class="" style="">项目负责人</label></div>
                <div id="div763574" class="col-md-2">
                    <div data-datafield="xmfzr" data-type="SheetUser" id="ctl617657" class="" style=""></div>
                </div>
                <div id="div270283" class="col-md-2">
                    <label data-datafield="ywbmzg" data-type="SheetLabel" id="ctl394978" class="" style="">业务部门主管</label></div>
                <div id="div384152" class="col-md-2">
                    <div data-datafield="ywbmzg" data-type="SheetUser" id="ctl345702" class="" style=""></div>
                </div>
            </div>

            <div class="nav-icon fa  fa-chevron-right bannerTitle">
                <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
            </div>


            <div class="row tableContent">
                <div id="title23" class="col-md-2">
                    <span id="Label30" data-type="SheetLabel" data-datafield="ProjectManager" style="">项目经理意见</span>
                </div>
                <div id="control23" class="col-md-10">
                    <div id="Control30" data-datafield="ProjectManager" data-type="SheetComment" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div637282" class="col-md-2">
                    <label data-datafield="ywbmfzr" data-type="SheetLabel" id="ctl72685" class="" style="">业务部门负责人意见</label></div>
                <div id="div127914" class="col-md-10">
                    <div data-datafield="ywbmfzr" data-type="SheetComment" id="ctl729420" class="" style=""></div>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title25" class="col-md-2">
                    <span id="Label31" data-type="SheetLabel" data-datafield="FDOption" style="">综合办财务部门意见</span>
                </div>
                <div id="control25" class="col-md-10">
                    <div id="Control31" data-datafield="FDOption" data-type="SheetComment" style=""></div>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title27" class="col-md-2">
                    <span id="Label32" data-type="SheetLabel" data-datafield="GeneralManage" style="">总经理审批意见</span>
                </div>
                <div id="control27" class="col-md-10">
                    <div id="Control32" data-datafield="GeneralManage" data-type="SheetComment" style=""></div>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title29" class="col-md-2">
                    <span id="Label33" data-type="SheetLabel" data-datafield="ChairmanOption" style="">董事长审批意见</span>
                </div>
                <div id="control29" class="col-md-10">
                    <div id="Control33" data-datafield="ChairmanOption" data-type="SheetComment" style=""></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>