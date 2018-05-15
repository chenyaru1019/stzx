<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectArchive.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectArchive" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="SProjectArchive.js"></script>
    <script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">项目归档</label>
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
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="" class="">发起人：</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="" class="">发起部门：</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
                </div>
            </div>
            <div class="row">
                <div id="div171537" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="Title" style="" class="">申请单标题：</span></div>
                <div id="div739007" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="div782173" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="title3" class="col-md-2">

                    <span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号：</span>
                </div>
                <div id="control3" class="col-md-4">

                    <input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum,TaskNum:TaskNum" data-onchange=" setProjectDepart();
setProjectAttachment();">
                </div>
                <div id="title4" class="col-md-2">
                </div>
                <div id="control4" class="col-md-4">
                </div>
            </div>
            <div class="row">
                <div id="div373249" class="col-md-2"><span id="Label15" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称：</span></div>
                <div id="div920310" class="col-md-8">
                    <input id="Control15" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="div428555" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="title5" class="col-md-2">

                    <span id="Label16" data-type="SheetLabel" data-datafield="FilingPerson" style="" class="">归档人：</span>
                </div>
                <div id="control5" class="col-md-4">

                    <div id="Control16" data-datafield="FilingPerson" data-type="SheetUser" style="" class=""></div>
                </div>
                <div id="title6" class="col-md-2">
                </div>
                <div id="control6" class="col-md-4">
                </div>
            </div>
            <div class="row hidden">
                <div id="div57107" class="col-md-2">
                    <label data-datafield="ArchiveTime" data-type="SheetLabel" id="ctl725791" class="" style="">归档时间</label>
                </div>
                <div id="div496033" class="col-md-4">
                    <input type="text" data-datafield="ArchiveTime" data-type="SheetTime" id="ctl220045" class="" style="" data-defaultvalue="">
                </div>
                <div id="div994235" class="col-md-2">
                    <label data-datafield="TaskNum" data-type="SheetLabel" id="ctl760219" class="" style="">任务编号</label>
                </div>
                <div id="div398376" class="col-md-4">
                    <input type="text" data-datafield="TaskNum" data-type="SheetTextBox" id="ctl111133" class="" style="">
                </div>
            </div>
            <div class="row tableContent">
                <div id="title7" class="col-md-2">
                    <span id="Label17" data-type="SheetLabel" data-datafield="Description" style="" class="">项目主要成果及归档说明：</span>
                </div>
                <div id="control7" class="col-md-10">
                    <textarea id="Control17" data-datafield="Description" data-type="SheetRichTextBox" style="" class="">					</textarea>
                </div>
            </div>
            <div class="row">
                <div id="div328479" class="col-md-2">
                    <label data-datafield="Attachment" data-type="SheetLabel" id="ctl905015" class="" style="">附件：</label>
                </div>
                <div id="div357910" class="col-md-10">
                    <div data-datafield="Attachment" data-type="SheetAttachment" id="ctl216108" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div75849" class="col-md-2">
                    <label data-datafield="TransferOrders" data-type="SheetLabel" id="ctl431194" class="" style="">项目归档移交单：</label>
                </div>
                <div id="div111228" class="col-md-10">
                    <table id="ctl657276" data-datafield="TransferOrders" data-type="SheetGridView" class="SheetGridView" style="" data-displaysummary="false" data-displayadd="false">
                        <tbody>
                            <tr class="header">
                                <td id="ctl657276_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl657276_header0" data-datafield="TransferOrders.FileName" style="" class="">
                                    <label id="ctl657276_Label0" data-datafield="TransferOrders.FileName" data-type="SheetLabel" style="">归档名称</label></td>
                                <td id="ctl657276_header1" data-datafield="TransferOrders.Num" style="">
                                    <label id="ctl657276_Label1" data-datafield="TransferOrders.Num" data-type="SheetLabel" style="">分数</label></td>
                                <td id="ctl657276_header2" data-datafield="TransferOrders.Modus" style="">
                                    <label id="ctl657276_Label2" data-datafield="TransferOrders.Modus" data-type="SheetLabel" style="">形式</label></td>
                                <td id="ctl657276_header3" data-datafield="TransferOrders.Note" style="">
                                    <label id="ctl657276_Label3" data-datafield="TransferOrders.Note" data-type="SheetLabel" style="">备注</label></td>
                                <td id="ctl657276_header4" data-datafield="TransferOrders.BizObjectId" style="" class="hidden">
                                    <label id="ctl657276_Label4" data-datafield="TransferOrders.BizObjectId" data-type="SheetLabel" style="" class="">BizObjectId</label></td>
                                <td id="ctl657276_header5" data-datafield="TransferOrders.FileObjectID" style="" class="hidden">
                                    <label id="ctl657276_Label5" data-datafield="TransferOrders.FileObjectID" data-type="SheetLabel" style="">FileObjectID</label></td>
                                <td id="ctl657276_header6" data-datafield="TransferOrders.SchemaCode" style="" class="hidden">
                                    <label id="ctl657276_Label6" data-datafield="TransferOrders.SchemaCode" data-type="SheetLabel" style="">SchemaCode</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td class=""></td>
                                <td id="ctl657276_control0" data-datafield="TransferOrders.FileName" style="width: 30%;" class="">
                                    <input type="text" data-datafield="TransferOrders.FileName" data-type="SheetTextBox" id="ctl657276_control0" style=""></td>
                                <td id="ctl657276_control1" data-datafield="TransferOrders.Num" style="width: 6%;" class="" data-defaultvalue="1">
                                    <input type="text" data-datafield="TransferOrders.Num" data-type="SheetTextBox" id="ctl657276_control1" style="" class="" data-defaultvalue="1"></td>
                                <td id="ctl657276_control2" data-datafield="TransferOrders.Modus" style="width: 18%;" class="">
                                    <div data-datafield="TransferOrders.Modus" data-type="SheetCheckboxList" id="ctl427254" class="" style="" data-defaultitems="纸质;电子版" data-selectedvalue="纸质;电子版" data-repeatcolumns="2"></div>
                                </td>
                                <td id="ctl657276_control3" data-datafield="TransferOrders.Note" style="" class="">
                                    <input type="text" data-datafield="TransferOrders.Note" data-type="SheetTextBox" id="ctl657276_control3" style="" class=""></td>
                                <td id="ctl657276_control4" data-datafield="TransferOrders.BizObjectId" class="hidden" style="">
                                    <input type="text" data-datafield="TransferOrders.BizObjectId" data-type="SheetTextBox" id="ctl657276_control4" style=""></td>
                                <td id="ctl657276_control5" data-datafield="TransferOrders.FileObjectID" style="" class="hidden">
                                    <input type="text" data-datafield="TransferOrders.FileObjectID" data-type="SheetTextBox" id="ctl657276_control5" style="" class=""></td>
                                <td id="ctl657276_control6" data-datafield="TransferOrders.SchemaCode" style="" class="hidden">
                                    <input type="text" data-datafield="TransferOrders.SchemaCode" data-type="SheetTextBox" id="ctl657276_control6" style="" class=""></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                            <tr class="footer">
                                <td></td>
                                <td id="ctl657276_Stat0" data-datafield="TransferOrders.FileName" style=""></td>
                                <td id="ctl657276_Stat1" data-datafield="TransferOrders.Num" style="">
                                    <label id="ctl657276_StatControl1" data-datafield="TransferOrders.Num" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td id="ctl657276_Stat2" data-datafield="TransferOrders.Modus" style="" class=""></td>
                                <td id="ctl657276_Stat3" data-datafield="TransferOrders.Note" style="" class=""></td>
                                <td id="ctl657276_Stat4" data-datafield="TransferOrders.BizObjectId" style="" class="hidden"></td>
                                <td id="ctl657276_Stat5" data-datafield="TransferOrders.FileObjectID" style="" class="hidden"></td>
                                <td id="ctl657276_Stat6" data-datafield="TransferOrders.SchemaCode" style="" class="hidden"></td>
                                <td class=""></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div id="div764294" class="col-md-12"></div>
            </div>
            <div class="row">
                <div id="div522745" class="col-md-2">
                    <label data-datafield="AddTransferOrders" data-type="SheetLabel" id="ctl592967" class="" style="">项目资料补充：</label>
                </div>
                <div id="div122392" class="col-md-10">
                    <table id="ctl541486" data-datafield="AddTransferOrders" data-type="SheetGridView" class="SheetGridView" style="" data-displaysummary="false">
                        <tbody>
                            <tr class="header">
                                <td id="ctl541486_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl541486_header0" data-datafield="AddTransferOrders.FileName" style="">
                                    <label id="ctl541486_Label0" data-datafield="AddTransferOrders.FileName" data-type="SheetLabel" style="">文件名称</label></td>
                                <td id="ctl541486_header1" data-datafield="AddTransferOrders.Num" style="">
                                    <label id="ctl541486_Label1" data-datafield="AddTransferOrders.Num" data-type="SheetLabel" style="">份数</label></td>
                                <td id="ctl541486_header2" data-datafield="AddTransferOrders.Modus" style="">
                                    <label id="ctl541486_Label2" data-datafield="AddTransferOrders.Modus" data-type="SheetLabel" style="">形式</label></td>
                                <td id="ctl541486_header3" data-datafield="AddTransferOrders.Note" style="">
                                    <label id="ctl541486_Label3" data-datafield="AddTransferOrders.Note" data-type="SheetLabel" style="">备注</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl541486_control0" data-datafield="AddTransferOrders.FileName" style="">
                                    <div data-datafield="AddTransferOrders.FileName" data-type="SheetAttachment" id="ctl541486_control0" style=""></div>
                                </td>
                                <td id="ctl541486_control1" data-datafield="AddTransferOrders.Num" style="width: 6%;" class="">
                                    <input type="text" data-datafield="AddTransferOrders.Num" data-type="SheetTextBox" id="ctl541486_control1" style="" class=""></td>
                                <td id="ctl541486_control2" data-datafield="AddTransferOrders.Modus" style="width: 18%;" class="">
                                    <div data-datafield="AddTransferOrders.Modus" data-type="SheetCheckboxList" id="ctl975640" class="" style="" data-defaultitems="纸质;电子版" data-repeatcolumns="2"></div>
                                </td>
                                <td id="ctl541486_control3" data-datafield="AddTransferOrders.Note" style="" class="">
                                    <input type="text" data-datafield="AddTransferOrders.Note" data-type="SheetTextBox" id="ctl541486_control3" style=""></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                            <tr class="footer">
                                <td></td>
                                <td id="ctl541486_Stat0" data-datafield="AddTransferOrders.FileName" style=""></td>
                                <td id="ctl541486_Stat1" data-datafield="AddTransferOrders.Num" style="" class="">
                                    <label id="ctl541486_StatControl1" data-datafield="AddTransferOrders.Num" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td id="ctl541486_Stat2" data-datafield="AddTransferOrders.Modus" style="" class=""></td>
                                <td id="ctl541486_Stat3" data-datafield="AddTransferOrders.Note" style="" class=""></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div id="div590587" class="col-md-12">
                </div>
            </div>
            <div class="row hidden">
                <div id="div707851" class="col-md-2">
                    <label data-datafield="ProjectId" data-type="SheetLabel" id="ctl532676" class="" style="">项目id</label>
                </div>
                <div id="div147470" class="col-md-4">
                    <input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl827685" class="" style="">
                </div>
                <div id="div331801" class="col-md-2"></div>
                <div id="div110411" class="col-md-4"></div>
            </div>

            <div class="nav-icon fa  fa-chevron-right bannerTitle">
                <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
            </div>

            <div class="row">
                <div id="div878955" class="col-md-2">
                    <label data-datafield="xmjlyj" data-type="SheetLabel" id="ctl608418" class="" style="">项目经理意见：</label>
                </div>
                <div id="div83256" class="col-md-10">
                    <div data-datafield="xmjlyj" data-type="SheetComment" id="ctl379280" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div843911" class="col-md-2">
                    <label data-datafield="daglyyj" data-type="SheetLabel" id="ctl65216" class="" style="">项目部档案管理员意见：</label>
                </div>
                <div id="div227388" class="col-md-10">
                    <div data-datafield="daglyyj" data-type="SheetComment" id="ctl364185" class="" style=""></div>
                </div>
            </div>
            <!--<div class="row">-->
                <!--<div id="div153222" class="col-md-2">-->
                    <!--<label data-datafield="xmjlhfyj" data-type="SheetLabel" id="ctl785598" class="" style="">项目经理修改结果及回复意见：</label>-->
                <!--</div>-->
                <!--<div id="div250889" class="col-md-10">-->
                    <!--<div data-datafield="xmjlhfyj" data-type="SheetComment" id="ctl562657" class="" style=""></div>-->
                <!--</div>-->
            <!--</div>-->
        </div>
    </div>

</asp:Content>
