<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SNewsStatistic.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.QueryPage.SNewsStatistic" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="SNewsStatistic.js"></script>
    <script type="text/javascript">

        $.MvcSheet.PreInit = function () {

            $("#ctl985045_control0 input").attr("disabled", "disabled");
            $("#ctl985045_control1 input").attr("disabled", "disabled");
            $("#ctl985045_control2 input").attr("disabled", "disabled");
            $("#ctl985045_control3 input").attr("disabled", "disabled");
            $("#ctl985045_control4 input").attr("disabled", "disabled");
        }
    </script>
    <style type='text/css'>
        #divTopBars li[data-action='Submit'],#divTopBars li[data-action='Save'],#divTopBars li[data-action='ViewInstance'] {
            display: none;
        }
        .btn {
            width: 40%;
            height: 30px;
            border-radius: 7px;
            background-color: #F9F9F9;
            border: 1px solid #C0C0C0;
            color: #7b7878;
            font-size: 13px;
        }
        .btn:hover {
            background: #eaeaea!important;
            background-color: white;
            color: #7b7878;
            font-size: 13px;
        }
    </style>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">新闻统计</label>
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
        <div class="nav-icon fa  fa-chevron-right bannerTitle hidden">
            <label id="divSheetInfo" data-en_us="Sheet information" class="">表单信息</label>
        </div>
        <div class="divContent" id="divSheet">
            <div class="row">
                <div id="div29992" class="col-md-12"></div>
            </div>
            <div class="row" style='border:0;'>
                <div id="div738731" class="col-md-1" style='background: #ffffff'><span id="Label11" data-type="SheetLabel" data-datafield="QYear" style="" class="">查询年份</span></div>
                <div id="div320283" class="col-md-3">
                    <input id="Control11" type="text" data-datafield="QYear" data-type="SheetTime" style="" class="" data-wdatepickerjson="{dateFmt:'yyyy'}" data-defaultvalue="">
                </div>
                <div id="div818386" class="col-md-2" style='background: #ffffff'>
                    <input type="button" value="查询" class='btn btn-default fa fa-search' onclick="newsStatistic()" style='line-height: 30px; padding: 0px 10px;' />

                </div>
                <div id="div502505" class="col-md-1"></div>
                <div id="div154063" class="col-md-4"></div>
            </div>
            <div class="row" style='border-top: 1px solid  #E3E3E3'>
                <div id="div375633" class="col-md-12">
                    <table id="ctl985045" data-datafield="NewsStatisticTable" data-type="SheetGridView" class="SheetGridView" style="" data-displayexport="true" data-displayadd="false">
                        <tbody>
                            <tr class="header">
                                <td id="ctl985045_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl985045_header0" data-datafield="NewsStatisticTable.Department" style="">
                                    <label id="ctl985045_Label0" data-datafield="NewsStatisticTable.Department" data-type="SheetLabel" style="">部门</label></td>
                                <td id="ctl985045_header1" data-datafield="NewsStatisticTable.Applyer" style="">
                                    <label id="ctl985045_Label1" data-datafield="NewsStatisticTable.Applyer" data-type="SheetLabel" style="">投稿人</label></td>
                                <td id="ctl985045_header2" data-datafield="NewsStatisticTable.NewsName" style="">
                                    <label id="ctl985045_Label2" data-datafield="NewsStatisticTable.NewsName" data-type="SheetLabel" style="">投稿新闻</label></td>
                                <td id="ctl985045_header3" data-datafield="NewsStatisticTable.PulishDate" style="">
                                    <label id="ctl985045_Label3" data-datafield="NewsStatisticTable.PulishDate" data-type="SheetLabel" style="">发布时间</label></td>
                                <td id="ctl985045_header4" data-datafield="NewsStatisticTable.Total" style="">
                                    <label id="ctl985045_Label4" data-datafield="NewsStatisticTable.Total" data-type="SheetLabel" style="">总数</label></td>
                                <td class="rowOption hidden">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl985045_control0" data-datafield="NewsStatisticTable.Department" style="width: 15%;" class="">
                                    <input type="text" data-datafield="NewsStatisticTable.Department" data-type="SheetTextBox" id="ctl985045_control0" style=""></td>
                                <td id="ctl985045_control1" data-datafield="NewsStatisticTable.Applyer" style="width: 15%;" class="">
                                    <input type="text" data-datafield="NewsStatisticTable.Applyer" data-type="SheetTextBox" id="ctl985045_control1" style="" class=""></td>
                                <td id="ctl985045_control2" data-datafield="NewsStatisticTable.NewsName" style="" class="">
                                    <input type="text" data-datafield="NewsStatisticTable.NewsName" data-type="SheetTextBox" id="ctl985045_control2" style="" class=""></td>
                                <td id="ctl985045_control3" data-datafield="NewsStatisticTable.PulishDate" style="width: 10%;" class="">
                                    <input type="text" data-datafield="NewsStatisticTable.PulishDate" data-type="SheetTime" id="ctl985045_control3" style="" class=""></td>
                                <td id="ctl985045_control4" data-datafield="NewsStatisticTable.Total" style="width: 7%;" class="">
                                    <input type="text" style="text-align: center;" data-datafield="NewsStatisticTable.Total" data-type="SheetTextBox" id="ctl985045_control4" style=""></td>
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

        </div>
    </div>
</asp:Content>
