/*
表单联动规则，由 SheetBizDropDownList 控件进行实现
Authine 2013-9
*/

var _Sheet_Display_GlobalString = { "Sheet_Display_Msg0": "显示规则设置错误：" };
////获取本地化字符串
//$.get(_PORTALROOT_GLOBAL + "/Ajax/GlobalHandler.ashx", { "Code": "Sheet_Display_Msg0" }, function (data) {
//    if (data.IsSuccess) {
//        _Sheet_Display_GlobalString = data.TextObj;
//    }
//}, "json");

Sheet.Display = function (sheet) {
    this.AttrName = "data-displayrule";
    this.sheet = sheet;
    this.init();
}

Sheet.Display.prototype = {
    init: function () {
        $("input[" + this.AttrName + "],span[" + this.AttrName + "],textarea[" + this.AttrName + "],select[" + this.AttrName + "],div[" + this.AttrName + "]").each(function (o) {
            if ($(this).parent().parent().hasClass("template")) {
                return;
            }

            var displayrule = $(this).attr(o.AttrName);
            if (displayrule) {
                o.registerEvent(this.id, displayrule);
            }
        }, [this]);
    },
    // 注册计算事件主方法
    registerEvent: function (id, eventExpress) {
        var fieldArray = eventExpress.split("{");
        var dataField;
        var isCount = false;
        for (var i = 1; i < fieldArray.length; i++) {
            var index = fieldArray[i].indexOf("}");
            if (index == -1) {
                alert(_Sheet_Display_GlobalString.Sheet_Display_Msg0 + eventExpress); return;
            }

            dataField = fieldArray[i].substring(0, index);

            // 获取控件
            var filterCtrl = this.sheet.findControlByDataField($("#" + id), dataField);
            if (!filterCtrl) return;

            filterCtrl.unbind("change." + id).bind("change." + id, [this], function (e) {
                e.data[0].selectChanged($("#" + id), eventExpress);
            });

            filterCtrl.change();
        }
    },
    selectChanged: function (obj, eventExpress) {
        debugger;
        var fieldArray = eventExpress.split("{");
        var dataField;
        var isCount = false;
        var rule = fieldArray[0];

        for (var i = 1; i < fieldArray.length; i++) {
            var index = fieldArray[i].indexOf("}");
            if (index == -1) {
                alert(_Sheet_Display_GlobalString.Sheet_Display_Msg0 + eventExpress); return;
            }

            dataField = fieldArray[i].substring(0, index);
            rule += "'" + this.sheet.getDataFieldValue(obj, dataField) + "'";
            rule += fieldArray[i].substring(index + 1);
        }

        var v = this.sheet.getResultValue(rule);// eval(rule);
        if (v) {
            var row = obj.parent().parent();
            if (row.is("tr")) row.show();
            var selectShow = false;
            if (obj.attr("data-type") == "SheetDropDownList") {
                if ($.MvcSheetUI.QueryString("Mode") == "View") {
                    selectShow = true;
                }
                else if ($.MvcSheetUI.QueryString("Mode") == "Work")
                {
                    //如果是不可编辑，不需要显示下拉框
                    if (obj.next().is("label"))
                    {
                        selectShow = true;
                    }
                }
                else {
                    obj.parent().find(".select2-container").show();
                }
            }
            //文本框
            if (obj.attr("data-type") == "SheetTextBox")
            {
                if ($.MvcSheetUI.QueryString("Mode") == "View") {
                    selectShow = true;
                }
                else if ($.MvcSheetUI.QueryString("Mode") == "Work") {
                    //如果是不可编辑，不需要显示下拉框
                    if (obj.next().is("label")) {
                        selectShow = true;
                    }
                }
            }
            //富文本框
            if (obj.attr("data-type") == "SheetRichTextBox") {
                if ($.MvcSheetUI.QueryString("Mode") == "View") {
                    selectShow = true;
                }
                else if ($.MvcSheetUI.QueryString("Mode") == "Work") {
                    //如果是不可编辑，不需要显示文本框
                    if (obj.parent().find("div.SheetRichTextBox").length>0) {
                        selectShow = true;
                    }
                }
            }
            if (!selectShow)
                obj.show();
        }
        else {
            if (obj.attr("data-type") == "SheetDropDownList") {
                obj.parent().find(".select2-container").hide();
            }
            obj.hide();
            var row = obj.parent().parent();
            var hasControl = false;
            row.find("label,span,input,select,textarea").each(function () {
                if (this.style.display != "none") hasControl = true;
            });
            if (!hasControl) {
                if (obj.attr("data-type") == "SheetDropDownList") {
                    obj.parent().find(".select2-container").hide();
                }
                row.hide();
            }
        }
    }
}