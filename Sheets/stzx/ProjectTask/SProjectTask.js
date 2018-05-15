
   //设置任务编号
function getTastNum() {
    var type = "XM";
    var smallNum = "RW";
    var taskType = $.MvcSheetUI.GetControlValue("TaskType");
	if(taskType!=""){
		
		    $.ajax({
            type: "POST",    //页面请求的类型
            url: "/Portal/Sheets/common/CommonService.ashx?Command=GetSequenceNum",   //处理页的相对地址
            data: {
                Type: type, SmallNum: smallNum
            },
            async: false,
            success: function (data) {  
                //console.log(data.SequenceNum);
                if (data.status == "success") {
                    var date = new Date;
                    var year = date.getFullYear(); 
                    var taskNum = "RW-" + taskType + "-" + year + data.SequenceNum;
                    $.MvcSheetUI.SetControlValue("TaskNum", taskNum);
                    
                } 

            }
        });
	}else{	
		alert("请先选择任务类型！");	
	}
    
    }


//更新公文号
function updateSequenceNum() {
    var type = "XM";
    var smallNum = "RW";
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "/Portal/Sheets/common/CommonService.ashx?Command=UpdateSequenceNum",   //处理页的相对地址
        data: {
            Type: type, SmallNum: smallNum
        },
        async: true,
        success: function (data) {
  
        }
    });
}