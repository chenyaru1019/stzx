<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SExternalDocument.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SExternalDocument" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">
   $.MvcSheet.PreInit = function () {
            $("<span style='color:#F00' >*</span>").appendTo('#Label13');
            $("<span style='color:#F00' >*</span>").appendTo('#Label14');
            $("<span style='color:#F00' >*</span>").appendTo('#Label15');
            $("<span style='color:#F00' >*</span>").appendTo('#Label16');
            $("<span style='color:#F00' >*</span>").appendTo('#Label17');

            if ($.MvcSheetUI.SheetInfo.IsOriginateMode) {
                $("#CYDepart").css("display", "none");
                $("#EmployeeView").css("display", "none");
                $("#Receiver").css("display", "none");
            }

            var type = $.MvcSheetUI.GetControlValue("Type");
            if (type == "集团工作联系单") {
                $("#hfrq").css("display", "block");
                $("#lblTitle").text(type);
            } else {
                $("#hfrq").css("display", "none");
                $("#lblTitle").text(type);
            }

            var flag = $.MvcSheetUI.GetControlValue("CYDepart");
            if (flag == "是") {
                $("#EmployeeView").show();
            } else {
                $("#EmployeeView").hide();
            }
        }

        // 页面加载完成事件
        $.MvcSheet.Loaded = function (sheetInfo) {

            if (!$.MvcSheetUI.SheetInfo.IsOriginateMode) {
                var objectId = $.MvcSheetUI.SheetInfo.BizObjectID;
                $.ajax({
                    type: "POST",    //页面请求的类型
                    url: "/Portal/Sheets/handlers/FileHandler.ashx?Command=QueryReplyAttach",   //处理页的相对地址
                    data: {
                        BizObjectId: objectId
                    },
                    async: false,
                    success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据

                        if (e != null) {
                             var ret = e;
                            var index = 0;
                            for (var i = 0; i < ret.length; i++) {
                                index++;
                                $($('#ctl7587 .rows  #ctl7587_control3 ').find('a')[i]).attr('href', ret[i].FilePath)
                            }
                        }
                    }
                });
            }

        }

        $.MvcSheet.Validate = function () {
            var type = $.MvcSheetUI.GetControlValue("Type");
            var requestDate = $.MvcSheetUI.GetControlValue("RequestDate");

            var flag = $.MvcSheetUI.GetControlValue("CYDepart");
            var employeeView = $.MvcSheetUI.GetControlValue("EmployeeView");

            if ($.MvcSheetUI.SheetInfo.ActivityCode == "Apply") {
                if (this.Action == "Submit") {

                    if (type == "集团工作联系单") {
                        if (requestDate == "" || requestDate == null) {
                            if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) {
                                layer.open({
                                    content: '请填写要求回复日期'
                                    , btn: '我知道了'
                                });
                                return false;
                            } else {
                                $('#message-module')
                                    .find('.modal-body')
                                    .html(
                                    '<h4 style="text-align: center;padding: 50px;line-height: 25px;">请填写要求回复日期</h4>');
                                $('#message-module').modal({
                                    keyboard: true,
                                    show: true,
                                    backdrop: true
                                });
                                $.MvcSheetUI.GetElement("RequestDate").focus();

                                return false;
                            }

                        }
                    }

                    if (flag == "是") {
                        if (employeeView == "" || employeeView == null) {
                            if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) {
                                layer.open({
                                    content: '请选择部门传阅对象'
                                    , btn: '我知道了'
                                });
                                return false;
                            } else {
                                $('#message-module')
                                    .find('.modal-body')
                                    .html(
                                    '<h4 style="text-align: center;padding: 50px;line-height: 25px;">请选择部门传阅对象</h4>');
                                $('#message-module').modal({
                                    keyboard: true,
                                    show: true,
                                    backdrop: true
                                });

                                return false;
                            }

                        }
                    }
                }
            }
            return true;
        }
</script>
    <div style="text-align: center;" class="DragContainer">
        <label id="lblTitle" class="panel-title">集团收文传阅单</label>
    </div>
    <div class="panel-body sheetContainer">
        <div class="nav-icon fa fa-chevron-right bannerTitle hidden">
            <label id="divBasicInfo" data-en_us="Basic information">基本信息</label>
        </div>
        <div class="divContent">
            <div class="row hidden">
                <div id="divFullNameTitle" class="col-md-2">
                    <label id="lblFullNameTitle" data-type="SheetLabel" data-datafield="Originator.UserName" data-en_us="Originator" data-bindtype="OnlyVisiable" style="" class="">发起人：</label>
                </div>
                <div id="divFullName" class="col-md-4">
                    <label id="lblFullName" data-type="SheetLabel" data-datafield="Originator.UserName" data-bindtype="OnlyData" style=""></label>
                </div>
                <div id="divOriginateDateTitle" class="col-md-2">

                    <label id="lblOriginateOUNameTitle" data-type="SheetLabel" data-datafield="Originator.OUName" data-en_us="Originate OUName" data-bindtype="OnlyVisiable" style="" class="">所属组织：</label>
                </div>
                <div id="divOriginateDate" class="col-md-4">

                    <select data-datafield="Originator.OUName" data-type="SheetOriginatorUnit" id="ctlOriginaotrOUName" class="" style="">
                    </select>
                </div>
            </div>
            <div class="row hidden">
                <div id="div644074" class="col-md-2">
                    <label id="lblOriginateDateTitle" data-type="SheetLabel" data-datafield="OriginateTime" data-en_us="Originate Date" data-bindtype="OnlyVisiable" style="" class="">发起时间：</label>
                </div>
                <div id="div587359" class="col-md-4">
                    <label id="lblOriginateDate" data-type="SheetLabel" data-datafield="OriginateTime" data-bindtype="OnlyData" style="" class=""></label>
                </div>
                <div id="div616446" class="col-md-2"></div>
                <div id="div731110" class="col-md-4"></div>
            </div>

        </div>
        <div class="nav-icon fa  fa-chevron-right bannerTitle">
            <label id="divSheetInfo" data-en_us="Sheet information">表单信息</label>
        </div>
        <div class="divContent" id="divSheet">
            <div class="row hidden">
                <div id="title1" class="col-md-2">
                    <span id="Label11" data-type="SheetLabel" data-datafield="Applyer" class="" style="">发布人：</span>
                </div>
                <div id="control1" class="col-md-4">
                    <input id="Control11" type="text" data-datafield="Applyer" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.UserName}" style="">
                </div>
                <div id="title2" class="col-md-2">
                    <span id="Label12" data-type="SheetLabel" data-datafield="Department" class="" style="">发起部门：</span>
                </div>
                <div id="control2" class="col-md-4">
                    <input id="Control12" type="text" data-datafield="Department" data-type="SheetTextBox" class="" data-defaultvalue="{Originator.OUName}" style="">
                </div>
            </div>
            <div class="row">
                <div id="div985247" class="col-md-2">
                    <label id="lblSequenceNoTitle" data-type="SheetLabel" data-datafield="SequenceNo" data-en_us="SequenceNo" data-bindtype="OnlyVisiable" style="" class="">流水号：</label>
                </div>
                <div id="div361160" class="col-md-4">
                    <label id="lblSequenceNo" data-type="SheetLabel" data-datafield="SequenceNo" data-bindtype="OnlyData" style="" class=""></label>
                </div>
                <div id="div564039" class="col-md-2"></div>
                <div id="div140808" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div482116" class="col-md-2"><span id="Label15" data-type="SheetLabel" data-datafield="Title" class="" style="">标题：</span></div>
                <div id="div954768" class="col-md-10">
                    <input id="Control15" type="text" data-datafield="Title" data-type="SheetTextBox" class="" style="">
                </div>
            </div>
            <div class="row">
                <div id="div628517" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="LWNumbering" class="" style="">来文编号：</span></div>
                <div id="div433349" class="col-md-4">
                    <input id="Control13" type="text" data-datafield="LWNumbering" data-type="SheetTextBox" style="" class="">
                </div>
                <div id="div809138" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="LWDepartmeent" class="" style="">来文单位/部门：</span></div>
                <div id="div566107" class="col-md-4">
                    <input id="Control14" type="text" data-datafield="LWDepartmeent" data-type="SheetTextBox" class="" style="">
                </div>
            </div>
            <div class="row">
                <div id="div75628" class="col-md-2">
                    <label data-datafield="StartTime" data-type="SheetLabel" id="ctl517752" class="" style="">发起时间</label>
                </div>
                <div id="div284845" class="col-md-4">
                    <input type="text" data-datafield="StartTime" data-type="SheetTime" id="ctl694963" class="" style="">
                </div>
                <div id="div470210" class="col-md-2">
                    <label data-datafield="RecriveDate" data-type="SheetLabel" id="ctl30302" class="" style="">收文日期</label>
                </div>
                <div id="div862703" class="col-md-4">
                    <input type="text" data-datafield="RecriveDate" data-type="SheetTime" id="ctl590209" class="" style="" data-defaultvalue="">
                </div>
            </div>


            <div class="row">
                <div id="div445435" class="col-md-2">
                    <label data-datafield="Type" data-type="SheetLabel" id="ctl603529" class="" style="">来文类别</label>
                </div>
                <div id="div407195" class="col-md-10">
                    <div data-datafield="Type" data-type="SheetRadioButtonList" id="ctl197297" class="" style="" data-defaultselected="false" data-defaultitems="集团工作联系单;集团内部传阅" data-onchange="var type = $.MvcSheetUI.GetControlValue(&quot;Type&quot;);
if(type==&quot;集团工作联系单&quot;){

   $(&quot;#hfrq&quot;).css(&quot;display&quot;,&quot;block&quot;);
   $(&quot;#lblTitle&quot;).text(type);

}else{

   $(&quot;#hfrq&quot;).css(&quot;display&quot;,&quot;none&quot;);
   $(&quot;#lblTitle&quot;).text(type);

}
"></div>
                </div>
            </div>



            <div class="row" id="hfrq" style="display: none">
                <div id="div90284" class="col-md-2">
                    <label data-datafield="RequestDate" data-type="SheetLabel" id="ctl114845" class="" style="">集团要求回复日期：</label>
                </div>
                <div id="div184894" class="col-md-4">
                    <input type="text" data-datafield="RequestDate" data-type="SheetTime" id="ctl313233" class="" style="" data-defaultvalue="">
                </div>
                <div id="div941326" class="col-md-2"></div>
                <div id="div686145" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="title7" class="col-md-2">
                    <span id="Label16" data-type="SheetLabel" data-datafield="HTAttach" class="" style="">来文附件：</span>
                </div>
                <div id="control7" class="col-md-10">
                    <div id="Control16" data-datafield="HTAttach" data-type="SheetAttachment" style="" class="" data-maxuploadsize="60"></div>
                </div>
            </div>
            <div class="row" id="CYDepart">
                <div id="div569575" class="col-md-2">
                    <label data-datafield="CYDepart" data-type="SheetLabel" id="ctl418586" class="" style="">是否需要部门查阅：</label>
                </div>
                <div id="div353695" class="col-md-4">

                    <div data-datafield="CYDepart" data-type="SheetRadioButtonList" id="ctl415042" class="" style="" data-defaultitems="是;否" data-onchange="	var flag = $.MvcSheetUI.GetControlValue(&quot;CYDepart&quot;);
	if (flag == &quot;是&quot;) {
               $(&quot;#EmployeeView&quot;).show();
	} else {
		$(&quot;#EmployeeView&quot;).hide();
                $(&quot;#ctl146051&quot;).SheetUIManager().ClearChoices(); 
          }  "></div>
                </div>
                <div id="div97499" class="col-md-2"></div>
                <div id="div345807" class="col-md-4"></div>
            </div>
            <div class="row"><div id="div809506" class="col-md-2"><label data-datafield="EmployeeView" data-type="SheetLabel" id="ctl198299" class="" style="">部门主管传阅</label></div><div id="div567221" class="col-md-10"><div data-datafield="EmployeeView" data-type="SheetUser" id="ctl146051" class="" style="" data-rootselectable="false" data-placeholder="请选择部门名称" data-orgunitvisible="true"></div></div></div>


            <div class="row tableContent">
                <div id="title11" class="col-md-2">
                    <span id="Label18" data-type="SheetLabel" data-datafield="Note" style="">备注：</span>
                </div>
                <div id="control11" class="col-md-10">
                    <textarea id="Control18" data-datafield="Note" data-type="SheetRichTextBox" style="" class="" data-autotrim="true"></textarea>
                </div>
            </div>


        </div>

        <div class="divContent">
        </div>
        <div class="nav-icon fa  fa-chevron-right bannerTitle" id="Opinion">
            <label id="divFlowAdvice" data-en_us="Flow advice" class="">流转意见</label>
        </div>
        <div class="divContent">
            <div class="row" id="Receiver">
                <div id="div64131" class="col-md-2">
                    <label data-datafield="Receiver" data-type="SheetLabel" id="ctl733445" class="" style="">公司领导查阅人：</label>
                </div>
                <div id="div458503" class="col-md-4">
                    <div data-datafield="Receiver" data-type="SheetUser" id="ctl901813" class="" style="" data-rootunitid="a4a6ccba-4b42-43ba-9716-555957fe7e23"></div>
                </div>
                <div id="div312930" class="col-md-2"></div>
                <div id="div397609" class="col-md-4"></div>
            </div>
            <div class="row">
                <div id="div603908" class="col-md-2">
                    <label data-datafield="IntegratedOffice" data-type="SheetLabel" id="ctl748620" class="" style="">综合办拟办意见：</label>
                </div>
                <div id="div267946" class="col-md-10">
                    <div data-datafield="IntegratedOffice" data-type="SheetComment" id="ctl822064" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div648581" class="col-md-2">
                    <label data-datafield="ManagerSuggess" data-type="SheetLabel" id="ctl302653" class="" style="">公司领导意见：</label>
                </div>
                <div id="div753047" class="col-md-10">
                    <div data-datafield="ManagerSuggess" data-type="SheetComment" id="ctl210830" class="" style=""></div>
                </div>
            </div>
            <div class="row">
                <div id="div608672" class="col-md-2">
                    <label data-datafield="DepartmentSuggess" data-type="SheetLabel" id="ctl382162" class="" style="">部门意见</label>
                </div>
                <div id="div906161" class="col-md-10">
                    <table id="ctl441539" data-datafield="DepartmentSuggess" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl441539_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl441539_header0" data-datafield="DepartmentSuggess.FullName" style="">
                                    <label id="ctl441539_Label0" data-datafield="DepartmentSuggess.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl441539_header1" data-datafield="DepartmentSuggess.Suggess" style="">
                                    <label id="ctl441539_Label1" data-datafield="DepartmentSuggess.Suggess" data-type="SheetLabel" style="">意见内容</label></td>
                                <td class="rowOption hidden">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl441539_control0" data-datafield="DepartmentSuggess.FullName" style="width: 25%;" class="">
                                    <input type="text" data-datafield="DepartmentSuggess.FullName" data-type="SheetTextBox" id="ctl441539_control0" style="" class=""></td>
                                <td id="ctl441539_control1" data-datafield="DepartmentSuggess.Suggess" style="" class="">
                                    <input type="text" data-datafield="DepartmentSuggess.Suggess" data-type="SheetTextBox" id="ctl441539_control1" style="" class=""></td>
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
                <div id="div601914" class="col-md-2">
                    <label data-datafield="StaffComments" data-type="SheetLabel" id="ctl670319" class="" style="">员工意见</label>
                </div>
                <div id="div396968" class="col-md-10">
                    <table id="ctl891321" data-datafield="StaffComments" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl891321_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl891321_header0" data-datafield="StaffComments.FullName" style="" class="">
                                    <label id="ctl891321_Label0" data-datafield="StaffComments.FullName" data-type="SheetLabel" style="">姓名</label></td>
                                <td id="ctl891321_header1" data-datafield="StaffComments.Suggess" style="" class="">
                                    <label id="ctl891321_Label1" data-datafield="StaffComments.Suggess" data-type="SheetLabel" style="">意见内容</label></td>
                                <td class="rowOption hidden">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl891321_control0" data-datafield="StaffComments.FullName" style="width: 25%;" class="">
                                    <input type="text" data-datafield="StaffComments.FullName" data-type="SheetTextBox" id="ctl891321_control0" style="" class=""></td>
                                <td id="ctl891321_control1" data-datafield="StaffComments.Suggess" style="" class="">
                                    <input type="text" data-datafield="StaffComments.Suggess" data-type="SheetTextBox" id="ctl891321_control1" style="" class=""></td>
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
                <div id="div184679" class="col-md-2">
                    <label data-datafield="ReplyAttach" data-type="SheetLabel" id="ctl345574" class="" style="">员工回复附件</label>
                </div>
                <div id="div958380" class="col-md-10">
                    <table id="ctl7587" data-datafield="ReplyAttach" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0">
                        <tbody>
                            <tr class="header">
                                <td id="ctl7587_SerialNo" class="rowSerialNo">序号</td>
                                <td id="ctl7587_header0" data-datafield="ReplyAttach.FullName" style="">
                                    <label id="ctl7587_Label0" data-datafield="ReplyAttach.FullName" data-type="SheetLabel" style="">上传人</label></td>
                                <td id="ctl7587_header1" data-datafield="ReplyAttach.AttachName" style="">
                                    <label id="ctl7587_Label1" data-datafield="ReplyAttach.AttachName" data-type="SheetLabel" style="">附件名称</label></td>
                                <td id="ctl7587_header2" data-datafield="ReplyAttach.FilePath" style="" class="hidden">
                                    <label id="ctl7587_Label2" data-datafield="ReplyAttach.FilePath" data-type="SheetLabel" style="">文件地址</label></td>
                                <td id="ctl7587_header3" data-datafield="ReplyAttach.Down" style="" class="">
                                    <label id="ctl7587_Label3" data-datafield="ReplyAttach.Down" data-type="SheetLabel" style="">下载查看</label></td>
                                <td class="rowOption hidden">删除</td>
                            </tr>
                            <tr class="template">
                                <td></td>
                                <td id="ctl7587_control0" data-datafield="ReplyAttach.FullName" style="width: 25%;" class="">
                                    <input type="text" data-datafield="ReplyAttach.FullName" data-type="SheetTextBox" id="ctl7587_control0" style="" class=""></td>
                                <td id="ctl7587_control1" data-datafield="ReplyAttach.AttachName" style="">
                                    <input type="text" data-datafield="ReplyAttach.AttachName" data-type="SheetTextBox" id="ctl7587_control1" style="" class=""></td>
                                <td id="ctl7587_control2" data-datafield="ReplyAttach.FilePath" style="" class="hidden">
                                    <input type="text" data-datafield="ReplyAttach.FilePath" data-type="SheetTextBox" id="ctl7587_control2" style=""></td>
                                <td id="ctl7587_control3" data-datafield="ReplyAttach.Down" style="width: 8%;" class="">
                                  
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



</asp:Content>