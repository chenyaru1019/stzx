<%@ Page Language="C#" AutoEventWireup="true" CodeFile="STaskChange.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.STaskChange" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="STaskChange.js"></script>
    <script type="text/javascript">
        $.MvcSheet.Loaded = function (sheetInfo) {
            if (sheetInfo.ActivityCode == "submit") {
                var xmfzrname = sheetInfo.BizObject.DataItems.xmfzr.V.Name;
                var fzbmname = sheetInfo.BizObject.DataItems.RDepartment.V.Name;
                var cjbmname = '';
                var fgldname = '';
                var cjbmarr = sheetInfo.BizObject.DataItems.JDepartment.V;
                for (i = 0; i < cjbmarr.length; i++) {
                    cjbmname += cjbmarr[i].Name + ';'
                }
                var fgldarr = sheetInfo.BizObject.DataItems.fgld.V;
                for (i = 0; i < fgldarr.length; i++) {
                    fgldname += fgldarr[i].Name + ';'
                }
                $.MvcSheetUI.SetControlValue("xmfzrname", xmfzrname);
                $.MvcSheetUI.SetControlValue("fzbmname", fzbmname);
                $.MvcSheetUI.SetControlValue("cjbmname", subStr(cjbmname));
                $.MvcSheetUI.SetControlValue("fgldname", subStr(fgldname));
            }
        }

        function subStr(str) {
            return (str.substring(str.length - 1) == ';') ? str.substring(0,
                str.length - 1) : str;

        }


        $.MvcSheet.PreInit = function () {


            var taskType = $.MvcSheetUI.GetControlValue("TaskType");
            if (taskType == "SJ" || taskType == "SZ") {
                $("#sd").css('display', 'block');
            } else {
                $("#sd").css('display', 'none');
            }

            $("#ctl439404").attr("onfocus", "this.blur()");    //合同编号
            $("#Control15").attr("onfocus", "this.blur()");    //项目编号
            $("#Control17").attr("onfocus", "this.blur()");    //任务编号
            $("#ctl902182").attr("disabled", "disabled");     //任务类型
            $("#ctl98454").attr("disabled", "disabled");     //项目类型
            $("#ctl206129_control0 input").attr("onfocus", "this.blur()");
            $("#ctl206129_control3 input").attr("onfocus", "this.blur()");
            $("#ctl206129_control4 input").attr("onfocus", "this.blur()");
            $("#ctl40025").attr("disabled", "disabled");



        }
    </script>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
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
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" style="">申请人</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.UserName}" style="">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" style="">所属部门</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.OUName}" style="">
                </div>
            </div>
            <div class="row">
                <div id="div339215" class="col-md-2">
                    <label data-datafield="Title" data-type="SheetLabel" id="ctl551820" class="" style="">标题</label></div>
                <div id="div18032" class="col-md-8">
                    <input type="text" data-datafield="Title" data-type="SheetTextBox" id="ctl747917" class="" style=""></div>
                <div id="div727946" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="div374273" class="col-md-2">
                    <label data-datafield="ContractNum" data-type="SheetLabel" id="ctl707129" class="" style="">合同编号</label></div>
                <div id="div532137" class="col-md-4">
                    <input type="text" data-datafield="ContractNum" data-type="SheetTextBox" id="ctl439404" class="" style="" data-onchange="setTaskChangeInfo();"></div>
                <div id="div997631" class="col-md-2"></div>
                <div id="div144380" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div899167" class="col-md-2">

                    <span id="Label15" data-type="SheetLabel" data-datafield="ProjectNum" class="" style="">项目编号</span>
                </div>
                <div id="div18937" class="col-md-4">

                    <input id="Control15" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" class="" data-popupwindow="PopupWindow" data-schemacode="ProjectInfo" data-querycode="xmxxlbcx" data-outputmappings="ProjectId:ObjectID,ProjectNum:ProjectNum,ProjectTaskId:ProjectTaskId,TaskNum:TaskNum,ProjectType:ProjectType,ContractStartDate:ContractStartDate,TaskType:TaskType,ContractNum:ContractNum" style="">
                </div>
                <div id="div563765" class="col-md-2">

                    <span id="Label14" data-type="SheetLabel" data-datafield="ProjectType" class="" style="">项目类型</span>
                </div>
                <div id="div978555" class="col-md-4">

                    <select data-datafield="ProjectType" data-type="SheetDropDownList" id="ctl98454" class="" data-defaultitems="高新类;普通类;平台类" data-displayemptyitem="true" style="" data-queryable="false"></select>
                </div>
            </div>
            <div class="row">
                <div id="div940092" class="col-md-2"><span id="Label17" data-type="SheetLabel" data-datafield="TaskNum" class="" style="">任务编号</span></div>
                <div id="div184030" class="col-md-4">
                    <input id="Control17" type="text" data-datafield="TaskNum" data-type="SheetTextBox" class="" style=""></div>
                <div id="div629189" class="col-md-2"><span id="Label16" data-type="SheetLabel" data-datafield="TaskType" class="" style="">任务类型</span></div>
                <div id="div793600" class="col-md-4">
                    <select data-datafield="TaskType" data-type="SheetDropDownList" id="ctl902182" class="" data-displayemptyitem="true" data-masterdatacategory="任务类型" style="" data-queryable="false" data-onchange="var taskType = $.MvcSheetUI.GetControlValue(&quot;TaskType&quot;);
if(taskType==&quot;SJ&quot; || taskType==&quot;SZ&quot;){
		$(&quot;#sd&quot;).css('display','block');  //会签人员
     }else{
               $(&quot;#sd&quot;).css('display','none');  
       }">
                    </select>
                </div>
            </div>
            <div class="row">
                <div id="div529616" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="ProjectName" class="" style="">项目名称</span></div>
                <div id="div271577" class="col-md-8">
                    <input id="Control13" type="text" data-datafield="ProjectName" data-type="SheetTextBox" class="" data-schemacode="ProjectTask" data-querycode="TaskList" style=""></div>
                <div id="div275171" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="div890692" class="col-md-2">
                    <label data-datafield="RDepartment" data-type="SheetLabel" id="ctl171376" class="" style="">负责部门</label></div>
                <div id="div710356" class="col-md-4">
                    <div data-datafield="RDepartment" data-type="SheetUser" id="ctl38533" class="" data-orgunitvisible="true" data-uservisible="false" style=""></div>
                </div>
                <div id="div291433" class="col-md-2">
                    <label data-datafield="JDepartment" data-type="SheetLabel" id="ctl465862" class="" style="">参加部门</label></div>
                <div id="div974185" class="col-md-4">
                    <div data-datafield="JDepartment" data-type="SheetUser" id="ctl334847" class="" data-uservisible="false" data-orgunitvisible="true" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div146689" class="col-md-2">
                    <label data-datafield="xmfzr" data-type="SheetLabel" id="ctl549156" class="" style="">项目负责人</label></div>
                <div id="div160401" class="col-md-4">
                    <div data-datafield="xmfzr" data-type="SheetUser" id="ctl491025" class="" style=""></div>
                </div>
                <div id="div325595" class="col-md-2">
                    <label data-datafield="fgld" data-type="SheetLabel" id="ctl373582" class="" style="">分管领导</label></div>
                <div id="div657728" class="col-md-4">
                    <div data-datafield="fgld" data-type="SheetUser" id="ctl408040" class="" style="" data-groupvisible="true"></div>
                </div>
            </div>
            <div class="row">
                <div id="div858405" class="col-md-2">
                    <label data-datafield="EntrustedUnit" data-type="SheetLabel" id="ctl314928" class="" style="">委托单位</label></div>
                <div id="div956286" class="col-md-8">
                    <input type="text" data-datafield="EntrustedUnit" data-type="SheetTextBox" id="ctl526940" class="" style=""></div>
                <div id="div493428" class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="div196933" class="col-md-2">
                    <label data-datafield="ContractStartDate" data-type="SheetLabel" id="ctl936232" class="" style="">合同签订时间</label></div>
                <div id="div499364" class="col-md-4">
                    <input type="text" data-datafield="ContractStartDate" data-type="SheetTime" id="ctl378086" class="" data-defaultvalue="" style=""></div>
                <div id="div484711" class="col-md-2"></div>
                <div id="div291368" class="col-md-4"></div>
            </div>


            <div class="row" id="sd" style="display: none">
                <div id="title7" class="col-md-2">

                    <label data-datafield="TechnicalValidation" data-type="SheetLabel" id="ctl423484" class="" style="">需要技术审定过程</label>
                </div>
                <div id="control7" class="col-md-4">

                    <div data-datafield="TechnicalValidation" data-type="SheetRadioButtonList" id="ctl234245" class="" style="" data-defaultitems="需要;不需要" data-defaultselected="false"></div>
                </div>
                <div id="space8" class="col-md-2"></div>
                <div id="spaceControl8" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div917888" class="col-md-2">

                    <span id="Label18" data-type="SheetLabel" data-datafield="TaskBasis" class="" style="">任务下达依据</span>
                </div>
                <div id="div115219" class="col-md-4">

                    <select data-datafield="TaskBasis" data-type="SheetDropDownList" id="ctl611087" class="" data-defaultitems="合同;中标通知书;项目立项建议表" data-displayemptyitem="true" data-emptyitemtext="请选择" style=""></select>
                </div>
                <div id="div841920" class="col-md-2">
                </div>
                <div id="div43504" class="col-md-4">
                </div>
            </div>
            <div class="row">
                <div id="div76844" class="col-md-2"><span id="Label19" data-type="SheetLabel" data-datafield="Content" class="" style="">服务内容</span></div>
                <div id="div978802" class="col-md-10">
                    <textarea id="Control19" data-datafield="Content" data-type="SheetRichTextBox" style="height: 60px; width: 100%;" class="">					</textarea></div>
            </div>
            <div class="row">
                <div id="div820649" class="col-md-2"><span id="Label20" data-type="SheetLabel" data-datafield="ServiceCycle" class="" style="">服务周期</span></div>
                <div id="div325292" class="col-md-10">
                    <textarea id="Control20" data-datafield="ServiceCycle" data-type="SheetRichTextBox" style="height: 60px; width: 100%;" class="">					</textarea></div>
            </div>
            <div class="row">
                <div id="div332680" class="col-md-2"><span id="Label21" data-type="SheetLabel" data-datafield="ServiceResults" class="" style="">服务成果</span></div>
                <div id="div398471" class="col-md-10">
                    <textarea id="Control21" data-datafield="ServiceResults" data-type="SheetRichTextBox" style="height: 60px; width: 100%;" class="">					</textarea></div>
            </div>
            <div class="row">
                <div id="div249801" class="col-md-2">
                    <label data-datafield="ChangeContent" data-type="SheetLabel" id="ctl241792" class="" style="">变更内容</label></div>
                <div id="div204011" class="col-md-10">
                    <textarea data-datafield="ChangeContent" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl43958" class=""></textarea></div>
            </div>
            <div class="row">
                <div id="div898633" class="col-md-2"><span id="Label22" data-type="SheetLabel" data-datafield="ContractAmount" class="" style="">合同金额</span></div>
                <div id="div688350" class="col-md-4">
                    <input id="Control22" type="text" data-datafield="ContractAmount" data-type="SheetTextBox" class="" style=""></div>
                <div id="div948301" class="col-md-2"></div>
                <div id="div94095" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div942706" class="col-md-2"><span id="Label23" data-type="SheetLabel" data-datafield="Outside" class="" style="">是否有委外情况</span></div>
                <div id="div8135" class="col-md-4">
                    <div data-datafield="Outside" data-type="SheetRadioButtonList" id="ctl638087" class="" data-defaultitems="是;否" data-defaultselected="false" data-repeatcolumns="1" style=""></div>
                </div>
                <div id="div809442" class="col-md-2"></div>
                <div id="div606665" class="col-md-4"></div>
            </div>

            <div class="row hidden">
                <div id="div945187" class="col-md-2">
                    <label data-datafield="ProjectId" data-type="SheetLabel" id="ctl882076" class="" style="">项目id</label>
                </div>
                <div id="div483077" class="col-md-4">
                    <input type="text" data-datafield="ProjectId" data-type="SheetTextBox" id="ctl75799" class="" style="">
                </div>
                <div id="div470532" class="col-md-2">
                    <label data-datafield="ProjectTaskId" data-type="SheetLabel" id="ctl353404" class="" style="">项目任务书id</label>
                </div>
                <div id="div912311" class="col-md-4">
                    <input type="text" data-datafield="ProjectTaskId" data-type="SheetTextBox" id="ctl982948" class="" style="">
                </div>
            </div>






            <div class="row">
                <div id="div430897" class="col-md-2">
                    <label data-datafield="TaskChangeMember" data-type="SheetLabel" id="ctl662307" class="" style="">人员信息</label>
                </div>
                <div id="div600796" class="col-md-10"></div>
            </div>
            <div class="row">
                <div id="div855392" class="col-md-12">
                    <table id="ctl265254" data-datafield="TaskChangeMember" data-type="SheetGridView" class="SheetGridView" style="">
                        <tbody>
                            <tr class="header">
                                <td id="ctl265254_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl265254_header0" data-datafield="TaskChangeMember.FullName" style="">
                                    <label id="ctl265254_Label0" data-datafield="TaskChangeMember.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl265254_header1" data-datafield="TaskChangeMember.Department" style="">
                                    <label id="ctl265254_Label1" data-datafield="TaskChangeMember.Department" data-type="SheetLabel" style="">所属部门</label></td>
                                <td id="ctl265254_header2" data-datafield="TaskChangeMember.PersonRole" style="width: 18%;" class="">
                                    <label id="ctl265254_Label2" data-datafield="TaskChangeMember.PersonRole" data-type="SheetLabel" style="">角色</label></td>
                                <td id="ctl265254_header3" data-datafield="TaskChangeMember.Profession" style="">
                                    <label id="ctl265254_Label3" data-datafield="TaskChangeMember.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl265254_header4" data-datafield="TaskChangeMember.JobTitle" style="">
                                    <label id="ctl265254_Label4" data-datafield="TaskChangeMember.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl265254_header5" data-datafield="TaskChangeMember.Qualification" style="">
                                    <label id="ctl265254_Label5" data-datafield="TaskChangeMember.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                <td id="ctl265254_header6" data-datafield="TaskChangeMember.AppointmentDate" style="">
                                    <label id="ctl265254_Label6" data-datafield="TaskChangeMember.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl265254_header7" data-datafield="TaskChangeMember.ResidentBegin" style="">
                                    <label id="ctl265254_Label7" data-datafield="TaskChangeMember.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label></td>
                                <td id="ctl265254_header8" data-datafield="TaskChangeMember.ResidentEnd" style="">
                                    <label id="ctl265254_Label8" data-datafield="TaskChangeMember.ResidentEnd" data-type="SheetLabel" style="">至</label></td>
                                <td id="ctl265254_header9" data-datafield="TaskChangeMember.UserId" style="" class="hidden">
                                    <label id="ctl265254_Label9" data-datafield="TaskChangeMember.UserId" data-type="SheetLabel" style="">UserId</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl265254_control0" data-datafield="TaskChangeMember.FullName" style="width: 10%;" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="TaskChangeMember.FullName:UserName,TaskChangeMember.Department:Department,TaskChangeExpert.Profession:Profession,TaskChangeExpert.JobTitle:Appellation,TaskChangeExpert.Qualification:QualificationInfo,TaskChangeMember.UserId:UserId">
                                    <input type="text" data-datafield="TaskChangeMember.FullName" data-type="SheetTextBox" id="ctl265254_control0" style="width: 65%;" class="" data-popupwindow="PopupWindow" data-schemacode="AddressBook" data-querycode="queryUser" data-outputmappings="TaskChangeMember.FullName:UserName,TaskChangeMember.Department:Department,TaskChangeExpert.Profession:Profession,TaskChangeExpert.JobTitle:Appellation,TaskChangeExpert.Qualification:QualificationInfo,TaskChangeMember.UserId:UserId"></td>
                                <td id="ctl265254_control1" data-datafield="TaskChangeMember.Department" style="" class="">
                                    <input type="text" data-datafield="TaskChangeMember.Department" data-type="SheetTextBox" id="ctl265254_control1" style="" class=""></td>
                                <td id="ctl265254_control2" data-datafield="TaskChangeMember.PersonRole" style="width: 18%;" class="">
                                    <select data-datafield="TaskChangeMember.PersonRole" data-type="SheetDropDownList" id="ctl390049" class="" style="width: 100%;" data-masterdatacategory="项目角色" data-displayemptyitem="true" data-emptyitemtext="请选择"></select></td>
                                <td id="ctl265254_control3" data-datafield="TaskChangeMember.Profession" style="">
                                    <input type="text" data-datafield="TaskChangeMember.Profession" data-type="SheetTextBox" id="ctl265254_control3" style=""></td>
                                <td id="ctl265254_control4" data-datafield="TaskChangeMember.JobTitle" style="" class="">
                                    <input type="text" data-datafield="TaskChangeMember.JobTitle" data-type="SheetTextBox" id="ctl265254_control4" style=""></td>
                                <td id="ctl265254_control5" data-datafield="TaskChangeMember.Qualification" style="" class="">
                                    <input type="text" data-datafield="TaskChangeMember.Qualification" data-type="SheetTextBox" id="ctl265254_control5" style="" class=""></td>
                                <td id="ctl265254_control6" data-datafield="TaskChangeMember.AppointmentDate" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskChangeMember.AppointmentDate" data-type="SheetTime" id="ctl265254_control6" style="" class=""></td>
                                <td id="ctl265254_control7" data-datafield="TaskChangeMember.ResidentBegin" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskChangeMember.ResidentBegin" data-type="SheetTime" id="ctl265254_control7" style="" class=""></td>
                                <td id="ctl265254_control8" data-datafield="TaskChangeMember.ResidentEnd" style="width: 10%;" class="">
                                    <input type="text" data-datafield="TaskChangeMember.ResidentEnd" data-type="SheetTime" id="ctl265254_control8" style="" class=""></td>
                                <td id="ctl265254_control9" data-datafield="TaskChangeMember.UserId" style="" class="hidden">
                                    <input type="text" data-datafield="TaskChangeMember.UserId" data-type="SheetTextBox" id="ctl265254_control9" style=""></td>
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
                <div id="div978625" class="col-md-2">
                    <label data-datafield="TaskChangeExpert" data-type="SheetLabel" id="ctl394846" class="" style="">专家信息</label>
                </div>
                <div id="div580065" class="col-md-10"></div>
            </div>
            <div class="row">
                <div id="div312660" class="col-md-12">
                    <table id="ctl206129" data-datafield="TaskChangeExpert" data-type="SheetGridView" class="SheetGridView" style="">
                        <tbody>
                            <tr class="header">
                                <td id="ctl206129_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl206129_header0" data-datafield="TaskChangeExpert.FullName" style="" class="">
                                    <label id="ctl206129_Label0" data-datafield="TaskChangeExpert.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl206129_header1" data-datafield="TaskChangeExpert.PersonRole" style="width: 18%;" class="">
                                    <label id="ctl206129_Label1" data-datafield="TaskChangeExpert.PersonRole" data-type="SheetLabel" style="">角色</label></td>
                                <td id="ctl206129_header2" data-datafield="TaskChangeExpert.Profession" style="">
                                    <label id="ctl206129_Label2" data-datafield="TaskChangeExpert.Profession" data-type="SheetLabel" style="">专业</label></td>
                                <td id="ctl206129_header3" data-datafield="TaskChangeExpert.JobTitle" style="">
                                    <label id="ctl206129_Label3" data-datafield="TaskChangeExpert.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                <td id="ctl206129_header4" data-datafield="TaskChangeExpert.Qualification" style="">
                                    <label id="ctl206129_Label4" data-datafield="TaskChangeExpert.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                <td id="ctl206129_header5" data-datafield="TaskChangeExpert.AppointmentDate" style="">
                                    <label id="ctl206129_Label5" data-datafield="TaskChangeExpert.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                <td id="ctl206129_header6" data-datafield="TaskChangeExpert.ResidentBegin" style="">
                                    <label id="ctl206129_Label6" data-datafield="TaskChangeExpert.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label></td>
                                <td id="ctl206129_header7" data-datafield="TaskChangeExpert.ResidentEnd" style="">
                                    <label id="ctl206129_Label7" data-datafield="TaskChangeExpert.ResidentEnd" data-type="SheetLabel" style="">至</label></td>
                                <td class="rowOption">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl206129_control0" data-datafield="TaskChangeExpert.FullName" style="width: 10%;" class="" data-popupwindow="PopupWindow" data-schemacode="ExpertInfo" data-querycode="zjcx" data-outputmappings="TaskChangeExpert.FullName:EName,TaskChangeExpert.Profession:Cszy1,TaskChangeExpert.JobTitle:Job,TaskChangeExpert.Qualification:TechnicalTitle">
                                    <input type="text" data-datafield="TaskChangeExpert.FullName" data-type="SheetTextBox" id="ctl206129_control0" class="" data-popupwindow="PopupWindow" data-schemacode="ExpertInfo" data-querycode="zjcx" data-outputmappings="TaskChangeExpert.FullName:EName,TaskChangeExpert.Profession:Cszy1,TaskChangeExpert.JobTitle:Job,TaskChangeExpert.Qualification:TechnicalTitle" style="width: 65%;"></td>
                                <td id="ctl206129_control1" data-datafield="TaskChangeExpert.PersonRole" style="width: 18%;" class="">
                                    <select data-datafield="TaskChangeExpert.PersonRole" data-type="SheetDropDownList" id="ctl166490" class="" data-displayemptyitem="true" data-emptyitemtext="请选择" data-masterdatacategory="项目角色" style="width: 100%;"></select></td>
                                <td id="ctl206129_control2" data-datafield="TaskChangeExpert.Profession" style="width: 12%;" class="">
                                    <select data-datafield="TaskChangeExpert.Profession" data-type="SheetDropDownList" id="ctl40025" class="" data-schemacode="zjkcx" data-querycode="zjklb" data-datavaluefield="Cid" data-datatextfield="TypeName" data-displayemptyitem="true" style="" data-filter="0:Pid" data-queryable="false"></select></td>
                                <td id="ctl206129_control3" data-datafield="TaskChangeExpert.JobTitle" style="" class="">
                                    <input type="text" data-datafield="TaskChangeExpert.JobTitle" data-type="SheetTextBox" id="ctl206129_control3" style="" class=""></td>
                                <td id="ctl206129_control4" data-datafield="TaskChangeExpert.Qualification" style="" class="">
                                    <input type="text" data-datafield="TaskChangeExpert.Qualification" data-type="SheetTextBox" id="ctl206129_control4" style="" class=""></td>
                                <td id="ctl206129_control5" data-datafield="TaskChangeExpert.AppointmentDate" style="" class="">
                                    <input type="text" data-datafield="TaskChangeExpert.AppointmentDate" data-type="SheetTime" id="ctl206129_control5" style=""></td>
                                <td id="ctl206129_control6" data-datafield="TaskChangeExpert.ResidentBegin" style="">
                                    <input type="text" data-datafield="TaskChangeExpert.ResidentBegin" data-type="SheetTime" id="ctl206129_control6" style=""></td>
                                <td id="ctl206129_control7" data-datafield="TaskChangeExpert.ResidentEnd" style="">
                                    <input type="text" data-datafield="TaskChangeExpert.ResidentEnd" data-type="SheetTime" id="ctl206129_control7" style=""></td>
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
                <div id="div507472" class="col-md-3">
                    <input type="text" data-datafield="xmfzrname" data-type="SheetTextBox" id="ctl473852" class="" style="">
                </div>
                <div id="div924737" class="col-md-3">
                    <input type="text" data-datafield="fzbmname" data-type="SheetTextBox" id="ctl492337" class="" style="">
                </div>
                <div id="div583638" class="col-md-3">
                    <input type="text" data-datafield="cjbmname" data-type="SheetTextBox" id="ctl38260" class="" style="">
                </div>
                <div id="div717990" class="col-md-3">
                    <input type="text" data-datafield="fgldname" data-type="SheetTextBox" id="ctl930701" class="" style="">
                </div>
            </div>

            <div class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: -1px 3px 0px 0px;">
                <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
            </div>

            <div class="row">
                <div id="div705638" class="col-md-2">
                    <label data-datafield="xmglbyj" data-type="SheetLabel" id="ctl882806" class="" style="">项目管理部意见</label>
                </div>
                <div id="div38548" class="col-md-10">
                    <div data-datafield="xmglbyj" data-type="SheetComment" id="ctl628203" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div959377" class="col-md-2">
                    <label data-datafield="zjlyj" data-type="SheetLabel" id="ctl456971" class="" style="">总经理意见</label>
                </div>
                <div id="div273809" class="col-md-10">
                    <div data-datafield="zjlyj" data-type="SheetComment" id="ctl656362" class="" style=""></div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
