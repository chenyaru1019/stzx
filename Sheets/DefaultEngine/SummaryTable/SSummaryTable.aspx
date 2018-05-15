<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSummaryTable.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SSummaryTable" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">



            $.MvcSheet.InitToolBar();

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">项目绩效评价汇总表</label>
</div>
<div class="panel-body sheetContainer">
	<div class="nav-icon fa fa-chevron-right bannerTitle hidden">
		<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
	</div>
	<div class="divContent">
		<div class="row hidden">
			<div id="divFullNameTitle" class="col-md-2">
				<label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="">发起人</label>
			</div>
			<div id="divFullName" class="col-md-4">
				<label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style="">

				</label>
			</div>
			<div id="divOriginateDateTitle" class="col-md-2">
				<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
			</div>
			<div id="divOriginateDate" class="col-md-4">
				<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style="">

				</label>
			</div>
		</div>
		<div class="row hidden">
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
					<label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style="">

					</label>
				</div>
			</div>
		</div>
		<div class="nav-icon fa  fa-chevron-right bannerTitle hidden">
			<label id="divSheetInfo" data-en_us="Sheet information" class="">表单信息</label>
		</div>
		<div class="divContent" id="divSheet">
			<div class="row"><div id="div391702" class="col-md-2"><span id="Label11" data-type="SheetLabel" data-datafield="ParticularYear" style="" class="">考核年份</span></div><div id="div350032" class="col-md-3"><input id="Control11" type="text" data-datafield="ParticularYear" data-type="SheetTextBox" style="" class=""></div><div id="div867458" class="col-md-2"><span id="Label12" data-type="SheetLabel" data-datafield="Quarterly" style="" class="">考核季度</span></div><div id="div55868" class="col-md-3"><select data-datafield="Quarterly" data-type="SheetDropDownList" id="ctl769476" class="" style="" data-defaultitems="第一季度;第二季度;第三季度;第四季度" data-displayemptyitem="true"></select></div><div id="div455293" class="col-md-2"></div></div><div class="row"><div id="div816195" class="col-md-12"><table id="Control13" data-datafield="Summary_Table" data-type="SheetGridView" class="SheetGridView" data-displayadd="false" data-displaysummary="false" data-displaydelete="false" data-displayexport="true">
						<tbody>
							
							<tr class="header">
								<td id="Control13_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control13_Header3" data-datafield="Summary_Table.ProjectName">
									<label id="Control13_Label3" data-datafield="Summary_Table.ProjectName" data-type="SheetLabel" style="">项目名称</label>
								</td>
								<td id="Control13_Header4" data-datafield="Summary_Table.TaskNum">
									<label id="Control13_Label4" data-datafield="Summary_Table.TaskNum" data-type="SheetLabel" style="">任务编号</label>
								</td>
								<td id="Control13_Header5" data-datafield="Summary_Table.Quality">
									<label id="Control13_Label5" data-datafield="Summary_Table.Quality" data-type="SheetLabel" style="">质量管理（20）</label>
								</td>
								<td id="Control13_Header6" data-datafield="Summary_Table.Schedule">
									<label id="Control13_Label6" data-datafield="Summary_Table.Schedule" data-type="SheetLabel" style="">进度管理（15）</label>
								</td>
								<td id="Control13_Header7" data-datafield="Summary_Table.Contract">
									<label id="Control13_Label7" data-datafield="Summary_Table.Contract" data-type="SheetLabel" style="">合同管理（7.5）</label>
								</td>
								<td id="Control13_Header8" data-datafield="Summary_Table.Security">
									<label id="Control13_Label8" data-datafield="Summary_Table.Security" data-type="SheetLabel" style="">安全管理（2.5）</label>
								</td>
								<td id="Control13_Header9" data-datafield="Summary_Table.Datum">
									<label id="Control13_Label9" data-datafield="Summary_Table.Datum" data-type="SheetLabel" style="">资料管理（15）</label>
								</td>
								<td id="Control13_Header10" data-datafield="Summary_Table.Material">
									<label id="Control13_Label10" data-datafield="Summary_Table.Material" data-type="SheetLabel" style="">物资管理（5）</label>
								</td>
								<td id="Control13_Header11" data-datafield="Summary_Table.Cost">
									<label id="Control13_Label11" data-datafield="Summary_Table.Cost" data-type="SheetLabel" style="">成本管理（7.5）</label>
								</td>
								<td id="Control13_Header12" data-datafield="Summary_Table.Total" class="">
									<label id="Control13_Label12" data-datafield="Summary_Table.Total" data-type="SheetLabel" style="">总分</label>
								</td>
								<td id="Control13_Header13" data-datafield="Summary_Table.Percentage" class="">
									<label id="Control13_Label13" data-datafield="Summary_Table.Percentage" data-type="SheetLabel" style="">百分制换算</label>
								</td>
								<td class="rowOption">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control13_Option" class="rowOption">
								</td>
								<td data-datafield="Summary_Table.ProjectName">
									<input id="Control13_ctl3" type="text" data-datafield="Summary_Table.ProjectName" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.TaskNum">
									<input id="Control13_ctl4" type="text" data-datafield="Summary_Table.TaskNum" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Quality" class="" style="width: 7%;">
									<input id="Control13_ctl5" type="text" data-datafield="Summary_Table.Quality" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Schedule" class="" style="width: 7%;">
									<input id="Control13_ctl6" type="text" data-datafield="Summary_Table.Schedule" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Contract" class="" style="width: 7%;">
									<input id="Control13_ctl7" type="text" data-datafield="Summary_Table.Contract" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Security" class="" style="width: 7%;">
									<input id="Control13_ctl8" type="text" data-datafield="Summary_Table.Security" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Datum" class="" style="width: 7%;">
									<input id="Control13_ctl9" type="text" data-datafield="Summary_Table.Datum" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Material" class="" style="width: 7%;">
									<input id="Control13_ctl10" type="text" data-datafield="Summary_Table.Material" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Cost" class="" style="width: 7%;">
									<input id="Control13_ctl11" type="text" data-datafield="Summary_Table.Cost" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Total" class="" style="width: 7%;">
									<input id="Control13_ctl12" type="text" data-datafield="Summary_Table.Total" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="Summary_Table.Percentage" class="" style="width: 7%;">
									<input id="Control13_ctl13" type="text" data-datafield="Summary_Table.Percentage" data-type="SheetTextBox" style="" class="">
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
								<td data-datafield="Summary_Table.ProjectName">
								</td>
								<td data-datafield="Summary_Table.TaskNum">
								</td>
								<td data-datafield="Summary_Table.Quality" class="" style="width: 7%;">
									<label id="Control13_stat5" data-datafield="Summary_Table.Quality" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Schedule">
									<label id="Control13_stat6" data-datafield="Summary_Table.Schedule" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Contract">
									<label id="Control13_stat7" data-datafield="Summary_Table.Contract" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Security">
									<label id="Control13_stat8" data-datafield="Summary_Table.Security" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Datum">
									<label id="Control13_stat9" data-datafield="Summary_Table.Datum" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Material">
									<label id="Control13_stat10" data-datafield="Summary_Table.Material" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Cost">
									<label id="Control13_stat11" data-datafield="Summary_Table.Cost" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Total" class="">
									<label id="Control13_stat12" data-datafield="Summary_Table.Total" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="Summary_Table.Percentage">
									<label id="Control13_stat13" data-datafield="Summary_Table.Percentage" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table></div></div>
			
		</div>
	</div>
</asp:Content>