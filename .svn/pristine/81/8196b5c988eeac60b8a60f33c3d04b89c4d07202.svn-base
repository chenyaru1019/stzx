<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Stest.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.Stest" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
      // 保存前事件
        $.MvcSheet.SaveAction.OnActionPreDo = function () {
           $.MvcSheet.Action(
                    {
                        Action: "getdt",   // 后台方法名称
             
                        LoadControlValue: true, // 是否获取表单数据
                        PostSheetInfo: false,    // 是否获取已经改变的表单数据
                        OnActionDone: function (e) {
                          console.log(e)
                        }
                    }
                )
           
        }
  // 页面加载完成事件
        $.MvcSheet.Loaded = function (sheetInfo) {
            // 获取选人控件
alert(getQueryString("code"));
}

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
    }
</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">test</label>
</div>
<div class="panel-body sheetContainer">
	<div class="nav-icon fa fa-chevron-right bannerTitle">
		<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
	</div>
	<div class="divContent">
		<div class="row">
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
		<div class="row">
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
		<div class="nav-icon fa  fa-chevron-right bannerTitle">
			<label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
		</div>
		<div class="divContent" id="divSheet">
			<div class="row">
				<div id="title1" class="col-md-2">
					<span id="Label11" data-type="SheetLabel" data-datafield="date1" style="">date1</span>
				</div>
				<div id="control1" class="col-md-4">
					<input id="Control11" type="text" data-datafield="date1" data-type="SheetTime" style="">
				</div>
				<div id="title2" class="col-md-2">
					<span id="Label12" data-type="SheetLabel" data-datafield="date2" style="">date2</span>
				</div>
				<div id="control2" class="col-md-4">
					<input id="Control12" type="text" data-datafield="date2" data-type="SheetTime" style="">
				</div>
			</div>
			<div class="row">
				<div id="title3" class="col-md-2">
					<span id="Label13" data-type="SheetLabel" data-datafield="days" style="">days</span>
				</div>
				<div id="control3" class="col-md-4">
					<input id="Control13" type="text" data-datafield="days" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="title4" class="col-md-2">
					<span id="Label14" data-type="SheetLabel" data-datafield="qq" style="">qq</span>
				</div>
				<div id="control4" class="col-md-4">
					<input id="Control14" type="text" data-datafield="qq" data-type="SheetTextBox" style="" class="">
				</div>
			</div><div class="row"><div id="div77219" class="col-md-2"><label data-datafield="ssss" data-type="SheetLabel" id="ctl555132" class="" style="">sssss</label></div><div id="div775522" class="col-md-4"><div data-datafield="ssss" data-type="SheetUser" id="ctl584971" class="" style="" data-rootselectable="false"></div></div><div id="div653382" class="col-md-2"></div><div id="div91210" class="col-md-4"></div></div>
			<div class="row tableContent">
				<div id="title5" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="zibiao" style="">zibiao</span>
				</div>
				<div id="control5" class="col-md-10">
					<table id="Control15" data-datafield="zibiao" data-type="SheetGridView" class="SheetGridView">
						<tbody>
							
							<tr class="header">
								<td id="Control15_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control15_Header3" data-datafield="zibiao.t1">
									<label id="Control15_Label3" data-datafield="zibiao.t1" data-type="SheetLabel" style="" class="">t1</label>
								</td>
								<td id="Control15_Header4" data-datafield="zibiao.t2">
									<label id="Control15_Label4" data-datafield="zibiao.t2" data-type="SheetLabel" style="">t2</label>
								</td>
								<td id="Control15_Header5" data-datafield="zibiao.t3">
									<label id="Control15_Label5" data-datafield="zibiao.t3" data-type="SheetLabel" style="">t3</label>
								</td>
								<td id="Control15_Header6" data-datafield="zibiao.t4">
									<label id="Control15_Label6" data-datafield="zibiao.t4" data-type="SheetLabel" style="">t4</label>
								</td>
								<td class="rowOption">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control15_Option" class="rowOption">
								</td>
								<td data-datafield="zibiao.t1">
									
								<select data-datafield="zibiao.t1" data-type="SheetDropDownList" id="ctl599055" class="" style="" data-schemacode="getDepartById" data-querycode="getDepartById" data-filter="qq:ObjectID1" data-datavaluefield="Name1" data-datatextfield="Name1"></select></td>
								<td data-datafield="zibiao.t2">
									<input id="Control15_ctl4" type="text" data-datafield="zibiao.t2" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="zibiao.t3">
									<input id="Control15_ctl5" type="text" data-datafield="zibiao.t3" data-type="SheetTime" style="">
								</td>
								<td data-datafield="zibiao.t4">
									<input id="Control15_ctl6" type="text" data-datafield="zibiao.t4" data-type="SheetTextBox" style="">
								</td>
								<td class="rowOption">
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
								<td class="rowOption">
								</td>
								<td data-datafield="zibiao.t1">
								</td>
								<td data-datafield="zibiao.t2">
								</td>
								<td data-datafield="zibiao.t3">
								</td>
								<td data-datafield="zibiao.t4">
									<label id="Control15_stat6" data-datafield="zibiao.t4" data-type="SheetCountLabel" style="" class=""></label>
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</asp:Content>