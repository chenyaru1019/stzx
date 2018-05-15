<%@ Page Language="C#" AutoEventWireup="true" CodeFile="STaskChange.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.STaskChange" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">项目任务变更</label>
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
					<span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">申请人</span>
				</div>
				<div id="control1" class="col-md-4">
					<input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
				</div>
				<div id="title2" class="col-md-2">
					<span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">所属部门</span>
				</div>
				<div id="control2" class="col-md-4">
					<input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
				</div>
			</div>
			<div class="row">
				<div id="title3" class="col-md-2">
					<span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" style="">项目名称</span>
				</div>
				<div id="control3" class="col-md-4">
					<input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="" data-schemacode="ProjectTask" data-querycode="TaskList" data-outputmappings="ProjectName:ProjectName,TaskObjectId:ObjectID,ProjectNum:ProjectNum,TaskNum:TaskNum,TaskBasis:TaskBasis,Content:Content,ServiceCycle:ServiceCycle,ServiceResults:ServiceResults,ContractAmount:ContractAmount,Outside:Outside,TaskType:TaskType" data-popupwindow="PopupWindow">
				</div>
				<div id="title4" class="col-md-2">
					<span id="Label14" data-type="SheetLabel" data-datafield="ProjectType" style="">项目类型</span>
				</div>
				<div id="control4" class="col-md-4">
					<input id="Control14" type="text" data-datafield="ProjectType" data-type="SheetTextBox" style="" class="">
				</div>
			</div>
			<div class="row">
				<div id="title5" class="col-md-2">
					<span id="Label15" data-type="SheetLabel" data-datafield="ProjectNum" style="">项目编号</span>
				</div>
				<div id="control5" class="col-md-4">
					<input id="Control15" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-onchange="var TaskObjectId= $.MvcSheetUI.GetControlValue(&quot;TaskObjectId&quot;);    
 $.MvcSheet.Action(
                    {
                        Action: &quot;AddMembers&quot;,   // 后台方法名称
                        Datas: [TaskObjectId],    // 输入参数，格式 [&quot;{数据项名称}&quot;,&quot;String值&quot;,&quot;控件ID&quot;]，当包含数据项名称时 LoadControlValue必须为true
                        LoadControlValue: true, // 是否获取表单数据
                        PostSheetInfo: false,    // 是否获取已经改变的表单数据
                        OnActionDone: function (e) {
                        alert(e);
                        }
                    }
                )">
				</div>
				<div id="title6" class="col-md-2">
					<span id="Label16" data-type="SheetLabel" data-datafield="TaskType" style="">任务类型</span>
				</div>
				<div id="control6" class="col-md-4">
					
				<select data-datafield="TaskType" data-type="SheetDropDownList" id="ctl902182" class="" style="" data-masterdatacategory="项目任务类型" data-queryable="false" data-displayemptyitem="true"></select></div>
			</div>
			<div class="row">
				<div id="title7" class="col-md-2">
					<span id="Label17" data-type="SheetLabel" data-datafield="TaskNum" style="">任务编号</span>
				</div>
				<div id="control7" class="col-md-4">
					<input id="Control17" type="text" data-datafield="TaskNum" data-type="SheetTextBox" style="" class="">
				</div>
				<div id="space8" class="col-md-2">
				</div>
				<div id="spaceControl8" class="col-md-4">
				</div>
			</div>
			<div class="row"><div id="div354861" class="col-md-2"><span id="Label18" data-type="SheetLabel" data-datafield="TaskBasis" style="" class="">任务下达依据</span></div><div id="div944917" class="col-md-4"><select data-datafield="TaskBasis" data-type="SheetDropDownList" id="ctl611087" class="" style="" data-defaultitems="合同;中标通知书;项目立项建议表" data-displayemptyitem="true" data-emptyitemtext="请选择"></select></div><div id="div143359" class="col-md-2"></div><div id="div93863" class="col-md-4"></div></div>
			<div class="row tableContent">
				<div id="title11" class="col-md-2">
					<span id="Label19" data-type="SheetLabel" data-datafield="Content" style="">服务内容</span>
				</div>
				<div id="control11" class="col-md-10">
					<textarea id="Control19" data-datafield="Content" data-type="SheetRichTextBox" style="height: 60px; width: 100%;" class="">					</textarea>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title13" class="col-md-2">
					<span id="Label20" data-type="SheetLabel" data-datafield="ServiceCycle" style="">服务周期</span>
				</div>
				<div id="control13" class="col-md-10">
					<textarea id="Control20" data-datafield="ServiceCycle" data-type="SheetRichTextBox" style="height: 60px; width: 100%;" class="">					</textarea>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title15" class="col-md-2">
					<span id="Label21" data-type="SheetLabel" data-datafield="ServiceResults" style="">服务成果</span>
				</div>
				<div id="control15" class="col-md-10">
					<textarea id="Control21" data-datafield="ServiceResults" data-type="SheetRichTextBox" style="height: 60px; width: 100%;" class="">					</textarea>
				</div>
			</div>
			<div class="row">
				<div id="title17" class="col-md-2">
					<span id="Label22" data-type="SheetLabel" data-datafield="ContractAmount" style="">合同金额</span>
				</div>
				<div id="control17" class="col-md-4">
					<input id="Control22" type="text" data-datafield="ContractAmount" data-type="SheetTextBox" style="">
				</div>
				<div id="title18" class="col-md-2">
					<span id="Label23" data-type="SheetLabel" data-datafield="Outside" style="">是否有委外情况</span>
				</div>
				<div id="control18" class="col-md-4">
					
				<div data-datafield="Outside" data-type="SheetRadioButtonList" id="ctl638087" class="" style="" data-defaultitems="是;否" data-defaultselected="false"></div></div>
			</div>
			<div class="row tableContent">
				<div id="title19" class="col-md-2">
					<span id="Label24" data-type="SheetLabel" data-datafield="AddMember" style="">成员新增</span>
				</div>
				<div id="control19" class="col-md-10">
					<table id="Control24" data-datafield="AddMember" data-type="SheetGridView" class="SheetGridView">
						<tbody>
							
							<tr class="header">
								<td id="Control24_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control24_Header3" data-datafield="AddMember.FullName">
									<label id="Control24_Label3" data-datafield="AddMember.FullName" data-type="SheetLabel" style="">姓名</label>
								</td>
								<td id="Control24_Header4" data-datafield="AddMember.PersonRole">
									<label id="Control24_Label4" data-datafield="AddMember.PersonRole" data-type="SheetLabel" style="">角色</label>
								</td>
								<td id="Control24_Header5" data-datafield="AddMember.Department">
									<label id="Control24_Label5" data-datafield="AddMember.Department" data-type="SheetLabel" style="">所属部门</label>
								</td>
								<td id="Control24_Header6" data-datafield="AddMember.Profession">
									<label id="Control24_Label6" data-datafield="AddMember.Profession" data-type="SheetLabel" style="">专业</label>
								</td>
								<td id="Control24_Header7" data-datafield="AddMember.JobTitle">
									<label id="Control24_Label7" data-datafield="AddMember.JobTitle" data-type="SheetLabel" style="">职称</label>
								</td>
								<td id="Control24_Header8" data-datafield="AddMember.GNVQ">
									<label id="Control24_Label8" data-datafield="AddMember.GNVQ" data-type="SheetLabel" style="">职业资格</label>
								</td>
								<td id="Control24_Header9" data-datafield="AddMember.AppointmentDate">
									<label id="Control24_Label9" data-datafield="AddMember.AppointmentDate" data-type="SheetLabel" style="">任命日期</label>
								</td>
								<td id="Control24_Header10" data-datafield="AddMember.ResidentDate">
									<label id="Control24_Label10" data-datafield="AddMember.ResidentDate" data-type="SheetLabel" style="">常驻日期</label>
								</td>
								<td id="Control24_Header11" data-datafield="AddMember.UserId" class="hidden">
									<label id="Control24_Label11" data-datafield="AddMember.UserId" data-type="SheetLabel" style="" class="">UserId</label>
								</td>
								<td class="rowOption">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control24_Option" class="rowOption">
								</td>
								<td data-datafield="AddMember.FullName">
									<input id="Control24_ctl3" type="text" data-datafield="AddMember.FullName" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="AddMember.FullName:UserName,AddMember.Department:Department,AddMember.Profession:Profession,AddMember.JobTitle:Appellation,AddMember.UserId:ObjectID">
								</td>
								<td data-datafield="AddMember.PersonRole" class="" style="width: 15%;">
									<select data-datafield="AddMember.PersonRole" data-type="SheetDropDownList" id="ctl964663" class="" style="" data-defaultitems="项目成员;项目经理;副经理" data-displayemptyitem="true" data-emptyitemtext="请选择">
									</select>
								</td>
								<td data-datafield="AddMember.Department">
									<input id="Control24_ctl5" type="text" data-datafield="AddMember.Department" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="AddMember.Profession">
									<input id="Control24_ctl6" type="text" data-datafield="AddMember.Profession" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="AddMember.JobTitle">
									<input id="Control24_ctl7" type="text" data-datafield="AddMember.JobTitle" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="AddMember.GNVQ">
									<input id="Control24_ctl8" type="text" data-datafield="AddMember.GNVQ" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="AddMember.AppointmentDate">
									<input id="Control24_ctl9" type="text" data-datafield="AddMember.AppointmentDate" data-type="SheetTime" class="" style="">
								</td>
								<td data-datafield="AddMember.ResidentDate">
									<input id="Control24_ctl10" type="text" data-datafield="AddMember.ResidentDate" data-type="SheetTime" style="" class="" data-defaultvalue="">
								</td>
								<td data-datafield="AddMember.UserId" class="hidden">
									<input id="Control24_ctl11" type="text" data-datafield="AddMember.UserId" data-type="SheetTextBox" style="">
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
								<td data-datafield="AddMember.FullName">
								</td>
								<td data-datafield="AddMember.PersonRole">
								</td>
								<td data-datafield="AddMember.Department">
								</td>
								<td data-datafield="AddMember.Profession">
								</td>
								<td data-datafield="AddMember.JobTitle">
								</td>
								<td data-datafield="AddMember.GNVQ">
								</td>
								<td data-datafield="AddMember.AppointmentDate">
								</td>
								<td data-datafield="AddMember.ResidentDate">
								</td>
								<td data-datafield="AddMember.UserId" class="hidden">
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title21" class="col-md-2">
					<span id="Label25" data-type="SheetLabel" data-datafield="RoleChange" style="">成员岗位变更</span>
				</div>
				<div id="control21" class="col-md-10">
					<table id="Control25" data-datafield="RoleChange" data-type="SheetGridView" class="SheetGridView">
						<tbody>
							
							<tr class="header">
								<td id="Control25_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control25_Header3" data-datafield="RoleChange.FullName">
									<label id="Control25_Label3" data-datafield="RoleChange.FullName" data-type="SheetLabel" style="">姓名</label>
								</td>
								<td id="Control25_Header4" data-datafield="RoleChange.ChangeDate">
									<label id="Control25_Label4" data-datafield="RoleChange.ChangeDate" data-type="SheetLabel" style="">变更起始时间</label>
								</td>
								<td id="Control25_Header5" data-datafield="RoleChange.Department">
									<label id="Control25_Label5" data-datafield="RoleChange.Department" data-type="SheetLabel" style="">所属部门</label>
								</td>
								<td id="Control25_Header6" data-datafield="RoleChange.BeforeRole">
									<label id="Control25_Label6" data-datafield="RoleChange.BeforeRole" data-type="SheetLabel" style="">变更前角色</label>
								</td>
								<td id="Control25_Header7" data-datafield="RoleChange.AfterRole">
									<label id="Control25_Label7" data-datafield="RoleChange.AfterRole" data-type="SheetLabel" style="">变更后角色</label>
								</td>
								<td class="rowOption">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control25_Option" class="rowOption">
								</td>
								<td data-datafield="RoleChange.FullName">
									<input id="Control25_ctl3" type="text" data-datafield="RoleChange.FullName" data-type="SheetTextBox" style="" class="">
								</td>
								<td data-datafield="RoleChange.ChangeDate">
									<input id="Control25_ctl4" type="text" data-datafield="RoleChange.ChangeDate" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="RoleChange.Department">
									<input id="Control25_ctl5" type="text" data-datafield="RoleChange.Department" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="RoleChange.BeforeRole">
									
								<select data-datafield="RoleChange.BeforeRole" data-type="SheetDropDownList" id="ctl234264" class="" style="" data-defaultitems="项目成员;项目经理;副经理" data-queryable="false"></select></td>
								<td data-datafield="RoleChange.AfterRole">
									
								<select data-datafield="RoleChange.AfterRole" data-type="SheetDropDownList" id="ctl122234" class="" style="" data-defaultitems="项目成员;项目经理;副经理" data-queryable="false"></select></td>
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
								<td data-datafield="RoleChange.FullName">
								</td>
								<td data-datafield="RoleChange.ChangeDate">
									<label id="Control25_stat4" data-datafield="RoleChange.ChangeDate" data-type="SheetCountLabel" style=""></label>
								</td>
								<td data-datafield="RoleChange.Department">
								</td>
								<td data-datafield="RoleChange.BeforeRole">
								</td>
								<td data-datafield="RoleChange.AfterRole">
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row tableContent">
				<div id="title23" class="col-md-2">
					<span id="Label26" data-type="SheetLabel" data-datafield="MembersReduce" style="">成员删减</span>
				</div>
				<div id="control23" class="col-md-10">
					<table id="Control26" data-datafield="MembersReduce" data-type="SheetGridView" class="SheetGridView" data-displayadd="false">
						<tbody>
							
							<tr class="header">
								<td id="Control26_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control26_Header3" data-datafield="MembersReduce.FullName">
									<label id="Control26_Label3" data-datafield="MembersReduce.FullName" data-type="SheetLabel" style="">姓名</label>
								</td>
								<td id="Control26_Header4" data-datafield="MembersReduce.ChangeDate">
									<label id="Control26_Label4" data-datafield="MembersReduce.ChangeDate" data-type="SheetLabel" style="" class="">变更起始时间</label>
								</td>
								<td id="Control26_Header5" data-datafield="MembersReduce.Department">
									<label id="Control26_Label5" data-datafield="MembersReduce.Department" data-type="SheetLabel" style="">所属部门</label>
								</td>
								<td id="Control26_Header6" data-datafield="MembersReduce.PersonRole">
									<label id="Control26_Label6" data-datafield="MembersReduce.PersonRole" data-type="SheetLabel" style="">担任专业角色</label>
								</td>
								<td class="rowOption">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control26_Option" class="rowOption">
								</td>
								<td data-datafield="MembersReduce.FullName">
									<input id="Control26_ctl3" type="text" data-datafield="MembersReduce.FullName" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="MembersReduce.ChangeDate">
									<input id="Control26_ctl4" type="text" data-datafield="MembersReduce.ChangeDate" data-type="SheetTime" style="" class="" data-defaultvalue="">
								</td>
								<td data-datafield="MembersReduce.Department">
									<input id="Control26_ctl5" type="text" data-datafield="MembersReduce.Department" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="MembersReduce.PersonRole" class="" style="width: 15%;">
									<select data-datafield="MembersReduce.PersonRole" data-type="SheetDropDownList" id="ctl876352" class="" style="" data-defaultitems="项目成员;项目经理;副经理" data-displayemptyitem="true" data-emptyitemtext="请选择">
									</select>
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
								<td data-datafield="MembersReduce.FullName">
								</td>
								<td data-datafield="MembersReduce.ChangeDate">
								</td>
								<td data-datafield="MembersReduce.Department">
								</td>
								<td data-datafield="MembersReduce.PersonRole">
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div><div class="row"><div id="div650476" class="col-md-2"><label data-datafield="TaskObjectId" data-type="SheetLabel" id="ctl764125" class="" style="">TaskObjectId</label></div><div id="div956652" class="col-md-4"><input type="text" data-datafield="TaskObjectId" data-type="SheetTextBox" id="ctl385326" class="" style=""></div><div id="div113507" class="col-md-2"></div><div id="div962626" class="col-md-4"></div></div>
		</div>
	</div>
</asp:Content>