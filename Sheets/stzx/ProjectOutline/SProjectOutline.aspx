<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectOutline.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectOutline" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="SProjectOutline.js"></script>
    <script type="text/javascript">

        $.MvcSheet.PreInit = function () {
            $("#Control14").attr("onfocus", "this.blur()");    //项目编号
            $("#Control15").attr("onfocus", "this.blur()");    //项目名称

            $("#ctl711239_control0 input").attr("onfocus", "this.blur()");
            $("#ctl711239_control3 input").attr("onfocus", "this.blur()");
            $("#ctl711239_control4 input").attr("onfocus", "this.blur()");
            $("#ctl126495").attr("disabled", "disabled");

        }

        $.MvcSheet.Validate = function () {
            // this.Action 表示当前操作的按钮名称
            var nameText = $.MvcSheetUI.GetControlValue("mvcName");    // 根据数据项编码获取页面控件的值
            // 填写申请单环节，设置 mvcName 必填
            if ($.MvcSheetUI.SheetInfo.ActivityCode == "submit") {
                if (this.Action == "Submit") {
               
                    alert("tijiao le ");
                    return true;
                }
            }
            return true;
        }


    </script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">项目大纲</label>
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
                <div id="div258647" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="Title" style="" class="">标题：</span></div>
                <div id="div890388" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="Title" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="div509609" class="col-md-2"></div>
            </div>

            <div class="row">
                <div id="div356477" class="col-md-2">
                    <span id="Label14" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号：</span>
                </div>
                <div id="div163301" class="col-md-4">
                    <input id="Control14" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum" data-onchange="checkProject();">
                </div>
                <div id="div385394" class="col-md-2"></div>
                <div id="div111796" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div815891" class="col-md-2"><span id="Label15" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称：</span></div>
                <div id="div193052" class="col-md-8">
                    <input id="Control15" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="div361440" class="col-md-2"></div>
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
            <div class="row">
                <div id="div653417" class="col-md-2">
                    <label data-datafield="ProjectMember" data-type="SheetLabel" id="ctl299212" class="" style="">项目成员：</label>
                </div>
                <div id="div36357" class="col-md-4"></div>
                <div id="div805751" class="col-md-2"></div>
                <div id="div752606" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div94063" class="col-md-12">
                    <table id="ctl928514" data-datafield="ProjectMember" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl928514_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl928514_header0" data-datafield="ProjectMember.FullName" style="">
                                    <label id="ctl928514_Label0" data-datafield="ProjectMember.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl928514_header1" data-datafield="ProjectMember.UserRole" style="">
                                    <label id="ctl928514_Label1" data-datafield="ProjectMember.UserRole" data-type="SheetLabel" style="">角色</label></td>
                                <td id="ctl928514_header2" data-datafield="ProjectMember.Department" style="">
                                    <label id="ctl928514_Label2" data-datafield="ProjectMember.Department" data-type="SheetLabel" style="">所属部门</label></td>
                                <td id="ctl928514_header3" data-datafield="ProjectMember.Profession" style="">
                                    <label id="ctl928514_Label3" data-datafield="ProjectMember.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl928514_header4" data-datafield="ProjectMember.JobTitle" style="">
                                    <label id="ctl928514_Label4" data-datafield="ProjectMember.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl928514_header5" data-datafield="ProjectMember.Qualification" style="">
                                    <label id="ctl928514_Label5" data-datafield="ProjectMember.Qualification" data-type="SheetLabel" style="">任职资格</label></td>
                                <td id="ctl928514_header6" data-datafield="ProjectMember.AppointmentDate" style="">
                                    <label id="ctl928514_Label6" data-datafield="ProjectMember.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl928514_header7" data-datafield="ProjectMember.ResidentBegin" style="">
                                    <label id="ctl928514_Label7" data-datafield="ProjectMember.ResidentBegin" data-type="SheetLabel" style="">常驻开始日期</label></td>
                                <td id="ctl928514_header8" data-datafield="ProjectMember.ResidentEnd" style="">
                                    <label id="ctl928514_Label8" data-datafield="ProjectMember.ResidentEnd" data-type="SheetLabel" style="">常驻结束日期</label></td>
                                <td id="ctl928514_header9" data-datafield="ProjectMember.UserId" style="" class="hidden">
                                    <label id="ctl928514_Label9" data-datafield="ProjectMember.UserId" data-type="SheetLabel" style="">UserId</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl928514_control0" data-datafield="ProjectMember.FullName" style="width: 10%;" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="ProjectMember.FullName:UserName,ProjectMember.Department:Department,ProjectMember.Profession:Profession,ProjectMember.JobTitle:Appellation,ProjectMember.Qualification:QualificationInfo,ProjectMember.UserId:UserId">
                                    <input type="text" data-datafield="ProjectMember.FullName" data-type="SheetTextBox" id="ctl928514_control0" style="width: 65%;" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="ProjectMember.FullName:UserName,ProjectMember.Department:Department,ProjectMember.Profession:Profession,ProjectMember.JobTitle:Appellation,ProjectMember.Qualification:QualificationInfo,ProjectMember.UserId:UserId"></td>
                                <td id="ctl928514_control1" data-datafield="ProjectMember.UserRole" style="width: 18%;" class="">
                                    <select data-datafield="ProjectMember.UserRole" data-type="SheetDropDownList" id="ctl149143" class="" style="width: 100%;" data-displayemptyitem="true" data-emptyitemtext="请选择" data-masterdatacategory="项目角色"></select></td>
                                <td id="ctl928514_control2" data-datafield="ProjectMember.Department" style="" class="">
                                    <input type="text" data-datafield="ProjectMember.Department" data-type="SheetTextBox" id="ctl928514_control2" style="" class=""></td>
                                <td id="ctl928514_control3" data-datafield="ProjectMember.Profession" style="" class="">
                                    <input type="text" data-datafield="ProjectMember.Profession" data-type="SheetTextBox" id="ctl928514_control3" style="" class=""></td>
                                <td id="ctl928514_control4" data-datafield="ProjectMember.JobTitle" style="" class="">
                                    <input type="text" data-datafield="ProjectMember.JobTitle" data-type="SheetTextBox" id="ctl928514_control4" style="" class=""></td>
                                <td id="ctl928514_control5" data-datafield="ProjectMember.Qualification" class="">
                                    <input type="text" data-datafield="ProjectMember.Qualification" data-type="SheetTextBox" id="ctl928514_control5" style="" class=""></td>
                                <td id="ctl928514_control6" data-datafield="ProjectMember.AppointmentDate" style="width: 10%;" class="">
                                    <input type="text" data-datafield="ProjectMember.AppointmentDate" data-type="SheetTime" id="ctl928514_control6" style="" class=""></td>
                                <td id="ctl928514_control7" data-datafield="ProjectMember.ResidentBegin" style="width: 10%;" class="">
                                    <input type="text" data-datafield="ProjectMember.ResidentBegin" data-type="SheetTime" id="ctl928514_control7" style="" class=""></td>
                                <td id="ctl928514_control8" data-datafield="ProjectMember.ResidentEnd" style="width: 10%;" class="">
                                    <input type="text" data-datafield="ProjectMember.ResidentEnd" data-type="SheetTime" id="ctl928514_control8" style="" class=""></td>
                                <td id="ctl928514_control9" data-datafield="ProjectMember.UserId" style="" class="hidden">
                                    <input type="text" data-datafield="ProjectMember.UserId" data-type="SheetTextBox" id="ctl928514_control9" style=""></td>
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
                <div id="div485934" class="col-md-2">
                    <label data-datafield="ProjectExpert" data-type="SheetLabel" id="ctl553491" class="" style="">项目专家人员：</label>
                </div>
                <div id="div223256" class="col-md-4"></div>
                <div id="div674889" class="col-md-2"></div>
                <div id="div318897" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div506091" class="col-md-12">
                    <table id="ctl711239" data-datafield="ProjectExpert" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl711239_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl711239_header0" data-datafield="ProjectExpert.FullName" style="" class="">
                                    <label id="ctl711239_Label0" data-datafield="ProjectExpert.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl711239_header1" data-datafield="ProjectExpert.UserRole" style="">
                                    <label id="ctl711239_Label1" data-datafield="ProjectExpert.UserRole" data-type="SheetLabel" style="">角色</label></td>
                                <td id="ctl711239_header2" data-datafield="ProjectExpert.Profession" style="">
                                    <label id="ctl711239_Label2" data-datafield="ProjectExpert.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl711239_header3" data-datafield="ProjectExpert.JobTitle" style="">
                                    <label id="ctl711239_Label3" data-datafield="ProjectExpert.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl711239_header4" data-datafield="ProjectExpert.Qualification" style="">
                                    <label id="ctl711239_Label4" data-datafield="ProjectExpert.Qualification" data-type="SheetLabel" style="">任职资格</label></td>
                                <td id="ctl711239_header5" data-datafield="ProjectExpert.AppointmentDate" style="">
                                    <label id="ctl711239_Label5" data-datafield="ProjectExpert.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl711239_header6" data-datafield="ProjectExpert.ResidentBegin" style="">
                                    <label id="ctl711239_Label6" data-datafield="ProjectExpert.ResidentBegin" data-type="SheetLabel" style="">常驻开始日期</label></td>
                                <td id="ctl711239_header7" data-datafield="ProjectExpert.ResidentEnd" style="">
                                    <label id="ctl711239_Label7" data-datafield="ProjectExpert.ResidentEnd" data-type="SheetLabel" style="">常驻结束日期</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl711239_control0" data-datafield="ProjectExpert.FullName" style="width: 10%;" class="" data-popupwindow="PopupWindow" data-schemacode="ExpertInfo" data-querycode="zjcx" data-outputmappings="ProjectExpert.FullName:EName,ProjectExpert.Profession:Cszy1,ProjectExpert.JobTitle:Job,ProjectMember.Qualification:TechnicalTitle">
                                    <input type="text" data-datafield="ProjectExpert.FullName" data-type="SheetTextBox" id="ctl711239_control0" style="width: 65%;" class="" data-popupwindow="PopupWindow" data-schemacode="ExpertInfo" data-querycode="zjcx" data-outputmappings="ProjectExpert.FullName:EName,ProjectExpert.Profession:Cszy1,ProjectExpert.JobTitle:Job,ProjectMember.Qualification:TechnicalTitle"></td>
                                <td id="ctl711239_control1" data-datafield="ProjectExpert.UserRole" style="width: 18%;" class="">
                                    <select data-datafield="ProjectExpert.UserRole" data-type="SheetDropDownList" id="ctl911653" class="" style="width: 100%;" data-displayemptyitem="true" data-emptyitemtext="请选择" data-masterdatacategory="项目角色"></select></td>
                                <td id="ctl711239_control2" data-datafield="ProjectExpert.Profession" style="" class="">
                                    <select data-datafield="ProjectExpert.Profession" data-type="SheetDropDownList" id="ctl126495" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="0:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false" data-displayemptyitem="true"></select></td>
                                <td id="ctl711239_control3" data-datafield="ProjectExpert.JobTitle" style="" class="">
                                    <input type="text" data-datafield="ProjectExpert.JobTitle" data-type="SheetTextBox" id="ctl711239_control3" style="" class=""></td>
                                <td id="ctl711239_control4" data-datafield="ProjectExpert.Qualification" style="" class="">
                                    <input type="text" data-datafield="ProjectExpert.Qualification" data-type="SheetTextBox" id="ctl711239_control4" style="" class=""></td>
                                <td id="ctl711239_control5" data-datafield="ProjectExpert.AppointmentDate" style="">
                                    <input type="text" data-datafield="ProjectExpert.AppointmentDate" data-type="SheetTime" id="ctl711239_control5" style=""></td>
                                <td id="ctl711239_control6" data-datafield="ProjectExpert.ResidentBegin" style="">
                                    <input type="text" data-datafield="ProjectExpert.ResidentBegin" data-type="SheetTime" id="ctl711239_control6" style=""></td>
                                <td id="ctl711239_control7" data-datafield="ProjectExpert.ResidentEnd" style="" class="">
                                    <input type="text" data-datafield="ProjectExpert.ResidentEnd" data-type="SheetTime" id="ctl711239_control7" style="" class=""></td>
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
                <div id="div452848" class="col-md-12">
                    <span style="" class="" id="note">注：所属部门填写：人员所属部门、借调单位或项目聘用</span>
                </div>
            </div>
            <div class="row">
                <div id="div348022" class="col-md-2">
                    <label data-datafield="sfkjhb" data-type="SheetLabel" id="ctl107040" class="" style="">项目收付款款计划表：</label>
                </div>
                <div id="div636063" class="col-md-10">
                </div>
            </div>
            <div class="row">
                <div id="div206065" class="col-md-12">
                    <table id="ctl329191" data-datafield="sfkjhb" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0" data-onadded="var dtl = $.MvcSheetUI.GetElement(&quot;sfkjhb&quot;).SheetGridView();
console.log(dtl);
if(dtl){
var str = &quot;第&quot;+dtl.RowCount+&quot;期付款时间&quot;
$.MvcSheetUI.SetControlValue(&quot;sfkjhb.PlanTitle&quot;, str, dtl.RowCount);

}
"
                        data-displaysummary="false">
                        <tbody>
                            <tr class="header">
                                <td id="ctl329191_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl329191_header0" data-datafield="sfkjhb.PlanTitle" style="" class="">
                                    <label id="ctl329191_Label0" data-datafield="sfkjhb.PlanTitle" data-type="SheetLabel" style="">收款计划</label></td>
                                <td id="ctl329191_header1" data-datafield="sfkjhb.PlanDate" style="">
                                    <label id="ctl329191_Label1" data-datafield="sfkjhb.PlanDate" data-type="SheetLabel" style="">收款计划时间</label></td>
                                <td id="ctl329191_header2" data-datafield="sfkjhb.PaymentDescription" style="">
                                    <label id="ctl329191_Label2" data-datafield="sfkjhb.PaymentDescription" data-type="SheetLabel" style="">付款节点说明</label></td>
                                <td id="ctl329191_header3" data-datafield="sfkjhb.PaymentPercentage" style="">
                                    <label id="ctl329191_Label3" data-datafield="sfkjhb.PaymentPercentage" data-type="SheetLabel" style="">计划付款百分比（不累计）</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td class=""></td>
                                <td id="ctl329191_control0" data-datafield="sfkjhb.PlanTitle" style="width: 15%;" class="">
                                    <input type="text" data-datafield="sfkjhb.PlanTitle" data-type="SheetTextBox" id="ctl329191_control0" class="" style=""></td>
                                <td id="ctl329191_control1" data-datafield="sfkjhb.PlanDate" style="width: 13%;" class="">
                                    <input type="text" data-datafield="sfkjhb.PlanDate" data-type="SheetTime" id="ctl329191_control1" style="" class=""></td>
                                <td id="ctl329191_control2" data-datafield="sfkjhb.PaymentDescription" style="" class="">
                                    <textarea data-datafield="sfkjhb.PaymentDescription" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl329191_control2" class=""></textarea></td>
                                <td id="ctl329191_control3" data-datafield="sfkjhb.PaymentPercentage" style="width: 8%;" class="">
                                    <input type="text" data-datafield="sfkjhb.PaymentPercentage" data-type="SheetTextBox" id="ctl329191_control3" style="" class=""></td>
                                <td class="rowOption"><a class="delete">
                                    <div class="fa fa-minus"></div>
                                </a><a class="insert">
                                    <div class="fa fa-arrow-down"></div>
                                </a></td>
                            </tr>
                            <tr class="footer">
                                <td class=""></td>
                                <td id="ctl329191_Stat0" data-datafield="sfkjhb.PlanTitle" style="" class=""></td>
                                <td id="ctl329191_Stat1" data-datafield="sfkjhb.PlanDate" style="" class=""></td>
                                <td id="ctl329191_Stat2" data-datafield="sfkjhb.PaymentDescription" style="" class=""></td>
                                <td id="ctl329191_Stat3" data-datafield="sfkjhb.PaymentPercentage" style="" class="">
                                    <label id="ctl329191_StatControl3" data-datafield="sfkjhb.PaymentPercentage" data-type="SheetCountLabel" style=""></label>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div id="div326588" class="col-md-2">
                    <label data-datafield="ProjectProgressTable" data-type="SheetLabel" id="ctl509965" class="" style="">项目形象进度计划：</label>
                </div>
                <div id="div175219" class="col-md-10">
                </div>
            </div>
            <div class="row">
                <div id="div679370" class="col-md-12">
                    <table id="ctl526817" data-datafield="ProjectProgressTable" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl526817_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl526817_header0" data-datafield="ProjectProgressTable.ScheduleBegin" style="">
                                    <label id="ctl526817_Label0" data-datafield="ProjectProgressTable.ScheduleBegin" data-type="SheetLabel" style="">项目进度计划开始</label></td>
                                <td id="ctl526817_header1" data-datafield="ProjectProgressTable.ScheduleEnd" style="">
                                    <label id="ctl526817_Label1" data-datafield="ProjectProgressTable.ScheduleEnd" data-type="SheetLabel" style="">项目进度计划结束</label></td>
                                <td id="ctl526817_header2" data-datafield="ProjectProgressTable.ItemDescription" style="" class="">
                                    <label id="ctl526817_Label2" data-datafield="ProjectProgressTable.ItemDescription" data-type="SheetLabel" style="">项目节点说明</label></td>
                                <td id="ctl526817_header3" data-datafield="ProjectProgressTable.ProjectSchedule" style="">
                                    <label id="ctl526817_Label3" data-datafield="ProjectProgressTable.ProjectSchedule" data-type="SheetLabel" style="">项目进度</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl526817_control0" data-datafield="ProjectProgressTable.ScheduleBegin" style="width: 13%;" class="">
                                    <input type="text" data-datafield="ProjectProgressTable.ScheduleBegin" data-type="SheetTime" id="ctl526817_control0" style="" class=""></td>
                                <td id="ctl526817_control1" data-datafield="ProjectProgressTable.ScheduleEnd" style="width: 13%;" class="">
                                    <input type="text" data-datafield="ProjectProgressTable.ScheduleEnd" data-type="SheetTime" id="ctl526817_control1" style="" class=""></td>
                                <td id="ctl526817_control2" data-datafield="ProjectProgressTable.ItemDescription" style="">
                                    <textarea data-datafield="ProjectProgressTable.ItemDescription" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl526817_control2"></textarea></td>
                                <td id="ctl526817_control3" data-datafield="ProjectProgressTable.ProjectSchedule" style="width: 8%;" class="">
                                    <input type="text" data-datafield="ProjectProgressTable.ProjectSchedule" data-type="SheetTextBox" id="ctl526817_control3" style="" class=""></td>
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
            <div class="row hidden">
                <div id="div44294" class="col-md-2">
                    <label data-datafield="ProjectId" data-type="SheetLabel" id="ctl874179" class="" style="">项目id</label>
                </div>
                <div id="div460683" class="col-md-4">
                    <input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl242234" class="" style="">
                </div>
                <div id="div237714" class="col-md-2">
                    <label data-datafield="Status" data-type="SheetLabel" id="ctl467390" class="" style="">状态</label>
                </div>
                <div id="div602271" class="col-md-4">
                    <input type="text" data-datafield="Status" data-type="SheetTextBox" id="ctl672581" class="" style="">
                </div>
            </div>
            <div class="row hidden">
                <div id="div269024" class="col-md-2">
                    <label data-datafield="ywbmzg" data-type="SheetLabel" id="ctl223521" class="" style="">业务部门主管</label>
                </div>
                <div id="div957402" class="col-md-4">
                    <div data-datafield="ywbmzg" data-type="SheetUser" id="ctl913542" class="" style=""></div>
                </div>
                <div id="div667939" class="col-md-2">
                    <label data-datafield="fgld" data-type="SheetLabel" id="ctl13522" class="" style="">分管领导</label>
                </div>
                <div id="div21949" class="col-md-4">
                    <div data-datafield="fgld" data-type="SheetUser" id="ctl205039" class="" style=""></div>
                </div>
            </div>

            <div class="nav-icon fa  fa-chevron-right bannerTitle" style="">
                <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
            </div>

            <div class="row">
                <div id="div385534" class="col-md-2">
                    <label data-datafield="ywbmzgyj" data-type="SheetLabel" id="ctl626784" class="" style="">业务部门主管意见：</label>
                </div>
                <div id="div849872" class="col-md-10">
                    <div data-datafield="ywbmzgyj" data-type="SheetComment" id="ctl653391" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div85388" class="col-md-2">
                    <label data-datafield="jszjyj" data-type="SheetLabel" id="ctl549230" class="" style="">技术总监意见：</label>
                </div>
                <div id="div317193" class="col-md-10">
                    <div data-datafield="jszjyj" data-type="SheetComment" id="ctl416253" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div445369" class="col-md-2">
                    <label data-datafield="fgldyj" data-type="SheetLabel" id="ctl804469" class="" style="">分管领导意见：</label>
                </div>
                <div id="div123054" class="col-md-10">
                    <div data-datafield="fgldyj" data-type="SheetComment" id="ctl128746" class="" style=""></div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
