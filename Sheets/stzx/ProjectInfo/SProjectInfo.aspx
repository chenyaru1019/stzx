<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SProjectInfo.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.SProjectInfo" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>

<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
    <script src="Project_execute.js"></script>
    <script type="text/javascript">
        $.MvcSheet.PreInit = function () {

            //设置字段只读
            $("#Control11").attr("onfocus", "this.blur()");
            $("#Control12").attr("onfocus", "this.blur()");
            $("#Control13").attr("onfocus", "this.blur()");
            $("#Control14").attr("disabled", "disabled");
            $("#Control15").attr("onfocus", "this.blur()");
            $("#ctl758831").attr("disabled", "disabled"); //项目类别
            $("#Control17").attr("onfocus", "this.blur()");
            $("#ctl465461").attr("onfocus", "this.blur()");
            $("#ctl834551").attr("onfocus", "this.blur()");
            $("#ctl475098").attr("onfocus", "this.blur()");
            $("#ctl357422").attr("onfocus", "this.blur()");
            $("#ctl742335").attr("onfocus", "this.blur()");
            $("#div116537").css("pointer-events", "none");    //是否委外  
            $("#control5").css("pointer-events", "none");
            $("#Control22").attr("disabled", "disabled");
            $("#ctl345981").attr("disabled", "disabled");
            $("#ctl589943").attr("onfocus", "this.blur()");
            $("#ctl1925").attr("onfocus", "this.blur()");
            $("#ctl158954").attr("onfocus", "this.blur()");

            //项目人员只读
            $("#ctl66772_control0 input").attr("onfocus", "this.blur()");
            $("#ctl66772_control1 input").attr("onfocus", "this.blur()");
            $("#ctl66772_control2 input").attr("onfocus", "this.blur()");
            $("#ctl66772_control3 input").attr("onfocus", "this.blur()");
            $("#ctl66772_control4 input").attr("onfocus", "this.blur()");
            $("#ctl66772_control5 input").attr("onfocus", "this.blur()");
            $("#ctl66772_control6 input").attr("disabled", "disabled");
            $("#ctl66772_control7 input").attr("disabled", "disabled");
            $("#ctl66772_control8 input").attr("disabled", "disabled");

            //项目专家只读
            $("#ctl189187_control0 input").attr("onfocus", "this.blur()");
            $("#ctl189187_control1 input").attr("onfocus", "this.blur()");
            $("#ctl726390 ").attr("disabled", "disabled");
            $("#ctl189187_control3 input").attr("onfocus", "this.blur()");
            $("#ctl189187_control4 input").attr("onfocus", "this.blur()");
            $("#ctl189187_control5 input").attr("disabled", "disabled");
            $("#ctl189187_control6 input").attr("disabled", "disabled");
            $("#ctl189187_control7  input").attr("disabled", "disabled");

            //项目形象进度计划表
            $("#ctl905899_control0 input").attr("disabled", "disabled");
            $("#ctl905899_control1 input").attr("disabled", "disabled");
            $("#ctl905899_control2 textarea").attr("onfocus", "this.blur()");
            $("#ctl905899_control3 input").attr("onfocus", "this.blur()");

            //项目形象进度跟踪表
            $("#ctl612433_control0 input").attr("disabled", "disabled");
            $("#ctl612433_control1 input").attr("disabled", "disabled");
            $("#ctl612433_control2 textarea").attr("onfocus", "this.blur()");
            $("#ctl612433_control3 input").attr("onfocus", "this.blur()");


            //收付款计划表
            $("#ctl613201_control0 input").attr("disabled", "this.blur()");
            $("#ctl613201_control1 input").attr("disabled", "disabled");
            $("#ctl613201_control2 textarea").attr("onfocus", "this.blur()");
            $("#ctl613201_control3 input").attr("onfocus", "this.blur()");


            //首付款跟踪表
            $("#ctl281997_control0 input").attr("disabled", "this.blur()");
            $("#ctl281997_control1 input").attr("disabled", "disabled");
            $("#ctl281997_control2 textarea").attr("onfocus", "this.blur()");
            $("#ctl281997_control3 input").attr("onfocus", "this.blur()");


            //租房，租车
            $("#Control32_ctl3 input").attr("onfocus", "this.blur()");
            $("#Control32_ctl4 input").attr("onfocus", "this.blur()");
            $("#Control32_ctl5 input").attr("onfocus", "this.blur()");
            $("#Control33_ctl3 input").attr("onfocus", "this.blur()");
            $("#Control33_ctl4 input").attr("onfocus", "this.blur()");
            $("#Control33_ctl5 input").attr("onfocus", "this.blur()");

            //项目总结资料
            $("#ctl642268_control0 input").attr("onfocus", "this.blur()");
            $("#ctl642268_control1 textarea").attr("onfocus", "this.blur()");
            $("#ctl642268_control2 input").attr("disabled", "disabled");
            $("#ctl642268_control3 input").attr("onfocus", "this.blur()");


            //月度/周资料
            $("#ctl182260_control0 input").attr("onfocus", "this.blur()");
            $("#ctl182260_control1 textarea").attr("onfocus", "this.blur()");
            $("#ctl182260_control2 input").attr("disabled", "disabled");
            $("#ctl182260_control3 input").attr("onfocus", "this.blur()");


            //评审材料
            $("#ctl815077_control0 input").attr("onfocus", "this.blur()");
            $("#ctl815077_control1 textarea").attr("onfocus", "this.blur()");
            $("#ctl815077_control2 input").attr("disabled", "disabled");
            $("#ctl815077_control3  input").attr("onfocus", "this.blur()");


            //外部等登记
            $("#ctl686802_control0 input").attr("onfocus", "this.blur()");
            $("#ctl686802_control1 textarea").attr("onfocus", "this.blur()");
            $("#ctl686802_control2 input").attr("disabled", "disabled");
            $("#ctl686802_control3  input").attr("onfocus", "this.blur()");


            //归档资料
            $("#ctl104936_control0 input").attr("onfocus", "this.blur()");
            $("#ctl104936_control1 input").attr("onfocus", "this.blur()");
            $("#ctl104936_control2 textarea").attr("onfocus", "this.blur()");
            $("#ctl104936_control3 input").attr("disabled", "disabled");


            //委外单位
            $("#ctl430603_control0 input").attr("onfocus", "this.blur()");
            $("#ctl430603_control1 input").attr("onfocus", "this.blur()");
            $("#ctl430603_control2 input").attr("onfocus", "this.blur()");


        };




        $.MvcSheet.Loaded = function (sheetInfo) {




            //项目进度
            var projectId = sheetInfo.BizObjectID;
            if (projectId) {
                getProjectProcess(projectId);
            }


            //评审材料
            var projectReviewData = $.MvcSheetUI.GetElement(
                "ProjectReviewData").SheetGridView();
            var projectReviewDataArr = projectReviewData.V.R;
            if (projectReviewDataArr.length > 0) {
                for (var i = 0; i < projectReviewDataArr.length; i++) {
                    var url = projectReviewDataArr[i].DataItems["ProjectReviewData.FilePath"].V;
                    $($('#ctl815077 .rows #ctl815077_control5 ').find('a')[i]).attr('href', url)
                }

            }
            //外部登记资料
            var externalData = $.MvcSheetUI.GetElement("ExternalData")
                .SheetGridView();
            var externalDataArr = externalData.V.R;
            if (externalDataArr.length > 0) {
                for (var i = 0; i < externalDataArr.length; i++) {
                    var url = externalDataArr[i].DataItems["ExternalData.FilePath"].V;
                    $($('#ctl686802 .rows #ctl686802_control5 ').find('a')[i]).attr('href', url)
                }
            }

            //项目总结资料
            var projectSummaryInfo = $.MvcSheetUI.GetElement("ProjectSummaryInfo")
                .SheetGridView();
            var projectSummaryInfoArr = projectSummaryInfo.V.R;
            if (projectSummaryInfoArr.length > 0) {
                for (var j = 0; j < projectSummaryInfoArr.length; j++) {
                    var attachmentId = projectSummaryInfoArr[j].DataItems["ProjectSummaryInfo.FilePath"].V;
                    var url = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=ProjectSummary&BizObjectID=&AttachmentID="
                        + attachmentId + "&OpenMethod=0"
                    $($('#ctl642268 .rows #ctl642268_control5 ').find('a')[j])
                        .attr('href', url)
                }

            }


            //项目月周
            var mweeklyData = $.MvcSheetUI.GetElement("MWeeklyData")
                .SheetGridView();
            var mweeklyDataArr = mweeklyData.V.R;
            if (mweeklyDataArr.length > 0) {
                for (var j = 0; j < mweeklyDataArr.length; j++) {
                    var attachmentId = mweeklyDataArr[j].DataItems["MWeeklyData.FilePath"].V;
                    var url = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=ProjectSummary&BizObjectID=&AttachmentID="
                        + attachmentId + "&OpenMethod=0"
                    $($('#ctl182260 .rows #ctl182260_control5 ').find('a')[j])
                        .attr('href', url)
                }

            }

            //委外单位
            var outsourcingInfo = $.MvcSheetUI.GetElement("OutsourcingInfo")
                .SheetGridView();
            var outsourcingInfoArr = outsourcingInfo.V.R;
            if (outsourcingInfoArr.length > 0) {
                for (var j = 0; j < outsourcingInfoArr.length; j++) {
                    var attachmentId = outsourcingInfoArr[j].DataItems["OutsourcingInfo.ProjectOutsideId"].V;
                    console.log(attachmentId)
                    var url = "/Portal/MvcDefaultSheet.aspx?SheetCode=SProjectOutside&Mode=View&SchemaCode=ProjectOutside&BizObjectID="
                        + attachmentId
                    $($('#ctl430603 .rows #ctl430603_control3 ').find('a')[j])
                        .attr('href', url)
                }

            }
            var formUrl1 =  'http://'+forurlpost .substring(0,forurlpost.indexOf(':'))+':8010/';
console.log(formUrl1)
            $('#TechnicalAudit').attr('href',''+formUrl1+'Portal/index.html#/app/jscgshgl/QueryInstance/ConsultativeTRR')
        }

    </script>
    <style type="text/css">
        .tab-pane {
            border-top: 1px solid #E3E3E3;
        }

        #FlowChart {
            text-align: center;
            height: 61px;
        }

            #FlowChart li {
                float: left;
                width: 12%;
                /*border-bottom: 14px solid red;*/
                position: relative;
            }

                #FlowChart1 li:last-child {
                        border-right: 20px solid white;
                        width: 6%;
                }

                #FlowChart li img {
                    position: absolute;
                    top: 62px;
                    left: -5px;
                }

                #FlowChart li span {
                    display: block;
                    text-align: left;
                    padding-bottom: 22px;
                    padding-left: 0px;
                    -ms-transform: rotate(-35deg); /* IE 9 */
                    -moz-transform: rotate(-35deg); /* Firefox */
                    -webkit-transform: rotate(-35deg); /* Safari and Chrome */
                    -o-transform: rotate(-35deg); /* Opera */
                    transform: rotate(-35deg);
                }
                #FlowChart1 li {
                    height: 0px;
                    width: 12%;
                    border-bottom: 13px solid red;
                    background-color:red;
                    float: left;
                }
    </style>
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">项目信息</label>
    </div>
       <div class="row" style='height: 110px;border-top: 1px solid #E3E3E3;'>
                    <div class="col-md-12">
                        <p>
                            流程前进方向
                            <img src="ic_flowm1.png" alt="">
                        </p>
                    </div>
                    <div class="col-md-12">
                        <ul id='FlowChart'>
                            <li><span>任务书下达</span><img src="ic_flowm3.png" alt="" style='left: 0;'></li>
                            <li><span>大纲编制</span><img src="ic_flowm3.png" alt=""></li>
                            <li><span>项目执行</span><img src="ic_flowm3.png" alt=""></li>
                            <li><span>项目归档</span><img src="ic_flowm3.png" alt=""></li>
                            <li><span>项目销项</span><img src="ic_flowm3.png" alt=""></li>
                        </ul>
                        <ul id='FlowChart1'>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>

                </div>
    <div class="panel-body sheetContainer">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#basicInfo" data-toggle="tab">项目基本信息</a></li>
            <li><a href="#personnelInfo" data-toggle="tab">人员信息</a></li>
            <li><a href="#budgetInfo" data-toggle="tab">预算信息</a></li>
            <li><a href="#progressInfo" data-toggle="tab">进度信息</a></li>
            <li><a href="#paymentInfo" data-toggle="tab">收付款信息</a></li>
            <li><a href="#supportingInfo" data-toggle="tab">资源支撑信息</a></li>
            <li class="dropdown">
                <a href="#" id="myTabDrop1" class="dropdown-toggle"
                    data-toggle="dropdown">更多
                			<b class="caret"></b>
                </a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                    <li><a href="#outsourcingInfo" tabindex="-1" data-toggle="tab">委外信息</a></li>
                    <li><a href="#communicatingInfo" tabindex="-1" data-toggle="tab">沟通信息</a></li>
                    <li><a  id='TechnicalAudit' target=_parent>项目技术审核</a></li>
                    <li><a href="#projectInfo" tabindex="-1" data-toggle="tab">项目资料信息</a></li>
                </ul>
            </li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="basicInfo">
                <div class="row">
                    <div id="title1" class="col-md-2">
                        <span id="Label11" data-type="SheetLabel" data-datafield="ProjectNum" style="" class="">项目编号：</span>
                    </div>
                    <div id="control1" class="col-md-4">
                        <input id="Control11" type="text" data-datafield="ProjectNum" data-type="SheetTextBox" style="" class="">
                    </div>
                    <div id="title2" class="col-md-2">
                    </div>
                    <div id="control2" class="col-md-4">
                    </div>
                </div>
                <div class="row">
                    <div id="div201488" class="col-md-2"><span id="Label12" data-type="SheetLabel" data-datafield="ContractNum" style="" class="">合同编号：</span></div>
                    <div id="div154189" class="col-md-4">
                        <input id="Control12" type="text" data-datafield="ContractNum" data-type="SheetTextBox" style="" class="">
                    </div>
                    <div id="div588508" class="col-md-2"></div>
                    <div id="div132843" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div853956" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="TaskNum" style="" class="">任务编号：</span></div>
                    <div id="div462610" class="col-md-4">
                        <input id="Control13" type="text" data-datafield="TaskNum" data-type="SheetTextBox" style="" class="">
                    </div>
                    <div id="div891193" class="col-md-2"></div>
                    <div id="div487166" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div813262" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="TReleaseDate" style="" class="">任务下达日期：</span></div>
                    <div id="div86164" class="col-md-4">
                        <input id="Control14" type="text" data-datafield="TReleaseDate" data-type="SheetTime" style="" class="">
                    </div>
                    <div id="div779401" class="col-md-2"></div>
                    <div id="div876562" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div127138" class="col-md-2"><span id="Label15" data-type="SheetLabel" data-datafield="ProjectName" style="" class="">项目名称：</span></div>
                    <div id="div421797" class="col-md-8">
                        <input id="Control15" type="text" data-datafield="ProjectName" data-type="SheetTextBox" style="" class="">
                    </div>
                    <div id="div797138" class="col-md-2"></div>
                </div>
                <div class="row">
                    <div id="div439149" class="col-md-2"><span id="Label16" data-type="SheetLabel" data-datafield="ProjectType" style="" class="">项目类别：</span></div>
                    <div id="div919105" class="col-md-4">
                        <select data-datafield="ProjectType" data-type="SheetDropDownList" id="ctl758831" class="" style="" data-defaultitems="高新类;普通类;平台类" data-displayemptyitem="true" data-queryable="false"></select>
                    </div>
                    <div id="div680890" class="col-md-2"></div>
                    <div id="div257137" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div408669" class="col-md-2"><span id="Label17" data-type="SheetLabel" data-datafield="EntrustedUnit" style="" class="">委托单位：</span></div>
                    <div id="div613154" class="col-md-8">
                        <input id="Control17" type="text" data-datafield="EntrustedUnit" data-type="SheetTextBox" style="" class="">
                    </div>
                    <div id="div554499" class="col-md-2"></div>
                </div>
                <div class="row">
                    <div id="div448220" class="col-md-2">
                        <label data-datafield="fzbm" data-type="SheetLabel" id="ctl185529" class="" style="">负责部门：</label>
                    </div>
                    <div id="div727727" class="col-md-4">
                        <input type="text" data-datafield="fzbm" data-type="SheetTextBox" id="ctl465461" class="" style="">
                    </div>
                    <div id="div275353" class="col-md-2"></div>
                    <div id="div985346" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div423783" class="col-md-2">
                        <label data-datafield="cybm" data-type="SheetLabel" id="ctl621049" class="" style="">参与部门：</label>
                    </div>
                    <div id="div685510" class="col-md-4">
                        <input type="text" data-datafield="cybm" data-type="SheetTextBox" id="ctl834551" class="" style="">
                    </div>
                    <div id="div976654" class="col-md-2"></div>
                    <div id="div414531" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div281889" class="col-md-2">
                        <label data-datafield="xmfzr" data-type="SheetLabel" id="ctl392775" class="" style="">项目负责人：</label>
                    </div>
                    <div id="div299636" class="col-md-4">
                        <input type="text" data-datafield="xmfzr" data-type="SheetTextBox" id="ctl475098" class="" style="">
                    </div>
                    <div id="div163217" class="col-md-2"></div>
                    <div id="div262961" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div587989" class="col-md-2">
                        <label data-datafield="fgld" data-type="SheetLabel" id="ctl845688" class="" style="">分管领导：</label>
                    </div>
                    <div id="div259838" class="col-md-4">
                        <input type="text" data-datafield="fgld" data-type="SheetTextBox" id="ctl357422" class="" style="">
                    </div>
                    <div id="div502820" class="col-md-2"></div>
                    <div id="div44018" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div304204" class="col-md-2">
                        <label data-datafield="ContractAmount" data-type="SheetLabel" id="ctl719164" class="" style="">合同金额：</label>
                    </div>
                    <div id="div916524" class="col-md-4">
                        <input type="text" data-datafield="ContractAmount" data-type="SheetTextBox" id="ctl742335" class="" style="">
                    </div>
                    <div id="div79123" class="col-md-2"></div>
                    <div id="div51312" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div310987" class="col-md-2">
                        <label data-datafield="Outside" data-type="SheetLabel" id="ctl138091" class="" style="">是否委外：</label>
                    </div>
                    <div id="div116537" class="col-md-4">
                        <div data-datafield="Outside" data-type="SheetRadioButtonList" id="ctl308998" class="" style="" data-defaultitems="是;否" data-defaultselected="false"></div>
                    </div>
                    <div id="div303917" class="col-md-2"></div>
                    <div id="div630996" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div55298" class="col-md-2"><span id="Label22" data-type="SheetLabel" data-datafield="ContractStartDate" style="" class="">合同签订日期：</span></div>
                    <div id="div284971" class="col-md-4">
                        <input id="Control22" type="text" data-datafield="ContractStartDate" data-type="SheetTime" style="" class="">
                    </div>
                    <div id="div324279" class="col-md-2"></div>
                    <div id="div65884" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="title5" class="col-md-2">

                        <label data-datafield="TechnicalValidation" data-type="SheetLabel" id="ctl8065" class="" style="">需要技术审定过程：</label>
                    </div>
                    <div id="control5" class="col-md-4">

                        <div data-datafield="TechnicalValidation" data-type="SheetRadioButtonList" id="ctl345981" class="" style="" data-defaultitems="需要;不需要" data-defaultselected="false"></div>
                    </div>
                    <div id="title6" class="col-md-2">
                    </div>
                    <div id="control6" class="col-md-4">
                    </div>
                </div>
                <div class="row hidden">
                    <div id="div552683" class="col-md-2">
                        <label data-datafield="TaskType" data-type="SheetLabel" id="ctl405787" class="" style="">任务类型</label>
                    </div>
                    <div id="div787802" class="col-md-2">
                        <select data-datafield="TaskType" data-type="SheetDropDownList" id="ctl384789" class="" style="" data-displayemptyitem="true" data-emptyitemtext="请选择" data-masterdatacategory="任务类型"></select>
                    </div>
                    <div id="div834836" class="col-md-2">
                        <label data-datafield="TaskBasis" data-type="SheetLabel" id="ctl259790" class="" style="">任务下达依据</label>
                    </div>
                    <div id="div459118" class="col-md-2">
                        <select data-datafield="TaskBasis" data-type="SheetDropDownList" id="ctl504976" class="" style="" data-defaultitems="合同;中标通知书;项目立项建议表" data-displayemptyitem="true" data-emptyitemtext="请选择"></select>
                    </div>
                    <div id="div710921" class="col-md-2"></div>
                    <div id="div580219" class="col-md-2"></div>
                </div>
                <div class="row">
                    <div id="div575198" class="col-md-2">
                        <label data-datafield="Content" data-type="SheetLabel" id="ctl399648" class="" style="">服务内容：</label>
                    </div>
                    <div id="div693089" class="col-md-10">
                        <textarea data-datafield="Content" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl589943" class=""></textarea>
                    </div>
                </div>
                <div class="row">
                    <div id="div22502" class="col-md-2">
                        <label data-datafield="ServiceCycle" data-type="SheetLabel" id="ctl709746" class="" style="">服务范围：</label>
                    </div>
                    <div id="div210621" class="col-md-10">
                        <textarea data-datafield="ServiceCycle" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl1925" class=""></textarea>
                    </div>
                </div>
                <div class="row">
                    <div id="div204569" class="col-md-2">
                        <label data-datafield="ServiceResults" data-type="SheetLabel" id="ctl322823" class="" style="">服务成果：</label>
                    </div>
                    <div id="div748647" class="col-md-10">
                        <textarea data-datafield="ServiceResults" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl158954" class=""></textarea>
                    </div>
                </div>

                <div class="row">
                    <div id="title17" class="col-md-2">
                        <span id="Label25">项目状态：</span>
                    </div>
                    <div id="control17" class="col-md-4">
                        <select id="sel" disabled="disabled" style="-webkit-appearance: none;">
                            <option value="任务书下达">任务书下达</option>
                            <option value="大纲编制">大纲编制</option>
                            <option value="项目执行">项目执行</option>
                            <option value="项目归档">项目归档</option>
                            <option value="项目销项">项目销项</option>
                        </select>
                    </div>
                    <div id="space18" class="col-md-2">
                    </div>
                    <div id="spaceControl18" class="col-md-4">
                    </div>
                </div>


            </div>
            <div class="tab-pane fade active" id="personnelInfo">
                <div class="row">
                    <div id="div367314" class="col-md-2">
                        <label data-datafield="PersonnelInfo" data-type="SheetLabel" id="ctl759663" class="" style="">人员信息：</label>
                    </div>
                    <div id="div287807" class="col-md-10"></div>
                </div>
                <div class="row">
                    <div id="div619656" class="col-md-12">
                        <table id="ctl66772" data-datafield="PersonnelInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl66772_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl66772_header0" data-datafield="PersonnelInfo.UserName" style="">
                                        <label id="ctl66772_Label0" data-datafield="PersonnelInfo.UserName" data-type="SheetLabel" style="">姓名</label></td>
                                    <td id="ctl66772_header1" data-datafield="PersonnelInfo.UserRole" style="" class="">
                                        <label id="ctl66772_Label1" data-datafield="PersonnelInfo.UserRole" data-type="SheetLabel" style="">角色</label></td>
                                    <td id="ctl66772_header2" data-datafield="PersonnelInfo.Depart" style="">
                                        <label id="ctl66772_Label2" data-datafield="PersonnelInfo.Depart" data-type="SheetLabel" style="">所属部门</label></td>
                                    <td id="ctl66772_header3" data-datafield="PersonnelInfo.Profession" style="">
                                        <label id="ctl66772_Label3" data-datafield="PersonnelInfo.Profession" data-type="SheetLabel" style="">专业</label></td>
                                    <td id="ctl66772_header4" data-datafield="PersonnelInfo.JobTitle" style="">
                                        <label id="ctl66772_Label4" data-datafield="PersonnelInfo.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                    <td id="ctl66772_header5" data-datafield="PersonnelInfo.Qualification" style="">
                                        <label id="ctl66772_Label5" data-datafield="PersonnelInfo.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                    <td id="ctl66772_header6" data-datafield="PersonnelInfo.AppointmentDate" style="">
                                        <label id="ctl66772_Label6" data-datafield="PersonnelInfo.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                    <td id="ctl66772_header7" data-datafield="PersonnelInfo.ResidentBegin" style="">
                                        <label id="ctl66772_Label7" data-datafield="PersonnelInfo.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label></td>
                                    <td id="ctl66772_header8" data-datafield="PersonnelInfo.ResidentEnd" style="">
                                        <label id="ctl66772_Label8" data-datafield="PersonnelInfo.ResidentEnd" data-type="SheetLabel" style="">至</label></td>
                                    <td id="ctl66772_header9" data-datafield="PersonnelInfo.LeaveDate" style="">
                                        <label id="ctl66772_Label9" data-datafield="PersonnelInfo.LeaveDate" data-type="SheetLabel" style="">撤出日期</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl66772_control0" data-datafield="PersonnelInfo.UserName" style="">
                                        <input type="text" data-datafield="PersonnelInfo.UserName" data-type="SheetTextBox" id="ctl66772_control0" style="" class=""></td>
                                    <td id="ctl66772_control1" data-datafield="PersonnelInfo.UserRole" style="" class="">
                                        <input type="text" data-datafield="PersonnelInfo.UserRole" data-type="SheetTextBox" id="ctl66772_control1" style="" class=""></td>
                                    <td id="ctl66772_control2" data-datafield="PersonnelInfo.Depart" style="">
                                        <input type="text" data-datafield="PersonnelInfo.Depart" data-type="SheetTextBox" id="ctl66772_control2" style="" class=""></td>
                                    <td id="ctl66772_control3" data-datafield="PersonnelInfo.Profession" style="" class="">
                                        <input type="text" data-datafield="PersonnelInfo.Profession" data-type="SheetTextBox" id="ctl66772_control3" style="" class=""></td>
                                    <td id="ctl66772_control4" data-datafield="PersonnelInfo.JobTitle" style="">
                                        <input type="text" data-datafield="PersonnelInfo.JobTitle" data-type="SheetTextBox" id="ctl66772_control4" style=""></td>
                                    <td id="ctl66772_control5" data-datafield="PersonnelInfo.Qualification" style="">
                                        <input type="text" data-datafield="PersonnelInfo.Qualification" data-type="SheetTextBox" id="ctl66772_control5" style="" class=""></td>
                                    <td id="ctl66772_control6" data-datafield="PersonnelInfo.AppointmentDate" style="">
                                        <input type="text" data-datafield="PersonnelInfo.AppointmentDate" data-type="SheetTime" id="ctl66772_control6" style="" class=""></td>
                                    <td id="ctl66772_control7" data-datafield="PersonnelInfo.ResidentBegin" style="">
                                        <input type="text" data-datafield="PersonnelInfo.ResidentBegin" data-type="SheetTime" id="ctl66772_control7" style="" class=""></td>
                                    <td id="ctl66772_control8" data-datafield="PersonnelInfo.ResidentEnd" style="">
                                        <input type="text" data-datafield="PersonnelInfo.ResidentEnd" data-type="SheetTime" id="ctl66772_control8" style="" class=""></td>
                                    <td id="ctl66772_control9" data-datafield="PersonnelInfo.LeaveDate" style="">
                                        <input type="text" data-datafield="PersonnelInfo.LeaveDate" data-type="SheetTime" id="ctl66772_control9" style="" class=""></td>
                                    <td class="rowOption hidden"><a class="delete">
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
                    <div id="div713887" class="col-md-2">
                        <label data-datafield="ProjectExpertInfo" data-type="SheetLabel" id="ctl316523" class="" style="">项目专家信息：</label>
                    </div>
                    <div id="div864247" class="col-md-10"></div>
                </div>
                <div class="row">
                    <div id="div606057" class="col-md-12">
                        <table id="ctl189187" data-datafield="ProjectExpertInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl189187_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl189187_header0" data-datafield="ProjectExpertInfo.FullName" style="" class="">
                                        <label id="ctl189187_Label0" data-datafield="ProjectExpertInfo.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                    <td id="ctl189187_header1" data-datafield="ProjectExpertInfo.UserRole" style="">
                                        <label id="ctl189187_Label1" data-datafield="ProjectExpertInfo.UserRole" data-type="SheetLabel" style="">角色</label></td>
                                    <td id="ctl189187_header2" data-datafield="ProjectExpertInfo.Profession" style="" class="">
                                        <label id="ctl189187_Label2" data-datafield="ProjectExpertInfo.Profession" data-type="SheetLabel" style="">专业</label></td>
                                    <td id="ctl189187_header3" data-datafield="ProjectExpertInfo.JobTitle" style="">
                                        <label id="ctl189187_Label3" data-datafield="ProjectExpertInfo.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                    <td id="ctl189187_header4" data-datafield="ProjectExpertInfo.Qualification" style="">
                                        <label id="ctl189187_Label4" data-datafield="ProjectExpertInfo.Qualification" data-type="SheetLabel" style="">职业资格</label></td>
                                    <td id="ctl189187_header5" data-datafield="ProjectExpertInfo.AppointmentDate" style="">
                                        <label id="ctl189187_Label5" data-datafield="ProjectExpertInfo.AppointmentDate" data-type="SheetLabel" style="">任命日期</label></td>
                                    <td id="ctl189187_header6" data-datafield="ProjectExpertInfo.ResidentBegin" style="">
                                        <label id="ctl189187_Label6" data-datafield="ProjectExpertInfo.ResidentBegin" data-type="SheetLabel" style="">常驻日期</label></td>
                                    <td id="ctl189187_header7" data-datafield="ProjectExpertInfo.ResidentEnd" style="">
                                        <label id="ctl189187_Label7" data-datafield="ProjectExpertInfo.ResidentEnd" data-type="SheetLabel" style="">至</label></td>
                                    <td id="ctl189187_header8" data-datafield="ProjectExpertInfo.LeaveDate" style="">
                                        <label id="ctl189187_Label8" data-datafield="ProjectExpertInfo.LeaveDate" data-type="SheetLabel" style="">撤出日期</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl189187_control0" data-datafield="ProjectExpertInfo.FullName" style="" class="">
                                        <input type="text" data-datafield="ProjectExpertInfo.FullName" data-type="SheetTextBox" id="ctl189187_control0" style="" class=""></td>
                                    <td id="ctl189187_control1" data-datafield="ProjectExpertInfo.UserRole" style="" class="">
                                        <input type="text" data-datafield="ProjectExpertInfo.UserRole" data-type="SheetTextBox" id="ctl189187_control1" style="" class=""></td>
                                    <td id="ctl189187_control2" data-datafield="ProjectExpertInfo.Profession" style="width: 11%;" class="">
                                        <select data-datafield="ProjectExpertInfo.Profession" data-type="SheetDropDownList" id="ctl726390" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="0:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false" data-displayemptyitem="true"></select></td>
                                    <td id="ctl189187_control3" data-datafield="ProjectExpertInfo.JobTitle" style="" class="">
                                        <input type="text" data-datafield="ProjectExpertInfo.JobTitle" data-type="SheetTextBox" id="ctl189187_control3" style="" class=""></td>
                                    <td id="ctl189187_control4" data-datafield="ProjectExpertInfo.Qualification" style="">
                                        <input type="text" data-datafield="ProjectExpertInfo.Qualification" data-type="SheetTextBox" id="ctl189187_control4" style="" class=""></td>
                                    <td id="ctl189187_control5" data-datafield="ProjectExpertInfo.AppointmentDate" style="" class="">
                                        <input type="text" data-datafield="ProjectExpertInfo.AppointmentDate" data-type="SheetTime" id="ctl189187_control5" style="" class=""></td>
                                    <td id="ctl189187_control6" data-datafield="ProjectExpertInfo.ResidentBegin" style="" class="">
                                        <input type="text" data-datafield="ProjectExpertInfo.ResidentBegin" data-type="SheetTime" id="ctl189187_control6" style="" class=""></td>
                                    <td id="ctl189187_control7" data-datafield="ProjectExpertInfo.ResidentEnd" style="">
                                        <input type="text" data-datafield="ProjectExpertInfo.ResidentEnd" data-type="SheetTime" id="ctl189187_control7" style="" class=""></td>
                                    <td id="ctl189187_control8" data-datafield="ProjectExpertInfo.LeaveDate" style="" class="">
                                        <input type="text" data-datafield="ProjectExpertInfo.LeaveDate" data-type="SheetTime" id="ctl189187_control8" style="" class=""></td>
                                    <td class="rowOption hidden"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade active" id="budgetInfo">
                <div class="row">
                    <div id="div128869" class="col-md-2">
                        <label data-datafield="GrossProfit" data-type="SheetLabel" id="ctl478090" class="" style="">目前毛利：</label>
                    </div>
                    <div id="div567172" class="col-md-4">
                        <input type="text" data-datafield="GrossProfit" data-type="SheetTextBox" id="ctl460838" class="" style="" data-computationrule="{IncomeTotal}-({LaborCostTotal}+{TravelExpensesTotal}+{OfficeExpensesTotal}+{RentPropertyFeeTotal}+{VehicleCostsTotal}+{CommunicationFeeTotal} +{OtherCostTotal})">
                    </div>
                    <div id="div101872" class="col-md-2"></div>
                    <div id="div704456" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div484535" class="col-md-12">
                        <label data-datafield="ProjectIncome" data-type="SheetLabel" id="ctl109407" class="" style="">项目收入：</label>
                    </div>
                    <div id="div402557" class="col-md-12">
                        <table id="ctl511776" data-datafield="ProjectIncome" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl511776_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl511776_header1" data-datafield="ProjectIncome.Content" style="" class="">
                                        <label id="ctl511776_Label1" data-datafield="ProjectIncome.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl511776_header2" data-datafield="ProjectIncome.Total" style="">
                                        <label id="ctl511776_Label2" data-datafield="ProjectIncome.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl511776_header3" data-datafield="ProjectIncome.Description" style="">
                                        <label id="ctl511776_Label3" data-datafield="ProjectIncome.Description" data-type="SheetLabel" style="">费用说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td class=""></td>
                                    <td id="ctl511776_control1" data-datafield="ProjectIncome.Content" style="" class="">
                                        <input type="text" data-datafield="ProjectIncome.Content" data-type="SheetTextBox" id="ctl511776_control1" style="" class=""></td>
                                    <td id="ctl511776_control2" data-datafield="ProjectIncome.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="ProjectIncome.Total" data-type="SheetTextBox" id="ctl511776_control2" style="" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl511776_control3" data-datafield="ProjectIncome.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="ProjectIncome.Description" data-type="SheetTextBox" id="ctl511776_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl511776_Stat1" data-datafield="ProjectIncome.Content" style=""></td>
                                    <td id="ctl511776_Stat2" data-datafield="ProjectIncome.Total" style="" class="">
                                        <label id="ctl511776_StatControl2" data-datafield="ProjectIncome.Total" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl511776_Stat3" data-datafield="ProjectIncome.Description" style=""></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div488687" class="col-md-2">
                        <label data-datafield="IncomeTotal" data-type="SheetLabel" id="ctl918420" class="" style="">项目收入合计：</label>
                    </div>
                    <div id="div996882" class="col-md-4">
                        <input type="text" data-datafield="IncomeTotal" data-type="SheetTextBox" id="ctl344792" class="" style="" data-computationrule="1,(SUM({ProjectIncome.Total}))/1.06">
                    </div>
                    <div id="div404581" class="col-md-2"></div>
                    <div id="div666154" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div31940" class="col-md-12">
                        <label data-datafield="LaborCost" data-type="SheetLabel" id="ctl636627" class="" style="">人工成本：</label>
                    </div>
                    <div id="div857234" class="col-md-12">
                        <table id="ctl911976" data-datafield="LaborCost" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl911976_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl911976_header1" data-datafield="LaborCost.Content" style="">
                                        <label id="ctl911976_Label1" data-datafield="LaborCost.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl911976_header2" data-datafield="LaborCost.Total" style="">
                                        <label id="ctl911976_Label2" data-datafield="LaborCost.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl911976_header3" data-datafield="LaborCost.Description" style="">
                                        <label id="ctl911976_Label3" data-datafield="LaborCost.Description" data-type="SheetLabel" style="">说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl911976_control1" data-datafield="LaborCost.Content" style="" class="">
                                        <input type="text" data-datafield="LaborCost.Content" data-type="SheetTextBox" id="ctl911976_control1" style="" class=""></td>
                                    <td id="ctl911976_control2" data-datafield="LaborCost.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="LaborCost.Total" data-type="SheetTextBox" id="ctl911976_control2" style="text-align: center;" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl911976_control3" data-datafield="LaborCost.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="LaborCost.Description" data-type="SheetTextBox" id="ctl911976_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl911976_Stat1" data-datafield="LaborCost.Content" style=""></td>
                                    <td id="ctl911976_Stat2" data-datafield="LaborCost.Total" style="" class="">
                                        <label id="ctl911976_StatControl2" data-datafield="LaborCost.Total" data-type="SheetCountLabel" style="margin-left: auto; margin-right: auto"></label>
                                    </td>
                                    <td id="ctl911976_Stat3" data-datafield="LaborCost.Description" style=""></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div96218" class="col-md-2">
                        <label data-datafield="LaborCostTotal" data-type="SheetLabel" id="ctl750303" class="" style="">人工成本合计：</label>
                    </div>
                    <div id="div652115" class="col-md-4">
                        <input type="text" data-datafield="LaborCostTotal" data-type="SheetTextBox" id="ctl859950" class="" style="" data-computationrule="SUM({LaborCost.Total})">
                    </div>
                    <div id="div365183" class="col-md-2"></div>
                    <div id="div475516" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div522437" class="col-md-12">
                        <label data-datafield="TravelExpenses" data-type="SheetLabel" id="ctl630256" class="" style="">差旅费：</label>
                    </div>
                    <div id="div460944" class="col-md-12">
                        <table id="ctl784787" data-datafield="TravelExpenses" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl784787_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl784787_header1" data-datafield="TravelExpenses.Content" style="">
                                        <label id="ctl784787_Label1" data-datafield="TravelExpenses.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl784787_header2" data-datafield="TravelExpenses.Total" style="" class="">
                                        <label id="ctl784787_Label2" data-datafield="TravelExpenses.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl784787_header3" data-datafield="TravelExpenses.Description" style="">
                                        <label id="ctl784787_Label3" data-datafield="TravelExpenses.Description" data-type="SheetLabel" style="">说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td class=""></td>
                                    <td id="ctl784787_control1" data-datafield="TravelExpenses.Content" style="" class="">
                                        <input type="text" data-datafield="TravelExpenses.Content" data-type="SheetTextBox" id="ctl784787_control1" style="" class=""></td>
                                    <td id="ctl784787_control2" data-datafield="TravelExpenses.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="TravelExpenses.Total" data-type="SheetTextBox" id="ctl784787_control2" style="text-align: center;" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl784787_control3" data-datafield="TravelExpenses.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="TravelExpenses.Description" data-type="SheetTextBox" id="ctl784787_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl784787_Stat1" data-datafield="TravelExpenses.Content" style="" class=""></td>
                                    <td id="ctl784787_Stat2" data-datafield="TravelExpenses.Total" style="">
                                        <label id="ctl784787_StatControl2" data-datafield="TravelExpenses.Total" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl784787_Stat3" data-datafield="TravelExpenses.Description" style=""></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div561329" class="col-md-2">
                        <label data-datafield="TravelExpensesTotal" data-type="SheetLabel" id="ctl829834" class="" style="">差旅费合计：</label>
                    </div>
                    <div id="div933146" class="col-md-4">
                        <input type="text" data-datafield="TravelExpensesTotal" data-type="SheetTextBox" id="ctl699053" class="" style="" data-computationrule="SUM({TravelExpenses.Total})">
                    </div>
                    <div id="div307106" class="col-md-2"></div>
                    <div id="div814013" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div246566" class="col-md-12">
                        <label data-datafield="OfficeExpenses" data-type="SheetLabel" id="ctl919652" class="" style="">办公费：</label>
                    </div>
                    <div id="div344321" class="col-md-12">
                        <table id="ctl689959" data-datafield="OfficeExpenses" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl689959_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl689959_header1" data-datafield="OfficeExpenses.Content" style="">
                                        <label id="ctl689959_Label1" data-datafield="OfficeExpenses.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl689959_header2" data-datafield="OfficeExpenses.Total" style="">
                                        <label id="ctl689959_Label2" data-datafield="OfficeExpenses.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl689959_header3" data-datafield="OfficeExpenses.Description" style="">
                                        <label id="ctl689959_Label3" data-datafield="OfficeExpenses.Description" data-type="SheetLabel" style="">说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td class=""></td>
                                    <td id="ctl689959_control1" data-datafield="OfficeExpenses.Content" style="" class="">
                                        <input type="text" data-datafield="OfficeExpenses.Content" data-type="SheetTextBox" id="ctl689959_control1" style="" class=""></td>
                                    <td id="ctl689959_control2" data-datafield="OfficeExpenses.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="OfficeExpenses.Total" data-type="SheetTextBox" id="ctl689959_control2" style="text-align: center;" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl689959_control3" data-datafield="OfficeExpenses.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="OfficeExpenses.Description" data-type="SheetTextBox" id="ctl689959_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl689959_Stat1" data-datafield="OfficeExpenses.Content" style=""></td>
                                    <td id="ctl689959_Stat2" data-datafield="OfficeExpenses.Total" style="" class="">
                                        <label id="ctl689959_StatControl2" data-datafield="OfficeExpenses.Total" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl689959_Stat3" data-datafield="OfficeExpenses.Description" style=""></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div674390" class="col-md-2">
                        <label data-datafield="OfficeExpensesTotal" data-type="SheetLabel" id="ctl805630" class="" style="">办公费合计：</label>
                    </div>
                    <div id="div543918" class="col-md-4">
                        <input type="text" data-datafield="OfficeExpensesTotal" data-type="SheetTextBox" id="ctl642975" class="" style="" data-computationrule="SUM({OfficeExpenses.Total})">
                    </div>
                    <div id="div347455" class="col-md-2"></div>
                    <div id="div328557" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div461753" class="col-md-12">
                        <label data-datafield="RentPropertyFee" data-type="SheetLabel" id="ctl383604" class="" style="">房我租赁和物业费：</label>
                    </div>
                    <div id="div130558" class="col-md-12">
                        <table id="ctl106890" data-datafield="RentPropertyFee" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody class="">
                                <tr class="header">
                                    <td id="ctl106890_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl106890_header1" data-datafield="RentPropertyFee.Content" style="">
                                        <label id="ctl106890_Label1" data-datafield="RentPropertyFee.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl106890_header2" data-datafield="RentPropertyFee.Total" style="">
                                        <label id="ctl106890_Label2" data-datafield="RentPropertyFee.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl106890_header3" data-datafield="RentPropertyFee.Description" style="">
                                        <label id="ctl106890_Label3" data-datafield="RentPropertyFee.Description" data-type="SheetLabel" style="">说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td class=""></td>
                                    <td id="ctl106890_control1" data-datafield="RentPropertyFee.Content" style="" class="">
                                        <input type="text" data-datafield="RentPropertyFee.Content" data-type="SheetTextBox" id="ctl106890_control1" style="" class=""></td>
                                    <td id="ctl106890_control2" data-datafield="RentPropertyFee.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="RentPropertyFee.Total" data-type="SheetTextBox" id="ctl106890_control2" style="text-align: center;" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl106890_control3" data-datafield="RentPropertyFee.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="RentPropertyFee.Description" data-type="SheetTextBox" id="ctl106890_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl106890_Stat1" data-datafield="RentPropertyFee.Content" style=""></td>
                                    <td id="ctl106890_Stat2" data-datafield="RentPropertyFee.Total" style="" class="">
                                        <label id="ctl106890_StatControl2" data-datafield="RentPropertyFee.Total" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl106890_Stat3" data-datafield="RentPropertyFee.Description" style="" class=""></td>
                                    <td class=""></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div596931" class="col-md-2">
                        <label data-datafield="RentPropertyFeeTotal" data-type="SheetLabel" id="ctl156935" class="" style="">房我租赁和物业费合计：</label>
                    </div>
                    <div id="div205499" class="col-md-4">
                        <input type="text" data-datafield="RentPropertyFeeTotal" data-type="SheetTextBox" id="ctl172843" class="" style="" data-computationrule="SUM({RentPropertyFee.Total})">
                    </div>
                    <div id="div683530" class="col-md-2"></div>
                    <div id="div155630" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div216777" class="col-md-12">
                        <label data-datafield="VehicleCosts" data-type="SheetLabel" id="ctl775675" class="" style="">车辆费用：</label>
                    </div>
                    <div id="div966941" class="col-md-12">
                        <table id="ctl286204" data-datafield="VehicleCosts" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl286204_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl286204_header1" data-datafield="VehicleCosts.Content" style="">
                                        <label id="ctl286204_Label1" data-datafield="VehicleCosts.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl286204_header2" data-datafield="VehicleCosts.Total" style="">
                                        <label id="ctl286204_Label2" data-datafield="VehicleCosts.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl286204_header3" data-datafield="VehicleCosts.Description" style="">
                                        <label id="ctl286204_Label3" data-datafield="VehicleCosts.Description" data-type="SheetLabel" style="">说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl286204_control1" data-datafield="VehicleCosts.Content" style="" class="">
                                        <input type="text" data-datafield="VehicleCosts.Content" data-type="SheetTextBox" id="ctl286204_control1" style="" class=""></td>
                                    <td id="ctl286204_control2" data-datafield="VehicleCosts.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="VehicleCosts.Total" data-type="SheetTextBox" id="ctl286204_control2" style="text-align: center;" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl286204_control3" data-datafield="VehicleCosts.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="VehicleCosts.Description" data-type="SheetTextBox" id="ctl286204_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl286204_Stat1" data-datafield="VehicleCosts.Content" style=""></td>
                                    <td id="ctl286204_Stat2" data-datafield="VehicleCosts.Total" style="">
                                        <label id="ctl286204_StatControl2" data-datafield="VehicleCosts.Total" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl286204_Stat3" data-datafield="VehicleCosts.Description" style=""></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div243278" class="col-md-2">
                        <label data-datafield="VehicleCostsTotal" data-type="SheetLabel" id="ctl867034" class="" style="">车辆费用合计：</label>
                    </div>
                    <div id="div100102" class="col-md-4">
                        <input type="text" data-datafield="VehicleCostsTotal" data-type="SheetTextBox" id="ctl479825" class="" style="" data-computationrule="SUM({VehicleCosts.Total})">
                    </div>
                    <div id="div415174" class="col-md-2"></div>
                    <div id="div634365" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div836082" class="col-md-12">
                        <label data-datafield="CommunicationFee" data-type="SheetLabel" id="ctl162153" class="" style="">邮电通讯费：</label>
                    </div>
                    <div id="div622364" class="col-md-12">
                        <table id="ctl344815" data-datafield="CommunicationFee" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl344815_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl344815_header1" data-datafield="CommunicationFee.Content" style="">
                                        <label id="ctl344815_Label1" data-datafield="CommunicationFee.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl344815_header2" data-datafield="CommunicationFee.Total" style="">
                                        <label id="ctl344815_Label2" data-datafield="CommunicationFee.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl344815_header3" data-datafield="CommunicationFee.Description" style="">
                                        <label id="ctl344815_Label3" data-datafield="CommunicationFee.Description" data-type="SheetLabel" style="">说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl344815_control1" data-datafield="CommunicationFee.Content" style="" class="">
                                        <input type="text" data-datafield="CommunicationFee.Content" data-type="SheetTextBox" id="ctl344815_control1" style="" class=""></td>
                                    <td id="ctl344815_control2" data-datafield="CommunicationFee.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="CommunicationFee.Total" data-type="SheetTextBox" id="ctl344815_control2" style="text-align: center;" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl344815_control3" data-datafield="CommunicationFee.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="CommunicationFee.Description" data-type="SheetTextBox" id="ctl344815_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl344815_Stat1" data-datafield="CommunicationFee.Content" style=""></td>
                                    <td id="ctl344815_Stat2" data-datafield="CommunicationFee.Total" style="">
                                        <label id="ctl344815_StatControl2" data-datafield="CommunicationFee.Total" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl344815_Stat3" data-datafield="CommunicationFee.Description" style=""></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div266693" class="col-md-2">
                        <label data-datafield="CommunicationFeeTotal" data-type="SheetLabel" id="ctl602705" class="" style="">邮电通讯费合计：</label>
                    </div>
                    <div id="div9798" class="col-md-4">
                        <input type="text" data-datafield="CommunicationFeeTotal" data-type="SheetTextBox" id="ctl684927" class="" style="" data-computationrule="SUM({CommunicationFee.Total})">
                    </div>
                    <div id="div499843" class="col-md-2"></div>
                    <div id="div211255" class="col-md-4"></div>
                </div>
                <div class="row">
                    <div id="div476702" class="col-md-12">
                        <label data-datafield="OtherCost" data-type="SheetLabel" id="ctl875822" class="" style="">其他成本：</label>
                    </div>
                    <div id="div784631" class="col-md-12">
                        <table id="ctl295019" data-datafield="OtherCost" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl295019_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl295019_header1" data-datafield="OtherCost.Content" style="">
                                        <label id="ctl295019_Label1" data-datafield="OtherCost.Content" data-type="SheetLabel" style="">内容</label></td>
                                    <td id="ctl295019_header2" data-datafield="OtherCost.Total" style="">
                                        <label id="ctl295019_Label2" data-datafield="OtherCost.Total" data-type="SheetLabel" style="">合计</label></td>
                                    <td id="ctl295019_header3" data-datafield="OtherCost.Description" style="">
                                        <label id="ctl295019_Label3" data-datafield="OtherCost.Description" data-type="SheetLabel" style="">说明</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td class=""></td>
                                    <td id="ctl295019_control1" data-datafield="OtherCost.Content" style="" class="">
                                        <input type="text" data-datafield="OtherCost.Content" data-type="SheetTextBox" id="ctl295019_control1" style="" class=""></td>
                                    <td id="ctl295019_control2" data-datafield="OtherCost.Total" style="width: 12%;" class="" data-tooltip="请输入金额">
                                        <input type="text" data-datafield="OtherCost.Total" data-type="SheetTextBox" id="ctl295019_control2" style="text-align: center;" class="" data-tooltip="请输入金额"></td>
                                    <td id="ctl295019_control3" data-datafield="OtherCost.Description" style="" class="" data-placeholder="请输入费用说明">
                                        <input type="text" data-datafield="OtherCost.Description" data-type="SheetTextBox" id="ctl295019_control3" style="" class="" data-placeholder="请输入费用说明"></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl295019_Stat1" data-datafield="OtherCost.Content" style="" class=""></td>
                                    <td id="ctl295019_Stat2" data-datafield="OtherCost.Total" style="" class="">
                                        <label id="ctl295019_StatControl2" data-datafield="OtherCost.Total" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl295019_Stat3" data-datafield="OtherCost.Description" style=""></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div9679" class="col-md-2">
                        <label data-datafield="OtherCostTotal" data-type="SheetLabel" id="ctl581658" class="" style="">其他成本合计：</label>
                    </div>
                    <div id="div835885" class="col-md-4">
                        <input type="text" data-datafield="OtherCostTotal" data-type="SheetTextBox" id="ctl437856" class="" style="" data-computationrule="SUM({OtherCost.Total})">
                    </div>
                    <div id="div462815" class="col-md-2"></div>
                    <div id="div8916" class="col-md-4"></div>
                </div>
            </div>
            <div class="tab-pane fade active" id="progressInfo">
                <div class="row">
                    <div id="title23" class="col-md-2">
                        <span id="Label28" data-type="SheetLabel" data-datafield="ProjectStartDate" style="" class="">项目工作开始时间：</span>
                    </div>
                    <div id="control23" class="col-md-4">
                        <input id="Control28" type="text" data-datafield="ProjectStartDate" data-type="SheetTime" style="" class="" data-defaultvalue="">
                    </div>
                    <div id="space24" class="col-md-2">
                    </div>
                    <div id="spaceControl24" class="col-md-4">
                    </div>
                </div>
                <div class="row">
                    <div id="div375268" class="col-md-12">
                        <label data-datafield="ProjectProgress" data-type="SheetLabel" id="ctl569380" class="" style="">项目形象进度计划表：</label>
                    </div>
                    <div id="div308437" class="col-md-12">
                        <table id="ctl905899" data-datafield="ProjectProgress" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl905899_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl905899_header0" data-datafield="ProjectProgress.ScheduleBegin" style="">
                                        <label id="ctl905899_Label0" data-datafield="ProjectProgress.ScheduleBegin" data-type="SheetLabel" style="">项目进度计划开始时间</label></td>
                                    <td id="ctl905899_header1" data-datafield="ProjectProgress.ScheduleEnd" style="">
                                        <label id="ctl905899_Label1" data-datafield="ProjectProgress.ScheduleEnd" data-type="SheetLabel" style="">项目进度计划结束时间</label></td>
                                    <td id="ctl905899_header2" data-datafield="ProjectProgress.ItemDescription" style="">
                                        <label id="ctl905899_Label2" data-datafield="ProjectProgress.ItemDescription" data-type="SheetLabel" style="">项目节点说明</label></td>
                                    <td id="ctl905899_header3" data-datafield="ProjectProgress.ProjectSchedule" style="">
                                        <label id="ctl905899_Label3" data-datafield="ProjectProgress.ProjectSchedule" data-type="SheetLabel" style="">项目进度</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl905899_control0" data-datafield="ProjectProgress.ScheduleBegin" style="width: 15%;" class="">
                                        <input type="text" data-datafield="ProjectProgress.ScheduleBegin" data-type="SheetTime" id="ctl905899_control0" style="" class=""></td>
                                    <td id="ctl905899_control1" data-datafield="ProjectProgress.ScheduleEnd" style="width: 15%;" class="">
                                        <input type="text" data-datafield="ProjectProgress.ScheduleEnd" data-type="SheetTime" id="ctl905899_control1" style="" class=""></td>
                                    <td id="ctl905899_control2" data-datafield="ProjectProgress.ItemDescription" style="" class="">
                                        <textarea data-datafield="ProjectProgress.ItemDescription" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl905899_control2" class=""></textarea></td>
                                    <td id="ctl905899_control3" data-datafield="ProjectProgress.ProjectSchedule" style="width: 10%;" class="">
                                        <input type="text" style="text-align: center;" data-datafield="ProjectProgress.ProjectSchedule" data-type="SheetTextBox" id="ctl905899_control3" class=""></td>
                                    <td class="rowOption hidden"><a class="delete">
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
                    <div id="div890677" class="col-md-12">
                        <label data-datafield="xxjdgzb" data-type="SheetLabel" id="ctl72493" class="" style="">项目形象进度跟踪表：</label>
                    </div>
                    <div id="div437701" class="col-md-12">
                        <table id="ctl612433" data-datafield="xxjdgzb" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl612433_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl612433_header0" data-datafield="xxjdgzb.ProgressBegin" style="">
                                        <label id="ctl612433_Label0" data-datafield="xxjdgzb.ProgressBegin" data-type="SheetLabel" style="">项目实际进度开始</label></td>
                                    <td id="ctl612433_header1" data-datafield="xxjdgzb.ProgressEnd" style="">
                                        <label id="ctl612433_Label1" data-datafield="xxjdgzb.ProgressEnd" data-type="SheetLabel" style="">项目实际进度结束</label></td>
                                    <td id="ctl612433_header2" data-datafield="xxjdgzb.ItemDescription" style="">
                                        <label id="ctl612433_Label2" data-datafield="xxjdgzb.ItemDescription" data-type="SheetLabel" style="">项目节点说明</label></td>
                                    <td id="ctl612433_header3" data-datafield="xxjdgzb.ProjectProcess" style="">
                                        <label id="ctl612433_Label3" data-datafield="xxjdgzb.ProjectProcess" data-type="SheetLabel" style="">项目实际进度（不累计）</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl612433_control0" data-datafield="xxjdgzb.ProgressBegin" style="width: 15%;" class="">
                                        <input type="text" data-datafield="xxjdgzb.ProgressBegin" data-type="SheetTime" id="ctl612433_control0" style="" class=""></td>
                                    <td id="ctl612433_control1" data-datafield="xxjdgzb.ProgressEnd" style="width: 15%;" class="">
                                        <input type="text" data-datafield="xxjdgzb.ProgressEnd" data-type="SheetTime" id="ctl612433_control1" style="" class=""></td>
                                    <td id="ctl612433_control2" data-datafield="xxjdgzb.ItemDescription" style="" class="">
                                        <textarea data-datafield="xxjdgzb.ItemDescription" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl612433_control2" class=""></textarea></td>
                                    <td id="ctl612433_control3" data-datafield="xxjdgzb.ProjectProcess" style="width: 10%;" class="">
                                        <input type="text" data-datafield="xxjdgzb.ProjectProcess" data-type="SheetTextBox" id="ctl612433_control3" style="text-align: center;" class=""></td>
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
            </div>
            <div class="tab-pane fade active" id="paymentInfo">
                <div class="row">
                    <div id="div24581" class="col-md-12">
                        <label data-datafield="SFKSchedule" data-type="SheetLabel" id="ctl872536" class="" style="">收付款计划表：</label>
                    </div>
                    <div id="div176612" class="col-md-12">
                        <table id="ctl613201" data-datafield="SFKSchedule" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl613201_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl613201_header0" data-datafield="SFKSchedule.PlanTitle" style="">
                                        <label id="ctl613201_Label0" data-datafield="SFKSchedule.PlanTitle" data-type="SheetLabel" style="">收款计划</label></td>
                                    <td id="ctl613201_header1" data-datafield="SFKSchedule.PlanDate" style="">
                                        <label id="ctl613201_Label1" data-datafield="SFKSchedule.PlanDate" data-type="SheetLabel" style="">收款计划时间</label></td>
                                    <td id="ctl613201_header2" data-datafield="SFKSchedule.PaymentDescription" style="">
                                        <label id="ctl613201_Label2" data-datafield="SFKSchedule.PaymentDescription" data-type="SheetLabel" style="">付款节点说明</label></td>
                                    <td id="ctl613201_header3" data-datafield="SFKSchedule.PaymentPercentage" style="">
                                        <label id="ctl613201_Label3" data-datafield="SFKSchedule.PaymentPercentage" data-type="SheetLabel" style="">计划付款百分比（不累计）</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl613201_control0" data-datafield="SFKSchedule.PlanTitle" style="" class="">
                                        <input type="text" data-datafield="SFKSchedule.PlanTitle" data-type="SheetTextBox" id="ctl613201_control0" style="" class=""></td>
                                    <td id="ctl613201_control1" data-datafield="SFKSchedule.PlanDate" style="width: 15%;" class="">
                                        <input type="text" data-datafield="SFKSchedule.PlanDate" data-type="SheetTime" id="ctl613201_control1" style="" class=""></td>
                                    <td id="ctl613201_control2" data-datafield="SFKSchedule.PaymentDescription" style="" class="">
                                        <textarea data-datafield="SFKSchedule.PaymentDescription" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl613201_control2" class=""></textarea></td>
                                    <td id="ctl613201_control3" data-datafield="SFKSchedule.PaymentPercentage" style="width: 10%;" class="">
                                        <input type="text" style="text-align: center;" data-datafield="SFKSchedule.PaymentPercentage" data-type="SheetTextBox" id="ctl613201_control3" style="" class=""></td>
                                    <td class="rowOption hidden"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl613201_Stat0" data-datafield="SFKSchedule.PlanTitle" style=""></td>
                                    <td id="ctl613201_Stat1" data-datafield="SFKSchedule.PlanDate" style="" class=""></td>
                                    <td id="ctl613201_Stat2" data-datafield="SFKSchedule.PaymentDescription" style=""></td>
                                    <td id="ctl613201_Stat3" data-datafield="SFKSchedule.PaymentPercentage" style="">
                                        <label id="ctl613201_StatControl3" data-datafield="SFKSchedule.PaymentPercentage" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td class="hidden"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div102831" class="col-md-12">
                        <label data-datafield="SFKTrackingTable" data-type="SheetLabel" id="ctl727293" class="" style="">收付款跟踪表：</label>
                    </div>
                    <div id="div780700" class="col-md-12">
                        <table id="ctl281997" data-datafield="SFKTrackingTable" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl281997_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl281997_header0" data-datafield="SFKTrackingTable.PaymentTitle" style="">
                                        <label id="ctl281997_Label0" data-datafield="SFKTrackingTable.PaymentTitle" data-type="SheetLabel" style="">实际付款</label></td>
                                    <td id="ctl281997_header1" data-datafield="SFKTrackingTable.ActualPaymentTime" style="">
                                        <label id="ctl281997_Label1" data-datafield="SFKTrackingTable.ActualPaymentTime" data-type="SheetLabel" style="">实际付款时间</label></td>
                                    <td id="ctl281997_header2" data-datafield="SFKTrackingTable.PaymentDescription" style="">
                                        <label id="ctl281997_Label2" data-datafield="SFKTrackingTable.PaymentDescription" data-type="SheetLabel" style="">付款节点说明</label></td>
                                    <td id="ctl281997_header3" data-datafield="SFKTrackingTable.ActualPaymentPercentage" style="">
                                        <label id="ctl281997_Label3" data-datafield="SFKTrackingTable.ActualPaymentPercentage" data-type="SheetLabel" style="">实际付款百分比</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl281997_control0" data-datafield="SFKTrackingTable.PaymentTitle" style="" class="">
                                        <input type="text" data-datafield="SFKTrackingTable.PaymentTitle" data-type="SheetTextBox" id="ctl281997_control0" style="" class=""></td>
                                    <td id="ctl281997_control1" data-datafield="SFKTrackingTable.ActualPaymentTime" style="width: 15%;" class="">
                                        <input type="text" data-datafield="SFKTrackingTable.ActualPaymentTime" data-type="SheetTime" id="ctl281997_control1" style="" class=""></td>
                                    <td id="ctl281997_control2" data-datafield="SFKTrackingTable.PaymentDescription" style="" class="">
                                        <textarea data-datafield="SFKTrackingTable.PaymentDescription" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl281997_control2" class=""></textarea></td>
                                    <td id="ctl281997_control3" data-datafield="SFKTrackingTable.ActualPaymentPercentage" style="width: 10%;" class="">
                                        <input type="text" style="text-align: center;" data-datafield="SFKTrackingTable.ActualPaymentPercentage" data-type="SheetTextBox" id="ctl281997_control3" style="" class=""></td>
                                    <td class="rowOption"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl281997_Stat0" data-datafield="SFKTrackingTable.PaymentTitle" style=""></td>
                                    <td id="ctl281997_Stat1" data-datafield="SFKTrackingTable.ActualPaymentTime" style=""></td>
                                    <td id="ctl281997_Stat2" data-datafield="SFKTrackingTable.PaymentDescription" style=""></td>
                                    <td id="ctl281997_Stat3" data-datafield="SFKTrackingTable.ActualPaymentPercentage" style="">
                                        <label id="ctl281997_StatControl3" data-datafield="SFKTrackingTable.ActualPaymentPercentage" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td class=""></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade active" id="supportingInfo">
                <div class="row tableContent">
                    <div id="title31" class="col-md-12">
                        <span id="Label32" data-type="SheetLabel" data-datafield="CarRentalInfo" style="" class="">项目现有租车信息：</span>
                    </div>
                    <div id="control31" class="col-md-12">
                        <table id="Control32" data-datafield="CarRentalInfo" data-type="SheetGridView" class="SheetGridView" data-displayadd="false">
                            <tbody>

                                <tr class="header">
                                    <td id="Control32_SerialNo" class="rowSerialNo">序号								</td>
                                    <td id="Control32_Header3" data-datafield="CarRentalInfo.Type">
                                        <label id="Control32_Label3" data-datafield="CarRentalInfo.Type" data-type="SheetLabel" style="">车辆型号</label>
                                    </td>
                                    <td id="Control32_Header4" data-datafield="CarRentalInfo.Plate">
                                        <label id="Control32_Label4" data-datafield="CarRentalInfo.Plate" data-type="SheetLabel" style="">车牌号</label>
                                    </td>
                                    <td id="Control32_Header5" data-datafield="CarRentalInfo.Seat">
                                        <label id="Control32_Label5" data-datafield="CarRentalInfo.Seat" data-type="SheetLabel" style="">座位数量</label>
                                    </td>
                                    <td class="rowOption hidden">删除								</td>
                                </tr>
                                <tr class="template">
                                    <td id="Control32_Option" class="rowOption"></td>
                                    <td data-datafield="CarRentalInfo.Type">
                                        <input id="Control32_ctl3" type="text" data-datafield="CarRentalInfo.Type" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td data-datafield="CarRentalInfo.Plate">
                                        <input id="Control32_ctl4" type="text" data-datafield="CarRentalInfo.Plate" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td data-datafield="CarRentalInfo.Seat">
                                        <input id="Control32_ctl5" style="text-align: center;" type="text" data-datafield="CarRentalInfo.Seat" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td class="rowOption hidden">
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
                                    <td class="rowOption"></td>
                                    <td data-datafield="CarRentalInfo.Type"></td>
                                    <td data-datafield="CarRentalInfo.Plate"></td>
                                    <td data-datafield="CarRentalInfo.Seat">
                                        <label id="Control32_stat5" data-datafield="CarRentalInfo.Seat" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td class="rowOption hidden"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row tableContent">
                    <div id="title33" class="col-md-12">
                        <span id="Label33" data-type="SheetLabel" data-datafield="RentalInfo" style="" class="">租房信息：</span>
                    </div>
                    <div id="control33" class="col-md-12">
                        <table id="Control33" data-datafield="RentalInfo" data-type="SheetGridView" class="SheetGridView" data-displayadd="false">
                            <tbody>

                                <tr class="header">
                                    <td id="Control33_SerialNo" class="rowSerialNo">序号								</td>
                                    <td id="Control33_Header3" data-datafield="RentalInfo.Place">
                                        <label id="Control33_Label3" data-datafield="RentalInfo.Place" data-type="SheetLabel" style="">租房处所</label>
                                    </td>
                                    <td id="Control33_Header4" data-datafield="RentalInfo.Personnel" class="">
                                        <label id="Control33_Label4" data-datafield="RentalInfo.Personnel" data-type="SheetLabel" style="">住宿人员</label>
                                    </td>
                                    <td id="Control33_Header5" data-datafield="RentalInfo.Type">
                                        <label id="Control33_Label5" data-datafield="RentalInfo.Type" data-type="SheetLabel" style="">户型</label>
                                    </td>
                                    <td class="rowOption hidden">删除								</td>
                                </tr>
                                <tr class="template">
                                    <td id="Control33_Option" class="rowOption"></td>
                                    <td data-datafield="RentalInfo.Place">
                                        <input id="Control33_ctl3" type="text" data-datafield="RentalInfo.Place" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td data-datafield="RentalInfo.Personnel" class="">
                                        <input id="Control33_ctl4" type="text" data-datafield="RentalInfo.Personnel" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td data-datafield="RentalInfo.Type" class="">
                                        <input id="Control33_ctl5" style="text-align: center;" type="text" data-datafield="RentalInfo.Type" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td class="rowOption hidden">
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
                                    <td class="rowOption"></td>
                                    <td data-datafield="RentalInfo.Place"></td>
                                    <td data-datafield="RentalInfo.Personnel"></td>
                                    <td data-datafield="RentalInfo.Type"></td>
                                    <td class="rowOption hidden"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row tableContent">
                    <div id="title35" class="col-md-12">
                        <span id="Label34" data-type="SheetLabel" data-datafield="ExpertResources" style="" class="">专家资源：</span>
                    </div>
                    <div id="control35" class="col-md-12">
                        <table id="Control34" data-datafield="ExpertResources" data-type="SheetGridView" class="SheetGridView">
                            <tbody>

                                <tr class="header">
                                    <td id="Control34_SerialNo" class="rowSerialNo">序号								</td>
                                    <td id="Control34_Header3" data-datafield="ExpertResources.ProfessionalExperts">
                                        <label id="Control34_Label3" data-datafield="ExpertResources.ProfessionalExperts" data-type="SheetLabel" style="">专家专业</label>
                                    </td>
                                    <td id="Control34_Header4" data-datafield="ExpertResources.UseTimes">
                                        <label id="Control34_Label4" data-datafield="ExpertResources.UseTimes" data-type="SheetLabel" style="">使用人次</label>
                                    </td>
                                    <td id="Control34_Header5" data-datafield="ExpertResources.UseDate">
                                        <label id="Control34_Label5" data-datafield="ExpertResources.UseDate" data-type="SheetLabel" style="">使用日期</label>
                                    </td>
                                    <td class="rowOption">删除								</td>
                                </tr>
                                <tr class="template">
                                    <td id="Control34_Option" class="rowOption"></td>
                                    <td data-datafield="ExpertResources.ProfessionalExperts">
                                        <input id="Control34_ctl3" type="text" data-datafield="ExpertResources.ProfessionalExperts" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td data-datafield="ExpertResources.UseTimes">
                                        <input id="Control34_ctl4" type="text" data-datafield="ExpertResources.UseTimes" data-type="SheetTextBox" style="" class="">
                                    </td>
                                    <td data-datafield="ExpertResources.UseDate">
                                        <input id="Control34_ctl5" type="text" data-datafield="ExpertResources.UseDate" data-type="SheetTime" style="" class="">
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
                                    <td class="rowOption"></td>
                                    <td data-datafield="ExpertResources.ProfessionalExperts"></td>
                                    <td data-datafield="ExpertResources.UseTimes"></td>
                                    <td data-datafield="ExpertResources.UseDate"></td>
                                    <td class="rowOption"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade active" id="outsourcingInfo">
                <div class="row">
                    <div id="div883788" class="col-md-12">
                        <label data-datafield="OutsourcingInfo" data-type="SheetLabel" id="ctl538945" class="" style="">委外信息</label>
                    </div>
                    <div id="div756101" class="col-md-12">
                        <table id="ctl430603" data-datafield="OutsourcingInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl430603_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl430603_header0" data-datafield="OutsourcingInfo.Unit" style="">
                                        <label id="ctl430603_Label0" data-datafield="OutsourcingInfo.Unit" data-type="SheetLabel" style="">委外单位</label></td>
                                    <td id="ctl430603_header1" data-datafield="OutsourcingInfo.Amount" style="">
                                        <label id="ctl430603_Label1" data-datafield="OutsourcingInfo.Amount" data-type="SheetLabel" style="">委外金额（元）</label></td>
                                    <td id="ctl430603_header2" data-datafield="OutsourcingInfo.ContractNumber" style="">
                                        <label id="ctl430603_Label2" data-datafield="OutsourcingInfo.ContractNumber" data-type="SheetLabel" style="">委外合同编号</label></td>
                                    <td id="ctl430603_header3" data-datafield="OutsourcingInfo.Operate" style="">
                                        <label id="ctl430603_Label3" data-datafield="OutsourcingInfo.Operate" data-type="SheetLabel" style="">查看</label></td>
                                    <td id="ctl430603_header4" data-datafield="OutsourcingInfo.ProjectOutsideId" style="" class="hidden">
                                        <label id="ctl430603_Label4" data-datafield="OutsourcingInfo.ProjectOutsideId" data-type="SheetLabel" style="">委外id</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl430603_control0" data-datafield="OutsourcingInfo.Unit" style="">
                                        <input type="text" data-datafield="OutsourcingInfo.Unit" data-type="SheetTextBox" id="ctl430603_control0" style="" class=""></td>
                                    <td id="ctl430603_control1" data-datafield="OutsourcingInfo.Amount" style="">
                                        <input type="text" data-datafield="OutsourcingInfo.Amount" data-type="SheetTextBox" id="ctl430603_control1" style="text-align: center;"></td>
                                    <td id="ctl430603_control2" data-datafield="OutsourcingInfo.ContractNumber" style="">
                                        <input type="text" data-datafield="OutsourcingInfo.ContractNumber" data-type="SheetTextBox" id="ctl430603_control2" style="" class=""></td>
                                    <td id="ctl430603_control3" data-datafield="OutsourcingInfo.Operate" style="width: 6%;" class="">

                                        <a href="javascript:void(0)" target="_blank">查看</a>
                                    </td>
                                    <td id="ctl430603_control4" data-datafield="OutsourcingInfo.ProjectOutsideId" style="" class="hidden">
                                        <input type="text" data-datafield="OutsourcingInfo.ProjectOutsideId" data-type="SheetTextBox" id="ctl430603_control4" style="">
                                    </td>
                                    <td class="rowOption hidden"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                                <tr class="footer">
                                    <td></td>
                                    <td id="ctl430603_Stat0" data-datafield="OutsourcingInfo.Unit" style="" class=""></td>
                                    <td id="ctl430603_Stat1" data-datafield="OutsourcingInfo.Amount" style="">
                                        <label id="ctl430603_StatControl1" data-datafield="OutsourcingInfo.Amount" data-type="SheetCountLabel" style=""></label>
                                    </td>
                                    <td id="ctl430603_Stat2" data-datafield="OutsourcingInfo.ContractNumber" style="" class=""></td>
                                    <td id="ctl430603_Stat3" data-datafield="OutsourcingInfo.Operate" style="" class=""></td>
                                    <td id="ctl430603_Stat4" data-datafield="OutsourcingInfo.ProjectOutsideId" style="" class="hidden"></td>
                                    <td class="hidden"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade active" id="communicatingInfo">
                <div class="row tableContent">
                    <div id="title39" class="col-md-12">
                        <span id="Label36" data-type="SheetLabel" data-datafield="ExternalInterface" style="" class="">外部接口：</span>
                    </div>
                    <div id="control39" class="col-md-12">
                        <table id="Control36" data-datafield="ExternalInterface" data-type="SheetGridView" class="SheetGridView">
                            <tbody>

                                <tr class="header">
                                    <td id="Control36_SerialNo" class="rowSerialNo">序号								</td>
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
                                    <td class="rowOption">删除								</td>
                                </tr>
                                <tr class="template">
                                    <td id="Control36_Option" class="rowOption"></td>
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
                                    <td class="rowOption"></td>
                                    <td data-datafield="ExternalInterface.UserName"></td>
                                    <td data-datafield="ExternalInterface.Unit"></td>
                                    <td data-datafield="ExternalInterface.Depart"></td>
                                    <td data-datafield="ExternalInterface.Post"></td>
                                    <td data-datafield="ExternalInterface.JobTitle"></td>
                                    <td data-datafield="ExternalInterface.Phone"></td>
                                    <td data-datafield="ExternalInterface.Email"></td>
                                    <td data-datafield="ExternalInterface.OtherContact"></td>
                                    <td class="rowOption"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="div764712" class="col-md-12"><span id="Label37" data-type="SheetLabel" data-datafield="InternalInterface" style="" class="">内部接口：</span></div>
                    <div id="div6152" class="col-md-12">
                        <table id="ctl377768" data-datafield="InternalInterface" data-type="SheetGridView" class="SheetGridView" style="">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl377768_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl377768_header0" data-datafield="InternalInterface.UserName" style="">
                                        <label id="ctl377768_Label0" data-datafield="InternalInterface.UserName" data-type="SheetLabel" style="">姓名</label></td>
                                    <td id="ctl377768_header1" data-datafield="InternalInterface.Unit" style="">
                                        <label id="ctl377768_Label1" data-datafield="InternalInterface.Unit" data-type="SheetLabel" style="">单位</label></td>
                                    <td id="ctl377768_header2" data-datafield="InternalInterface.Depart" style="">
                                        <label id="ctl377768_Label2" data-datafield="InternalInterface.Depart" data-type="SheetLabel" style="">部门</label></td>
                                    <td id="ctl377768_header3" data-datafield="InternalInterface.Post" style="">
                                        <label id="ctl377768_Label3" data-datafield="InternalInterface.Post" data-type="SheetLabel" style="">职务</label></td>
                                    <td id="ctl377768_header4" data-datafield="InternalInterface.JobTitle" style="">
                                        <label id="ctl377768_Label4" data-datafield="InternalInterface.JobTitle" data-type="SheetLabel" style="">职称</label></td>
                                    <td id="ctl377768_header5" data-datafield="InternalInterface.Phone" style="">
                                        <label id="ctl377768_Label5" data-datafield="InternalInterface.Phone" data-type="SheetLabel" style="">联系电话</label></td>
                                    <td id="ctl377768_header6" data-datafield="InternalInterface.Email" style="">
                                        <label id="ctl377768_Label6" data-datafield="InternalInterface.Email" data-type="SheetLabel" style="">邮箱</label></td>
                                    <td id="ctl377768_header7" data-datafield="InternalInterface.OtherContact" style="">
                                        <label id="ctl377768_Label7" data-datafield="InternalInterface.OtherContact" data-type="SheetLabel" style="">其他联系方式</label></td>
                                    <td class="rowOption">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl377768_control0" data-datafield="InternalInterface.UserName" style="">
                                        <input type="text" data-datafield="InternalInterface.UserName" data-type="SheetTextBox" id="ctl377768_control0" style=""></td>
                                    <td id="ctl377768_control1" data-datafield="InternalInterface.Unit" style="">
                                        <input type="text" data-datafield="InternalInterface.Unit" data-type="SheetTextBox" id="ctl377768_control1" style=""></td>
                                    <td id="ctl377768_control2" data-datafield="InternalInterface.Depart" style="">
                                        <input type="text" data-datafield="InternalInterface.Depart" data-type="SheetTextBox" id="ctl377768_control2" style=""></td>
                                    <td id="ctl377768_control3" data-datafield="InternalInterface.Post" style="">
                                        <input type="text" data-datafield="InternalInterface.Post" data-type="SheetTextBox" id="ctl377768_control3" style=""></td>
                                    <td id="ctl377768_control4" data-datafield="InternalInterface.JobTitle" style="">
                                        <input type="text" data-datafield="InternalInterface.JobTitle" data-type="SheetTextBox" id="ctl377768_control4" style=""></td>
                                    <td id="ctl377768_control5" data-datafield="InternalInterface.Phone" style="">
                                        <input type="text" data-datafield="InternalInterface.Phone" data-type="SheetTextBox" id="ctl377768_control5" style=""></td>
                                    <td id="ctl377768_control6" data-datafield="InternalInterface.Email" style="">
                                        <input type="text" data-datafield="InternalInterface.Email" data-type="SheetTextBox" id="ctl377768_control6" style=""></td>
                                    <td id="ctl377768_control7" data-datafield="InternalInterface.OtherContact" style="">
                                        <input type="text" data-datafield="InternalInterface.OtherContact" data-type="SheetTextBox" id="ctl377768_control7" style=""></td>
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
            </div>
            <!--<div class="tab-pane fade" id="ejb2">-->
            <!---->
            <!--</div>-->
            <div class="tab-pane fade active" id="projectInfo">
                <div class="row">
                    <div id="div177241" class="col-md-12">
                        <label data-datafield="ProjectSummaryInfo" data-type="SheetLabel" id="ctl382942" class="" style="">项目总结资料：</label>
                    </div>
                    <div id="div431969" class="col-md-12">
                        <table id="ctl642268" data-datafield="ProjectSummaryInfo" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl642268_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl642268_header0" data-datafield="ProjectSummaryInfo.DataName" style="">
                                        <label id="ctl642268_Label0" data-datafield="ProjectSummaryInfo.DataName" data-type="SheetLabel" style="">姓名名称</label></td>
                                    <td id="ctl642268_header1" data-datafield="ProjectSummaryInfo.PNote" style="">
                                        <label id="ctl642268_Label1" data-datafield="ProjectSummaryInfo.PNote" data-type="SheetLabel" style="">备注</label></td>
                                    <td id="ctl642268_header2" data-datafield="ProjectSummaryInfo.ImportDate" style="">
                                        <label id="ctl642268_Label2" data-datafield="ProjectSummaryInfo.ImportDate" data-type="SheetLabel" style="">资料上传日期</label></td>
                                    <td id="ctl642268_header3" data-datafield="ProjectSummaryInfo.UploadPeople" style="">
                                        <label id="ctl642268_Label3" data-datafield="ProjectSummaryInfo.UploadPeople" data-type="SheetLabel" style="">上传人</label></td>
                                    <td id="ctl642268_header4" data-datafield="ProjectSummaryInfo.FilePath" style="" class="hidden">
                                        <label id="ctl642268_Label4" data-datafield="ProjectSummaryInfo.FilePath" data-type="SheetLabel" style="">下载地址</label></td>
                                    <td id="ctl642268_header5" data-datafield="ProjectSummaryInfo.Down" style="" class="">
                                        <label id="ctl642268_Label5" data-datafield="ProjectSummaryInfo.Down" data-type="SheetLabel" style="" class="">下载</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl642268_control0" data-datafield="ProjectSummaryInfo.DataName" style="">
                                        <input type="text" data-datafield="ProjectSummaryInfo.DataName" data-type="SheetTextBox" id="ctl642268_control0" style="" class=""></td>
                                    <td id="ctl642268_control1" data-datafield="ProjectSummaryInfo.PNote" style="">
                                        <textarea data-datafield="ProjectSummaryInfo.PNote" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl642268_control1" class=""></textarea></td>
                                    <td id="ctl642268_control2" data-datafield="ProjectSummaryInfo.ImportDate" style="">
                                        <input type="text" data-datafield="ProjectSummaryInfo.ImportDate" data-type="SheetTime" id="ctl642268_control2" style="" class=""></td>
                                    <td id="ctl642268_control3" data-datafield="ProjectSummaryInfo.UploadPeople" style="">
                                        <input type="text" data-datafield="ProjectSummaryInfo.UploadPeople" data-type="SheetTextBox" id="ctl642268_control3" style="" class=""></td>
                                    <td id="ctl642268_control4" data-datafield="ProjectSummaryInfo.FilePath" style="" class="hidden">
                                        <input type="text" data-datafield="ProjectSummaryInfo.FilePath" data-type="SheetTextBox" id="ctl642268_control4" style=""></td>
                                    <td id="ctl642268_control5" data-datafield="ProjectSummaryInfo.Down" style="width: 6%;" class="">
                                        <a href="javascript:void(0)">下载</a>
                                    </td>
                                    <td class="rowOption hidden"><a class="delete">
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
                    <div id="div196553" class="col-md-12">
                        <label data-datafield="MWeeklyData" data-type="SheetLabel" id="ctl860915" class="" style="">月度/周资料：</label>
                    </div>
                    <div id="div299606" class="col-md-12">
                        <table id="ctl182260" data-datafield="MWeeklyData" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl182260_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl182260_header0" data-datafield="MWeeklyData.DataName" style="">
                                        <label id="ctl182260_Label0" data-datafield="MWeeklyData.DataName" data-type="SheetLabel" style="">资料名称</label></td>
                                    <td id="ctl182260_header1" data-datafield="MWeeklyData.PNote" style="">
                                        <label id="ctl182260_Label1" data-datafield="MWeeklyData.PNote" data-type="SheetLabel" style="">备注</label></td>
                                    <td id="ctl182260_header2" data-datafield="MWeeklyData.ImportDate" style="">
                                        <label id="ctl182260_Label2" data-datafield="MWeeklyData.ImportDate" data-type="SheetLabel" style="">资料上传日期</label></td>
                                    <td id="ctl182260_header3" data-datafield="MWeeklyData.UploadPeople" style="">
                                        <label id="ctl182260_Label3" data-datafield="MWeeklyData.UploadPeople" data-type="SheetLabel" style="">上传人</label></td>
                                    <td id="ctl182260_header4" data-datafield="MWeeklyData.FilePath" style="" class="hidden">
                                        <label id="ctl182260_Label4" data-datafield="MWeeklyData.FilePath" data-type="SheetLabel" style="">下载地址</label></td>
                                    <td id="ctl182260_header5" data-datafield="MWeeklyData.Down" style="" class="">
                                        <label id="ctl182260_Label5" data-datafield="MWeeklyData.Down" data-type="SheetLabel" style="">下载</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl182260_control0" data-datafield="MWeeklyData.DataName" style="">
                                        <input type="text" data-datafield="MWeeklyData.DataName" data-type="SheetTextBox" id="ctl182260_control0" style="" class=""></td>
                                    <td id="ctl182260_control1" data-datafield="MWeeklyData.PNote" style="">
                                        <textarea data-datafield="MWeeklyData.PNote" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl182260_control1" class=""></textarea></td>
                                    <td id="ctl182260_control2" data-datafield="MWeeklyData.ImportDate" style="" class="">
                                        <input type="text" data-datafield="MWeeklyData.ImportDate" data-type="SheetTime" id="ctl182260_control2" style="" class=""></td>
                                    <td id="ctl182260_control3" data-datafield="MWeeklyData.UploadPeople" style="">
                                        <input type="text" data-datafield="MWeeklyData.UploadPeople" data-type="SheetTextBox" id="ctl182260_control3" style="" class=""></td>
                                    <td id="ctl182260_control4" data-datafield="MWeeklyData.FilePath" style="" class="hidden">
                                        <input type="text" data-datafield="MWeeklyData.FilePath" data-type="SheetTextBox" id="ctl182260_control4" style=""></td>
                                    <td id="ctl182260_control5" data-datafield="MWeeklyData.Down" style="width: 6%;" class="">
                                        <a href="javascript:void(0)">下载</a>
                                    </td>
                                    <td class="rowOption hidden"><a class="delete">
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
                    <div id="div999175" class="col-md-12">
                        <label data-datafield="ProjectReviewData" data-type="SheetLabel" id="ctl118560" class="" style="">项目输入评审材料：</label>
                    </div>
                    <div id="div856784" class="col-md-12">
                        <table id="ctl815077" data-datafield="ProjectReviewData" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl815077_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl815077_header0" data-datafield="ProjectReviewData.DataName" style="">
                                        <label id="ctl815077_Label0" data-datafield="ProjectReviewData.DataName" data-type="SheetLabel" style="">资料名称</label></td>
                                    <td id="ctl815077_header1" data-datafield="ProjectReviewData.PNote" style="">
                                        <label id="ctl815077_Label1" data-datafield="ProjectReviewData.PNote" data-type="SheetLabel" style="">备注</label></td>
                                    <td id="ctl815077_header2" data-datafield="ProjectReviewData.ImportDate" style="">
                                        <label id="ctl815077_Label2" data-datafield="ProjectReviewData.ImportDate" data-type="SheetLabel" style="">资料上传日期</label></td>
                                    <td id="ctl815077_header3" data-datafield="ProjectReviewData.UploadPeople" style="">
                                        <label id="ctl815077_Label3" data-datafield="ProjectReviewData.UploadPeople" data-type="SheetLabel" style="">上传人</label></td>
                                    <td id="ctl815077_header4" data-datafield="ProjectReviewData.FilePath" style="" class="hidden">
                                        <label id="ctl815077_Label4" data-datafield="ProjectReviewData.FilePath" data-type="SheetLabel" style="">下载地址</label></td>
                                    <td id="ctl815077_header5" data-datafield="ProjectReviewData.Down" style="width: 6%;" class="">
                                        <label id="ctl815077_Label5" data-datafield="ProjectReviewData.Down" data-type="SheetLabel" style="" class="">下载</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl815077_control0" data-datafield="ProjectReviewData.DataName" style="">
                                        <input type="text" data-datafield="ProjectReviewData.DataName" data-type="SheetTextBox" id="ctl815077_control0" style="" class=""></td>
                                    <td id="ctl815077_control1" data-datafield="ProjectReviewData.PNote" style="">
                                        <textarea data-datafield="ProjectReviewData.PNote" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl815077_control1" class=""></textarea></td>
                                    <td id="ctl815077_control2" data-datafield="ProjectReviewData.ImportDate" style="">
                                        <input type="text" data-datafield="ProjectReviewData.ImportDate" data-type="SheetTime" id="ctl815077_control2" style="" class=""></td>
                                    <td id="ctl815077_control3" data-datafield="ProjectReviewData.UploadPeople" style="">
                                        <input type="text" data-datafield="ProjectReviewData.UploadPeople" data-type="SheetTextBox" id="ctl815077_control3" style="" class=""></td>
                                    <td id="ctl815077_control4" data-datafield="ProjectReviewData.FilePath" style="" class="hidden">
                                        <input type="text" data-datafield="ProjectReviewData.FilePath" data-type="SheetTextBox" id="ctl815077_control4" style=""></td>
                                    <td id="ctl815077_control5" data-datafield="ProjectReviewData.Down" style="" class="">
                                        <a href="javascript:void(0)">下载</a>
                                    </td>
                                    <td class="rowOption hidden"><a class="delete">
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
                    <div id="div181623" class="col-md-12">
                        <label data-datafield="ExternalData" data-type="SheetLabel" id="ctl166802" class="" style="">外部登记资料：</label>
                    </div>
                    <div id="div652707" class="col-md-12">
                        <table id="ctl686802" data-datafield="ExternalData" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false">
                            <tbody>
                                <tr class="header">
                                    <td id="ctl686802_SerialNo" class="rowSerialNo">序号</td>
                                    <td id="ctl686802_header0" data-datafield="ExternalData.DataName" style="">
                                        <label id="ctl686802_Label0" data-datafield="ExternalData.DataName" data-type="SheetLabel" style="">资料名称</label></td>
                                    <td id="ctl686802_header1" data-datafield="ExternalData.PNote" style="">
                                        <label id="ctl686802_Label1" data-datafield="ExternalData.PNote" data-type="SheetLabel" style="">备注</label></td>
                                    <td id="ctl686802_header2" data-datafield="ExternalData.RegisterDate" style="">
                                        <label id="ctl686802_Label2" data-datafield="ExternalData.RegisterDate" data-type="SheetLabel" style="">资料登记日期</label></td>
                                    <td id="ctl686802_header3" data-datafield="ExternalData.RegisterPerson" style="">
                                        <label id="ctl686802_Label3" data-datafield="ExternalData.RegisterPerson" data-type="SheetLabel" style="">资料登记人</label></td>
                                    <td id="ctl686802_header4" data-datafield="ExternalData.FilePath" style="" class="hidden">
                                        <label id="ctl686802_Label4" data-datafield="ExternalData.FilePath" data-type="SheetLabel" style="" class="">附件地址</label></td>
                                    <td id="ctl686802_header5" data-datafield="ExternalData.Down" style="width: 6%;" class="">
                                        <label id="ctl686802_Label5" data-datafield="ExternalData.Down" data-type="SheetLabel" style="" class="">下载</label></td>
                                    <td class="rowOption hidden">删除</td>
                                </tr>
                                <tr class="template">
                                    <td></td>
                                    <td id="ctl686802_control0" data-datafield="ExternalData.DataName" style="" class="">
                                        <input type="text" data-datafield="ExternalData.DataName" data-type="SheetTextBox" id="ctl686802_control0" style="" class=""></td>
                                    <td id="ctl686802_control1" data-datafield="ExternalData.PNote" style="">
                                        <textarea data-datafield="ExternalData.PNote" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl686802_control1"></textarea></td>
                                    <td id="ctl686802_control2" data-datafield="ExternalData.RegisterDate" style="">
                                        <input type="text" data-datafield="ExternalData.RegisterDate" data-type="SheetTime" id="ctl686802_control2" style=""></td>
                                    <td id="ctl686802_control3" data-datafield="ExternalData.RegisterPerson" style="">
                                        <input type="text" data-datafield="ExternalData.RegisterPerson" data-type="SheetTextBox" id="ctl686802_control3" style=""></td>
                                    <td id="ctl686802_control4" data-datafield="ExternalData.FilePath" style="" class="hidden">
                                        <input type="text" data-datafield="ExternalData.FilePath" data-type="SheetTextBox" id="ctl686802_control4" style=""></td>
                                    <td id="ctl686802_control5" data-datafield="ExternalData.Down" style="" class="">
                                        <a href="javascript:void(0)">下载</a>
                                    </td>
                                    <td class="rowOption hidden"><a class="delete">
                                        <div class="fa fa-minus"></div>
                                    </a><a class="insert">
                                        <div class="fa fa-arrow-down"></div>
                                    </a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
