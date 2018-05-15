<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SFileBorrow.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SFileBorrow" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="SFileBorrow.js"></script>
    <script type="text/javascript">


        $.MvcSheet.PreInit = function () {

            $("#ctl244694").attr("onfocus", "this.blur()");
            $("#ctl533409").attr("onfocus", "this.blur()");

            //借阅的文件只读
            $("#ctl824322_control0 input").attr("disabled", "disabled");
            $("#ctl824322_control1 input").attr("disabled", "disabled");
            $("#ctl722281 ").css("pointer-events", "none");
            $("#ctl824322_control3 input").attr("disabled", "disabled");

        }




        $.MvcSheet.Loaded = function (sheetInfo) {

            var projectId = $.MvcSheetUI.GetControlValue("ProjectId");
            if (projectId) {
                setProjectInfo();
                setArchiveData();
            }

            if ($.MvcSheetUI.SheetInfo.ActivityCode == "finish") {
                $.MvcSheet.SubmitAction.Text = "完成";

                var borrowDocuments = $.MvcSheetUI.GetElement("BorrowDocuments")
                    .SheetGridView();
                console.log(borrowDocuments)
                var borrowDocumentsArr = borrowDocuments.V.R;
                if (borrowDocumentsArr.length > 0) {
                    for (var i = 0; i < borrowDocumentsArr.length; i++) {
                        var operate = borrowDocumentsArr[i].DataItems["BorrowDocuments.Operate"].V;
                        if (operate) {
                            console.log(i);
                            //借阅勾选后显示下载
                            console.log($('#ctl824322 .rows #ctl824322_control4 ').find('#ctl258366_Row' + (i + 1) + ''));
                            $('#ctl824322 .rows #ctl824322_control4 ').find('#ctl258366_Row' + (i + 1) + '').css('display', 'none');
                            var url = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=" + borrowDocumentsArr[i].DataItems["BorrowDocuments.SchemaCode"].V + "&BizObjectID=" + borrowDocumentsArr[i].DataItems["BorrowDocuments.BizObjectId"].V + "&AttachmentID=" + borrowDocumentsArr[i].DataItems["BorrowDocuments.FileObjectID"].V + "&OpenMethod=0";
                            $($('#ctl824322 .rows #ctl824322_control4 ').find('a')[i]).html('下载')
                            $($('#ctl824322 .rows #ctl824322_control4 ').find('a')[i]).attr('href', url)
                        }


                    }

                }

            }


        }
    </script>
    <style type='text/css'>
         .divTopBars li:last-child {
                    display:block;
         }
    </style>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">档案借阅</label>
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
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">借阅人</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">借阅部门</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
                </div>
            </div>
            <div class="row">
                <div id="div583222" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="Title" style="" class="">标题</span></div>
                <div id="div706277" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="div46726" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="div652158" class="col-md-2">
                    <label data-datafield="ProjectNum" data-type="SheetLabel" id="ctl557580" class="" style="">项目编号</label>
                </div>
                <div id="div297965" class="col-md-4">
                    <input type="text" data-datafield="ProjectNum" data-type="SheetTextBox" id="ctl244694" class="" style="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum" data-onchange=" setProjectDepart(); setArchiveData();">
                </div>
                <div id="div130047" class="col-md-2"></div>
                <div id="div637588" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div392196" class="col-md-2">
                    <label data-datafield="ProjectName" data-type="SheetLabel" id="ctl714166" class="" style="">项目名称</label>
                </div>
                <div id="div320818" class="col-md-8">
                    <input type="text" data-datafield="ProjectName" data-type="SheetTextBox" id="ctl533409" class="" style="">
                </div>
                <div id="div930767" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="div933962" class="col-md-2">
                    <label data-datafield="BorrowDocuments" data-type="SheetLabel" id="ctl519190" class="" style="">借阅的文件</label>
                </div>
                <div id="div525450" class="col-md-10">
                    <table id="ctl824322" data-datafield="BorrowDocuments" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-displaysummary="false">
                        <tbody>
                            <tr class="header">
                                <td id="ctl824322_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl824322_header0" data-datafield="BorrowDocuments.FileName" style="">
                                    <label id="ctl824322_Label0" data-datafield="BorrowDocuments.FileName" data-type="SheetLabel" style="">文件名称</label></td>
                                <td id="ctl824322_header1" data-datafield="BorrowDocuments.Num" style="">
                                    <label id="ctl824322_Label1" data-datafield="BorrowDocuments.Num" data-type="SheetLabel" style="">份数</label></td>
                                <td id="ctl824322_header2" data-datafield="BorrowDocuments.Modus" style="" class="">
                                    <label id="ctl824322_Label2" data-datafield="BorrowDocuments.Modus" data-type="SheetLabel" style="">形式</label></td>
                                <td id="ctl824322_header3" data-datafield="BorrowDocuments.Note" style="">
                                    <label id="ctl824322_Label3" data-datafield="BorrowDocuments.Note" data-type="SheetLabel" style="">备注</label></td>
                                <td id="ctl824322_header4" data-datafield="BorrowDocuments.Operate" style="" class="">
                                    <label id="ctl824322_Label4" data-datafield="BorrowDocuments.Operate" data-type="SheetLabel" style="">操作</label></td>
                                <td id="ctl824322_header5" data-datafield="BorrowDocuments.BizObjectId" style="" class="hidden">
                                    <label id="ctl824322_Label5" data-datafield="BorrowDocuments.BizObjectId" data-type="SheetLabel" style="">BizObjectId</label></td>
                                <td id="ctl824322_header6" data-datafield="BorrowDocuments.FileObjectID" style="" class="hidden">
                                    <label id="ctl824322_Label6" data-datafield="BorrowDocuments.FileObjectID" data-type="SheetLabel" style="">FileObjectID</label></td>
                                <td id="ctl824322_header7" data-datafield="BorrowDocuments.SchemaCode" style="" class="hidden">
                                    <label id="ctl824322_Label7" data-datafield="BorrowDocuments.SchemaCode" data-type="SheetLabel" style="" class="">SchemaCode</label></td>
                                <td class="rowOption hidden">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl824322_control0" data-datafield="BorrowDocuments.FileName" style="" class="">
                                    <input type="text" data-datafield="BorrowDocuments.FileName" data-type="SheetTextBox" id="ctl824322_control0" style=""></td>
                                <td id="ctl824322_control1" data-datafield="BorrowDocuments.Num" style="width: 6%;" class="">
                                    <input type="text" data-datafield="BorrowDocuments.Num" data-type="SheetTextBox" id="ctl824322_control1" style="width: 100%; text-align: center" class=""></td>
                                <td id="ctl824322_control2" data-datafield="BorrowDocuments.Modus" style="width: 18%;" class="">
                                    <div data-datafield="BorrowDocuments.Modus" data-type="SheetCheckboxList" id="ctl722281" class="" style="" data-defaultitems="纸质;电子版" data-repeatcolumns="2"></div>
                                </td>
                                <td id="ctl824322_control3" data-datafield="BorrowDocuments.Note" style="">
                                    <input type="text" data-datafield="BorrowDocuments.Note" data-type="SheetTextBox" id="ctl824322_control3" style=""></td>
                                <td id="ctl824322_control4" data-datafield="BorrowDocuments.Operate" style="width: 8%;" class="">
                                    <div data-datafield="BorrowDocuments.Operate" data-type="SheetCheckboxList" id="ctl258366" class="" style="" data-defaultitems="借阅" data-repeatcolumns="1"></div>
                                    <a></a>
                                </td>
                                <td id="ctl824322_control5" data-datafield="BorrowDocuments.BizObjectId" style="" class="hidden">
                                    <input type="text" data-datafield="BorrowDocuments.BizObjectId" data-type="SheetTextBox" id="ctl824322_control5" style=""></td>
                                <td id="ctl824322_control6" data-datafield="BorrowDocuments.FileObjectID" style="" class="hidden">
                                    <input type="text" data-datafield="BorrowDocuments.FileObjectID" data-type="SheetTextBox" id="ctl824322_control6" style=""></td>
                                <td id="ctl824322_control7" data-datafield="BorrowDocuments.SchemaCode" style="" class="hidden">
                                    <input type="text" data-datafield="BorrowDocuments.SchemaCode" data-type="SheetTextBox" id="ctl824322_control7" style=""></td>
                                <td class="rowOption hidden"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                            <tr class="footer">
                                <td></td>
                                <td id="ctl824322_Stat0" data-datafield="BorrowDocuments.FileName" style=""></td>
                                <td id="ctl824322_Stat1" data-datafield="BorrowDocuments.Num" style="">
                                    <label id="ctl824322_StatControl1" data-datafield="BorrowDocuments.Num" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td id="ctl824322_Stat2" data-datafield="BorrowDocuments.Modus" style=""></td>
                                <td id="ctl824322_Stat3" data-datafield="BorrowDocuments.Note" style=""></td>
                                <td id="ctl824322_Stat4" data-datafield="BorrowDocuments.Operate" style=""></td>
                                <td id="ctl824322_Stat5" data-datafield="BorrowDocuments.BizObjectId" style="" class="hidden"></td>
                                <td id="ctl824322_Stat6" data-datafield="BorrowDocuments.FileObjectID" style="" class="hidden"></td>
                                <td id="ctl824322_Stat7" data-datafield="BorrowDocuments.SchemaCode" style="" class="hidden"></td>
                                <td class="hidden"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row hidden">
                <div id="div5073" class="col-md-2">
                    <label data-datafield="ProjectId" data-type="SheetLabel" id="ctl735625" class="" style="">项目id</label>
                </div>
                <div id="div206089" class="col-md-4">
                    <input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl988752" class="" style="">
                </div>
                <div id="div528696" class="col-md-2"></div>
                <div id="div595375" class="col-md-4"></div>
            </div>

            <div class="row tableContent">
                <div id="title5" class="col-md-2">
                    <span id="Label14" data-type="SheetLabel" data-datafield="Reason" style="">借阅事由</span>
                </div>
                <div id="control5" class="col-md-10">
                    <textarea id="Control14" data-datafield="Reason" data-type="SheetRichTextBox" style="">					</textarea>
                </div>
            </div>
            <div class="row">
                <div id="title7" class="col-md-2">
                    <span id="Label15" data-type="SheetLabel" data-datafield="Attachment" style="">附件</span>
                </div>
                <div id="control7" class="col-md-10">
                    <div id="Control15" data-datafield="Attachment" data-type="SheetAttachment" style="" class=""></div>
                </div>
            </div>

            <div class="nav-icon fa  fa-chevron-right bannerTitle">
                <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
            </div>

            <div class="row tableContent">
                <div id="title9" class="col-md-2">
                    <span id="Label16" data-type="SheetLabel" data-datafield="bmzgyj" style="">部门主管意见</span>
                </div>
                <div id="control9" class="col-md-10">
                    <div id="Control16" data-datafield="bmzgyj" data-type="SheetComment" style="" class=""></div>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title11" class="col-md-2">
                    <span id="Label17" data-type="SheetLabel" data-datafield="daglyjy" style="">项管部档案管理员意见</span>
                </div>
                <div id="control11" class="col-md-10">
                    <div id="Control17" data-datafield="daglyjy" data-type="SheetComment" style=""></div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
