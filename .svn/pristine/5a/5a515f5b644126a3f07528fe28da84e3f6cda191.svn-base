$.MvcSheet.Loaded = function () {

    var BizObjectID = getUrlParam("BizObjectID");
    // 根据合同号码获取对应合同相关数据
    
    if (BizObjectID != null && BizObjectID != "") {

        $.ajax({
            type: "POST",    //页面请求的类型
            url: "Agreement_execute.ashx?Command=AgreementConect",   //处理页的相对地址
            data: {
                BizObjectID: BizObjectID
            },
            async: false,
            success: function (ret) {    //这是处理后执行的函数，msg是处理页返回的数据
                console.log(ret);
                var dtl = $.MvcSheetUI.GetElement("Project").SheetGridView();
                dtl._Clear();
                for (var i = 0; i < ret.length; i++) {
                    dtl._AddRow();
                    $.MvcSheetUI.SetControlValue("Project.Project_type", ret[i].agency_rate, i + 1);
                    $.MvcSheetUI.SetControlValue("Project.Project_Numbers", ret[i].agency_rate, i + 1);
                    $.MvcSheetUI.SetControlValue("Project.Project_names", ret[i].agency_rate, i + 1);
                    $.MvcSheetUI.SetControlValue("Project.Should_money", ret[i].agency_rate, i + 1);
                    $.MvcSheetUI.SetControlValue("Project.Received_money", ret[i].agency_rate, i + 1);
                    $.MvcSheetUI.SetControlValue("Project.Received_RMB", ret[i].agency_rate, i + 1);
                    $.MvcSheetUI.SetControlValue("Project.Agency_balance", ret[i].agency_rate, i + 1);
                }

            }
        });

        $("input[data-datafield='Project.Project_type']").attr("disabled", "disabled");
        $("input[data-datafield='Project.Project_Numbers']").attr("disabled", "disabled");
        $("input[data-datafield='Project.Project_names']").attr("disabled", "disabled");
        $("input[data-datafield='Project.Should_money']").attr("disabled", "disabled");
        $("input[data-datafield='Project.Received_RMB']").attr("disabled", "disabled");
        $("input[data-datafield='Project.Agency_balance']").attr("disabled", "disabled");
    } else {
        alert(111111111111111);
    }

}
/**
 * 自动生成协议号
 */
function Create_number() {
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "AgreeMent_main.ashx?Command=AgreementNo",   //处理页的相对地址
        data: {
            
        },
        async: false,
        success: function (ret) {    //这是处理后执行的函数，msg是处理页返回的数据
            
            $.MvcSheetUI.SetControlValue("AgreeMent_number", ret.AgreementNo);
            $.MvcSheetUI.SetControlValue("Numberid", ret.Number);

        }
    });
   
}
/**
*协议号修改申请
*/

function update_muber(el) {
    //alert(12313);
    var AgreeMent_name = $.MvcSheetUI.GetControlValue("AgreeMent_name");
    var Project_head_A = $.MvcSheetUI.GetControlValue("Project_head_A");
    var Project_head_B = $.MvcSheetUI.GetControlValue("Project_head_B");
    var AgreeMent_number = $.MvcSheetUI.GetControlValue("AgreeMent_number");
    var canUpdateFlg = true;
    //判断当前协议号是否有数据（是否进行保存过）
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "AgreeMent_main.ashx?Command=getByContractNo",   //处理页的相对地址
        data: {
            AgreeMent_number: AgreeMent_number,
        },
        async: false,
        success: function (ret) {    //这是处理后执行的函数，msg是处理页返回的数据
            if (ret == 2 ) {
                alert("协议号还不存在，无法申请修改（请先进行保存）");
                canUpdateFlg = false;

            }
        }
    });
    /**
     * 有任何一个值为空都不能通过
     */
    if (AgreeMent_name == '') {
        alert("请填写协议名称");
        return false;
    }
    if (Project_head_A == '') {
        alert('请填写项目负责人A');
        return false;
    }
    if (Project_head_B == '') {
        alert('请填写项目负责人B');
        return false;
    }
    if (AgreeMent_number == '') {
        alert('请生成协议号');
        return false;
    }

    if (canUpdateFlg) {
        //获取子流程的版本号
        var Process_version = $.MvcSheetUI.GetControlValue("Process_version");
        alert(Process_version);
        alert()
        window.location.href = "/Portal/Sheets/Agreement/Update_AgreementNumber/Update_AgreementNumber.aspx?Mode=Originate&WorkflowCode=Update_agreement_number&WorkflowVersion=" + Process_version
            + "&AgreeMent_number=" + AgreeMent_number;
    }
    
}