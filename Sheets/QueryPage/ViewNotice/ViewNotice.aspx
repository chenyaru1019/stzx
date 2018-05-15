<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewNotice.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.QueryPage.ViewNotice" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
     <script src="../../js/bootstrap-table.js"></script>
     <script src="../../js/bootstrap-table-zh-CN.js"></script>
     <link rel="stylesheet" href="../../js/css/bootstrap-table.css">
     <link rel="stylesheet" href="../QueryPafe.css">

<script type="text/javascript">

</script>
<div  class="DragContainer">
	<label id="lblTitle" class="panel-title">公告查阅</label>
</div>
<div class="panel-body sheetContainer">
		<div class="divContent" id="divSheet">
		    <div class="row" style='border: 0px;'>
            		            <div class="col-md-12">
            		                <h4 class="search_new">查询条件</h4>
                                </div>
                            </div>
            <div class="searchBox">
                <div class="row">
                				<div id="title1" class="col-md-2">
                					<span id="Label11" data-type="SheetLabel" data-datafield="Title" style="">标题</span>
                				</div>
                				<div id="control1" class="col-md-4">
                					<input id="Control11" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class="">
                				</div>
                				<div id="title2" class="col-md-2">
                				</div>
                				<div id="control2" class="col-md-4">
                				</div>
                			</div>
                <div class="row">
                				<div id="title3" class="col-md-2">
                					<span id="Label14" data-type="SheetLabel" data-datafield="Department" class="" style="">部门</span>
                				</div>
                				<div id="control3" class="col-md-4">
                					<input id="Control14" type="text" data-datafield="Department" data-type="SheetTextBox" class="" style="">
                				</div>
                				<div id="title4" class="col-md-2">
                				</div>
                				<div id="control4" class="col-md-4">
                				</div>
                			</div>
                <div class="row">
                				<div id="div870942" class="col-md-2">
                					<span id="Label12" data-type="SheetLabel" data-datafield="PublicStart" class="" style="">发布时间</span>
                				</div>
                				<div id="div726462" class="col-md-2"  style="padding-left: 5px;">
                					<input id="Control12" type="text" data-datafield="PublicStart" data-type="SheetTime" class="" style="" data-defaultvalue="">
                				</div>
                				<div id="div685558" class="col-md-1" style="text-align: center">
                					<span id="Label13" data-type="SheetLabel" data-datafield="PublicEnd" class="">至</span>
                				</div>
                				<div id="div274215" class="col-md-2"  style="padding-left: 5px;">
                					<input id="Control13" type="text" data-datafield="PublicEnd" data-type="SheetTime" class="" style="" data-defaultvalue="">
                				</div>
                				<div id="div922447" class="col-md-5">
                				</div>
                			</div>
                <div class="row">
                                <div id="div385810" class="col-md-0"></div>
                                <div id="div527969" class="col-md-0"></div>
                                <div id="div511335" class="col-md-12" style="text-align: center;padding: 10px;">
                                      <input type="button" value="查询" class='btn btn-default fa fa-search' onclick="queryNotice()" style='line-height: 30px;padding: 0px 10px;'/>
                                </div>
                                <div id="div51022" class="col-md-0"></div>
                                <div id="div444522" class="col-md-0"></div>
                			</div>
            </div>
            <div class="row" style='border: 0px;margin: 0;padding: 0px'>
                                <div class="col-md-12" style='margin: 0;padding: 0px;background-color:#C4C4C4;'>
                                    <div class="dropDown" id="Btn_dropDown-ViewNews" style="display: block;">
                                        <a class="Btn_dropDown"></a>
                                    </div>
                                </div>
                            </div>

              <div class="myTable">
                  <table data-toggle="table" class="table table-striped table-bordered table-hover" id="ViewNotice"></table>
            </div>

		</div>
	</div>
    <script src="ViewNotice.js"></script>
</asp:Content>