<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SOfficeTemplate.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SOfficeTemplate" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <link rel="stylesheet" href="SOfficeTemplate.css">
    <script src="SOfficeTemplate.js"></script>
    <script type="text/javascript">


        $.MvcSheet.PreInit = function () {

            setCarouselFigure();
        };
    </script>
    <div style="text-align: center;position: fixed;top: 0px;z-index: 999999;" class="DragContainer">
        <label id="lblTitle" class="panel-title">Office模板管理</label>
    </div>
    <div class="panel-body sheetContainer">

        <div class="divContent" id="divSheet">
            <div class="row">
                <div class="col-md-6 Wrapper">
                    	<div id="picSlideWrap" class="clearfix">
                            <div class="imgnav" id="imgnav">
                                 <div id="img">
                                    <!--<img src="images/100260_1306276811398.jpg" width="780" height="570">-->
                                    <!--<img src="images/100261_1306276853791.jpg"  width="780" height="570">-->
                                    <!--<img src="images/100391_4381_1306217104406.jpg" width="780" height="570" />-->
                                    <!--<img src="images/bImg.jpg"  width="780" height="570" />-->
                                    <!--<img src="images/100260_1306276811398.jpg" width="780" height="570">-->
                                    <!--<img src="images/100261_1306276853791.jpg"  width="780" height="570">-->
                                    <!--<img src="images/100391_4381_1306217104406.jpg" width="780" height="570" />-->
                                    <!--<img src="images/bImg.jpg"  width="780" height="570" />-->
                                    <!--<img src="images/100260_1306276811398.jpg" width="780" height="570">-->
                                    <!--<img src="images/100261_1306276853791.jpg"  width="780" height="570">-->
                                    <!--<div id="front" title="上一张"><a href="javaScript:void(0)" class="pngFix"></a></div>-->
                                    <!--<div id="next" title="下一张"><a href="javaScript:void(0)" class="pngFix"></a></div>-->
                                 </div>
                                 <div id="cbtn">
                                    <i class="picSildeLeft"><img src="images/ico/picSlideLeft.gif"></i>
                                    <i class="picSildeRight"><img src="images/ico/picSlideRight.gif"></i>
                                    <div id="cSlideUl">
                                        <ul>
                                            <!--<li><img src="images/100260_1306276811398.jpg"><tt></tt></li>-->
                                            <!--<li><img src="images/100261_1306276853791.jpg"><tt></tt></li>-->
                                            <!--<li><img src="images/100391_4381_1306217104406.jpg" /><tt></tt></li>-->
                                            <!--<li><img src="images/bImg.jpg"><tt></tt></li>-->
                                            <!--<li><img src="images/100260_1306276811398.jpg"><tt></tt></li>-->
                                            <!--<li><img src="images/100261_1306276853791.jpg"><tt></tt></li>-->
                                            <!--<li><img src="images/100391_4381_1306217104406.jpg" /><tt></tt></li>-->
                                            <!--<li><img src="images/bImg.jpg"><tt></tt></li>-->
                                            <!--<li><img src="images/100260_1306276811398.jpg"><tt></tt></li>-->
                                            <!--<li><img src="images/100261_1306276853791.jpg"><tt></tt></li>-->
                                        </ul>
                                    </div>
                                 </div>
                            </div>
                        </div><!--end滚动看图-->
                </div>
                <div class="col-md-6" id="OfficeMsg">
                    <div class="col-md-12">
                        <div id="title5" class="col-md-3" data-title="" style='display: none'>
                            <span id="Label15" data-type="SheetLabel" data-datafield="TemplateName" style="display: block;">模板名称</span>
                        </div>
                        <div id="control5" class="col-md-9 OfficeName" data-title="模板名称" style='padding-left: 7%'>
                            <input type="text" data-datafield="TemplateName" data-type="SheetTextBox" id="ctl557878" class="inputMouseOut" style="" placeholder="">
                        </div>

                    </div>
                    <div class="col-md-12">
                        <div id="title7" class="col-md-3">
                            <span id="Label16" data-type="SheetLabel" data-datafield="Description" style="">模板描述</span>
                        </div>
                        <div id="control7" class="col-md-7 OfficeDescribe">
                            <textarea id="Control16" data-datafield="Description" data-type="SheetRichTextBox" style="">					</textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="div411186" class="col-md-3"><span id="Label14" data-type="SheetLabel" data-datafield="Type" style="" class="">模板类型</span></div>
                        <div id="div450533" class="col-md-7">
                            <select data-datafield="Type" data-type="SheetDropDownList" id="ctl369708" class="" style="" data-defaultitems="Word模板;Excel模板;PPT模板" data-displayemptyitem="true" data-emptyitemtext="请选择" data-queryable="false"></select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title3" class="col-md-3">
                            <span id="Label13" data-type="SheetLabel" data-datafield="UploadDate" style="">上传日期</span>
                        </div>
                        <div id="control3" class="col-md-7">
                            <input id="Control13" type="text" data-datafield="UploadDate" data-type="SheetTime" style="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title2" class="col-md-3">
                            <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">上传部门</span>
                        </div>
                        <div id="control2" class="col-md-7">
                            <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="title1" class="col-md-3">
                            <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">上传人员</span>
                        </div>
                        <div id="control1" class="col-md-7">
                            <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
                        </div>
                    </div>
                    <div class="col-md-12" style='padding-left:7%;'>
                           <a href="" id='fileLoad'><img src="images/ico/btn_officedl.png" alt="" style='width: 40%'></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
