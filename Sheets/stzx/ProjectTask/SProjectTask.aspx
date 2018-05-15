<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectTask.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectTask" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="SProjectTask.js"></script>
    <script type="text/javascript">

        $.MvcSheet.PreInit = function () {


            $("#ctl405313").attr("onfocus", "this.blur()");  //专家姓名
            $("#ctl379041_control3 input").attr("onfocus", "this.blur()");  //专家职称
            $("#ctl379041_control4 input").attr("onfocus", "this.blur()");  //专家职业资格
            $("#ctl84292").attr("disabled", "disabled");

            if ($.MvcSheetUI.SheetInfo.ActivityCode == "Applyer") {

                $("#div508980").css('display', 'block');

            }

            var taskType = $.MvcSheetUI.GetControlValue("TaskType");
            if (taskType == "SJ" || taskType == "SZ") {
                $("#sd").css('display', 'block');
            } else {
                $("#sd").css('display', 'none');
            }

        };



        // 表单验证接口
        $.MvcSheet.Validate = function () {
            var taskNum = $.MvcSheetUI.GetControlValue("TaskNum");
            if ($.MvcSheetUI.SheetInfo.ActivityCode == "Applyer") {
                if (this.Action == "Submit") {
                    if (!taskNum) {
                        $.MvcSheetUI.GetElement("TaskNum").focus();
                        alert("请设置任务编号");
                        return false;
                    } else {
                        //更新编号
                        updateSequenceNum();

                    }
                }
            }
        }



        $.MvcSheet.Loaded = function (sheetInfo) {
            if (sheetInfo.ActivityCode == "submit") {
                var xmfzrname = sheetInfo.BizObject.DataItems.xmfzr.V.Name;
                var fzbmname = sheetInfo.BizObject.DataItems.RDepartment.V.Name;
                var cjbuname = '';
                var fgldname = '';
                var cjbmarr = sheetInfo.BizObject.DataItems.JDepartment.V;
                for (i = 0; i < cjbmarr.length; i++) {
                    cjbuname += cjbmarr[i].Name + ';'
                }
                var fgldarr = sheetInfo.BizObject.DataItems.fgld.V;
                for (i = 0; i < fgldarr.length; i++) {
                    fgldname += fgldarr[i].Name + ';'
                }
                $.MvcSheetUI.SetControlValue("xmfzrname", xmfzrname);
                $.MvcSheetUI.SetControlValue("fzbmname", fzbmname);
                $.MvcSheetUI.SetControlValue("cjbuname", subStr(cjbuname));
                $.MvcSheetUI.SetControlValue("fgldname", subStr(fgldname));
            }
        }

        function subStr(str) {
            return (str.substring(str.length - 1) == ';') ? str.substring(0,
                str.length - 1) : str;

        }
    </script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">项目任务书</label>
    </div>
    <div class="panel-body sheetContainer">
        <!--<div class="nav-icon fa fa-chevron-right bannerTitle">-->
            <!--<label id="divBasicInfo" data-en_us="Basic information">基本信息</label>-->
        <!--</div>-->
        <!--<div class="divContent">-->
            <!--<div class="row">-->
                <!--<div id="divFullNameTitle" class="col-md-2">-->
                    <!--<label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" class="" style="">发起人</label>-->
                <!--</div>-->
                <!--<div id="divFullName" class="col-md-4">-->
                    <!--<label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>-->
                <!--</div>-->
                <!--<div id="divOriginateDateTitle" class="col-md-2">-->
                    <!--<label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="">发起时间</label>-->
                <!--</div>-->
                <!--<div id="divOriginateDate" class="col-md-4">-->
                    <!--<label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style=""></label>-->
                <!--</div>-->
            <!--</div>-->
            <!--<div class="row">-->
                <!--<div id="divOriginateOUNameTitle" class="col-md-2">-->
                    <!--<label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" style="">所属组织</label>-->
                <!--</div>-->
                <!--<div id="divOriginateOUName" class="col-md-4">-->
                    <!--&lt;!&ndash;					<label id="lblOriginateOUName" data-type="SheetLabel" data-datafield="Originator.OUName" data-bindtype="OnlyData">-->
<!--<span class="OnlyDesigner">Originator.OUName</span>-->
					<!--</label>&ndash;&gt;-->
                    <!--<select data-datafield="Originator.OUName" data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class="" style="">-->
                    <!--</select>-->
                <!--</div>-->
                <!--<div id="divSequenceNoTitle" class="col-md-2">-->
                    <!--<label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="">流水号</label>-->
                <!--</div>-->
                <!--<div id="divSequenceNo" class="col-md-4">-->
                    <!--<label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style=""></label>-->
                <!--</div>-->
            <!--</div>-->
        <!--</div>-->
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
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.UserName}" style="">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="" class="">所属部门：</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.OUName}" style="">
                </div>
            </div>
            <div class="row">
                <div id="div37248" class="col-md-2">
                    <label data-datafield="Title" data-type="SheetLabel" id="ctl836722" class="" style="">标题：</label>
                </div>
                <div id="div971746" class="col-md-8">
                    <input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl54918" class="" style="">
                </div>
                <div id="div132322" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="div506806" class="col-md-2">
                    <label data-datafield="ContractNum" data-type="SheetLabel" id="ctl958071" class="" style="">合同编号：</label>
                </div>
                <div id="div57385" class="col-md-4">
                    <input type="text" data-datafield="ContractNum" data-type="SheetTextBox" id="ctl623270" class="" style="">
                </div>
                <div id="div443659" class="col-md-2"></div>
                <div id="div758364" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div466714" class="col-md-2">
                    <span id="Label14" data-type="SheetLabel" data-datafield="ProjectType" class="" style="">项目类型：</span>
                </div>
                <div id="div482113" class="col-md-4">
                    <select data-datafield="ProjectType" data-type="SheetDropDownList" id="ctl67388" class="" data-defaultitems="高新类;普通类;平台类" data-displayemptyitem="true" data-emptyitemtext="请选择" style=""></select>
                </div>
                <div id="div860065" class="col-md-2">
                    <span id="Label15" data-type="SheetLabel" data-datafield="ProjectNum" class="" style="">项目编号：</span>
                </div>
                <div id="div982360" class="col-md-4">
                    <input id="Control15" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" class="" style="">
                </div>
            </div>
            <div class="row">
                <div id="div744828" class="col-md-2">
                    <label data-datafield="TaskType" data-type="SheetLabel" id="ctl214355" class="" style="">任务类型：</label>
                </div>
                <div id="div773021" class="col-md-4">
                    <select data-datafield="TaskType" data-type="SheetDropDownList" id="ctl621282" class="" data-displayemptyitem="true" data-emptyitemtext="请选择" data-masterdatacategory="任务类型" style="" data-onchange="var taskType = $.MvcSheetUI.GetControlValue(&quot;TaskType&quot;);
if(taskType==&quot;SJ&quot; || taskType==&quot;SZ&quot;){
		$(&quot;#sd&quot;).css('display','block');  //会签人员
     }else{
               $(&quot;#sd&quot;).css('display','none');  
       }">
                    </select>
                </div>
                <div id="div29490" class="col-md-2">
                    <span id="Label16" data-type="SheetLabel" data-datafield="TaskNum" class="" style="">任务编号：</span>
                </div>
                <div id="div666422" class="col-md-3">
                    <input id="Control16" type="text" data-datafield="TaskNum" data-type="SheetTextBox" class="" style="">
                </div>
                <div id="div508980" class="col-md-1" style="display:none">
                    <input type="button" value="获取编号" onclick="getTastNum()" style='line-height: 25px; padding: 0px 10px;' />

                </div>
            </div>
            <div class="row">
                <div id="div669672" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" class="" style="">项目名称：</span></div>
                <div id="div104046" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" class="" style=""></div>
                <div id="div106304" class="col-md-2"></div>
            </div>

            <div class="row">
                <div id="div268759" class="col-md-2">
                    <label data-datafield="RDepartment" data-type="SheetLabel" id="ctl470244" class="" style="">负责部门：</label>
                </div>
                <div id="div962141" class="col-md-4">
                    <div data-datafield="RDepartment" data-type="SheetUser" id="ctl477078" class="" data-orgunitvisible="true" data-groupvisible="true" style=""></div>
                </div>
                <div id="div780559" class="col-md-2">
                    <label data-datafield="JDepartment" data-type="SheetLabel" id="ctl821142" class="" style="">参加部门：</label>
                </div>
                <div id="div270415" class="col-md-4">
                    <div data-datafield="JDepartment" data-type="SheetUser" id="ctl106337" class="" data-orgunitvisible="true" data-groupvisible="true" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div205729" class="col-md-2">
                    <label data-datafield="xmfzr" data-type="SheetLabel" id="ctl776394" class="" style="">项目负责人：</label>
                </div>
                <div id="div556537" class="col-md-4">
                    <div data-datafield="xmfzr" data-type="SheetUser" id="ctl785260" class="" data-orgunitvisible="true" data-groupvisible="true" data-onchange="         var a=  $.MvcSheetUI.GetControlValue(&quot;xmfzr&quot;);
console.log(a);"
                        style="">
                    </div>
                </div>
                <div id="div852271" class="col-md-2">
                    <label data-datafield="fgld" data-type="SheetLabel" id="ctl382064" class="" style="">分管领导：</label>
                </div>
                <div id="div64650" class="col-md-4">
                    <div data-datafield="fgld" data-type="SheetUser" id="ctl989162" class="" data-groupvisible="true" data-orgunitvisible="true" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div398632" class="col-md-2">
                    <span id="Label17" data-type="SheetLabel" data-datafield="EntrustedUnit" class="" style="">委托单位：</span>
                </div>
                <div id="div162677" class="col-md-8">
                    <input type="text" data-datafield="EntrustedUnit" data-type="SheetTextBox" id="ctl503392" class="" style="">
                </div>
                <div id="div880094" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="div739298" class="col-md-2">
                    <label data-datafield="ContractStartDate" data-type="SheetLabel" id="ctl587788" class="" style="">合同签订时间：</label>
                </div>
                <div id="div928332" class="col-md-4">
                    <input type="text" data-datafield="ContractStartDate" data-type="SheetTime" id="ctl989279" class="" style="">
                </div>
                <div id="div742923" class="col-md-2"></div>
                <div id="div746577" class="col-md-4"></div>
            </div>
            <div class="row" id="sd" style="display: none">
                <div id="div407744" class="col-md-2">

                    <label data-datafield="TechnicalValidation" data-type="SheetLabel" id="ctl956552" class="" style="">需要技术审定过程</label>
                </div>
                <div id="div370406" class="col-md-4">
                    <div data-datafield="TechnicalValidation" data-type="SheetRadioButtonList" id="ctl703623" class="" data-defaultitems="需要;不需要" data-defaultselected="false" style=""></div>
                </div>
                <div id="div657792" class="col-md-2"></div>
                <div id="div502571" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div496113" class="col-md-2">
                    <label data-datafield="TaskDate" data-type="SheetLabel" id="ctl844985" class="" style="">任务下达日期：</label>
                </div>
                <div id="div976068" class="col-md-4">
                    <input type="text" data-datafield="TaskDate" data-type="SheetTime" id="ctl186021" class="" data-defaultvalue="" style="">
                </div>
                <div id="div637214" class="col-md-2"></div>
                <div id="div496635" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div307670" class="col-md-2">
                    <label data-datafield="TaskBasis" data-type="SheetLabel" id="ctl748569" class="" style="">任务下达依据：</label>
                </div>
                <div id="div317358" class="col-md-4">
                    <select data-datafield="TaskBasis" data-type="SheetDropDownList" id="ctl114938" class="" data-defaultitems="合同;中标通知书;项目立项建议表" data-displayemptyitem="true" data-emptyitemtext="请选择" style=""></select>
                </div>
                <div id="div254896" class="col-md-2"></div>
                <div id="div225004" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div684200" class="col-md-2">
                    <label data-datafield="Content" data-type="SheetLabel" id="ctl232515" class="" style="">服务内容：</label>
                </div>
                <div id="div708411" class="col-md-10">
                    <textarea data-datafield="Content" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl269158" class=""></textarea>
                </div>
            </div>
            <div class="row">
                <div id="div462480" class="col-md-2">
                    <label data-datafield="ServiceCycle" data-type="SheetLabel" id="ctl734960" class="" style="">服务周期：</label>
                </div>
                <div id="div56455" class="col-md-10">
                    <textarea data-datafield="ServiceCycle" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl221037" class=""></textarea>
                </div>
            </div>
            <div class="row">
                <div id="div88154" class="col-md-2">
                    <label data-datafield="ServiceResults" data-type="SheetLabel" id="ctl951470" class="" style="">服务成果：</label>
                </div>
                <div id="div469521" class="col-md-10">
                    <textarea data-datafield="ServiceResults" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl211306" class=""></textarea>
                </div>
            </div>
            <div class="row">
                <div id="div295861" class="col-md-2">
                    <label data-datafield="ContractAmount" data-type="SheetLabel" id="ctl396052" class="" style="">合同金额：</label>
                </div>
                <div id="div595574" class="col-md-4">
                    <input type="text" data-datafield="ContractAmount" data-type="SheetTextBox" id="ctl294571" class="" style="">
                </div>
                <div id="div309695" class="col-md-2"></div>
                <div id="div889248" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div268475" class="col-md-2">
                    <label data-datafield="Outside" data-type="SheetLabel" id="ctl425943" class="" style="">是否有委外情况：</label>
                </div>
                <div id="div747179" class="col-md-4">
                    <div data-datafield="Outside" data-type="SheetRadioButtonList" id="ctl393667" class="" data-defaultitems="是;否" data-defaultselected="false" data-repeatcolumns="1" style=""></div>
                </div>
                <div id="div591943" class="col-md-2"></div>
                <div id="div266673" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div756754" class="col-md-2">
                    <label data-datafield="TaskMember" data-type="SheetLabel" id="ctl504572" class="" style="">项目成员：</label>
                </div>
                <div id="div214893" class="col-md-10"></div>
            </div>
            <div class="row">
                <div id="div381901" class="col-md-12">
                    <table id="ctl312195" data-datafield="TaskMember" data-type="SheetGridView" class="SheetGridView" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl312195_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl312195_header0" data-datafield="TaskMember.FullName" style="">
                                    <label id="ctl312195_Label0" data-datafield="TaskMember.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl312195_header1" data-datafield="TaskMember.UserRole" style="" class="">
                                    <label id="ctl312195_Label1" data-datafield="TaskMember.UserRole" data-type="SheetLabel" style="" class="">角色</label></td>
                                <td id="ctl312195_header2" data-datafield="TaskMember.Department" style="">
                                    <label id="ctl312195_Label2" data-datafield="TaskMember.Department" data-type="SheetLabel" style="">部门</label></td>
                                <td id="ctl312195_header3" data-datafield="TaskMember.Profession" style="">
                                    <label id="ctl312195_Label3" data-datafield="TaskMember.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl312195_header4" data-datafield="TaskMember.JobTitle" style="">
                                    <label id="ctl312195_Label4" data-datafield="TaskMember.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl312195_header5" data-datafield="TaskMember.Qualification" style="">
                                    <label id="ctl312195_Label5" data-datafield="TaskMember.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                <td id="ctl312195_header6" data-datafield="TaskMember.AppointmentDate" style="">
                                    <label id="ctl312195_Label6" data-datafield="TaskMember.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl312195_header7" data-datafield="TaskMember.ResidentBegin" style="">
                                    <label id="ctl312195_Label7" data-datafield="TaskMember.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label></td>
                                <td id="ctl312195_header8" data-datafield="TaskMember.ResidentEnd" style="">
                                    <label id="ctl312195_Label8" data-datafield="TaskMember.ResidentEnd" data-type="SheetLabel" style="">至</label></td>
                                <td id="ctl312195_header9" data-datafield="TaskMember.UserId" style="" class="hidden">
                                    <label id="ctl312195_Label9" data-datafield="TaskMember.UserId" data-type="SheetLabel" style="">UserId</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl312195_control0" data-datafield="TaskMember.FullName" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="TaskMember.FullName:UserName,TaskMember.Department:Department,TaskMember.Profession:Profession,TaskMember.JobTitle:Appellation,TaskExpert.Qualification:QualificationInfo,TaskMember.UserId:UserId" style="width: 10%;">
                                    <input type="text" data-datafield="TaskMember.FullName" data-type="SheetTextBox" id="ctl312195_control0" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="TaskMember.FullName:UserName,TaskMember.Department:Department,TaskMember.Profession:Profession,TaskMember.JobTitle:Appellation,TaskExpert.Qualification:QualificationInfo,TaskMember.UserId:UserId" style="width: 60%;"></td>
                                <td id="ctl312195_control1" data-datafield="TaskMember.UserRole" class="" data-popupwindow="PopupWindow" style="width: 18%;">
                                    <select data-datafield="TaskMember.UserRole" data-type="SheetDropDownList" id="ctl819390" class="" style="width: 100%;" data-masterdatacategory="项目角色" data-displayemptyitem="true" data-emptyitemtext="请选择"></select></td>
                                <td id="ctl312195_control2" data-datafield="TaskMember.Department" style="" class="">
                                    <input type="text" data-datafield="TaskMember.Department" data-type="SheetTextBox" id="ctl312195_control2" style="" class=""></td>
                                <td id="ctl312195_control3" data-datafield="TaskMember.Profession" style="" class="">
                                    <input type="text" data-datafield="TaskMember.Profession" data-type="SheetTextBox" id="ctl312195_control3" style="" class=""></td>
                                <td id="ctl312195_control4" data-datafield="TaskMember.JobTitle" style="" class="">
                                    <input type="text" data-datafield="TaskMember.JobTitle" data-type="SheetTextBox" id="ctl312195_control4" style="" class=""></td>
                                <td id="ctl312195_control5" data-datafield="TaskMember.Qualification" style="" class="">
                                    <input type="text" data-datafield="TaskMember.Qualification" data-type="SheetTextBox" id="ctl312195_control5" style="" class=""></td>
                                <td id="ctl312195_control6" data-datafield="TaskMember.AppointmentDate" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskMember.AppointmentDate" data-type="SheetTime" id="ctl312195_control6" style="" class=""></td>
                                <td id="ctl312195_control7" data-datafield="TaskMember.ResidentBegin" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskMember.ResidentBegin" data-type="SheetTime" id="ctl312195_control7" style="" class=""></td>
                                <td id="ctl312195_control8" data-datafield="TaskMember.ResidentEnd" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskMember.ResidentEnd" data-type="SheetTime" id="ctl312195_control8" style="" class=""></td>
                                <td id="ctl312195_control9" data-datafield="TaskMember.UserId" style="" class="hidden">
                                    <input type="text" data-datafield="TaskMember.UserId" data-type="SheetTextBox" id="ctl312195_control9" style="" class=""></td>
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
                <div id="div723026" class="col-md-2">
                    <label data-datafield="TaskExpert" data-type="SheetLabel" id="ctl51019" class="" style="">专家成员：</label></div>
                <div id="div104195" class="col-md-4"></div>
                <div id="div445210" class="col-md-2"></div>
                <div id="div248615" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div320011" class="col-md-12">
                    <table id="ctl379041" data-datafield="TaskExpert" data-type="SheetGridView" class="SheetGridView" style="height: 900%;" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl379041_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl379041_header0" data-datafield="TaskExpert.FullName" style="">
                                    <label id="ctl379041_Label0" data-datafield="TaskExpert.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl379041_header1" data-datafield="TaskExpert.UserRole" style="">
                                    <label id="ctl379041_Label1" data-datafield="TaskExpert.UserRole" data-type="SheetLabel" style="">角色</label></td>
                                <td id="ctl379041_header2" data-datafield="TaskExpert.Profession" style="">
                                    <label id="ctl379041_Label2" data-datafield="TaskExpert.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl379041_header3" data-datafield="TaskExpert.JobTitle" style="">
                                    <label id="ctl379041_Label3" data-datafield="TaskExpert.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl379041_header4" data-datafield="TaskExpert.Qualification" style="">
                                    <label id="ctl379041_Label4" data-datafield="TaskExpert.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                <td id="ctl379041_header5" data-datafield="TaskExpert.AppointmentDate" style="">
                                    <label id="ctl379041_Label5" data-datafield="TaskExpert.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl379041_header6" data-datafield="TaskExpert.ResidentBegin" style="">
                                    <label id="ctl379041_Label6" data-datafield="TaskExpert.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label></td>
                                <td id="ctl379041_header7" data-datafield="TaskExpert.ResidentEnd" style="">
                                    <label id="ctl379041_Label7" data-datafield="TaskExpert.ResidentEnd" data-type="SheetLabel" style="">至</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td class=""></td>
                                <td id="ctl379041_control0" data-datafield="TaskExpert.FullName" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskExpert.FullName" data-type="SheetTextBox" id="ctl405313" class="" style="width: 60%;" data-tooltip="请从专家信息里选择" data-popupwindow="PopupWindow" data-schemacode="ExpertInfo" data-querycode="zjcx" data-outputmappings="TaskExpert.FullName:EName,TaskExpert.Profession:Cszy1,TaskExpert.JobTitle:Job,TaskExpert.Qualification:TechnicalTitle"></td>
                                <td id="ctl379041_control1" data-datafield="TaskExpert.UserRole" style="width: 18%;" class="">
                                    <select data-datafield="TaskExpert.UserRole" data-type="SheetDropDownList" id="ctl46918" class="" style="width: 100%;" data-displayemptyitem="true" data-emptyitemtext="请选择" data-masterdatacategory="项目角色"></select></td>
                                <td id="ctl379041_control2" data-datafield="TaskExpert.Profession" style="" class="">
                                    <select data-datafield="TaskExpert.Profession" data-type="SheetDropDownList" id="ctl84292" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false" data-displayemptyitem="true"></select></td>
                                <td id="ctl379041_control3" data-datafield="TaskExpert.JobTitle" style="" class="">
                                    <input type="text" data-datafield="TaskExpert.JobTitle" data-type="SheetTextBox" id="ctl379041_control3" style="" class=""></td>
                                <td id="ctl379041_control4" data-datafield="TaskExpert.Qualification" style="" class="">
                                    <input type="text" data-datafield="TaskExpert.Qualification" data-type="SheetTextBox" id="ctl379041_control4" style="" class=""></td>
                                <td id="ctl379041_control5" data-datafield="TaskExpert.AppointmentDate" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskExpert.AppointmentDate" data-type="SheetTime" id="ctl379041_control5" style="" class=""></td>
                                <td id="ctl379041_control6" data-datafield="TaskExpert.ResidentBegin" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskExpert.ResidentBegin" data-type="SheetTime" id="ctl379041_control6" style="" class=""></td>
                                <td id="ctl379041_control7" data-datafield="TaskExpert.ResidentEnd" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskExpert.ResidentEnd" data-type="SheetTime" id="ctl379041_control7" style="" class=""></td>
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
                <div id="div536930" class="col-md-3">
                    <input type="text" data-datafield="xmfzrname" data-type="SheetTextBox" id="ctl160702" class="" style="">
                </div>
                <div id="div218969" class="col-md-3">
                    <input type="text" data-datafield="fzbmname" data-type="SheetTextBox" id="ctl188676" class="" style="">
                </div>
                <div id="div723046" class="col-md-3">
                    <input type="text" data-datafield="cjbuname" data-type="SheetTextBox" id="ctl847435" class="" style="">
                </div>
                <div id="div686295" class="col-md-3">
                    <input type="text" data-datafield="fgldname" data-type="SheetTextBox" id="ctl653049" class="" style="">
                </div>
            </div>



            <div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: -1px 3px 0px 0px;">
                <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
            </div>

            <div class="row tableContent">
                <div id="title19" class="col-md-2">

                    <label data-datafield="xmglbyj" data-type="SheetLabel" id="ctl484112" class="" style="">项目管理部意见：</label>
                </div>
                <div id="control19" class="col-md-10">

                    <div data-datafield="xmglbyj" data-type="SheetComment" id="ctl905110" class="" style=""></div>
                </div>
            </div>
            <div class="row tableContent">
                <div id="title21" class="col-md-2">

                    <label data-datafield="zjlyj" data-type="SheetLabel" id="ctl902292" class="" style="">总经理意见：</label>
                </div>
                <div id="control21" class="col-md-10">

                    <div data-datafield="zjlyj" data-type="SheetComment" id="ctl842536" class="" style=""></div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>
