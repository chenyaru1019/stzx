﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsView.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.NewsView" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <link id="MyStyleSheet" rel="stylesheet" type="text/css" runat="server" href="NewsView.css" />
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <script src="NewsView.js"></script>
    <script type="text/javascript">

        $.MvcSheet.Loaded = function (sheetInfo) {
           queryHitAndVoteCount();
           // console.log($('.title').find('span').text());
           $('title').html($('.title').find('span').text());
           $('ion-footer-bar').css('display','none');
           $('.has-footer').css('bottom','0');

    };
    </script>
    <style type="text/css">
     .news label span,.zanNum #div908988 span,.title label span,.zanNum span {
        font-size: 17px;
     }
     img {
        width: 100%;
     }
     #div174950 input {
        height: 55px;
         width: 55px;
     }
     .unlike,.like {
        background-size: 55px 55px;
     }
    </style>
    <div class="panel-body sheetContainer">
                <div class="row">
                    <div id="newMsg" style="padding: 0px 10px;background-color:#FAFAFA;height: 40px">
                        <div id="control3" class="news"  style="float: left;font-size: 17px">
                            新闻 \
                            <input id="Control13" type="text" data-datafield="Type" data-type="SheetTextBox" style="">
                        </div>
                        <div class="liulanNum" style='float: right'>
                            <div id="control3" class="col-md-12" style='text-align: right;'>
                                <span id="Label13" data-type="SheetLabel" style="">浏览次数</span>
                                <span id="hitCount" type="text"  style="" class=""><span>
                            </div>
                        </div>
                    </div>
                </div>
        <div class="divContent" id="divSheet"  style='padding: 0px 10px;'>


            <div class="row">
                <div id="control4" class="col-md-12 title" style="text-align: center;">
                    <input id="Control14" type="text" data-datafield="Title" data-type="SheetTextBox" style="">
                </div>
            </div>
            <div class="row newmsg">
                <div id="control2" class="col-md-12" style="text-align: center">
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
                <div  class="col-md-12" id="mewTime" style="text-align: right">
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
                            <span type="text"  id="VoteNum" class="" style=""></span>
                        </span>
                    </div>
                </div>
                <div id="div861299" class="col-md-4"></div>
            </div>
        </div>
    </div>
</asp:Content>
