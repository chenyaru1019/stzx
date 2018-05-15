<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SWorkDaily.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SWorkDaily" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
   $.MvcSheet.PreInit = function () {

                $('#Control11').attr("disabled",true); //设置经办人和所属部门无法修改
                $('#Control12').attr("disabled",true);
                $('#Control13').attr("disabled",true);  
                $('#Control15').attr("disabled",true); 
}
    // 保存前事件
        $.MvcSheet.SaveAction.OnActionPreDo = function () {
        var date = new Date()
           var SDate= $.MvcSheetUI.GetControlValue("SDate");
alert(typeof SDate)

        }
</script>
		<div class="DragContainer" style="text-align: center;">
			<label class="panel-title" id="lblTitle">工作日报</label>
		</div>
		<div class="panel-body sheetContainer">
			<div class="nav-icon fa fa-chevron-right bannerTitle hidden">
				<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
			</div>
			<div class="divContent">
				<div class="row hidden">
					<div class="col-md-2" id="divFullNameTitle">
						<label id="lblFullNameTitle" style="" data-type="SheetLabel" data-en_us="Originator" data-bindtype="OnlyVisiable" data-datafield="Originator.UserName">发起人</label>
					</div>
					<div class="col-md-4" id="divFullName">
						<label id="lblFullName" style="" data-type="SheetLabel" data-bindtype="OnlyData" data-datafield="Originator.UserName"></label>
					</div>
					<div class="col-md-2" id="divOriginateDateTitle">
						<label id="lblOriginateDateTitle" style="" data-type="SheetLabel" data-en_us="Originate Date" data-bindtype="OnlyVisiable" data-datafield="OriginateTime">发起时间</label>
					</div>
					<div class="col-md-4" id="divOriginateDate">
						<label id="lblOriginateDate" style="" data-type="SheetLabel" data-bindtype="OnlyData" data-datafield="OriginateTime"></label>
					</div>
				</div>
				<div class="row hidden">
					<div class="col-md-2" id="divOriginateOUNameTitle">
						<label id="lblOriginateOUNameTitle" style="" data-type="SheetLabel" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" data-datafield="Originator.OUName">所属组织</label>
					</div>
					<div class="col-md-4" id="divOriginateOUName">
						<!--					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">
<span class="OnlyDesigner">Originator.OUName</span>
					</label>-->
						<select id="ctlOriginaotrOUName" style="" data-type="SheetOriginatorUnit" data-datafield="Originator.OUName">
						</select>
					</div>
					<div class="col-md-2" id="divSequenceNoTitle">
						<label id="lblSequenceNoTitle" style="" data-type="SheetLabel" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" data-datafield="SequenceNo">流水号</label>
					</div>
					<div class="col-md-4" id="divSequenceNo">
						<label id="lblSequenceNo" style="" data-type="SheetLabel" data-bindtype="OnlyData" data-datafield="SequenceNo"></label>
					</div>
				</div>
			</div>
			<div class="nav-icon fa  fa-chevron-right bannerTitle">
				<label id="divSheetInfo" data-en_us="Sheet information">日报信息：</label>
			</div>
			<div class="divContent" id="divSheet">
				<div class="row">
					<div class="col-md-2" id="title1">
						<span id="Label11" style="" data-type="SheetLabel" data-datafield="Applyer">日报提交人：</span>
					</div>
					<div class="col-md-4" id="control1">
						<input id="Control11" style="" onfocus="this.blur()" type="text" data-type="SheetTextBox" data-datafield="Applyer" data-defaultvalue="{Originator.UserName}" class="">
					</div>
					<div class="col-md-2" id="title2">
						<span id="Label12" style="" data-type="SheetLabel" data-datafield="Department" class="">所属部门：</span>
					</div>
					<div class="col-md-4" id="control2">
						<input id="Control12" style="" type="text" data-type="SheetTextBox" data-datafield="Department" data-defaultvalue="{Originator.OUName}" class="">
					</div>
				</div>

				<div class="row">
					<div class="col-md-2" id="title3">
						<span id="Label13" style="" data-type="SheetLabel" data-datafield="SDate">日报提交日期：</span>
					</div>
					<div class="col-md-4" id="control3">
						<input id="Control13" style="" type="text" data-type="SheetTime" data-datafield="SDate" data-timemode="FullTime" class="">
					</div>
					<div class="col-md-2" id="space4"></div>
					<div class="col-md-4" id="spaceControl4"></div>
				</div>
				
				<div class="row"><div id="div383214" class="col-md-2"><label id="ctl638385" style="" data-type="SheetLabel" data-datafield="WorkContent" class="">今日工作内容</label></div><div id="div121223" class="col-md-10"><table class="SheetGridView" id="ctl621123" data-type="SheetGridView" data-datafield="WorkContent" data-displaydelete="false" data-displayadd="false">
							<thead>
								<tr class="header">
									<td class="rowSerialNo" id="ctl621123_SerialNo" rowspan="2">序号</td>
									<td id="ctl621123_header0" colspan="4" data-field="WorkContent.AProject" class=""><label id="ctl621123_Label0" style="" data-type="SheetLabel" data-datafield="WorkContent.AProject">上午</label></td>
									<td id="ctl621123_header4" colspan="4" data-field="WorkContent.BProject"><label id="ctl621123_Label4" style="" data-type="SheetLabel" data-datafield="WorkContent.BProject">下午</label></td>
									<td class="rowOption" rowspan="2">删除</td>
								</tr>
								<tr class="header">
									<td id="ctl621123_header0" data-field="WorkContent.AProject">
										<label id="ctl621123_Label0" style="" data-type="SheetLabel" data-datafield="WorkContent.AProject">关联项目</label>
									</td>
									<td id="ctl621123_header1" colspan="2" data-field="WorkContent.AContent1" class=""><label id="ctl621123_Label1" style="" data-type="SheetLabel" data-datafield="WorkContent.AContent1">工作内容</label></td>
									<td id="ctl621123_header3" data-field="WorkContent.AHours">
										<label id="ctl621123_Label3" style="" data-type="SheetLabel" data-datafield="WorkContent.AHours">工时</label>
									</td>
									<td id="ctl621123_header4" data-field="WorkContent.BProject">
										<label id="ctl621123_Label4" style="" data-type="SheetLabel" data-datafield="WorkContent.BProject">关联项目</label>
									</td>
									<td id="ctl621123_header5" colspan="2" data-field="WorkContent.BContent1"><label id="ctl621123_Label5" style="" data-type="SheetLabel" data-datafield="WorkContent.BContent1">工作内容</label></td>
									<td id="ctl621123_header7" data-field="WorkContent.BHours">
										<label id="ctl621123_Label7" style="" data-type="SheetLabel" data-datafield="WorkContent.BHours">工时</label>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr class="template">
									<td></td>
									<td id="ctl621123_control0" style="width: 10%;" data-datafield="WorkContent.AProject" class=""><input id="ctl180939" style="" type="text" data-type="SheetTextBox" data-datafield="WorkContent.AProject" class="" data-popupwindow="Dropdown" data-schemacode="ProjectTask" data-querycode="TaskList" data-outputmappings="WorkContent.AProject:ProjectName"></td>
									<td id="ctl621123_control1" style="width: 16%;" data-datafield="WorkContent.AContent1" class=""><select id="ctl459862" style="" data-type="SheetDropDownList" data-datafield="WorkContent.AContent1" data-defaultitems="会议;咨询;写报告;后勤类事务;其他" data-emptyitemtext="请选择" data-displayemptyitem="true" class="" data-queryable="false"></select></td>
									<td id="ctl621123_control2" data-datafield="WorkContent.AContent2" class=""><input id="ctl621123_control2" style="" type="text" data-type="SheetTextBox" data-datafield="WorkContent.AContent2" class=""></td>
									<td id="ctl621123_control3" style="width: 5%;" data-datafield="WorkContent.AHours" class=""><input id="ctl621123_control3" style="" type="text" data-type="SheetTextBox" data-datafield="WorkContent.AHours" class=""></td>
									<td id="ctl621123_control4" style="width: 10%;" data-datafield="WorkContent.BProject" class=""><input id="ctl279388" style="" type="text" data-type="SheetTextBox" data-datafield="WorkContent.BProject" class="" data-popupwindow="Dropdown" data-schemacode="ProjectTask" data-querycode="TaskList" data-outputmappings="WorkContent.AProject:ProjectName"></td>
									<td id="ctl621123_control5" style="width: 16%;" data-datafield="WorkContent.BContent1" class=""><select id="ctl840538" style="" data-type="SheetDropDownList" data-datafield="WorkContent.BContent1" data-defaultitems="会议;咨询;写报告;后勤类事务;其他" data-emptyitemtext="请选择" data-displayemptyitem="true" class=""></select></td>
									<td id="ctl621123_control6" data-datafield="WorkContent.BContent2" class=""><input id="ctl621123_control6" style="" type="text" data-type="SheetTextBox" data-datafield="WorkContent.BContent2" class=""></td>
									<td id="ctl621123_control7" style="width: 5%;" data-datafield="WorkContent.BHours" class=""><input id="ctl621123_control7" style="" type="text" data-type="SheetTextBox" data-datafield="WorkContent.BHours" class=""></td>
									<td class="rowOption"><a class="delete">
											<div class="fa fa-minus"></div>
									</a> <a class="insert">
											<div class="fa fa-arrow-down"></div>
									</a></td>
								</tr>
								<tr class="footer">
									<td></td>
									<td id="ctl621123_Stat0" data-datafield="WorkContent.AProject" class=""></td>
									<td id="ctl621123_Stat1" data-datafield="WorkContent.AContent1" class=""></td>
									<td id="ctl621123_Stat2" data-datafield="WorkContent.AContent2"></td>
									<td id="ctl621123_Stat3" data-datafield="WorkContent.AHours">
										<label id="ctl621123_StatControl3" style="" data-type="SheetCountLabel" data-datafield="WorkContent.AHours"></label>
									</td>
									<td id="ctl621123_Stat4" data-datafield="WorkContent.BProject"></td>
									<td id="ctl621123_Stat5" data-datafield="WorkContent.BContent1" class=""></td>
									<td id="ctl621123_Stat6" data-datafield="WorkContent.BContent2"></td>
									<td id="ctl621123_Stat7" data-datafield="WorkContent.BHours">
										<label id="ctl621123_StatControl7" style="" data-type="SheetCountLabel" data-datafield="WorkContent.BHours"></label>
									</td>
									<td></td>
								</tr>
							</tbody>
						</table></div></div>


				<div class="row">
					<div class="col-md-2" id="title7">
						<span id="Label15" style="" data-type="SheetLabel" data-datafield="Total">总工时：</span>
					</div>
					<div class="col-md-4" id="control7">
						<input id="Control15" style="" type="text" data-type="SheetTextBox" data-datafield="Total" data-computationrule="SUM({WorkContent.AHours})+SUM({WorkContent.BHours})">
					</div>
					<div class="col-md-2" id="space8"></div>
					<div class="col-md-4" id="spaceControl8"></div>
				</div>
				<div class="row tableContent">
					<div class="col-md-2" id="title9">
						<span id="Label16" style="" data-type="SheetLabel" data-datafield="Note">备注：</span>
					</div>
					<div class="col-md-10" id="control9">
						<textarea id="Control16" style="" data-type="SheetRichTextBox" data-datafield="Note">					</textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="title11">
						<span id="Label17" style="" data-type="SheetLabel" data-datafield="Attachment">附件：</span>
					</div>
					<div class="col-md-10" id="control11">
						<div id="Control17" style="" data-type="SheetAttachment" data-datafield="Attachment"></div>
					</div>
				</div>
			</div>
		</div>
	</asp:Content>