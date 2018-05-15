<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSubwayNews.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SSubwayNews" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <link id="MyStyleSheet" rel="stylesheet" type="text/css" runat="server" href="../NewsView/NewsView.css" />
</asp:Content>

<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <script src="SSubwayNews.js"></script>
    <script type="text/javascript">
        $.MvcSheet.Loaded = function (sheetInfo) {

            queryHitAndVoteCount();
           $('title').html($('.title').find('span').text());
        };
</script>
    <div class="panel-body sheetContainer" style='padding-top: 0px'>
        <div class="divContent" id="divSheet">
            <div class="row">
                <div id="control3" class="col-md-8 news">
                    地铁新闻
                </div>
                <div class="col-md-4 liulanNum" style='border-left: 0px'>
                    <div id="control3" class="col-md-12" style='text-align: right;'>
                        <span id="Label13" data-type="SheetLabel" style="">浏览次数</span>
                        <span id="hitCount" type="text" style="" class=""><span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div id="control4" class="col-md-12 title" style="text-align: center;">
                    <input id="Control14" type="text" data-datafield="Title" data-type="SheetTextBox" style="">
                </div>
            </div>
            <div class="row newmsg">
                <div id="control2" class="col-md-12" style="text-align: center;">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="">
                    <input type="text" data-datafield="Publisher" data-type="SheetTextBox" id="ctl914225" class="" style="">
                </div>

            </div>
            <div class="row tableContent">
                <div id="control5" class="col-md-12">
                    <textarea id="Control15" data-datafield="Content" data-richtextbox="true" data-type="SheetRichTextBox" style="" class="">					</textarea>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12" id="mewTime" style="text-align: right">
                    <input id="Control1" type="text" data-datafield="PublishTime" data-type="SheetTime" style="">
                </div>
            </div>
            <div class="row" id='zan'>

                <div id="div174950" class="">
                    <input type="button" value="" onclick="newsVote()" class="">
                </div>
                <div class='zanNum'>
                    <div id="div959546" class="col-md-12">
                        <span>点赞次数</span>
                        <span id="div908988">
                            <%-- 点赞次数--%>
                            <span type="text" id="VoteNum" class="" style=""></span>
                        </span>
                    </div>
                </div>
                <div id="div861299" class="col-md-4"></div>
            </div>
        </div>
    </div>
</asp:Content>
