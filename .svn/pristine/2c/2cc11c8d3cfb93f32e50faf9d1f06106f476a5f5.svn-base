/*
表单展现规则
Authine 2013-9
*/
Sheet.Format = function () {
    this.AttrName = "data-formatrule";
    this.init(this);
}

/*
*/
Sheet.Format.prototype = {
    init: function (o) {
        $("input[" + this.AttrName + "],span[" + this.AttrName + "]").each(function (e) {
            var formatrule = $(this).attr(e.AttrName);
            if (formatrule) {
                $(this).blur(function () {
                    // this.value = this.value.numberFormat(0, ".", ",");
                    var param = { cmd: "GetFormatValue", Format: formatrule, InputValue: this.value || this.innerText };
                    var returnValue;
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: _PORTALROOT_GLOBAL + "/AjaxServices.aspx",
                        data: param,
                        dataType: "html",
                        success: function (data) {
                            returnValue = data;
                        },
                        error: function (e) {
                            var msg = e.toString();
                            alert(msg);
                        }
                    });
                    if (returnValue) {
                        if (this.value)
                            this.value = returnValue;
                        else
                            this.innerText = returnValue;
                    }
                }).focus(function () {
                    this.value = this.value.replace(/,/g, "").replace(/$/g, "").replace(/¥/g, "");
                });
            }
        }, [this]);
    }
}
