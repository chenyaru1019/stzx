<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSubwayJournals.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SSubwayJournals" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script type="text/javascript">
            $.MvcSheet.Loaded = function (sheetInfo) {
               $('title').html($('.panel-title').text());
        };
</script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">地铁期刊</label>
    </div>
    <div class="panel-body sheetContainer">
        <div class="nav-icon fa fa-chevron-right bannerTitle hidden">
            <label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
        </div>
        <div class="divContent">
            <div class="row hidden">
                <div id="divFullNameTitle" class="col-md-2">
                    <label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="">发起人</label>
                </div>
                <div id="divFullName" class="col-md-4">
                    <label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style="">
                    </label>
                </div>
                <div id="divOriginateDateTitle" class="col-md-2">
                    <label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
                </div>
                <div id="divOriginateDate" class="col-md-4">
                    <label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style="">
                    </label>
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
                    <label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style="">
                    </label>
                </div>
            </div>
        </div>
        <div class="nav-icon fa  fa-chevron-right bannerTitle hidden">
            <label id="divSheetInfo" data-en_us="Sheet information" class="">表单信息</label>
        </div>
        <div class="divContent" id="divSheet">
            <div class="row" style="border-top: 1px solid #E3E3E3;">
                <div id="title1" class="col-md-2">
                    <span id="Label15" data-type="SheetLabel" data-datafield="Publisher" style="" class="">期刊编辑人</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control15" type="text" data-datafield="Publisher" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
                </div>
                <div id="space2" class="col-md-2">
                    <span id="Label14" data-type="SheetLabel" data-datafield="Source" style="" class="">期刊来源</span>
                </div>
                <div id="spaceControl2" class="col-md-4">
                    <input id="Control14" type="text" data-datafield="Source" data-type="SheetTextBox" style="" class="">
                </div>
            </div>
            <div class="row">
                <div id="div720086" class="col-md-2">
                    <label data-datafield="Type" data-type="SheetLabel" id="ctl601147" class="" style="">类别</label></div>
                <div id="div651203" class="col-md-10">
                    <div data-datafield="Type" data-type="SheetRadioButtonList" id="ctl250891" class="" style="" data-defaultitems="地铁画报;申通咨询" data-defaultselected="false"></div>
                </div>
                <!--<div id="div667063" class="col-md-2"></div>-->
                <!--<div id="div581342" class="col-md-4"></div>-->
            </div>
            <div class="row">
                <div id="div547806" class="col-md-2">
                    <span id="Label11" data-type="SheetLabel" data-datafield="Title" style="" class="">标题</span>
                </div>
                <div id="div729892" class="col-md-10">
                    <input id="Control11" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class="">
                </div>
            </div>
            <div class="row tableContent">
                <div id="title3" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Content" style="">内容</span>
                </div>
                <div id="control3" class="col-md-10">
                    <textarea id="Control12" data-datafield="Content" data-type="SheetRichTextBox" style="height: 200px;" class="">					</textarea>
                </div>
            </div>
            <div class="row">
                <div id="title5" class="col-md-2">
                    <span id="Label13" data-type="SheetLabel" data-datafield="Attach" style="">期刊附件</span>
                </div>
                <div id="control5" class="col-md-10">
                    <div id="Control13" data-datafield="Attach" data-type="SheetAttachment" style="" class="" data-maxuploadsize="100">
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="title9" class="col-md-2">
                    <span id="Label16" data-type="SheetLabel" data-datafield="PublishTime" style="">期刊发布时间</span>
                </div>
                <div id="control9" class="col-md-4">
                    <input id="Control16" type="text" data-datafield="PublishTime" data-type="SheetTime" style="" class="" data-timemode="FullTime">
                </div>
                <div id="space10" class="col-md-2">
                </div>
                <div id="spaceControl10" class="col-md-4">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
