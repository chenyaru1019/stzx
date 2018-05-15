// SheetInstancePrioritySelector控件
(function ($) {
    //控件执行
    $.fn.SheetInstancePrioritySelector = function () {
        return $.MvcSheetUI.Run.call(this, "SheetInstancePrioritySelector", arguments);
    };

    $.MvcSheetUI.Controls.SheetInstancePrioritySelector = function (element, options, sheetInfo) {
        $.MvcSheetUI.Controls.SheetInstancePrioritySelector.Base.constructor.call(this, element, options, sheetInfo);
    };

    $.MvcSheetUI.Controls.SheetInstancePrioritySelector.Inherit($.MvcSheetUI.IControl, {
        Render: function () {
            var $element = $(this.Element);
            var that = this;
            //不可见返回
            if (!this.Visiable) {
                $element.hide();
                return;
            }

            //绑定change事件
            $element.unbind("change.SheetInstancePrioritySelector").bind("change.SheetInstancePrioritySelector", function () {
                if ($.isFunction(that.OnChange)) {
                    that.OnChange.apply(this);
                }
                else {
                    (new Function(that.OnChange)).apply(this);
                }
            });

            var priorities = $.MvcSheetUI.SheetInfo.Priorities;
            if (priorities) {
                $element.empty();
                for (var key in priorities) {
                    $element.append("<option value='" + key + "'>" + priorities[key] + "</option>");
                }

                this.V = this.V || this.DefaultValue;
                if (this.V && this.V != "") {
                    $element.val(this.V);
                }
                else {
                    $element.val("Normal");
                }

                //不可编辑
                if (!this.Editable) {
                    $element.after("<label style='width:100%;'>" + $element.children("option:selected").text() + "</label>");
                    $element.hide();
                }
            }
        },
        RenderMobile: function () {
            //可编辑
            if (this.Editable) {
                this.constructor.Base.RenderMobile.apply(this);
                this.Mask.hide();
                $(this.Element).closest("div.item").addClass("item-select");
            }
            else {
                this.Render();
            }
        },
        GetText: function () {
            return $(this.Element).children("option:selected").text();
        },
        //返回数据值
        SaveDataField: function () {
            var result = {};
            if (!this.Visiable || !this.Editable) return result;
            result[this.DataField] = this.SheetInfo.BizObject.DataItems[this.DataField];
            if (!result[this.DataField]) {
                alert(SheetLanguages.Current.DataItemNotExists + ":" + this.DataField);
                return {};
            }
            if (result[this.DataField].V != $(this.Element).val()) {
                $.MvcSheetUI.Priority = $(this.Element).val();
                result[this.DataField].V = $(this.Element).val();
                return result;
            }
            return {};
        }
    });
})(jQuery);