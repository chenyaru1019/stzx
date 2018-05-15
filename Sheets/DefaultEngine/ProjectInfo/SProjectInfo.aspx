<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectInfo.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SProjectInfo" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div class="panel-body sheetContainer">

        <ul id="myTab" class="nav nav-tabs">
        	<li class="active">
        		<a href="#home" data-toggle="tab">
        			 项目基本信息
        		</a>
        	</li>
        	<li><a href="#ios" data-toggle="tab">人员信息</a></li>
        	<li><a href="#ios1" data-toggle="tab">预算信息</a></li>
        	<li><a href="#ios2" data-toggle="tab">进度信息</a></li>
        	<li><a href="#ios3" data-toggle="tab">收付款信息</a></li>
        	<li><a href="#ios4" data-toggle="tab">资源支撑信息</a></li>
        	<li class="dropdown">
        		<a href="#" id="myTabDrop1" class="dropdown-toggle"
        		   data-toggle="dropdown">更多
        			<b class="caret"></b>
        		</a>
        		<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
        			<li><a href="#jmeter" tabindex="-1" data-toggle="tab">委外信息</a></li>
        			<li><a href="#ejb1" tabindex="-1" data-toggle="tab">沟通信息</a></li>
        			<li><a href="http://fanyi.baidu.com/">项目技术审核</a></li>
        			<li><a href="#ejb3" tabindex="-1" data-toggle="tab">项目资料信息</a></li>
        		</ul>
        	</li>
        </ul>
        <div id="myTabContent" class="tab-content">
        	<div class="tab-pane fade in active" id="home">
               	<div class="row">
               				<div id="title1" class="col-md-2">
               					<span id="Label11" data-type="SheetLabel" data-datafield="ProjectNum" style="">项目编号</span>
               				</div>
               				<div id="control1" class="col-md-4">
               					<input id="Control11" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="">
               				</div>
               				<div id="title2" class="col-md-2">
               					<span id="Label12" data-type="SheetLabel" data-datafield="ContractNum" style="">合同编号</span>
               				</div>
               				<div id="control2" class="col-md-4">
               					<input id="Control12" type="text" data-datafield="ContractNum" data-type="SheetTextBox" style="">
               				</div>
               			</div>
                <div class="row">
               			    <div id="div853956" class="col-md-2">
               			        <span id="Label13" data-type="SheetLabel" data-datafield="TaskNum" style="" class="">任务编号</span>
                               </div>
                               <div id="div462610" class="col-md-4">
                                   <input id="Control13" type="text" data-datafield="TaskNum" data-type="SheetTextBox" style="" class="">
                               </div>
                               <div id="div891193" class="col-md-2">
                                   <label data-datafield="TaskType" data-type="SheetLabel" id="ctl405787" class="" style="">任务类型</label>
                               </div>
                               <div id="div487166" class="col-md-4">
                                   <input type="text" data-datafield="TaskType" data-type="SheetTextBox" id="ctl846113" class="" style="">
                               </div>
                           </div>
                <div class="row">
                               <div id="div55298" class="col-md-2">
                                   <span id="Label14" data-type="SheetLabel" data-datafield="TReleaseDate" style="" class="">任务下达日期</span>
                               </div>
                               <div id="div284971" class="col-md-4">
                                   <input id="Control14" type="text" data-datafield="TReleaseDate" data-type="SheetTime" style="" class="">
                               </div>
                               <div id="div324279" class="col-md-2"></div>
                               <div id="div65884" class="col-md-4"></div>
                           </div>
                <div class="row">
               				<div id="title5" class="col-md-2">
               					<span id="Label15" data-type="SheetLabel" data-datafield="ProjectName" style="">项目名称</span>
               				</div>
               				<div id="control5" class="col-md-4">
               					<input id="Control15" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="">
               				</div>
               				<div id="title6" class="col-md-2">
               					<span id="Label16" data-type="SheetLabel" data-datafield="ProjectType" style="">项目类别</span>
               				</div>
               				<div id="control6" class="col-md-4">
               					<input id="Control16" type="text" data-datafield="ProjectType" data-type="SheetTextBox" style="">
               				</div>
               			</div>
                <div class="row">
               				<div id="title7" class="col-md-2">
               					<span id="Label17" data-type="SheetLabel" data-datafield="EntrustedUnit" style="">委托单位</span>
               				</div>
               				<div id="control7" class="col-md-4">
               					<input id="Control17" type="text" data-datafield="EntrustedUnit" data-type="SheetTextBox" style="">
               				</div>
               				<div id="title8" class="col-md-2">

               				</div>
               				<div id="control8" class="col-md-4">

               				</div>
               			</div>
                <div class="row">
               				<div id="title9" class="col-md-2">
               					<span id="Label19" data-type="SheetLabel" data-datafield="ProjectManager" style="">项目负责人</span>
               				</div>
               				<div id="control9" class="col-md-4">
               					<div id="Control19" data-datafield="ProjectManager" data-type="SheetUser" style="" class="">

               					</div>
               				</div>
               				<div id="title10" class="col-md-2">

               				<span id="Label18" data-type="SheetLabel" data-datafield="RDepartment" style="" class="">负责部门</span></div>
               				<div id="control10" class="col-md-4">

               				<div data-datafield="RDepartment" data-type="SheetUser" id="ctl69062" class="" style="" data-uservisible="false" data-orgunitvisible="true"></div></div>
               			</div>
                <div class="row">
               			    <div id="div496324" class="col-md-2">
               			        <label data-datafield="JDepartment" data-type="SheetLabel" id="ctl94817" class="" style="">参与部门</label>
                               </div>
                               <div id="div774193" class="col-md-4">
                                   <div data-datafield="JDepartment" data-type="SheetUser" id="ctl361372" class="" style="" data-uservisible="false" data-orgunitvisible="true"></div>
                               </div>
                               <div id="div810973" class="col-md-2">
                                   <label data-datafield="fgld" data-type="SheetLabel" id="ctl467136" class="" style="">分管领导</label>
                               </div>
                               <div id="div573688" class="col-md-4">
                                   <div data-datafield="fgld" data-type="SheetUser" id="ctl747659" class="" style=""></div>
                               </div>
                           </div>
                <div class="row">
               				<div id="title11" class="col-md-2">
               					<span id="Label21" data-type="SheetLabel" data-datafield="ContractAmount" style="">合同金额</span>
               				</div>
               				<div id="control11" class="col-md-4">
               					<input id="Control21" type="text" data-datafield="ContractAmount" data-type="SheetTextBox" style="">
               				</div>
               				<div id="title12" class="col-md-2">
               					<span id="Label22" data-type="SheetLabel" data-datafield="ContractStartDate" style="">合同签订日期</span>
               				</div>
               				<div id="control12" class="col-md-4">
               					<input id="Control22" type="text" data-datafield="ContractStartDate" data-type="SheetTime" style="">
               				</div>
               			</div>
                <div class="row tableContent">
               				<div id="title13" class="col-md-2">
               					<span id="Label23" data-type="SheetLabel" data-datafield="ServiceArea" style="">服务范围</span>
               				</div>
               				<div id="control13" class="col-md-10">
               					<textarea id="Control23" data-datafield="ServiceArea" data-type="SheetRichTextBox" style="">					</textarea>
               				</div>
               			</div>
                <div class="row tableContent">
               				<div id="title15" class="col-md-2">
               					<span id="Label24" data-type="SheetLabel" data-datafield="ResultsRequired" style="">成果要求</span>
               				</div>
               				<div id="control15" class="col-md-10">
               					<textarea id="Control24" data-datafield="ResultsRequired" data-type="SheetRichTextBox" style="">					</textarea>
               				</div>
               			</div>
                <div class="row">
               				<div id="title17" class="col-md-2">
               					<span id="Label25" data-type="SheetLabel" data-datafield="ProjectStatus" style="">项目状态</span>
               				</div>
               				<div id="control17" class="col-md-4">

               				<select data-datafield="ProjectStatus" data-type="SheetDropDownList" id="ctl956291" class="" style="" data-defaultitems="活跃中;已归档"></select></div>
               				<div id="space18" class="col-md-2">
               				</div>
               				<div id="spaceControl18" class="col-md-4">
               				</div>
               			</div>
            </div>
            <div class="tab-pane fade" id="ios">
                <div class="row tableContent">
                				<div id="title19" class="col-md-2">
                					<span id="Label26" data-type="SheetLabel" data-datafield="PersonnelInfo" style="">人员信息</span>
                				</div>
                				<div id="control19" class="col-md-10">
                					<table id="Control26" data-datafield="PersonnelInfo" data-type="SheetGridView" class="SheetGridView" data-defaultrowcount="">
                						<tbody>

                							<tr class="header">
                								<td id="Control26_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control26_Header3" data-datafield="PersonnelInfo.UserName">
                									<label id="Control26_Label3" data-datafield="PersonnelInfo.UserName" data-type="SheetLabel" style="">姓名</label>
                								</td>
                								<td id="Control26_Header4" data-datafield="PersonnelInfo.UserRole">
                									<label id="Control26_Label4" data-datafield="PersonnelInfo.UserRole" data-type="SheetLabel" style="">角色</label>
                								</td>
                								<td id="Control26_Header5" data-datafield="PersonnelInfo.Depart">
                									<label id="Control26_Label5" data-datafield="PersonnelInfo.Depart" data-type="SheetLabel" style="">所属部门</label>
                								</td>
                								<td id="Control26_Header6" data-datafield="PersonnelInfo.Profession">
                									<label id="Control26_Label6" data-datafield="PersonnelInfo.Profession" data-type="SheetLabel" style="">专业</label>
                								</td>
                								<td id="Control26_Header7" data-datafield="PersonnelInfo.JobTitle">
                									<label id="Control26_Label7" data-datafield="PersonnelInfo.JobTitle" data-type="SheetLabel" style="">职称</label>
                								</td>
                								<td id="Control26_Header8" data-datafield="PersonnelInfo.Qualification">
                									<label id="Control26_Label8" data-datafield="PersonnelInfo.Qualification" data-type="SheetLabel" style="">职业资格</label>
                								</td>
                								<td id="Control26_Header9" data-datafield="PersonnelInfo.AppointmentDate">
                									<label id="Control26_Label9" data-datafield="PersonnelInfo.AppointmentDate" data-type="SheetLabel" style="">任命日期</label>
                								</td>
                								<td id="Control26_Header10" data-datafield="PersonnelInfo.ResidentBegin">
                									<label id="Control26_Label10" data-datafield="PersonnelInfo.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label>
                								</td>
                								<td id="Control26_Header11" data-datafield="PersonnelInfo.ResidentEnd">
                									<label id="Control26_Label11" data-datafield="PersonnelInfo.ResidentEnd" data-type="SheetLabel" style="">至</label>
                								</td>
                								<td id="Control26_Header12" data-datafield="PersonnelInfo.LeaveDate">
                									<label id="Control26_Label12" data-datafield="PersonnelInfo.LeaveDate" data-type="SheetLabel" style="">撤出日期</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control26_Option" class="rowOption">
                								</td>
                								<td data-datafield="PersonnelInfo.UserName">
                									<input id="Control26_ctl3" type="text" data-datafield="PersonnelInfo.UserName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.UserRole">
                									<input id="Control26_ctl4" type="text" data-datafield="PersonnelInfo.UserRole" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.Depart">
                									<input id="Control26_ctl5" type="text" data-datafield="PersonnelInfo.Depart" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.Profession">
                									<input id="Control26_ctl6" type="text" data-datafield="PersonnelInfo.Profession" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.JobTitle">
                									<input id="Control26_ctl7" type="text" data-datafield="PersonnelInfo.JobTitle" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.Qualification">
                									<input id="Control26_ctl8" type="text" data-datafield="PersonnelInfo.Qualification" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.AppointmentDate">
                									<input id="Control26_ctl9" type="text" data-datafield="PersonnelInfo.AppointmentDate" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.ResidentBegin">
                									<input id="Control26_ctl10" type="text" data-datafield="PersonnelInfo.ResidentBegin" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.ResidentEnd">
                									<input id="Control26_ctl11" type="text" data-datafield="PersonnelInfo.ResidentEnd" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="PersonnelInfo.LeaveDate">
                									<input id="Control26_ctl12" type="text" data-datafield="PersonnelInfo.LeaveDate" data-type="SheetTime" style="">
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
                								<td data-datafield="PersonnelInfo.UserName">
                								</td>
                								<td data-datafield="PersonnelInfo.UserRole">
                								</td>
                								<td data-datafield="PersonnelInfo.Depart">
                								</td>
                								<td data-datafield="PersonnelInfo.Profession">
                								</td>
                								<td data-datafield="PersonnelInfo.JobTitle">
                								</td>
                								<td data-datafield="PersonnelInfo.Qualification">
                								</td>
                								<td data-datafield="PersonnelInfo.AppointmentDate">
                								</td>
                								<td data-datafield="PersonnelInfo.ResidentBegin">
                								</td>
                								<td data-datafield="PersonnelInfo.ResidentEnd">
                								</td>
                								<td data-datafield="PersonnelInfo.LeaveDate">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
            </div>
            <div class="tab-pane fade" id="ios1">
			    <div class="row tableContent">
				<div id="title21" class="col-md-2">
					<span id="Label27" data-type="SheetLabel" data-datafield="BudgetInfo" style="">预算信息</span>
				</div>
				<div id="control21" class="col-md-10">
					<table id="Control27" data-datafield="BudgetInfo" data-type="SheetGridView" class="SheetGridView" data-defaultrowcount="">
						<tbody>

							<tr class="header">
								<td id="Control27_SerialNo" class="rowSerialNo">
序号								</td>
								<td id="Control27_Header3" data-datafield="BudgetInfo.CountSubjects">
									<label id="Control27_Label3" data-datafield="BudgetInfo.CountSubjects" data-type="SheetLabel" style="">统计科目</label>
								</td>
								<td id="Control27_Header4" data-datafield="BudgetInfo.SubjectDescription">
									<label id="Control27_Label4" data-datafield="BudgetInfo.SubjectDescription" data-type="SheetLabel" style="">科目说明</label>
								</td>
								<td id="Control27_Header5" data-datafield="BudgetInfo.EstimatedAmount">
									<label id="Control27_Label5" data-datafield="BudgetInfo.EstimatedAmount" data-type="SheetLabel" style="">预计金额</label>
								</td>
								<td id="Control27_Header6" data-datafield="BudgetInfo.ActualExpenditure">
									<label id="Control27_Label6" data-datafield="BudgetInfo.ActualExpenditure" data-type="SheetLabel" style="">实际支出</label>
								</td>
								<td class="rowOption">
删除								</td>
							</tr>
							<tr class="template">
								<td id="Control27_Option" class="rowOption">
								</td>
								<td data-datafield="BudgetInfo.CountSubjects">
									<input id="Control27_ctl3" type="text" data-datafield="BudgetInfo.CountSubjects" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="BudgetInfo.SubjectDescription">
									<textarea id="Control27_ctl4" data-datafield="BudgetInfo.SubjectDescription" data-type="SheetRichTextBox" style="">									</textarea>
								</td>
								<td data-datafield="BudgetInfo.EstimatedAmount">
									<input id="Control27_ctl5" type="text" data-datafield="BudgetInfo.EstimatedAmount" data-type="SheetTextBox" style="">
								</td>
								<td data-datafield="BudgetInfo.ActualExpenditure">
									<input id="Control27_ctl6" type="text" data-datafield="BudgetInfo.ActualExpenditure" data-type="SheetTextBox" style="">
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
								<td data-datafield="BudgetInfo.CountSubjects">
								</td>
								<td data-datafield="BudgetInfo.SubjectDescription">
								</td>
								<td data-datafield="BudgetInfo.EstimatedAmount">
									<label id="Control27_stat5" data-datafield="BudgetInfo.EstimatedAmount" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td data-datafield="BudgetInfo.ActualExpenditure">
									<label id="Control27_stat6" data-datafield="BudgetInfo.ActualExpenditure" data-type="SheetCountLabel" style="">
									</label>
								</td>
								<td class="rowOption">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			    <div class="row">
				<div id="title23" class="col-md-2">
					<span id="Label28" data-type="SheetLabel" data-datafield="ProjectStartDate" style="">项目工作开始时间</span>
				</div>
				<div id="control23" class="col-md-4">
					<input id="Control28" type="text" data-datafield="ProjectStartDate" data-type="SheetTime" style="">
				</div>
				<div id="space24" class="col-md-2">
				</div>
				<div id="spaceControl24" class="col-md-4">
				</div>
			</div>
            </div>
            <div class="tab-pane fade" id="ios2">
                <div class="row tableContent">
                				<div id="title25" class="col-md-2">
                					<span id="Label29" data-type="SheetLabel" data-datafield="ProjectProgress" style="">项目形象进度计划表</span>
                				</div>
                				<div id="control25" class="col-md-10">
                					<table id="Control29" data-datafield="ProjectProgress" data-type="SheetGridView" class="SheetGridView" data-defaultrowcount="">
                						<tbody>

                							<tr class="header">
                								<td id="Control29_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control29_Header3" data-datafield="ProjectProgress.Schedule">
                									<label id="Control29_Label3" data-datafield="ProjectProgress.Schedule" data-type="SheetLabel" style="">项目进度计划</label>
                								</td>
                								<td id="Control29_Header4" data-datafield="ProjectProgress.ItemDescription">
                									<label id="Control29_Label4" data-datafield="ProjectProgress.ItemDescription" data-type="SheetLabel" style="">项目节点说明</label>
                								</td>
                								<td id="Control29_Header5" data-datafield="ProjectProgress.ProjectSchedule">
                									<label id="Control29_Label5" data-datafield="ProjectProgress.ProjectSchedule" data-type="SheetLabel" style="">项目进度</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control29_Option" class="rowOption">
                								</td>
                								<td data-datafield="ProjectProgress.Schedule">
                									<input id="Control29_ctl3" type="text" data-datafield="ProjectProgress.Schedule" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ProjectProgress.ItemDescription">
                									<textarea id="Control29_ctl4" data-datafield="ProjectProgress.ItemDescription" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="ProjectProgress.ProjectSchedule">
                									<input id="Control29_ctl5" type="text" data-datafield="ProjectProgress.ProjectSchedule" data-type="SheetTextBox" style="">
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
                								<td data-datafield="ProjectProgress.Schedule">
                								</td>
                								<td data-datafield="ProjectProgress.ItemDescription">
                								</td>
                								<td data-datafield="ProjectProgress.ProjectSchedule">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
            </div>
            <div class="tab-pane fade" id="ios3">
                <div class="row tableContent">
                				<div id="title27" class="col-md-2">
                					<span id="Label30" data-type="SheetLabel" data-datafield="SFKSchedule" style="">收付款计划表</span>
                				</div>
                				<div id="control27" class="col-md-10">
                					<table id="Control30" data-datafield="SFKSchedule" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control30_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control30_Header3" data-datafield="SFKSchedule.CollectionPlan">
                									<label id="Control30_Label3" data-datafield="SFKSchedule.CollectionPlan" data-type="SheetLabel" style="">收款计划</label>
                								</td>
                								<td id="Control30_Header4" data-datafield="SFKSchedule.PaymentDescription">
                									<label id="Control30_Label4" data-datafield="SFKSchedule.PaymentDescription" data-type="SheetLabel" style="">付款节点说明</label>
                								</td>
                								<td id="Control30_Header5" data-datafield="SFKSchedule.PaymentPercentage">
                									<label id="Control30_Label5" data-datafield="SFKSchedule.PaymentPercentage" data-type="SheetLabel" style="">计划付款百分比（不累计）</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control30_Option" class="rowOption">
                								</td>
                								<td data-datafield="SFKSchedule.CollectionPlan">
                									<input id="Control30_ctl3" type="text" data-datafield="SFKSchedule.CollectionPlan" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="SFKSchedule.PaymentDescription">
                									<textarea id="Control30_ctl4" data-datafield="SFKSchedule.PaymentDescription" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="SFKSchedule.PaymentPercentage">
                									<input id="Control30_ctl5" type="text" data-datafield="SFKSchedule.PaymentPercentage" data-type="SheetTextBox" style="">
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
                								<td data-datafield="SFKSchedule.CollectionPlan">
                								</td>
                								<td data-datafield="SFKSchedule.PaymentDescription">
                								</td>
                								<td data-datafield="SFKSchedule.PaymentPercentage">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title29" class="col-md-2">
                					<span id="Label31" data-type="SheetLabel" data-datafield="SFKTrackingTable" style="">跟踪表</span>
                				</div>
                				<div id="control29" class="col-md-10">
                					<table id="Control31" data-datafield="SFKTrackingTable" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control31_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control31_Header3" data-datafield="SFKTrackingTable.ActualPaymentTime">
                									<label id="Control31_Label3" data-datafield="SFKTrackingTable.ActualPaymentTime" data-type="SheetLabel" style="">实际付款时间</label>
                								</td>
                								<td id="Control31_Header4" data-datafield="SFKTrackingTable.PaymentDescription">
                									<label id="Control31_Label4" data-datafield="SFKTrackingTable.PaymentDescription" data-type="SheetLabel" style="">付款节点说明</label>
                								</td>
                								<td id="Control31_Header5" data-datafield="SFKTrackingTable.ActualPaymentPercentage">
                									<label id="Control31_Label5" data-datafield="SFKTrackingTable.ActualPaymentPercentage" data-type="SheetLabel" style="">实际付款百分比</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control31_Option" class="rowOption">
                								</td>
                								<td data-datafield="SFKTrackingTable.ActualPaymentTime">
                									<input id="Control31_ctl3" type="text" data-datafield="SFKTrackingTable.ActualPaymentTime" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="SFKTrackingTable.PaymentDescription">
                									<textarea id="Control31_ctl4" data-datafield="SFKTrackingTable.PaymentDescription" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="SFKTrackingTable.ActualPaymentPercentage">
                									<input id="Control31_ctl5" type="text" data-datafield="SFKTrackingTable.ActualPaymentPercentage" data-type="SheetTextBox" style="">
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
                								<td data-datafield="SFKTrackingTable.ActualPaymentTime">
                								</td>
                								<td data-datafield="SFKTrackingTable.PaymentDescription">
                								</td>
                								<td data-datafield="SFKTrackingTable.ActualPaymentPercentage">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
            </div>
            <div class="tab-pane fade" id="ios4">
                <div class="row tableContent">
                				<div id="title31" class="col-md-2">
                					<span id="Label32" data-type="SheetLabel" data-datafield="CarRentalInfo" style="">项目现有租车信息</span>
                				</div>
                				<div id="control31" class="col-md-10">
                					<table id="Control32" data-datafield="CarRentalInfo" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control32_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control32_Header3" data-datafield="CarRentalInfo.Type">
                									<label id="Control32_Label3" data-datafield="CarRentalInfo.Type" data-type="SheetLabel" style="">车辆型号</label>
                								</td>
                								<td id="Control32_Header4" data-datafield="CarRentalInfo.Plate">
                									<label id="Control32_Label4" data-datafield="CarRentalInfo.Plate" data-type="SheetLabel" style="">车牌号</label>
                								</td>
                								<td id="Control32_Header5" data-datafield="CarRentalInfo.Seat">
                									<label id="Control32_Label5" data-datafield="CarRentalInfo.Seat" data-type="SheetLabel" style="">座位数量</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control32_Option" class="rowOption">
                								</td>
                								<td data-datafield="CarRentalInfo.Type">
                									<input id="Control32_ctl3" type="text" data-datafield="CarRentalInfo.Type" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="CarRentalInfo.Plate">
                									<input id="Control32_ctl4" type="text" data-datafield="CarRentalInfo.Plate" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="CarRentalInfo.Seat">
                									<input id="Control32_ctl5" type="text" data-datafield="CarRentalInfo.Seat" data-type="SheetTextBox" style="">
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
                								<td data-datafield="CarRentalInfo.Type">
                								</td>
                								<td data-datafield="CarRentalInfo.Plate">
                								</td>
                								<td data-datafield="CarRentalInfo.Seat">
                									<label id="Control32_stat5" data-datafield="CarRentalInfo.Seat" data-type="SheetCountLabel" style="">
                									</label>
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title33" class="col-md-2">
                					<span id="Label33" data-type="SheetLabel" data-datafield="RentalInfo" style="">租房信息</span>
                				</div>
                				<div id="control33" class="col-md-10">
                					<table id="Control33" data-datafield="RentalInfo" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control33_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control33_Header3" data-datafield="RentalInfo.Place">
                									<label id="Control33_Label3" data-datafield="RentalInfo.Place" data-type="SheetLabel" style="">租房处所</label>
                								</td>
                								<td id="Control33_Header4" data-datafield="RentalInfo.Personnel">
                									<label id="Control33_Label4" data-datafield="RentalInfo.Personnel" data-type="SheetLabel" style="">住宿人员</label>
                								</td>
                								<td id="Control33_Header5" data-datafield="RentalInfo.Type">
                									<label id="Control33_Label5" data-datafield="RentalInfo.Type" data-type="SheetLabel" style="">户型</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control33_Option" class="rowOption">
                								</td>
                								<td data-datafield="RentalInfo.Place">
                									<input id="Control33_ctl3" type="text" data-datafield="RentalInfo.Place" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="RentalInfo.Personnel">
                									<input id="Control33_ctl4" type="text" data-datafield="RentalInfo.Personnel" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="RentalInfo.Type">
                									<input id="Control33_ctl5" type="text" data-datafield="RentalInfo.Type" data-type="SheetTextBox" style="">
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
                								<td data-datafield="RentalInfo.Place">
                								</td>
                								<td data-datafield="RentalInfo.Personnel">
                								</td>
                								<td data-datafield="RentalInfo.Type">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title35" class="col-md-2">
                					<span id="Label34" data-type="SheetLabel" data-datafield="ExpertResources" style="">专家资源</span>
                				</div>
                				<div id="control35" class="col-md-10">
                					<table id="Control34" data-datafield="ExpertResources" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control34_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control34_Header3" data-datafield="ExpertResources.ProfessionalExperts">
                									<label id="Control34_Label3" data-datafield="ExpertResources.ProfessionalExperts" data-type="SheetLabel" style="">专家专业</label>
                								</td>
                								<td id="Control34_Header4" data-datafield="ExpertResources.UseTimes">
                									<label id="Control34_Label4" data-datafield="ExpertResources.UseTimes" data-type="SheetLabel" style="">使用人次</label>
                								</td>
                								<td id="Control34_Header5" data-datafield="ExpertResources.UseDate">
                									<label id="Control34_Label5" data-datafield="ExpertResources.UseDate" data-type="SheetLabel" style="">使用日期</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control34_Option" class="rowOption">
                								</td>
                								<td data-datafield="ExpertResources.ProfessionalExperts">
                									<input id="Control34_ctl3" type="text" data-datafield="ExpertResources.ProfessionalExperts" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExpertResources.UseTimes">
                									<input id="Control34_ctl4" type="text" data-datafield="ExpertResources.UseTimes" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExpertResources.UseDate">
                									<input id="Control34_ctl5" type="text" data-datafield="ExpertResources.UseDate" data-type="SheetTime" style="">
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
                								<td data-datafield="ExpertResources.ProfessionalExperts">
                								</td>
                								<td data-datafield="ExpertResources.UseTimes">
                								</td>
                								<td data-datafield="ExpertResources.UseDate">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
            </div>
            <div class="tab-pane fade" id="jmeter">
                <div class="row tableContent">
                				<div id="title37" class="col-md-2">
                					<span id="Label35" data-type="SheetLabel" data-datafield="OutsourcingInfo" style="">委外信息</span>
                				</div>
                				<div id="control37" class="col-md-10">
                					<table id="Control35" data-datafield="OutsourcingInfo" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control35_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control35_Header3" data-datafield="OutsourcingInfo.Unit">
                									<label id="Control35_Label3" data-datafield="OutsourcingInfo.Unit" data-type="SheetLabel" style="">委外单位</label>
                								</td>
                								<td id="Control35_Header4" data-datafield="OutsourcingInfo.Amount">
                									<label id="Control35_Label4" data-datafield="OutsourcingInfo.Amount" data-type="SheetLabel" style="">委外金额（元）</label>
                								</td>
                								<td id="Control35_Header5" data-datafield="OutsourcingInfo.ContractNumber">
                									<label id="Control35_Label5" data-datafield="OutsourcingInfo.ContractNumber" data-type="SheetLabel" style="">委外合同编号</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control35_Option" class="rowOption">
                								</td>
                								<td data-datafield="OutsourcingInfo.Unit">
                									<input id="Control35_ctl3" type="text" data-datafield="OutsourcingInfo.Unit" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="OutsourcingInfo.Amount">
                									<input id="Control35_ctl4" type="text" data-datafield="OutsourcingInfo.Amount" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="OutsourcingInfo.ContractNumber">
                									<input id="Control35_ctl5" type="text" data-datafield="OutsourcingInfo.ContractNumber" data-type="SheetTextBox" style="">
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
                								<td data-datafield="OutsourcingInfo.Unit">
                								</td>
                								<td data-datafield="OutsourcingInfo.Amount">
                									<label id="Control35_stat4" data-datafield="OutsourcingInfo.Amount" data-type="SheetCountLabel" style="">
                									</label>
                								</td>
                								<td data-datafield="OutsourcingInfo.ContractNumber">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
            </div>
            <div class="tab-pane fade" id="ejb1">
                <div class="row tableContent">
                				<div id="title39" class="col-md-2">
                					<span id="Label36" data-type="SheetLabel" data-datafield="ExternalInterface" style="">外部接口</span>
                				</div>
                				<div id="control39" class="col-md-10">
                					<table id="Control36" data-datafield="ExternalInterface" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control36_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control36_Header3" data-datafield="ExternalInterface.UserName">
                									<label id="Control36_Label3" data-datafield="ExternalInterface.UserName" data-type="SheetLabel" style="">姓名</label>
                								</td>
                								<td id="Control36_Header4" data-datafield="ExternalInterface.Unit">
                									<label id="Control36_Label4" data-datafield="ExternalInterface.Unit" data-type="SheetLabel" style="">单位</label>
                								</td>
                								<td id="Control36_Header5" data-datafield="ExternalInterface.Depart">
                									<label id="Control36_Label5" data-datafield="ExternalInterface.Depart" data-type="SheetLabel" style="">部门</label>
                								</td>
                								<td id="Control36_Header6" data-datafield="ExternalInterface.Post">
                									<label id="Control36_Label6" data-datafield="ExternalInterface.Post" data-type="SheetLabel" style="">职务</label>
                								</td>
                								<td id="Control36_Header7" data-datafield="ExternalInterface.JobTitle">
                									<label id="Control36_Label7" data-datafield="ExternalInterface.JobTitle" data-type="SheetLabel" style="">职称</label>
                								</td>
                								<td id="Control36_Header8" data-datafield="ExternalInterface.Phone">
                									<label id="Control36_Label8" data-datafield="ExternalInterface.Phone" data-type="SheetLabel" style="">联系电话</label>
                								</td>
                								<td id="Control36_Header9" data-datafield="ExternalInterface.Email">
                									<label id="Control36_Label9" data-datafield="ExternalInterface.Email" data-type="SheetLabel" style="">邮箱</label>
                								</td>
                								<td id="Control36_Header10" data-datafield="ExternalInterface.OtherContact">
                									<label id="Control36_Label10" data-datafield="ExternalInterface.OtherContact" data-type="SheetLabel" style="">其他联系方式</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control36_Option" class="rowOption">
                								</td>
                								<td data-datafield="ExternalInterface.UserName">
                									<input id="Control36_ctl3" type="text" data-datafield="ExternalInterface.UserName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalInterface.Unit">
                									<input id="Control36_ctl4" type="text" data-datafield="ExternalInterface.Unit" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalInterface.Depart">
                									<input id="Control36_ctl5" type="text" data-datafield="ExternalInterface.Depart" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalInterface.Post">
                									<input id="Control36_ctl6" type="text" data-datafield="ExternalInterface.Post" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalInterface.JobTitle">
                									<input id="Control36_ctl7" type="text" data-datafield="ExternalInterface.JobTitle" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalInterface.Phone">
                									<input id="Control36_ctl8" type="text" data-datafield="ExternalInterface.Phone" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalInterface.Email">
                									<input id="Control36_ctl9" type="text" data-datafield="ExternalInterface.Email" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalInterface.OtherContact">
                									<input id="Control36_ctl10" type="text" data-datafield="ExternalInterface.OtherContact" data-type="SheetTextBox" style="">
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
                								<td data-datafield="ExternalInterface.UserName">
                								</td>
                								<td data-datafield="ExternalInterface.Unit">
                								</td>
                								<td data-datafield="ExternalInterface.Depart">
                								</td>
                								<td data-datafield="ExternalInterface.Post">
                								</td>
                								<td data-datafield="ExternalInterface.JobTitle">
                								</td>
                								<td data-datafield="ExternalInterface.Phone">
                								</td>
                								<td data-datafield="ExternalInterface.Email">
                								</td>
                								<td data-datafield="ExternalInterface.OtherContact">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title41" class="col-md-2">
                					<span id="Label37" data-type="SheetLabel" data-datafield="InternalInterface" style="">内部接口</span>
                				</div>
                				<div id="control41" class="col-md-10">
                					<table id="Control37" data-datafield="InternalInterface" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control37_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control37_Header3" data-datafield="InternalInterface.UserName">
                									<label id="Control37_Label3" data-datafield="InternalInterface.UserName" data-type="SheetLabel" style="">姓名</label>
                								</td>
                								<td id="Control37_Header4" data-datafield="InternalInterface.Unit">
                									<label id="Control37_Label4" data-datafield="InternalInterface.Unit" data-type="SheetLabel" style="">单位</label>
                								</td>
                								<td id="Control37_Header5" data-datafield="InternalInterface.Depart">
                									<label id="Control37_Label5" data-datafield="InternalInterface.Depart" data-type="SheetLabel" style="">部门</label>
                								</td>
                								<td id="Control37_Header6" data-datafield="InternalInterface.Post">
                									<label id="Control37_Label6" data-datafield="InternalInterface.Post" data-type="SheetLabel" style="">职务</label>
                								</td>
                								<td id="Control37_Header7" data-datafield="InternalInterface.Phone">
                									<label id="Control37_Label7" data-datafield="InternalInterface.Phone" data-type="SheetLabel" style="">联系电话</label>
                								</td>
                								<td id="Control37_Header8" data-datafield="InternalInterface.Email">
                									<label id="Control37_Label8" data-datafield="InternalInterface.Email" data-type="SheetLabel" style="">邮箱</label>
                								</td>
                								<td id="Control37_Header9" data-datafield="InternalInterface.OtherContact">
                									<label id="Control37_Label9" data-datafield="InternalInterface.OtherContact" data-type="SheetLabel" style="">其他联系方式</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control37_Option" class="rowOption">
                								</td>
                								<td data-datafield="InternalInterface.UserName">
                									<input id="Control37_ctl3" type="text" data-datafield="InternalInterface.UserName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="InternalInterface.Unit">
                									<input id="Control37_ctl4" type="text" data-datafield="InternalInterface.Unit" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="InternalInterface.Depart">
                									<input id="Control37_ctl5" type="text" data-datafield="InternalInterface.Depart" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="InternalInterface.Post">
                									<input id="Control37_ctl6" type="text" data-datafield="InternalInterface.Post" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="InternalInterface.Phone">
                									<input id="Control37_ctl7" type="text" data-datafield="InternalInterface.Phone" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="InternalInterface.Email">
                									<input id="Control37_ctl8" type="text" data-datafield="InternalInterface.Email" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="InternalInterface.OtherContact">
                									<input id="Control37_ctl9" type="text" data-datafield="InternalInterface.OtherContact" data-type="SheetTextBox" style="">
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
                								<td data-datafield="InternalInterface.UserName">
                								</td>
                								<td data-datafield="InternalInterface.Unit">
                								</td>
                								<td data-datafield="InternalInterface.Depart">
                								</td>
                								<td data-datafield="InternalInterface.Post">
                								</td>
                								<td data-datafield="InternalInterface.Phone">
                								</td>
                								<td data-datafield="InternalInterface.Email">
                								</td>
                								<td data-datafield="InternalInterface.OtherContact">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
            </div>
            <!--<div class="tab-pane fade" id="ejb2">-->
                <!--<p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。</p>-->
            <!--</div>-->
            <div class="tab-pane fade" id="ejb3">
                <div class="row tableContent">
                				<div id="title43" class="col-md-2">
                					<span id="Label38" data-type="SheetLabel" data-datafield="ProjectSummaryInfo" style="">项目总结资料</span>
                				</div>
                				<div id="control43" class="col-md-10">
                					<table id="Control38" data-datafield="ProjectSummaryInfo" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control38_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control38_Header3" data-datafield="ProjectSummaryInfo.DataName">
                									<label id="Control38_Label3" data-datafield="ProjectSummaryInfo.DataName" data-type="SheetLabel" style="">姓名名称</label>
                								</td>
                								<td id="Control38_Header4" data-datafield="ProjectSummaryInfo.PNote">
                									<label id="Control38_Label4" data-datafield="ProjectSummaryInfo.PNote" data-type="SheetLabel" style="">备注</label>
                								</td>
                								<td id="Control38_Header5" data-datafield="ProjectSummaryInfo.Attach">
                									<label id="Control38_Label5" data-datafield="ProjectSummaryInfo.Attach" data-type="SheetLabel" style="">附件</label>
                								</td>
                								<td id="Control38_Header6" data-datafield="ProjectSummaryInfo.ImportDate">
                									<label id="Control38_Label6" data-datafield="ProjectSummaryInfo.ImportDate" data-type="SheetLabel" style="">资料上传日期</label>
                								</td>
                								<td id="Control38_Header7" data-datafield="ProjectSummaryInfo.UploadPeople">
                									<label id="Control38_Label7" data-datafield="ProjectSummaryInfo.UploadPeople" data-type="SheetLabel" style="">上传人</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control38_Option" class="rowOption">
                								</td>
                								<td data-datafield="ProjectSummaryInfo.DataName">
                									<input id="Control38_ctl3" type="text" data-datafield="ProjectSummaryInfo.DataName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ProjectSummaryInfo.PNote">
                									<textarea id="Control38_ctl4" data-datafield="ProjectSummaryInfo.PNote" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="ProjectSummaryInfo.Attach">
                									<div id="Control38_ctl5" data-datafield="ProjectSummaryInfo.Attach" data-type="SheetAttachment" style="">

                									</div>
                								</td>
                								<td data-datafield="ProjectSummaryInfo.ImportDate">
                									<input id="Control38_ctl6" type="text" data-datafield="ProjectSummaryInfo.ImportDate" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="ProjectSummaryInfo.UploadPeople">
                									<input id="Control38_ctl7" type="text" data-datafield="ProjectSummaryInfo.UploadPeople" data-type="SheetTextBox" style="">
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
                								<td data-datafield="ProjectSummaryInfo.DataName">
                								</td>
                								<td data-datafield="ProjectSummaryInfo.PNote">
                								</td>
                								<td data-datafield="ProjectSummaryInfo.Attach">
                								</td>
                								<td data-datafield="ProjectSummaryInfo.ImportDate">
                								</td>
                								<td data-datafield="ProjectSummaryInfo.UploadPeople">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title45" class="col-md-2">
                					<span id="Label39" data-type="SheetLabel" data-datafield="MWeeklyData" style="">月度/周资料</span>
                				</div>
                				<div id="control45" class="col-md-10">
                					<table id="Control39" data-datafield="MWeeklyData" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control39_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control39_Header3" data-datafield="MWeeklyData.DataName">
                									<label id="Control39_Label3" data-datafield="MWeeklyData.DataName" data-type="SheetLabel" style="">资料名称</label>
                								</td>
                								<td id="Control39_Header4" data-datafield="MWeeklyData.PNote">
                									<label id="Control39_Label4" data-datafield="MWeeklyData.PNote" data-type="SheetLabel" style="">备注</label>
                								</td>
                								<td id="Control39_Header5" data-datafield="MWeeklyData.Attach">
                									<label id="Control39_Label5" data-datafield="MWeeklyData.Attach" data-type="SheetLabel" style="">附件</label>
                								</td>
                								<td id="Control39_Header6" data-datafield="MWeeklyData.ImportDate">
                									<label id="Control39_Label6" data-datafield="MWeeklyData.ImportDate" data-type="SheetLabel" style="">资料上传日期</label>
                								</td>
                								<td id="Control39_Header7" data-datafield="MWeeklyData.UploadPeople">
                									<label id="Control39_Label7" data-datafield="MWeeklyData.UploadPeople" data-type="SheetLabel" style="">上传人</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control39_Option" class="rowOption">
                								</td>
                								<td data-datafield="MWeeklyData.DataName">
                									<input id="Control39_ctl3" type="text" data-datafield="MWeeklyData.DataName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="MWeeklyData.PNote">
                									<textarea id="Control39_ctl4" data-datafield="MWeeklyData.PNote" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="MWeeklyData.Attach">
                									<div id="Control39_ctl5" data-datafield="MWeeklyData.Attach" data-type="SheetAttachment" style="">

                									</div>
                								</td>
                								<td data-datafield="MWeeklyData.ImportDate">
                									<input id="Control39_ctl6" type="text" data-datafield="MWeeklyData.ImportDate" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="MWeeklyData.UploadPeople">
                									<input id="Control39_ctl7" type="text" data-datafield="MWeeklyData.UploadPeople" data-type="SheetTextBox" style="">
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
                								<td data-datafield="MWeeklyData.DataName">
                								</td>
                								<td data-datafield="MWeeklyData.PNote">
                								</td>
                								<td data-datafield="MWeeklyData.Attach">
                								</td>
                								<td data-datafield="MWeeklyData.ImportDate">
                								</td>
                								<td data-datafield="MWeeklyData.UploadPeople">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title47" class="col-md-2">
                					<span id="Label40" data-type="SheetLabel" data-datafield="ProjectReviewData" style="">项目输入评审材料</span>
                				</div>
                				<div id="control47" class="col-md-10">
                					<table id="Control40" data-datafield="ProjectReviewData" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control40_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control40_Header3" data-datafield="ProjectReviewData.DataName">
                									<label id="Control40_Label3" data-datafield="ProjectReviewData.DataName" data-type="SheetLabel" style="">资料名称</label>
                								</td>
                								<td id="Control40_Header4" data-datafield="ProjectReviewData.PNote">
                									<label id="Control40_Label4" data-datafield="ProjectReviewData.PNote" data-type="SheetLabel" style="">备注</label>
                								</td>
                								<td id="Control40_Header5" data-datafield="ProjectReviewData.Attach">
                									<label id="Control40_Label5" data-datafield="ProjectReviewData.Attach" data-type="SheetLabel" style="">附件</label>
                								</td>
                								<td id="Control40_Header6" data-datafield="ProjectReviewData.ImportDate">
                									<label id="Control40_Label6" data-datafield="ProjectReviewData.ImportDate" data-type="SheetLabel" style="">资料上传日期</label>
                								</td>
                								<td id="Control40_Header7" data-datafield="ProjectReviewData.UploadPeople">
                									<label id="Control40_Label7" data-datafield="ProjectReviewData.UploadPeople" data-type="SheetLabel" style="">上传人</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control40_Option" class="rowOption">
                								</td>
                								<td data-datafield="ProjectReviewData.DataName">
                									<input id="Control40_ctl3" type="text" data-datafield="ProjectReviewData.DataName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ProjectReviewData.PNote">
                									<textarea id="Control40_ctl4" data-datafield="ProjectReviewData.PNote" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="ProjectReviewData.Attach">
                									<div id="Control40_ctl5" data-datafield="ProjectReviewData.Attach" data-type="SheetAttachment" style="">

                									</div>
                								</td>
                								<td data-datafield="ProjectReviewData.ImportDate">
                									<input id="Control40_ctl6" type="text" data-datafield="ProjectReviewData.ImportDate" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="ProjectReviewData.UploadPeople">
                									<input id="Control40_ctl7" type="text" data-datafield="ProjectReviewData.UploadPeople" data-type="SheetTextBox" style="">
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
                								<td data-datafield="ProjectReviewData.DataName">
                								</td>
                								<td data-datafield="ProjectReviewData.PNote">
                								</td>
                								<td data-datafield="ProjectReviewData.Attach">
                								</td>
                								<td data-datafield="ProjectReviewData.ImportDate">
                								</td>
                								<td data-datafield="ProjectReviewData.UploadPeople">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title49" class="col-md-2">
                					<span id="Label41" data-type="SheetLabel" data-datafield="ExternalData" style="">外部登记资料</span>
                				</div>
                				<div id="control49" class="col-md-10">
                					<table id="Control41" data-datafield="ExternalData" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control41_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control41_Header3" data-datafield="ExternalData.DataName">
                									<label id="Control41_Label3" data-datafield="ExternalData.DataName" data-type="SheetLabel" style="">资料名称</label>
                								</td>
                								<td id="Control41_Header4" data-datafield="ExternalData.PNote">
                									<label id="Control41_Label4" data-datafield="ExternalData.PNote" data-type="SheetLabel" style="">备注</label>
                								</td>
                								<td id="Control41_Header5" data-datafield="ExternalData.Attach">
                									<label id="Control41_Label5" data-datafield="ExternalData.Attach" data-type="SheetLabel" style="">附件</label>
                								</td>
                								<td id="Control41_Header6" data-datafield="ExternalData.RegisterDate">
                									<label id="Control41_Label6" data-datafield="ExternalData.RegisterDate" data-type="SheetLabel" style="">资料登记日期</label>
                								</td>
                								<td id="Control41_Header7" data-datafield="ExternalData.RegisterPerson">
                									<label id="Control41_Label7" data-datafield="ExternalData.RegisterPerson" data-type="SheetLabel" style="">资料登记人</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control41_Option" class="rowOption">
                								</td>
                								<td data-datafield="ExternalData.DataName">
                									<input id="Control41_ctl3" type="text" data-datafield="ExternalData.DataName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ExternalData.PNote">
                									<textarea id="Control41_ctl4" data-datafield="ExternalData.PNote" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="ExternalData.Attach">
                									<input id="Control41_ctl5" type="text" data-datafield="ExternalData.Attach" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="ExternalData.RegisterDate">
                									<input id="Control41_ctl6" type="text" data-datafield="ExternalData.RegisterDate" data-type="SheetTime" style="">
                								</td>
                								<td data-datafield="ExternalData.RegisterPerson">
                									<input id="Control41_ctl7" type="text" data-datafield="ExternalData.RegisterPerson" data-type="SheetTextBox" style="">
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
                								<td data-datafield="ExternalData.DataName">
                								</td>
                								<td data-datafield="ExternalData.PNote">
                								</td>
                								<td data-datafield="ExternalData.Attach">
                								</td>
                								<td data-datafield="ExternalData.RegisterDate">
                								</td>
                								<td data-datafield="ExternalData.RegisterPerson">
                								</td>
                								<td class="rowOption">
                								</td>
                							</tr>
                						</tbody>
                					</table>
                				</div>
                			</div>
                <div class="row tableContent">
                				<div id="title51" class="col-md-2">
                					<span id="Label42" data-type="SheetLabel" data-datafield="ArchivedData" style="">归档资料</span>
                				</div>
                				<div id="control51" class="col-md-10">
                					<table id="Control42" data-datafield="ArchivedData" data-type="SheetGridView" class="SheetGridView">
                						<tbody>

                							<tr class="header">
                								<td id="Control42_SerialNo" class="rowSerialNo">
                序号								</td>
                								<td id="Control42_Header3" data-datafield="ArchivedData.Type">
                									<label id="Control42_Label3" data-datafield="ArchivedData.Type" data-type="SheetLabel" style="">资料类别</label>
                								</td>
                								<td id="Control42_Header4" data-datafield="ArchivedData.DataName">
                									<label id="Control42_Label4" data-datafield="ArchivedData.DataName" data-type="SheetLabel" style="">资料名称</label>
                								</td>
                								<td id="Control42_Header5" data-datafield="ArchivedData.PNote">
                									<label id="Control42_Label5" data-datafield="ArchivedData.PNote" data-type="SheetLabel" style="">备注</label>
                								</td>
                								<td id="Control42_Header6" data-datafield="ArchivedData.Attach">
                									<label id="Control42_Label6" data-datafield="ArchivedData.Attach" data-type="SheetLabel" style="">附件</label>
                								</td>
                								<td id="Control42_Header7" data-datafield="ArchivedData.ArchivingDate">
                									<label id="Control42_Label7" data-datafield="ArchivedData.ArchivingDate" data-type="SheetLabel" style="">资料归档时间</label>
                								</td>
                								<td class="rowOption">
                删除								</td>
                							</tr>
                							<tr class="template">
                								<td id="Control42_Option" class="rowOption">
                								</td>
                								<td data-datafield="ArchivedData.Type">
                									<input id="Control42_ctl3" type="text" data-datafield="ArchivedData.Type" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ArchivedData.DataName">
                									<input id="Control42_ctl4" type="text" data-datafield="ArchivedData.DataName" data-type="SheetTextBox" style="">
                								</td>
                								<td data-datafield="ArchivedData.PNote">
                									<textarea id="Control42_ctl5" data-datafield="ArchivedData.PNote" data-type="SheetRichTextBox" style="">									</textarea>
                								</td>
                								<td data-datafield="ArchivedData.Attach">
                									<div id="Control42_ctl6" data-datafield="ArchivedData.Attach" data-type="SheetAttachment" style="">

                									</div>
                								</td>
                								<td data-datafield="ArchivedData.ArchivingDate">
                									<input id="Control42_ctl7" type="text" data-datafield="ArchivedData.ArchivingDate" data-type="SheetTime" style="">
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
                								<td data-datafield="ArchivedData.Type">
                								</td>
                								<td data-datafield="ArchivedData.DataName">
                								</td>
                								<td data-datafield="ArchivedData.PNote">
                								</td>
                								<td data-datafield="ArchivedData.Attach">
                								</td>
                								<td data-datafield="ArchivedData.ArchivingDate">
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
	</div>
</asp:Content>