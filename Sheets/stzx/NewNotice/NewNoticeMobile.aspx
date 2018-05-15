<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewNotice.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.NewNotice" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
        <link id="MyStyleSheet" rel="stylesheet" type="text/css" runat="server" href="NewNotice.css"/>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
    $.MvcSheet.Loaded = function (sheetInfo) {
        $('ion-footer-bar').css('display','none');
        $('.has-footer').css('bottom','0');
    };
</script>
    <style type="text/css">
     .news,.title label span,.zanNum span {
        font-size: 17px;
     }
     img {
        width: 100%;
     }
    </style>
<div class="panel-body sheetContainer">
        <div class="row">
                    <div id="NoticeMsg" style="padding: 0px 10px;background-color:#FAFAFA;height: 40px">
                            <div id="control3" class="news" style="display: inline-block;width: 50%">
                                公告
                            </div>
                            <div class="liulanNum" style='border-left: 0px;display: inline-block;width: 47%'>
                                <div id="control3" class="col-md-12" style='text-align: right;'>
                                    <span id="Label13" data-type="SheetLabel" style="">浏览次数</span>
                                    <input id="Control16" type="text" data-datafield="Hits" data-type="SheetTextBox" style="">
                                </div>
                            </div>
                    </div>
                </div>
    	<div class="divContent" id="divSheet" style='padding: 0px 10px;'>

                <div class="row">
                    <div id="control4" class="col-md-12 title" style="text-align: center;">
                        <input id="Control14" type="text" data-datafield="Title" data-type="SheetTextBox" style="">
                    </div>
                </div>
    			<div class="row newmsg">
                    <div id="control2" class="col-md-12" style="text-align: center;">
    				    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="">
    					<!--<input id="Control11" type="text" data-datafield="PublishTime" data-type="SheetTime" style="">-->
    				</div>

    			</div>
    			<div class="row tableContent">
    				<div id="control5" class="col-md-12">
    					<textarea id="Control15" data-datafield="Content" data-richtextbox="true" data-type="SheetRichTextBox" style="" class="">					</textarea>
    				</div>
    			</div>
    			<div class="row">
    			    <div class="col-md-12" id="newTime" style="text-align: right">
    			        <input id="Control11" type="text" data-datafield="PublishTime" data-type="SheetTime" style="">
                    </div>
                </div>
    			<div class="row">
                    <div id="title7" class="col-md-12">
                            <div id="Control15" data-datafield="Attachment" data-type="SheetAttachment" style="">

                            </div>
                    </div>
                </div>
    		</div>
	</div>
</asp:Content>