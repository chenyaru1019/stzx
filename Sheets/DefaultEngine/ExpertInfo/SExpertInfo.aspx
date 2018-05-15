<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SExpertInfo.aspx.cs" Inherits="OThinker.H3.Portal.Sheets.DefaultEngine.SExpertInfo" EnableEventValidation="false" MasterPageFile="~/MvcSheet.master" %>
<%@ OutputCache Duration="999999" VaryByParam="T" VaryByCustom="browser" %>
<asp:Content ID="head" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="menu" ContentPlaceHolderID="cphMenu" runat="Server">
</asp:Content>
<asp:Content ID="master" ContentPlaceHolderID="masterContent" runat="Server">
<script type="text/javascript">

</script>
<div style="text-align: center;" class="DragContainer">
	<label id="lblTitle" class="panel-title">专家信息</label>
</div>
<div class="panel-body sheetContainer">
	<div class="nav-icon fa fa-chevron-right bannerTitle hidden">
		<label id="divBasicInfo" data-en_us="Basic information" class="">基本信息</label>
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
		<div class="nav-icon fa  fa-chevron-right bannerTitle">
			<label id="divSheetInfo" data-en_us="Sheet information" class="">专家信息</label>
		</div>
		<div class="divContent" id="divSheet">
			<div class="row"><div id="div888772" class="col-md-2"><label data-datafield="tjbm" data-type="SheetLabel" id="ctl576808" class="" style="">推荐部门</label></div><div id="div765940" class="col-md-4"><input type="text" data-datafield="tjbm" data-type="SheetTextBox" id="ctl276761" class="" style=""></div><div id="div765241" class="col-md-2"><label data-datafield="tjr" data-type="SheetLabel" id="ctl539856" class="" style="">推荐人</label></div><div id="div470292" class="col-md-4"><input type="text" data-datafield="tjr" data-type="SheetTextBox" id="ctl809945" class="" style=""></div></div><div class="row"><div id="div445967" class="col-md-2"><span id="Label11" data-type="SheetLabel" data-datafield="EName" style="" class="">姓名</span></div><div id="div216061" class="col-md-2"><input id="Control11" type="text" data-datafield="EName" data-type="SheetTextBox" style="" class=""></div><div id="div410098" class="col-md-2"><span id="Label12" data-type="SheetLabel" data-datafield="Sex" style="" class="">性别</span></div><div id="div168608" class="col-md-2"><select data-datafield="Sex" data-type="SheetDropDownList" id="ctl781725" class="" style="" data-defaultitems="男;女" data-queryable="false"></select></div><div id="div179329" class="col-md-2"><span id="Label13" data-type="SheetLabel" data-datafield="BirthDate" style="" class="">出生日期 </span></div><div id="div72483" class="col-md-2"><input id="Control13" type="text" data-datafield="BirthDate" data-type="SheetTime" style="" class=""></div></div>
			<div class="row">
				<div id="title3" class="col-md-2">
					
				<span id="Label16" data-type="SheetLabel" data-datafield="IdentificationCard" style="" class="">身份证</span></div>
				<div id="control3" class="col-md-4">
					
				<input id="Control16" type="text" data-datafield="IdentificationCard" data-type="SheetTextBox" style="" class=""></div>
				<div id="title4" class="col-md-2">
					
				<span id="Label17" data-type="SheetLabel" data-datafield="TechnicalTitle" style="" class="">技术职称/职业资格</span></div>
				<div id="control4" class="col-md-4">
					
				<input id="Control17" type="text" data-datafield="TechnicalTitle" data-type="SheetTextBox" style="" class=""></div>
			</div><div class="row"><div id="div425842" class="col-md-2"><span id="Label14" data-type="SheetLabel" data-datafield="WorkUnit" style="" class="">工作单位</span></div><div id="div257414" class="col-md-4"><input id="Control14" type="text" data-datafield="WorkUnit" data-type="SheetTextBox" style="" class=""></div><div id="div396844" class="col-md-2"><span id="Label15" data-type="SheetLabel" data-datafield="Job" style="" class="">职务</span></div><div id="div221121" class="col-md-4"><input id="Control15" type="text" data-datafield="Job" data-type="SheetTextBox" style="" class=""></div></div>
			<div class="row">
				<div id="title5" class="col-md-2">
					
				<span id="Label18" data-type="SheetLabel" data-datafield="Byyx" style="" class="">毕业院校</span></div>
				<div id="control5" class="col-md-4">
					
				<input id="Control18" type="text" data-datafield="Byyx" data-type="SheetTextBox" style="" class=""></div>
				<div id="title6" class="col-md-2">
					
				<span id="Label19" data-type="SheetLabel" data-datafield="Zgxl" style="" class="">最高学历</span></div>
				<div id="control6" class="col-md-4">
					
				<input id="Control19" type="text" data-datafield="Zgxl" data-type="SheetTextBox" style="" class=""></div>
			</div><div class="row"><div id="div797981" class="col-md-2"><span id="Label20" data-type="SheetLabel" data-datafield="Cszy1" class="" style="">从事专业</span></div><div id="div906975" class="col-md-3"><select data-datafield="Cszy1" data-type="SheetDropDownList" id="ctl313765" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="0:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false"></select></div><div id="div848933" class="col-md-3"><select data-datafield="Cszy2" data-type="SheetDropDownList" id="ctl334419" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="Cszy1:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false"></select></div><div id="div304648" class="col-md-3"><select data-datafield="Cszy3" data-type="SheetDropDownList" id="ctl935379" class="" style="" data-schemacode="zjkcx" data-querycode="zjklb" data-filter="Cszy2:Pid" data-datavaluefield="Cid" data-datatextfield="TypeName" data-queryable="false"></select></div><div id="div147850" class="col-md-1"></div></div>
			<div class="row">
				<div id="title7" class="col-md-2">
					
				<span id="Label29" data-type="SheetLabel" data-datafield="Zynx" style="" class="">专业年限</span></div>
				<div id="control7" class="col-md-4">
					
				<input id="Control29" type="text" data-datafield="Zynx" data-type="SheetTextBox" style="" class=""></div>
				<div id="title8" class="col-md-2">
					
				</div>
				<div id="control8" class="col-md-4">
					
				</div>
			</div>
			<div class="row">
				<div id="title9" class="col-md-2">
					
				<span id="Label23" data-type="SheetLabel" data-datafield="Lxdh" style="" class="">联系电话</span></div>
				<div id="control9" class="col-md-4">
					
				<input id="Control23" type="text" data-datafield="Lxdh" data-type="SheetTextBox" style="" class=""></div>
				<div id="title10" class="col-md-2">
					
				<span id="Label24" data-type="SheetLabel" data-datafield="Yx" style="" class="">邮箱</span></div>
				<div id="control10" class="col-md-4">
					
				<input id="Control24" type="text" data-datafield="Yx" data-type="SheetTextBox" style="" class=""></div>
			</div>
			<div class="row">
				<div id="div732703" class="col-md-2">
					
				<span id="Label25" data-type="SheetLabel" data-datafield="Txdz" style="" class="">通讯地址</span></div>
				<div id="div705177" class="col-md-3">
					
				<input id="Control25" type="text" data-datafield="Txdz" data-type="SheetTextBox" style="" class=""></div>
				<div id="div937294" class="col-md-3">
					
				</div>
				<div id="div977097" class="col-md-3">
					
				</div>
				<div id="div588112" class="col-md-1">
				</div>
			</div>
			
			<div class="row"><div id="div220295" class="col-md-2"><label data-datafield="Gzjlhyj" data-type="SheetLabel" id="ctl85337" class="" style="">主要工作简历和业绩</label></div><div id="div194875" class="col-md-10"><textarea data-datafield="Gzjlhyj" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl186307" class=""></textarea></div></div>
			<div class="row">
				<div id="title17" class="col-md-2">
					<span id="Label27" data-type="SheetLabel" data-datafield="Fj" style="">附件</span>
				</div>
				<div id="control17" class="col-md-10">
					<div id="Control27" data-datafield="Fj" data-type="SheetAttachment" style="">
						
					</div>
				</div>
			</div><div class="row"><div id="div79017" class="col-md-2"><label data-datafield="Status" data-type="SheetLabel" id="ctl456132" class="" style="">可用状态</label></div><div id="div746503" class="col-md-4"><select data-datafield="Status" data-type="SheetDropDownList" id="ctl989312" class="" style="" data-defaultitems="可用;不可用" data-queryable="false"></select></div><div id="div252086" class="col-md-2"></div><div id="div305254" class="col-md-4"></div></div>
			<div class="row"><div id="div560619" class="col-md-2"><label data-datafield="WorkEvaluation" data-type="SheetLabel" id="ctl704358" class="" style="">工作业绩评价</label></div><div id="div97166" class="col-md-10"><table id="ctl951602" data-datafield="WorkEvaluation" data-type="SheetGridView" class="SheetGridView" style="" data-defaultrowcount="0" data-displayadd="false"><tbody><tr class="header"><td id="ctl951602_SerialNo" class="rowSerialNo">序号</td><td id="ctl951602_header0" data-datafield="WorkEvaluation.Zjgzlx" style=""><label id="ctl951602_Label0" data-datafield="WorkEvaluation.Zjgzlx" data-type="SheetLabel" style="">专家工作类型</label></td><td id="ctl951602_header1" data-datafield="WorkEvaluation.Xmmc" style=""><label id="ctl951602_Label1" data-datafield="WorkEvaluation.Xmmc" data-type="SheetLabel" style="">项目名称</label></td><td id="ctl951602_header2" data-datafield="WorkEvaluation.Gzmc" style=""><label id="ctl951602_Label2" data-datafield="WorkEvaluation.Gzmc" data-type="SheetLabel" style="">工作名称</label></td><td id="ctl951602_header3" data-datafield="WorkEvaluation.Kssj" style=""><label id="ctl951602_Label3" data-datafield="WorkEvaluation.Kssj" data-type="SheetLabel" style="">开始时间</label></td><td id="ctl951602_header4" data-datafield="WorkEvaluation.Jssj" style=""><label id="ctl951602_Label4" data-datafield="WorkEvaluation.Jssj" data-type="SheetLabel" style="">结束时间</label></td><td id="ctl951602_header5" data-datafield="WorkEvaluation.Gznr" style=""><label id="ctl951602_Label5" data-datafield="WorkEvaluation.Gznr" data-type="SheetLabel" style="">工作内容</label></td><td id="ctl951602_header6" data-datafield="WorkEvaluation.Yjpj" style=""><label id="ctl951602_Label6" data-datafield="WorkEvaluation.Yjpj" data-type="SheetLabel" style="">业绩评价</label></td><td class="rowOption hidden">删除</td></tr><tr class="template"><td></td><td id="ctl951602_control0" data-datafield="WorkEvaluation.Zjgzlx" style=""><input type="text" data-datafield="WorkEvaluation.Zjgzlx" data-type="SheetTextBox" id="ctl951602_control0" style=""></td><td id="ctl951602_control1" data-datafield="WorkEvaluation.Xmmc" style=""><input type="text" data-datafield="WorkEvaluation.Xmmc" data-type="SheetTextBox" id="ctl951602_control1" style=""></td><td id="ctl951602_control2" data-datafield="WorkEvaluation.Gzmc" style=""><input type="text" data-datafield="WorkEvaluation.Gzmc" data-type="SheetTextBox" id="ctl951602_control2" style=""></td><td id="ctl951602_control3" data-datafield="WorkEvaluation.Kssj" style=""><input type="text" data-datafield="WorkEvaluation.Kssj" data-type="SheetTime" id="ctl951602_control3" style=""></td><td id="ctl951602_control4" data-datafield="WorkEvaluation.Jssj" style=""><input type="text" data-datafield="WorkEvaluation.Jssj" data-type="SheetTime" id="ctl951602_control4" style=""></td><td id="ctl951602_control5" data-datafield="WorkEvaluation.Gznr" style=""><textarea data-datafield="WorkEvaluation.Gznr" style="height: 60px; width: 100%;" data-type="SheetRichTextBox" id="ctl951602_control5"></textarea></td><td id="ctl951602_control6" data-datafield="WorkEvaluation.Yjpj" style=""><input type="text" data-datafield="WorkEvaluation.Yjpj" data-type="SheetTextBox" id="ctl951602_control6" style=""></td><td class="rowOption hidden"><a class="delete"><div class="fa fa-minus"></div></a><a class="insert"><div class="fa fa-arrow-down"></div></a></td></tr></tbody></table></div></div>
		</div>
	</div>
</asp:Content>