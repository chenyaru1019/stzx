/*
表单联动规则，由 SheetBizDropDownList 控件进行实现
Authine 2013-9
*/

//var _Sheet_Validate_GlobalString = { "Sheet_Validate_Msg0": "验证规则设置错误：" };
////获取本地化字符串
//$.get(_PORTALROOT_GLOBAL + "/Ajax/GlobalHandler.ashx", { "Code": "Sheet_Validate_Msg0" }, function (data) {
//    if (data.IsSuccess) {
//        _Sheet_Validate_GlobalString = data.TextObj;
//    }
//}, "json");

Sheet.Validate = function (sheet) {
    this.requiredValue = "data-requiredfield";
    this.AttrName = "data-vaildationrule";
    this.sheet = sheet;

    this.init();
}

Sheet.Validate.prototype = {
    init: function () {
        $("[" + this.AttrName + "]").each(function (o) {
            var validaterule = $(this).attr(o.AttrName);
            if (validaterule) {
                o.registerEvent(this.id, validaterule);
            }
        }, [this]);
        //$("input[" + this.AttrName + "],textarea[" + this.AttrName + "],select[" + this.AttrName + "]").each(function (o) {
        //    var validaterule = $(this).attr(o.AttrName);
        //    if (validaterule) {
        //        o.registerEvent(this.id, validaterule);
        //    }
        //}, [this]);
    },
    // 注册计算事件主方法
    registerEvent: function (id, eventExpress) {
        var fieldArray = eventExpress.split("{");
        var dataField;
        var isCount = false;
        for (var i = 1; i < fieldArray.length; i++) {
            var index = fieldArray[i].indexOf("}");
            if (index == -1) {
                alert(_Sheet_Validate_GlobalString.Sheet_Validate_Msg0 + eventExpress); return;
            }

            dataField = fieldArray[i].substring(0, index);

            // 获取控件
            var filterCtrl = this.sheet.findControlByDataField($("#" + id), dataField);
            if (!filterCtrl) return;

            filterCtrl.unbind("change.Validate" + id).bind("change.Validate" + id, [this], function (e) {
                e.data[0].selectChanged($("#" + id), eventExpress);
            });

            filterCtrl.change();
        }
    },
    selectChanged: function (obj, eventExpress) {
        var fieldArray = eventExpress.split("{");
        var dataField;
        var isCount = false;
        var rule = fieldArray[0];

        for (var i = 1; i < fieldArray.length; i++) {
            var index = fieldArray[i].indexOf("}");
            if (index == -1) {
                alert(_Sheet_Validate_GlobalString.Sheet_Validate_Msg0 + eventExpress); return;
            }

            dataField = fieldArray[i].substring(0, index);
            rule += "'" + this.sheet.getDataFieldValue(obj, dataField) + "'";
            rule += fieldArray[i].substring(index + 1);
        }
        var v = this.sheet.getResultValue(rule);

        var dataType = obj.attr("data-type");
        if (v) {
            if (dataType == "SheetDropDownList"
                || dataType == "SheetCheckboxList"
                || dataType == "SheetRadioButtonList") {
                var manager = null;
                switch (dataType) {
                    case "SheetDropDownList": manager = $(obj).SheetDropDownList(); break;
                    case "SheetCheckboxList": manager = $(obj).SheetCheckboxList(); break;
                    case "SheetRadioButtonList": manager = $(obj).SheetRadioButtonList(); break;
                    default: break;
                }
                manager.Required = true;
                manager.Validate();
            } else {
                obj.attr("data-Required", true);
            }
        }
        else {
            if (dataType == "SheetDropDownList"
                || dataType == "SheetCheckboxList"
                || dataType == "SheetRadioButtonList") {
                var manager = null;
                switch (dataType) {
                    case "SheetDropDownList": manager = $(obj).SheetDropDownList(); break;
                    case "SheetCheckboxList": manager = $(obj).SheetCheckboxList(); break;
                    case "SheetRadioButtonList": manager = $(obj).SheetRadioButtonList(); break;
                    default: break;
                }
                manager.Required = false;
                manager.RemoveInvalidText(manager.Element);
            } else {
                obj.removeAttr("data-Required");
                obj.removeClass($.MvcSheetUI.Css.inputError);
                var o = obj.next();
                if (o.hasClass("InvalidText")) o.remove();
            }
        }
        obj.trigger("change");
    }

    // End
}