<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExpertNomination.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.stzx.ExpertNomination" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
		<div style="text-align: center;" class="DragContainer">
			<label id="lblTitle" class="panel-title">专家提名</label>
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
				<label id="divSheetInfo" data-en_us="Sheet information">申请信息</label>
			</div>
			<div class="divContent" id="divSheet">
				<div class="row">
					<div id="div636951" class="col-md-2">
						<label data-datafield="Applyer" data-type="SheetLabel" id="ctl732933" class="" style="">推荐人</label>
					</div>
					<div id="div364276" class="col-md-4">
						<input type="text" data-datafield="Applyer" data-type="SheetTextBox" id="ctl729644" class="" style="" data-defaultvalue="{Originator.UserName}">
					</div>
					<div id="div645055" class="col-md-2">
						<label data-datafield="Department" data-type="SheetLabel" id="ctl10744" class="" style="">推荐部门</label>
					</div>
					<div id="div764622" class="col-md-4">
						<input type="text" data-datafield="Department" data-type="SheetTextBox" id="ctl866706" class="" style="" data-defaultvalue="{Originator.OUName}">
					</div>
				</div>
				<div class="row">
					<div id="div805626" class="col-md-2">
						<label data-datafield="Tjsj" data-type="SheetLabel" id="ctl797189" class="" style="">推荐时间</label>
					</div>
					<div id="div763955" class="col-md-4">
						<input type="text" data-datafield="Tjsj" data-type="SheetTime" id="ctl532482" class="" style="">
					</div>
					<div id="div492595" class="col-md-2"></div>
					<div id="div50496" class="col-md-4"></div>
				</div>
				
				
				 <div id="" class="nav-icon fa  fa-chevron-right bannerTitle" style="margin: 10px 3px 19px -26px;">
                    <label id="divInvInfo" data-en_us="Inventory situation" class="">提名信息</label>
                </div>
				
				
				<div class="row">
					<div id="div586682" class="col-md-2">
						<span id="Label11" data-type="SheetLabel" data-datafield="EName" class="" style="">姓名</span>
					</div>
					<div id="div638533" class="col-md-2">
						<input id="Control11" type="text" data-datafield="EName" data-type="SheetTextBox" class="" style="">
					</div>
					<div id="div850581" class="col-md-2">
						<span id="Label12" data-type="SheetLabel" data-datafield="Sex" class="" style="">性别</span>
					</div>
					<div id="div988643" class="col-md-2">
						<input id="Control12" type="text" data-datafield="Sex" data-type="SheetTextBox" class="" style="">
					</div>
					<div id="div126522" class="col-md-2">
						<span id="Label13" data-type="SheetLabel" data-datafield="BirthDate" class="" style="">出生日期</span>
					</div>
					<div id="div74270" class="col-md-2">
						<input id="Control13" type="text" data-datafield="BirthDate" data-type="SheetTime" class="" style="">
					</div>
				</div>
				<div class="row">
					<div id="title3" class="col-md-2">
						<span id="Label16" data-type="SheetLabel" data-datafield="IdentificationCard" class="" style="">身份证</span>
					</div>
					<div id="control3" class="col-md-4">
						<input id="Control16" type="text" data-datafield="IdentificationCard" data-type="SheetTextBox" class="" style="">
					</div>
					<div id="title4" class="col-md-2">
						<span id="Label17" data-type="SheetLabel" data-datafield="TechnicalTitle" style="" class="">技术职称/职业资格</span>
					</div>
					<div id="control4" class="col-md-4">
						<input id="Control17" type="text" data-datafield="TechnicalTitle" data-type="SheetTextBox" style="" class="">
					</div>
				</div>
				<div class="row">
					<div id="div118097" class="col-md-2">
						<span id="Label14" data-type="SheetLabel" data-datafield="WorkUnit" style="" class="">工作单位</span>
					</div>
					<div id="div719446" class="col-md-4">
						<input id="Control14" type="text" data-datafield="WorkUnit" data-type="SheetTextBox" style="" class="">
					</div>
					<div id="div991601" class="col-md-2">
						<span id="Label15" data-type="SheetLabel" data-datafield="Job" style="" class="">职务</span>
					</div>
					<div id="div82986" class="col-md-4">
						<input id="Control15" type="text" data-datafield="Job" data-type="SheetTextBox" style="" class="">
					</div>
				</div>
				<div class="row">
					<div id="title7" class="col-md-2">
						<span id="Label18" data-type="SheetLabel" data-datafield="Byyx" style="" class="">毕业院校</span>
					</div>
					<div id="control7" class="col-md-4">
						<input id="Control18" type="text" data-datafield="Byyx" data-type="SheetTextBox" style="" class="">
					</div>
					<div id="title8" class="col-md-2">
						<span id="Label19" data-type="SheetLabel" data-datafield="Zgxl" style="" class="">最高学历</span>
					</div>
					<div id="control8" class="col-md-4">
						<input id="Control19" type="text" data-datafield="Zgxl" data-type="SheetTextBox" style="" class="">
					</div>
				</div>
				<div class="row">
					<div id="div585551" class="col-md-2">
						<span id="Label20" data-type="SheetLabel" data-datafield="Cszy1" style="" class="">从事专业</span>
					</div>
					<div id="div599554" class="col-md-3">
						
					<select data-datafield="Cszy1" data-type="SheetDropDownList" id="ctl763060" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="0:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false"></select></div>
					<div id="div640175" class="col-md-3">
						
					<select data-datafield="Cszy2" data-type="SheetDropDownList" id="ctl892745" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="Cszy1:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false"></select></div>
					<div id="div611870" class="col-md-3">
						
					<select data-datafield="Cszy3" data-type="SheetDropDownList" id="ctl151772" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="Cszy2:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false"></select></div>
					<div id="div637424" class="col-md-1"></div>
				</div>
				<div class="row">
					<div id="title13" class="col-md-2">
						<span id="Label23" data-type="SheetLabel" data-datafield="Zynx" style="">专业年限</span>
					</div>
					<div id="control13" class="col-md-4">
						<input id="Control23" type="text" data-datafield="Zynx" data-type="SheetTextBox" style="">
					</div>
					<div id="title14" class="col-md-2"></div>
					<div id="control14" class="col-md-4"></div>
				</div>
				<div class="row">
					<div id="div404105" class="col-md-2">
						<span id="Label24" data-type="SheetLabel" data-datafield="Lxdh" style="" class="">联系电话</span>
					</div>
					<div id="div991394" class="col-md-4">
						<input id="Control24" type="text" data-datafield="Lxdh" data-type="SheetTextBox" style="" class="">
					</div>
					<div id="div313166" class="col-md-2">
						<span id="Label25" data-type="SheetLabel" data-datafield="Yx" style="" class="">邮箱</span>
					</div>
					<div id="div192058" class="col-md-4">
						<input id="Control25" type="text" data-datafield="Yx" data-type="SheetTextBox" style="" class="">
					</div>
				</div>
				<div class="row">
					<div id="div523934" class="col-md-2">
						<span id="Label26" data-type="SheetLabel" data-datafield="Txdz" style="" class="">通讯地址</span>
					</div>
					<div id="div649511" class="col-md-10">
						<input id="Control26" type="text" data-datafield="Txdz" data-type="SheetTextBox" style="" class="">
					</div>
				</div>
				<div class="row tableContent">
					<div id="title17" class="col-md-2">
						<span id="Label27" data-type="SheetLabel" data-datafield="Gzjlhyj" style="">主要工作简历和业绩</span>
					</div>
					<div id="control17" class="col-md-10">
						<textarea id="Control27" data-datafield="Gzjlhyj" data-type="SheetRichTextBox" style="">					</textarea>
					</div>
				</div>
				<div class="row">
					<div id="title19" class="col-md-2">
						<span id="Label28" data-type="SheetLabel" data-datafield="Fj" style="">附件</span>
					</div>
					<div id="control19" class="col-md-10">
						<div id="Control28" data-datafield="Fj" data-type="SheetAttachment" style=""></div>
					</div>
				</div><div class="row"><div id="div311970" class="col-md-2"><label data-datafield="Gzyjpjxx" data-type="SheetLabel" id="ctl726373" class="" style="">工作业绩评价信息</label></div><div id="div425978" class="col-md-10"><table id="ctl422963" data-datafield="Gzyjpjxx" data-type="SheetGridView" class="SheetGridView" style="" data-displayadd="false" data-defaultrowcount="0" data-displaydelete="false"><tbody><tr class="header"><td id="ctl422963_SerialNo" class="rowSerialNo">序号</td><td id="ctl422963_header0" data-datafield="Gzyjpjxx.Zjgzlx" style=""><label id="ctl422963_Label0" data-datafield="Gzyjpjxx.Zjgzlx" data-type="SheetLabel" style="">专家工作类型</label></td><td id="ctl422963_header1" data-datafield="Gzyjpjxx.Xmmc" style=""><label id="ctl422963_Label1" data-datafield="Gzyjpjxx.Xmmc" data-type="SheetLabel" style="">项目名称</label></td><td id="ctl422963_header2" data-datafield="Gzyjpjxx.Gzmc" style=""><label id="ctl422963_Label2" data-datafield="Gzyjpjxx.Gzmc" data-type="SheetLabel" style="">工作名称</label></td><td id="ctl422963_header3" data-datafield="Gzyjpjxx.Kssj" style=""><label id="ctl422963_Label3" data-datafield="Gzyjpjxx.Kssj" data-type="SheetLabel" style="">开始时间</label></td><td id="ctl422963_header4" data-datafield="Gzyjpjxx.Jssj" style=""><label id="ctl422963_Label4" data-datafield="Gzyjpjxx.Jssj" data-type="SheetLabel" style="">结束时间</label></td><td id="ctl422963_header5" data-datafield="Gzyjpjxx.Gznr" style=""><label id="ctl422963_Label5" data-datafield="Gzyjpjxx.Gznr" data-type="SheetLabel" style="">工作内容</label></td><td id="ctl422963_header6" data-datafield="Gzyjpjxx.Yjpj" style=""><label id="ctl422963_Label6" data-datafield="Gzyjpjxx.Yjpj" data-type="SheetLabel" style="">业绩评价</label></td><td class="rowOption">删除</td></tr><tr class="template"><td></td><td id="ctl422963_control0" data-datafield="Gzyjpjxx.Zjgzlx" style=""><input type="text" data-datafield="Gzyjpjxx.Zjgzlx" data-type="SheetTextBox" id="ctl422963_control0" style=""></td><td id="ctl422963_control1" data-datafield="Gzyjpjxx.Xmmc" style=""><input type="text" data-datafield="Gzyjpjxx.Xmmc" data-type="SheetTextBox" id="ctl422963_control1" style=""></td><td id="ctl422963_control2" data-datafield="Gzyjpjxx.Gzmc" style=""><input type="text" data-datafield="Gzyjpjxx.Gzmc" data-type="SheetTextBox" id="ctl422963_control2" style=""></td><td id="ctl422963_control3" data-datafield="Gzyjpjxx.Kssj" style=""><input type="text" data-datafield="Gzyjpjxx.Kssj" data-type="SheetTime" id="ctl422963_control3" style=""></td><td id="ctl422963_control4" data-datafield="Gzyjpjxx.Jssj" style=""><input type="text" data-datafield="Gzyjpjxx.Jssj" data-type="SheetTime" id="ctl422963_control4" style=""></td><td id="ctl422963_control5" data-datafield="Gzyjpjxx.Gznr" style=""><input type="text" data-datafield="Gzyjpjxx.Gznr" data-type="SheetTextBox" id="ctl422963_control5" style=""></td><td id="ctl422963_control6" data-datafield="Gzyjpjxx.Yjpj" style=""><input type="text" data-datafield="Gzyjpjxx.Yjpj" data-type="SheetTextBox" id="ctl422963_control6" style=""></td><td class="rowOption"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr></tbody></table></div></div>
			</div>
		</div>
	</asp:Content>