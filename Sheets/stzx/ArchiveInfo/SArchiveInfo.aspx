<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SArchiveInfo.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SArchiveInfo" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="SArchiveInfo.js"></script>
    <script type="text/javascript">

        $.MvcSheet.PreInit = function () {

            $("#Control11").attr("disabled", "disabled");
            $("#ctl889361  ").attr("disabled", "disabled");
            $("#ctl483100").attr("disabled", "disabled");
            //归档资料只读
            $("#Control12_ctl3").attr("disabled", "disabled");
            $("#Control12_ctl4").attr("disabled", "disabled");
            $("#ctl240962").css("pointer-events", "none");
            $("#Control12_ctl6").attr("disabled", "disabled");



            //过程信息只读
            $("#ctl88608_control0 input").attr("disabled", "disabled");
            $("#ctl88608_control1 input").attr("disabled", "disabled");
            $("#ctl88608_control2 input").attr("disabled", "disabled");
            $("#ctl88608_control3 input").attr("disabled", "disabled");
            $("#ctl88608_control4 input").attr("disabled", "disabled");
            $("#ctl88608_control5 input").attr("disabled", "disabled");

        }

        $.MvcSheet.Loaded = function (sheetInfo) {

            setArchiveData();
            setProcessInfo();
        }
    </script>
    <style type='text/css'>
         #divTopBars li:first-child {
                    display:none;
          }
          .tab-content {
            padding: 0;
          }
    </style>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">档案信息</label>
    </div>
    <div class="panel-body sheetContainer">
        <div class="nav-icon fa fa-chevron-right bannerTitle hidden">
            <label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
        </div>
        <div class="divContent" style='display: none;'>
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
            <label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
        </div>
        <ul id="myTab" class="nav nav-tabs">
        	<li class="active">
        		<a href="#ArchivedData" data-toggle="tab">
        			 归档资料
        		</a>
        	</li>
        	<li><a href="#ProcessInfo" data-toggle="tab">过程信息</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
        	<div class="tab-pane fade in active" id="ArchivedData">
                <div class="row">
                        <div id="div339593" class="col-md-2">
                            <label data-datafield="ProjectNum" data-type="SheetLabel" id="ctl96387" class="" style="">项目编号:</label></div>
                        <div id="div983094" class="col-md-4">
                            <input type="text" data-datafield="ProjectNum" data-type="SheetTextBox" id="ctl889361" class="" style=""></div>
                        <div id="div333259" class="col-md-2"></div>
                        <div id="div653775" class="col-md-4"></div>
                    </div>
                <div class="row">
                        <div id="div330546" class="col-md-2">
                            <label data-datafield="ProjectName" data-type="SheetLabel" id="ctl337908" class="" style="">项目名称:</label></div>
                        <div id="div969381" class="col-md-8">
                            <input type="text" data-datafield="ProjectName" data-type="SheetTextBox" id="ctl483100" class="" style=""></div>
                        <div id="div796549" class="col-md-2"></div>
                    </div>
                <div class="row">
                        <div id="title1" class="col-md-2">
                            <span id="Label11" data-type="SheetLabel" data-datafield="ArchiveTime" style="" class="">归档时间：</span>
                        </div>
                        <div id="control1" class="col-md-4">
                            <input id="Control11" type="text" data-datafield="ArchiveTime" data-type="SheetTime" style="">
                        </div>
                        <div id="space2" class="col-md-2">
                        </div>
                        <div id="spaceControl2" class="col-md-4">
                        </div>
                    </div>
                <div class="row hidden">
                        <div id="div594132" class="col-md-2">
                            <label data-datafield="ProjectId" data-type="SheetLabel" id="ctl889964" class="" style="">项目id</label></div>
                        <div id="div186662" class="col-md-4">
                            <input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl81290" class="" style=""></div>
                        <div id="div667619" class="col-md-2">
                            <label data-datafield="Flag" data-type="SheetLabel" id="ctl519835" class="" style="">Flag</label></div>
                        <div id="div519994" class="col-md-4">
                            <input type="text" data-datafield="Flag" data-type="SheetTextBox" id="ctl817725" class="" style=""></div>
                    </div>
                <div class="row tableContent">
                        <div id="title3" class="col-md-2">
                            <span id="Label12" data-type="SheetLabel" data-datafield="ArchiveData" style="" class="">归档资料</span>
                        </div>
                        <div id="control3" class="col-md-10">
                        </div>
                    </div>
                <div class="row">
                        <div id="div613562" class="col-md-12">
                            <table id="Control12" data-datafield="ArchiveData" data-type="SheetGridView" class="SheetGridView" data-displaysummary="false" data-displayadd="false">
                                <tbody>

                                    <tr class="header">
                                        <td id="Control12_SerialNo" class="rowSerialNo">序号								</td>
                                        <td id="Control12_Header3" data-datafield="ArchiveData.FileName" class="">
                                            <label id="Control12_Label3" data-datafield="ArchiveData.FileName" data-type="SheetLabel" style="">归档名称</label>
                                        </td>
                                        <td id="Control12_Header4" data-datafield="ArchiveData.Num">
                                            <label id="Control12_Label4" data-datafield="ArchiveData.Num" data-type="SheetLabel" style="">份数</label>
                                        </td>
                                        <td id="Control12_Header5" data-datafield="ArchiveData.Modus">
                                            <label id="Control12_Label5" data-datafield="ArchiveData.Modus" data-type="SheetLabel" style="">形式</label>
                                        </td>
                                        <td id="Control12_Header6" data-datafield="ArchiveData.Note">
                                            <label id="Control12_Label6" data-datafield="ArchiveData.Note" data-type="SheetLabel" style="">备注</label>
                                        </td>
                                        <td id="Control12_Header7" data-datafield="ArchiveData.Operate">
                                            <label id="Control12_Label7" data-datafield="ArchiveData.Operate" data-type="SheetLabel" style="">操作</label>
                                        </td>
                                        <td class="rowOption hidden">删除								</td>
                                    </tr>
                                    <tr class="template">
                                        <td id="Control12_Option" class="rowOption"></td>
                                        <td data-datafield="ArchiveData.FileName">
                                            <input id="Control12_ctl3" type="text" data-datafield="ArchiveData.FileName" data-type="SheetTextBox" style="">
                                        </td>
                                        <td data-datafield="ArchiveData.Num" class="" style="width: 6%;">
                                            <input id="Control12_ctl4" type="text" data-datafield="ArchiveData.Num" data-type="SheetTextBox" style="">
                                        </td>
                                        <td data-datafield="ArchiveData.Modus" class="" style="width: 18%;">

                                            <div data-datafield="ArchiveData.Modus" data-type="SheetCheckboxList" id="ctl240962" class="" style="" data-defaultitems="纸质;电子版" data-repeatcolumns="2"></div>
                                        </td>
                                        <td data-datafield="ArchiveData.Note">
                                            <input id="Control12_ctl6" type="text" data-datafield="ArchiveData.Note" data-type="SheetTextBox" style="" class="">
                                        </td>
                                        <td data-datafield="ArchiveData.Operate" class="" style="width: 8%;" id="operate">

                                             <a ></a>
                                        </td>
                                        <td class="rowOption hidden">
                                            <a class="delete">
                                                <div class="fa fa-minus">
                                                </div>
                                            </a>
                                            <a class="insert">
                                                <div class="fa fa-arrow-down">
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr class="footer">
                                        <td class="rowOption"></td>
                                        <td data-datafield="ArchiveData.FileName"></td>
                                        <td data-datafield="ArchiveData.Num" class="">
                                            <label id="Control12_stat4" data-datafield="ArchiveData.Num" data-type="SheetCountLabel" style=""></label>
                                        </td>
                                        <td data-datafield="ArchiveData.Modus"></td>
                                        <td data-datafield="ArchiveData.Note"></td>
                                        <td data-datafield="ArchiveData.Operate" class="" style="width: 8%;"></td>
                                        <td class="rowOption hidden"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
        	</div>
        	<div class="tab-pane fade active" id="ProcessInfo">
                <div class="row">
                    <div id="div830574" class="col-md-2">
                        <label data-datafield="ProcessInfo" data-type="SheetLabel" id="ctl226746" class="" style="">过程信息</label></div>
                    <div id="div996199" class="col-md-10"></div>
                </div>
                <div class="row">
                    <div id="div342055" class="col-md-12">
                        <table id="ctl88608" data-datafield="ProcessInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displaysummary="false" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl88608_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl88608_header0" data-datafield="ProcessInfo.SerialNum" style="">
                                        <label id="ctl88608_Label0" data-datafield="ProcessInfo.SerialNum" data-type="SheetLabel" style="">流水号</label></td>
                                    <td id="ctl88608_header1" data-datafield="ProcessInfo.Title" style="">
                                        <label id="ctl88608_Label1" data-datafield="ProcessInfo.Title" data-type="SheetLabel" style="">申请单标题</label></td>
                                    <td id="ctl88608_header2" data-datafield="ProcessInfo.FormName" style="">
                                        <label id="ctl88608_Label2" data-datafield="ProcessInfo.FormName" data-type="SheetLabel" style="">业务名称</label></td>
                                    <td id="ctl88608_header3" data-datafield="ProcessInfo.StartDate" style="">
                                        <label id="ctl88608_Label3" data-datafield="ProcessInfo.StartDate" data-type="SheetLabel" style="">发起时间</label></td>
                                    <td id="ctl88608_header4" data-datafield="ProcessInfo.Department" style="">
                                        <label id="ctl88608_Label4" data-datafield="ProcessInfo.Department" data-type="SheetLabel" style="">发起部门</label></td>
                                    <td id="ctl88608_header5" data-datafield="ProcessInfo.Applyer" style="">
                                        <label id="ctl88608_Label5" data-datafield="ProcessInfo.Applyer" data-type="SheetLabel" style="">发起人</label></td>
                                    <td id="ctl88608_header6" data-datafield="ProcessInfo.Operate" style="">
                                        <label id="ctl88608_Label6" data-datafield="ProcessInfo.Operate" data-type="SheetLabel" style="">操作</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl88608_control0" data-datafield="ProcessInfo.SerialNum" style="width: 13%;" class="">
                                        <input type="text" data-datafield="ProcessInfo.SerialNum" data-type="SheetTextBox" id="ctl88608_control0" style=""></td>
                                    <td id="ctl88608_control1" data-datafield="ProcessInfo.Title" style="">
                                        <input type="text" data-datafield="ProcessInfo.Title" data-type="SheetTextBox" id="ctl88608_control1" style=""></td>
                                    <td id="ctl88608_control2" data-datafield="ProcessInfo.FormName" style="">
                                        <input type="text" data-datafield="ProcessInfo.FormName" data-type="SheetTextBox" id="ctl88608_control2" style=""></td>
                                    <td id="ctl88608_control3" data-datafield="ProcessInfo.StartDate" style="width: 10%;" class="">
                                        <input type="text" data-datafield="ProcessInfo.StartDate" data-type="SheetTime" id="ctl88608_control3" style=""></td>
                                    <td id="ctl88608_control4" data-datafield="ProcessInfo.Department" style="width: 12%;" class="">
                                        <input type="text" data-datafield="ProcessInfo.Department" data-type="SheetTextBox" id="ctl88608_control4" style="" class=""></td>
                                    <td id="ctl88608_control5" data-datafield="ProcessInfo.Applyer" style="width: 12%;" class="">
                                        <input type="text" data-datafield="ProcessInfo.Applyer" data-type="SheetTextBox" id="ctl88608_control5" style="" class=""></td>
                                    <td id="ctl88608_control6" data-datafield="ProcessInfo.Operate" style="width: 8%;" class="" >
                                        <a ></a>

                                    </td>
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
    </div>
</asp:Content>
