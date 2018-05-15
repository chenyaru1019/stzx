﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SNewsView.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SNewsView" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <link id="MyStyleSheet" rel="stylesheet" type="text/css" runat="server" href="NewsView.css"/>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
 $.MvcSheet.Loaded = function (sheetInfo) {
console.log(sheetInfo)
 $("#praise").on('click',function() {
            var praise_img = $("#praise-img");
            var text_box = $("#add-num");
            var praise_txt = $("#praise-txt").find('span');
            console.log(praise_txt);
            var num=parseInt(praise_txt.text());
            if(praise_img.attr("src") == ("../../../img/btn_liked.png")){
                $(this).html("<img src='../../../img/btn_unlike.png' id='praise-img' class='animation' />");
                praise_txt.removeClass("hover");
                text_box.show().html("<em class='add-animation'>-1</em>");
                $(".add-animation").removeClass("hover");
                num -=1;
                praise_txt.text(num)
            }else{
                $(this).html("<img src='../../../img/btn_liked.png' id='praise-img' class='animation' />");
                praise_txt.addClass("hover");
                text_box.show().html("<em class='add-animation'>+1</em>");
                $(".add-animation").addClass("hover");
                num +=1;
                praise_txt.text(num)
            }
         })
};
</script>
<div class="panel-body sheetContainer" style='padding-top: 0px'>
		<div class="divContent" id="divSheet">
		    <div class="row">
                <div id="control3" class="col-md-8 news">
                    新闻 \ <input id="Control13" type="text" data-datafield="Type" data-type="SheetTextBox" style="">
                </div>
                <div class="col-md-4 liulanNum" style='text-align: right;'>
                    <div id="title3" class="col-md-8">
                        <span id="Label13" data-type="SheetLabel" style="">浏览次数</span>
                    </div>
                    <div id="control3" class="col-md-4" style='text-align: left'>
                        <input id="Control16" type="text" data-datafield="Hits" data-type="SheetTextBox" style="" class="">
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="control4" class="col-md-12 title">
                    <input id="Control14" type="text" data-datafield="Title" data-type="SheetTextBox" style="">
                </div>
            </div>
			<div class="row newmsg">
                <div id="control2" class="col-md-2">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="">
                </div>
				<div id="control1" class="col-md-10">
					<input id="Control11" type="text" data-datafield="PublishTime" data-type="SheetTime" style="">
				</div>

			</div>
			<div class="row tableContent">
				<div id="control5" class="col-md-12">
					<textarea id="Control15" data-datafield="Content" data-richtextbox="true" data-type="SheetRichTextBox" style="" class="">					</textarea>
				</div>
			</div>
			<div class="row">
				<div id="title7" class="col-md-12 praise">
                    	<span id="praise"><img src="../../../img/btn_unlike.png" id="praise-img" class="animation"></span>
                    	<div class='yizan'>已有<span id="praise-txt"><input id="Control17" type="text" data-datafield="VoteNum" data-type="SheetTextBox" style="" class=""></span>位点赞</div>
                        <span id="add-num"><em>+1</em></span>
				</div>
			</div>
		</div>
	</div>
</asp:Content>