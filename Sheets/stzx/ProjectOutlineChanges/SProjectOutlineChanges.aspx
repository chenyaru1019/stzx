<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectOutlineChanges.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectOutlineChanges" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="ProjectOutlineChanges.js"></script>
    <script type="text/javascript">
        $.MvcSheet.PreInit = function () {


            $("#Control14").attr("onfocus", "this.blur()");    //项目编号
            $("#Control15").attr("onfocus", "this.blur()");    //项目名称


            $("#ctl348953_control0 input").attr("onfocus", "this.blur()");
            $("#ctl348953_control3 input").attr("onfocus", "this.blur()");
            $("#ctl348953_control4 input").attr("onfocus", "this.blur()");
            $("#ctl819438").attr("disabled", "disabled");



        }
</script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">项目大纲变更</label>
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
                  <div id="divOriginateDateTitle" class="col-md-2">
                      <label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>
                  </div>
                  <div id="divOriginateDate" class="col-md-4">
                      <label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>
                  </div>
                 <div id="divSequenceNoTitle" class="col-md-2">
                     <label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号</label>
                 </div>
                 <div id="divSequenceNo" class="col-md-4">
                     <label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>
                 </div>
            </div>
            <div class="row">
                <div id="title1" class="col-md-2">
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="" class="">申请人：</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.UserName}">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="" class="">所属部门：</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" style="" class="" data-defaultvalue="{Originator.OUName}">
                </div>
            </div>
            <div class="row">
                <div id="div913857" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="Title" style="" class="">标题：</span></div>
                <div id="div959718" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class=""></div>
                <div id="div353340" class="col-md-2"></div>
            </div>

            <div class="row">
                <div id="div481748" class="col-md-2">
                    <span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号：</span>
                </div>
                <div id="div740296" class="col-md-4">
                    <input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum" data-onchange="$(&quot;#ctl21347&quot;).SheetUIManager().ClearChoices();setProjectDepart();
setProjectOutline();">
                </div>
                <div id="div853906" class="col-md-2">
                </div>
                <div id="div975791" class="col-md-4">
                </div>
            </div>
            <div class="row">
                <div id="div228394" class="col-md-2"><span id="Label15" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称：</span></div>
                <div id="div391933" class="col-md-8">
                    <input id="Control15" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="" data-onchange="
">
                </div>
                <div id="div112744" class="col-md-2"></div>
            </div>
          <div class="row">
                <div id="div194826" class="col-md-2">
                    <label data-datafield="jszj" data-type="SheetLabel" id="ctl164564" class="" style="">技术总监：</label>
                </div>
                <div id="div48809" class="col-md-4">
                    <div data-datafield="jszj" data-type="SheetUser" id="ctl133944" class="" style="" data-placeholder="选择审核的技术总监" data-rootunitid="fd375e11-b846-44a2-8070-9cbbdc5d93a9"></div>
                </div>
                <div id="div805750" class="col-md-2"></div>
                <div id="div232538" class="col-md-4"></div>
            </div>
			
            <div class="row tableContent">
                <div id="title7" class="col-md-2">
                    <span id="Label16" data-type="SheetLabel" data-datafield="SkillsRequirement" style="" class="">技术要求：</span>
                </div>
                <div id="control7" class="col-md-10">
                    <textarea id="Control16" data-datafield="SkillsRequirement" data-type="SheetRichTextBox" style="">					</textarea>
                </div>
            </div>
            <div class="row">
                <div id="title9" class="col-md-2">
                    <span id="Label17" data-type="SheetLabel" data-datafield="Attachment" style="" class="">附件：</span>
                </div>
                <div id="control9" class="col-md-10">
                    <div id="Control17" data-datafield="Attachment" data-type="SheetAttachment" style=""></div>
                </div>
            </div>
            <div class="row hidden">
                <div id="div938717" class="col-md-2">
                    <label data-datafield="ProjectId" data-type="SheetLabel" id="ctl279291" class="" style="">项目id</label></div>
                <div id="div774642" class="col-md-4">
                    <input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl40506" class="" style=""></div>
                <div id="div905186" class="col-md-2"></div>
                <div id="div992011" class="col-md-4"></div>
            </div>


               <div class="row">
                <div id="div591276" class="col-md-2">
                    <label data-datafield="ProjectChangeMember" data-type="SheetLabel" id="ctl959995" class="" style="">项目成员信息：</label>
                </div>
                <div id="div902320" class="col-md-10">
                </div>
            </div>
            <div class="row">
                <div id="div736670" class="col-md-12">
                    <table id="ctl764998" data-datafield="ProjectChangeMember" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0" data-displaysummary="false">
                        <tbody>
                            <tr class="header">
                                <td id="ctl764998_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl764998_header0" data-datafield="ProjectChangeMember.FullName" style="">
                                    <label id="ctl764998_Label0" data-datafield="ProjectChangeMember.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl764998_header1" data-datafield="ProjectChangeMember.UserRole" style="">
                                    <label id="ctl764998_Label1" data-datafield="ProjectChangeMember.UserRole" data-type="SheetLabel" style="">角色</label></td>
                                <td id="ctl764998_header2" data-datafield="ProjectChangeMember.Department" style="">
                                    <label id="ctl764998_Label2" data-datafield="ProjectChangeMember.Department" data-type="SheetLabel" style="">所属部门</label></td>
                                <td id="ctl764998_header3" data-datafield="ProjectChangeMember.Profession" style="">
                                    <label id="ctl764998_Label3" data-datafield="ProjectChangeMember.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl764998_header4" data-datafield="ProjectChangeMember.JobTitle" style="">
                                    <label id="ctl764998_Label4" data-datafield="ProjectChangeMember.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl764998_header5" data-datafield="ProjectChangeMember.Qualification" style="">
                                    <label id="ctl764998_Label5" data-datafield="ProjectChangeMember.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                <td id="ctl764998_header6" data-datafield="ProjectChangeMember.AppointmentDate" style="" class="">
                                    <label id="ctl764998_Label6" data-datafield="ProjectChangeMember.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl764998_header7" data-datafield="ProjectChangeMember.ResidentBegin" style="">
                                    <label id="ctl764998_Label7" data-datafield="ProjectChangeMember.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label></td>
                                <td id="ctl764998_header8" data-datafield="ProjectChangeMember.ResidentEnd" style="">
                                    <label id="ctl764998_Label8" data-datafield="ProjectChangeMember.ResidentEnd" data-type="SheetLabel" style="">至</label></td>
                                <td id="ctl764998_header9" data-datafield="ProjectChangeMember.UserId" style="" class="hidden">
                                    <label id="ctl764998_Label9" data-datafield="ProjectChangeMember.UserId" data-type="SheetLabel" style="" class="">用户id</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl764998_control0" data-datafield="ProjectChangeMember.FullName" style="width: 10%;" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="ProjectChangeMember.UserId:ObjectID,ProjectChangeMember.FullName:UserName,ProjectChangeMember.Department:Department,ProjectChangeMember.Profession:Profession,ProjectChangeMember.JobTitle:Appellation,ProjectChangeMember.Qualification:QualificationInfo,ProjectChangeMember.UserId:UserId">
                                    <input type="text" data-datafield="ProjectChangeMember.FullName" data-type="SheetTextBox" id="ctl764998_control0" style="width: 65%;" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="ProjectChangeMember.UserId:ObjectID,ProjectChangeMember.FullName:UserName,ProjectChangeMember.Department:Department,ProjectChangeMember.Profession:Profession,ProjectChangeMember.JobTitle:Appellation,ProjectChangeMember.Qualification:QualificationInfo,ProjectChangeMember.UserId:UserId"></td>
                                <td id="ctl764998_control1" data-datafield="ProjectChangeMember.UserRole" style="width: 18%;" class="">
                                    <select data-datafield="ProjectChangeMember.UserRole" data-type="SheetDropDownList" id="ctl590540" class="" style="" data-masterdatacategory="项目角色" data-displayemptyitem="true" data-emptyitemtext="请选择"></select></td>
                                <td id="ctl764998_control2" data-datafield="ProjectChangeMember.Department" style="">
                                    <input type="text" data-datafield="ProjectChangeMember.Department" data-type="SheetTextBox" id="ctl764998_control2" style="" class=""></td>
                                <td id="ctl764998_control3" data-datafield="ProjectChangeMember.Profession" class="">
                                    <input type="text" data-datafield="ProjectChangeMember.Profession" data-type="SheetTextBox" id="ctl779871" class="" style=""></td>
                                <td id="ctl764998_control4" data-datafield="ProjectChangeMember.JobTitle" style="">
                                    <input type="text" data-datafield="ProjectChangeMember.JobTitle" data-type="SheetTextBox" id="ctl764998_control4" style=""></td>
                                <td id="ctl764998_control5" data-datafield="ProjectChangeMember.Qualification" style="" class="">
                                    <input type="text" data-datafield="ProjectChangeMember.Qualification" data-type="SheetTextBox" id="ctl764998_control5" style=""></td>
                                <td id="ctl764998_control6" data-datafield="ProjectChangeMember.AppointmentDate" style="width: 10%;" class="">
                                    <input type="text" data-datafield="ProjectChangeMember.AppointmentDate" data-type="SheetTime" id="ctl764998_control6" style="" class=""></td>
                                <td id="ctl764998_control7" data-datafield="ProjectChangeMember.ResidentBegin" style="width: 10%;" class="">
                                    <input type="text" data-datafield="ProjectChangeMember.ResidentBegin" data-type="SheetTime" id="ctl764998_control7" style="" class=""></td>
                                <td id="ctl764998_control8" data-datafield="ProjectChangeMember.ResidentEnd" style="width: 10%;" class="">
                                    <input type="text" data-datafield="ProjectChangeMember.ResidentEnd" data-type="SheetTime" id="ctl764998_control8" style="" class=""></td>
                                <td id="ctl764998_control9" data-datafield="ProjectChangeMember.UserId" style="" class="hidden">
                                    <input type="text" data-datafield="ProjectChangeMember.UserId" data-type="SheetTextBox" id="ctl764998_control9" style="" class=""></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>


            <div class="row">
                <div id="div374707" class="col-md-2">
                    <label data-datafield="ProjectChangeExpert" data-type="SheetLabel" id="ctl546732" class="" style="">项目专家信息：</label>
                </div>
                <div id="div577636" class="col-md-10">
                </div>
            </div>
            <div class="row">
                <div id="div469486" class="col-md-12">
                    <table id="ctl348953" data-datafield="ProjectChangeExpert" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl348953_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl348953_header0" data-datafield="ProjectChangeExpert.FullName" style="">
                                    <label id="ctl348953_Label0" data-datafield="ProjectChangeExpert.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl348953_header1" data-datafield="ProjectChangeExpert.UserRole" style="">
                                    <label id="ctl348953_Label1" data-datafield="ProjectChangeExpert.UserRole" data-type="SheetLabel" style="">角色</label></td>
                                <td id="ctl348953_header2" data-datafield="ProjectChangeExpert.Profession" style="">
                                    <label id="ctl348953_Label2" data-datafield="ProjectChangeExpert.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl348953_header3" data-datafield="ProjectChangeExpert.JobTitle" style="">
                                    <label id="ctl348953_Label3" data-datafield="ProjectChangeExpert.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl348953_header4" data-datafield="ProjectChangeExpert.Qualification" style="">
                                    <label id="ctl348953_Label4" data-datafield="ProjectChangeExpert.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                <td id="ctl348953_header5" data-datafield="ProjectChangeExpert.AppointmentDate" style="">
                                    <label id="ctl348953_Label5" data-datafield="ProjectChangeExpert.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl348953_header6" data-datafield="ProjectChangeExpert.ResidentBegin" style="">
                                    <label id="ctl348953_Label6" data-datafield="ProjectChangeExpert.ResidentBegin" data-type="SheetLabel" style="">常驻开始日期</label></td>
                                <td id="ctl348953_header7" data-datafield="ProjectChangeExpert.ResidentEnd" style="">
                                    <label id="ctl348953_Label7" data-datafield="ProjectChangeExpert.ResidentEnd" data-type="SheetLabel" style="">常驻结束日期</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl348953_control0" data-datafield="ProjectChangeExpert.FullName" style="width: 10%;" data-popupwindow="PopupWindow" data-schemacode="ExpertInfo" data-querycode="zjcx" data-outputmappings="ProjectChangeExpert.UserId:ObjectID,ProjectChangeExpert.FullName:EName,ProjectChangeExpert.Profession:Cszy1,ProjectChangeExpert.JobTitle:Job,ProjectChangeExpert.Qualification:TechnicalTitle" class="">
                                    <input type="text" data-datafield="ProjectChangeExpert.FullName" data-type="SheetTextBox" id="ctl348953_control0" style="width: 65%;" class="" data-popupwindow="PopupWindow" data-schemacode="ExpertInfo" data-querycode="zjcx" data-outputmappings="ProjectChangeExpert.UserId:ObjectID,ProjectChangeExpert.FullName:EName,ProjectChangeExpert.Profession:Cszy1,ProjectChangeExpert.JobTitle:Job,ProjectChangeExpert.Qualification:TechnicalTitle"></td>
                                <td id="ctl348953_control1" data-datafield="ProjectChangeExpert.UserRole" style="width: 18%;" class="">
                                    <select data-datafield="ProjectChangeExpert.UserRole" data-type="SheetDropDownList" id="ctl692564" class="" style="" data-masterdatacategory="项目角色" data-displayemptyitem="true" data-emptyitemtext="请选择"></select></td>
                                <td id="ctl348953_control2" data-datafield="ProjectChangeExpert.Profession" style="" class="">
                                    <select data-datafield="ProjectChangeExpert.Profession" data-type="SheetDropDownList" id="ctl819438" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="0:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false" data-displayemptyitem="true"></select></td>
                                <td id="ctl348953_control3" data-datafield="ProjectChangeExpert.JobTitle" style="">
                                    <input type="text" data-datafield="ProjectChangeExpert.JobTitle" data-type="SheetTextBox" id="ctl348953_control3" style="" class=""></td>
                                <td id="ctl348953_control4" data-datafield="ProjectChangeExpert.Qualification" style="">
                                    <input type="text" data-datafield="ProjectChangeExpert.Qualification" data-type="SheetTextBox" id="ctl348953_control4" style=""></td>
                                <td id="ctl348953_control5" data-datafield="ProjectChangeExpert.AppointmentDate" style="">
                                    <input type="text" data-datafield="ProjectChangeExpert.AppointmentDate" data-type="SheetTime" id="ctl348953_control5" style=""></td>
                                <td id="ctl348953_control6" data-datafield="ProjectChangeExpert.ResidentBegin" style="">
                                    <input type="text" data-datafield="ProjectChangeExpert.ResidentBegin" data-type="SheetTime" id="ctl348953_control6" style=""></td>
                                <td id="ctl348953_control7" data-datafield="ProjectChangeExpert.ResidentEnd" style="">
                                    <input type="text" data-datafield="ProjectChangeExpert.ResidentEnd" data-type="SheetTime" id="ctl348953_control7" style=""></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title17" class="col-md-2">
                    <span id="Label21" data-type="SheetLabel" data-datafield="sfkjhbg" style="" class="">项目收付款计划：</span>
                </div>
                <div id="control17" class="col-md-10">
                </div>
            </div>
            <div class="row">
                <div id="div876164" class="col-md-12">
                    <table id="Control21" data-datafield="sfkjhbg" data-type="SheetGridView" class="SheetGridView" data-onadded="var dtl = $.MvcSheetUI.GetElement(&quot;sfkjhbg&quot;).SheetGridView();
console.log(dtl);
if(dtl){
var str = &quot;第&quot;+dtl.RowCount+&quot;期付款时间&quot;
$.MvcSheetUI.SetControlValue(&quot;sfkjhbg.PlanTitle&quot;, str, dtl.RowCount);

}
"
                        data-defaultrowcount="0" data-displaysummary="false">
                        <tbody>
                            <tr class="header">
                                <td id="Control21_SerialNo" class="rowSerialNo">序号</td>
                                <td id="Control21_Header3" data-datafield="sfkjhbg.PlanTitle">
                                    <label id="Control21_Label3" data-datafield="sfkjhbg.PlanTitle" data-type="SheetLabel" style="">收款计划</label>
                                </td>
                                <td id="Control21_Header4" data-datafield="sfkjhbg.PlanDate">
                                    <label id="Control21_Label4" data-datafield="sfkjhbg.PlanDate" data-type="SheetLabel" style="">收款计划时间</label>
                                </td>
                                <td id="Control21_Header5" data-datafield="sfkjhbg.PaymentDescription">
                                    <label id="Control21_Label5" data-datafield="sfkjhbg.PaymentDescription" data-type="SheetLabel" style="">付款节点说明</label></td>
                                <td id="Control21_Header6" data-datafield="sfkjhbg.PaymentPercentage">
                                    <label id="Control21_Label6" data-datafield="sfkjhbg.PaymentPercentage" data-type="SheetLabel" style="">计划付款百分比（不累计）</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td id="Control21_Option" class="rowOption"></td>
                                <td data-datafield="sfkjhbg.PlanTitle" class="" style="width: 18%;">
                                    <input id="Control21_ctl3" type="text" data-datafield="sfkjhbg.PlanTitle" data-type="SheetTextBox" style="" class="" data-onfocus="var dtl = $.MvcSheetUI.GetElement(&quot;sfkjhb&quot;).SheetGridView();
console.log(dtl);
if(dtl){
var str = &quot;第&quot;+dtl.RowCount+&quot;期付款时间&quot;
$.MvcSheetUI.SetControlValue(&quot;sfkjhb.PlanTitle&quot;, str, dtl.RowCount);

}
">
                                </td>
                                <td data-datafield="sfkjhbg.PlanDate" class="" style="width: 13%;">
                                    <input id="Control21_ctl4" type="text" data-datafield="sfkjhbg.PlanDate" data-type="SheetTime" style=""></td>
                                <td data-datafield="sfkjhbg.PaymentDescription">
                                    <textarea id="Control21_ctl5" data-datafield="sfkjhbg.PaymentDescription" data-type="SheetRichTextBox" style="" class="">									</textarea>
                                </td>
                                <td data-datafield="sfkjhbg.PaymentPercentage" class="" style="width: 8%;">
                                    <input type="text" data-datafield="sfkjhbg.PaymentPercentage" data-type="SheetTextBox" id="ctl930546" class="" style=""></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                            <tr class="footer">
                                <td class="rowOption"></td>
                                <td data-datafield="sfkjhbg.PlanTitle"></td>
                                <td data-datafield="sfkjhbg.PlanDate" class=""></td>
                                <td data-datafield="sfkjhbg.PaymentDescription"></td>
                                <td data-datafield="sfkjhbg.PaymentPercentage"></td>
                                <td class="rowOption"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title19" class="col-md-2">
                    <span id="Label22" data-type="SheetLabel" data-datafield="xmjtjh" style="" class="">项目形象进度计划：</span>
                </div>
                <div id="control19" class="col-md-10">
                </div>
            </div>
            <div class="row">
                <div id="div560666" class="col-md-12">
                    <table id="Control22" data-datafield="xmjtjh" data-type="SheetGridView" class="SheetGridView" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="Control22_SerialNo" class="rowSerialNo">序号</td>
                                <td id="Control22_Header3" data-datafield="xmjtjh.ScheduleBegin">
                                    <label id="Control22_Label3" data-datafield="xmjtjh.ScheduleBegin" data-type="SheetLabel" style="">项目进度计划开始</label></td>
                                <td id="Control22_Header4" data-datafield="xmjtjh.ScheduleEnd">
                                    <label id="Control22_Label4" data-datafield="xmjtjh.ScheduleEnd" data-type="SheetLabel" style="">项目进度计划结束</label>
                                </td>
                                <td id="Control22_Header5" data-datafield="xmjtjh.ItemDescription">
                                    <label id="Control22_Label5" data-datafield="xmjtjh.ItemDescription" data-type="SheetLabel" style="">项目节点说明</label></td>
                                <td id="Control22_Header6" data-datafield="xmjtjh.ProjectSchedule">
                                    <label id="Control22_Label6" data-datafield="xmjtjh.ProjectSchedule" data-type="SheetLabel" style="">项目进度</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td id="Control22_Option" class="rowOption"></td>
                                <td data-datafield="xmjtjh.ScheduleBegin" class="" style="width: 13%;">
                                    <input id="Control22_ctl3" type="text" data-datafield="xmjtjh.ScheduleBegin" data-type="SheetTime" style="" class="" data-defaultvalue=""></td>
                                <td data-datafield="xmjtjh.ScheduleEnd" class="" style="width: 13%;">
                                    <input id="Control22_ctl4" type="text" data-datafield="xmjtjh.ScheduleEnd" data-type="SheetTime" style="" class="" data-defaultvalue=""></td>
                                <td data-datafield="xmjtjh.ItemDescription">
                                    <textarea id="Control22_ctl5" data-datafield="xmjtjh.ItemDescription" data-type="SheetRichTextBox" style="" class="">									</textarea>
                                </td>
                                <td data-datafield="xmjtjh.ProjectSchedule" class="" style="width: 8%;">
                                    <input id="Control22_ctl6" type="text" data-datafield="xmjtjh.ProjectSchedule" data-type="SheetTextBox" style=""></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                            <tr class="footer">
                                <td class="rowOption"></td>
                                <td data-datafield="xmjtjh.ScheduleBegin"></td>
                                <td data-datafield="xmjtjh.ScheduleEnd"></td>
                                <td data-datafield="xmjtjh.ItemDescription"></td>
                                <td data-datafield="xmjtjh.ProjectSchedule"></td>
                                <td class="rowOption"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row hidden">
                <div id="div58001" class="col-md-2">
                    <label data-datafield="ywbmzg" data-type="SheetLabel" id="ctl716485" class="" style="">业务部门主管</label></div>
                <div id="div792093" class="col-md-4">
                    <div data-datafield="ywbmzg" data-type="SheetUser" id="ctl935777" class="" style="" data-groupvisible="true" data-orgunitvisible="true"></div>
                </div>
                <div id="div701086" class="col-md-2">
                    <label data-datafield="fgld" data-type="SheetLabel" id="ctl146100" class="" style="">分管领导</label></div>
                <div id="div255537" class="col-md-4">
                    <div data-datafield="fgld" data-type="SheetUser" id="ctl21347" class="" style="" data-groupvisible="true" data-orgunitvisible="true"></div>
                </div>
            </div>

            <div class="nav-icon fa  fa-chevron-right bannerTitle">
                <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
            </div>

            <div class="row">
                <div id="div262619" class="col-md-2">
                    <label data-datafield="ywbmzgyj" data-type="SheetLabel" id="ctl348311" class="" style="">业务部门主管意见：</label>
                </div>
                <div id="div473826" class="col-md-10">
                    <div data-datafield="ywbmzgyj" data-type="SheetComment" id="ctl817874" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div283871" class="col-md-2">
                    <label data-datafield="jszjyj" data-type="SheetLabel" id="ctl230186" class="" style="">技术总监意见：</label>
                </div>
                <div id="div344225" class="col-md-10">
                    <div data-datafield="jszjyj" data-type="SheetComment" id="ctl925107" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div340602" class="col-md-2">
                    <label data-datafield="fgldyj" data-type="SheetLabel" id="ctl371593" class="" style="">分管领导意见：</label>
                </div>
                <div id="div791513" class="col-md-10">
                    <div data-datafield="fgldyj" data-type="SheetComment" id="ctl742585" class="" style=""></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
