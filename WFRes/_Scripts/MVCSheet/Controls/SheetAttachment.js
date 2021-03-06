﻿// 附件控件
(function ($) {

    $.fn.SheetAttachment = function () {
        return $.MvcSheetUI.Run.call(this, "SheetAttachment", arguments);
    };

    // 构造函数
    $.MvcSheetUI.Controls.SheetAttachment = function (element, ptions, sheetInfo) {
        //this.SheetAttachmentHandler = _PORTALROOT_GLOBAL + "/Ajax/FileUploadHandler.ashx";
        this.SheetAttachmentHandler = _PORTALROOT_GLOBAL + "/FileUpload/UploadFile";
        this.FileUpload = $("<input type='file' />").attr("data-attachment", true);
        //文件数
        this.Files = 0;
        //新添加的
        this.AddAttachments = {};
        this.UploadAttachmentsIds = [];
        //删除数据库的
        this.RomveAttachments = [];
        //异步数据
        this.XHRJson = {};
        //数据模型编码
        this.SchemaCode = "";

        //隐藏了可配置属性，设置固定多选
        this.Multiple = true;

        $.MvcSheetUI.Controls.SheetAttachment.Base.constructor.call(this, element, ptions, sheetInfo);
    };

    // 继承及控件实现
    $.MvcSheetUI.Controls.SheetAttachment.Inherit($.MvcSheetUI.IControl, {
        Render: function () {
            if (!this.Visiable) {
                $(this.Element).hide();
                return;
            }

            this.HtmlRender();
            //初始化数据
            this.InitValue();

            //是否支持Html5
            if ((this.IsHtml5)) {
                this.Html5Render();
            }
            else {
                this.NotHtml5Render();
            }
        },
        RenderMobile: function () {
            this.Render();
            //this.MoveToMobileContainer(this.Element);
            //移动端附件需要另外创建一个div存放内容
            var oldDivContainer = $(this.Element).closest("div.item");
            oldDivContainer.css("padding", "0").removeClass("item-input");
            var spantitle = $(this.Element).parent().prev().remove();
            var newDivTitle = $("<div class='item item-input'></div>");
            newDivTitle.append(spantitle);
            newDivTitle.insertBefore(oldDivContainer);
            $(this.Element).parent().width("100%");

            //if (this.Editable) {
            //    this.btnUpload = $("<div class=\"button button-block button-outline button-calm\" >选择文件上传</div>").appendTo($(this.Element));
            //    var _that = this;
            //    this.btnUpload.bind("click.uploadAttachment", function () { _that.MobileSelectFileAction() })
            //}   ion-ios-arrow-right

            if (this.Editable) {
                this.btnUpload = $('<div class="detail item-icon-right"><i class="icon ion-paperclip"></i></div>').appendTo(newDivTitle);
                var _that = this;
                newDivTitle.bind("click.uploadAttachment", function () { _that.MobileSelectFileAction() })
            }
        },


        MobileSelectFileAction: function () {
            var _that = this;
            var u = navigator.userAgent;
            var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
            var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
            var isDingTalk = $.MvcSheetUI.IonicFramework.$rootScope.dingMobile.isDingMobile;
            if (isiOS || isDingTalk) {
                _that.FileUpload.click();
            }
            else {
                var hideSheet = $.MvcSheetUI.IonicFramework.$ionicActionSheet.show({
                    buttons: [
                      { text: '拍照' },
                      { text: '文件选择' }
                    ],
                    cancelText: '取消',
                    cancel: function () {
                        return false;
                    },
                    buttonClicked: function (index) {
                        if (index == 0) {
                            hideSheet()
                            //限定只能上传图片和相机
                            _that.FileUpload.removeAttr("multiple").attr("accept", "image/*").attr("capture", "camera")
                            if ($(_that.Element).data($.MvcSheetUI.DataFieldKey.toLowerCase()) != _that.DataField) return;
                            _that.FileUpload.click();

                        } else {
                            hideSheet()
                            _that.FileUpload.removeAttr("capture").removeAttr("accept");
                            if (_that.FileExtensions) {
                                _that.FileUpload.attr("accept", _that.FileExtensions)
                            }
                            if ($(_that.Element).data($.MvcSheetUI.DataFieldKey.toLowerCase()) != _that.DataField) return;
                            _that.FileUpload.click();
                        }
                    }
                });
                $.MvcSheetUI.IonicFramework.$timeout(function () {
                    hideSheet();
                }, 10000);
            }
        },
        MobileItemClick: function (fileId, fileUrl, IsImg) {
            var _that = this;
            var buttons = [
                  { text: '下载', code: 'download' },
                  { text: '删除', code: 'delete' }
            ];
            if (!fileUrl && this.Editable) {
                buttons = [{ text: '删除', code: 'delete' }];
            };
            if (fileUrl && !this.Editable) {
                buttons = [{ text: '下载', code: 'download' }];
            };
            var hideSheet = $.MvcSheetUI.IonicFramework.$ionicActionSheet.show({
                buttons: buttons,
                titleText: '附件操作',
                cancelText: '取消',
                buttonClicked: function (index, button) {
                    console.log(button)
                    if (button.code == "download") {
                        var url = window.location.href;
                        url = url.split(_PORTALROOT_GLOBAL)[0];
                        if ($.MvcSheetUI.IonicFramework.$rootScope.dingMobile.isDingMobile && dd) {
                            dd.biz.util.openLink({
                                url: url + fileUrl,
                                onSuccess: function (result) { },
                                onFail: function (err) { }
                            });
                        } else {
                            if (IsImg) {
                                $.MvcSheetUI.IonicFramework.$state.go("form.downLoadFile", { isimg: true, url: url + fileUrl });
                            }
                            else {
                                window.open(fileUrl);
                            }
                        }
                    } else if (button.code == "delete") {
                        _that.RemoveFile.apply(_that, [fileId]);
                    }
                    return true;
                }
            });
        },

        //初始化已上传文件
        InitValue: function () {
            if (this.V) {
                //子表编辑时
                if (this.BizObjectID == undefined) {
                    this.BizObjectID = this.SheetInfo.BizObjectID;
                }

                for (var i = 0; i < this.V.length; ++i) {
                    this.CreateFileElement($.trim(this.V[i].Code), this.V[i].Name, this.V[i].Size, this.V[i].Url, this.V[i].ContentType);
                }

                /*批量下载
                 *只有一个文件的时候不需要批量下载
                 */
                if (!this.IsMobile && this.AllowBatchDownload && this.V.length > 1) {
                    var BatchDownload = $("<a href=\"" + _PORTALROOT_GLOBAL + "/ReadAttachment/ReadBatch?BizObjectID=" + this.BizObjectID + "&SchemaCode=" + this.SchemaCode + "&DataField=" + this.DataField + "&DisplayName=" + this.DataField + "\" class=\"printHidden\">批量下载</a>");
                    $(this.Element).append(BatchDownload);
                    if (this.IsMobile) {
                        BatchDownload.css("margin-left", "10px").css("margin-right", "10px").addClass("button").addClass("block");
                    }
                    else {
                        BatchDownload.width("100%")
                        .addClass("btn").addClass("btn-outline").addClass("btn-lg")
                        .css("border", "1px dashed #ddd");
                    }
                }
            }
        },
        // 数据验证
        Validate: function (effective, initValid) {
            if (!this.Editable) return true;
            if (initValid) {
                if (this.Required && this.Files < 1) {
                    this.AddInvalidText(this.Element, "*", false);
                    return false;
                }
            }
            if (!effective) {
                if (this.Required) {//必填的
                    if (this.Files < 1) {
                        this.AddInvalidText(this.Element, "*");
                        return false;
                    }
                    // IE8  产品不支持IE8
                    if (false && this.Files[0] == null && $(this.Element).find("a").length < 2) {
                        this.AddInvalidText(this.Element, "*");
                        return false;
                    }
                }
            }

            if (this.IsHtml5) {
                //如果是支持Html5的话，得判断是否已经上传完整，需要等待
                for (var key in this.AddAttachments) {
                    if (this.AddAttachments[key].state == 0) {
                        this.AddInvalidText(this.Element, SheetLanguages.Current.Uploading);
                        return false;
                    }
                }
            }
            else {
                this.Form.submit();
            }

            this.RemoveInvalidText(this.Element);
            return true;
        },

        SaveDataField: function () {
            var result = {};
            if (!this.Visiable || !this.Editable) return result;

            //result[this.DataField] = this.SheetInfo.BizObject.DataItems[this.DataField];
            result[this.DataField] = this.DataItem;

            result[this.DataField].V = this.GetValue();
            return result;
        },

        GetValue: function () {
            var AttachmentIds = "";
            if ((this.IsHtml5)) {
                //如果是支持Html5的话，得判断是否已经上传完整，需要等待
                for (var key in this.AddAttachments) {
                    if (this.AddAttachments[key].state == 1 && this.AddAttachments[key].AttachmentId) {
                        AttachmentIds += this.AddAttachments[key].AttachmentId + ";";
                    }
                }
            }
            else {
                for (var i = 0; i < this.UploadAttachmentsIds.length; i++) {
                    AttachmentIds += this.UploadAttachmentsIds[i] + ";"
                }
            }

            var DelAttachmentIds = "";
            for (var i = 0; i < this.RomveAttachments.length; ++i) {
                DelAttachmentIds += this.RomveAttachments[i] + ";";
            }
            var result = {
                AttachmentIds: AttachmentIds,
                DelAttachmentIds: DelAttachmentIds
            };
            return result;
        },

        GetText: function () {
            return this.Files;
        },

        ClearFiles: function () {
            $(this.Element).html("");
            this.Files = 0;
            this.Validate();
        },

        HtmlRender: function () {
            //设置宽度
            $(this.Element).addClass("SheetAttachment");

            if (this.IsMobile) {
                this.UploadList = $("<div class='list'></div>")
            }
            else {
                //添加附件展示列表和按钮
                this.UploadList = $("<table class='table table-striped'></table>").css("margin", 0).css("min-height", "0px");
            }

            $(this.Element).append(this.UploadList);
        },

        NotHtml5Render: function () {
            if (!this.Editable) return;
            $(this.Element).width(this.Width);
            var id = $.MvcSheetUI.NewGuid();

            var param = "DataField=" + encodeURI(this.DataField) + "&PostForm=true&BizObjectID=" + this.SheetInfo.BizObjectID + "&SchemaCode=" + encodeURI(this.SchemaCode);
            param += "&MaxSize=" + (this.MaxUploadSize * 1024);
            //设置form属性，关键是target要指向iframe
            this.Form = $("<form id=\"" + id + "\" method=\"post\" enctype=\"multipart/form-data\" action=\"" + this.SheetAttachmentHandler + "?" + param + "\"></form>");
            $(this.Element).append(this.Form);
            ///创建iframe
            this.CreateFrame();

            //是否多选
            if (this.Multiple) {
                this.BtnAdd = $("<div>" + SheetLanguages.Current.Add + "</div>").addClass("SheetAttachmentAdd");
                $(this.Form).append(this.BtnAdd);
                $(this.BtnAdd).unbind("click.AddAttachment").bind("click.AddAttachment", this, function (e) {
                    e.data.AddAttachment.apply(e.data);
                });
            }
            else {
                $(this.FileUpload).attr("name", $.MvcSheetUI.NewGuid());
                $(this.Form).append(this.FileUpload);
            }
            this.BtnUpload = $("<div>" + SheetLanguages.Current.Upload + "</div>").addClass("SheetAttachmentUpload");
            $(this.BtnUpload).unbind("click.UploadAttachment").bind("click.UploadAttachment", this, function (e) {
                e.data.Form.submit();

                var ids = "";
                $(e.data.Form).find("input").each(function () {
                    if (this.value) ids += "," + this.name;
                    if (e.data.UploadAttachmentsIds.indexOf(this.name) == -1) {
                        e.data.UploadAttachmentsIds.push(this.name);
                    }
                });
                var that = e.data;
                if (ids) {
                    setTimeout(function () {
                        that.CheckUpload(ids)
                    }, 500);
                }
            });
            $(this.Form).append(this.BtnUpload);
            this.AddAttachment();
        },
        CheckUpload: function (ids) {
            var that = this;
            $.MvcSheet.GetSheet(
                {
                    "Command": "GetAttachmentHeader",
                    "Param": JSON.stringify([this.SheetInfo.SchemaCode, this.SheetInfo.BizObjectID, ids])
                },
                function (data) {
                    if (data && data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            that.CreateFileElement(data[i].AttachmentID, data[i].FileName, data[i].ContentLength, that.PortalRoot + "/ReadAttachment/Read?AttachmentID=" + data[i].AttachmentID, data[i].ContentType)
                            ids = ids.replace("," + $.trim(data[i].AttachmentID), "");

                            $("div[id='" + $.trim(data[i].AttachmentID) + "']").remove();
                        }
                    }

                    if (ids) {
                        setTimeout(function () {
                            that.CheckUpload(ids)
                        }, 500);
                    }
                }
            );
        },
        // 创建iframe
        CreateFrame: function () {
            var FrameName = "uploadFrame_" + $.MvcSheetUI.NewGuid();
            var oframe = $('<iframe name=' + FrameName + '>');
            //修改样式是css，修改属性是attr
            oframe.css("display", "none");
            //在内部的前面加节点
            $('body').prepend(oframe);
            //设置form属性，关键是target要指向iframe
            this.Form.attr("target", FrameName);
            this.Form.attr("method", "post");
            //注意ie的form没有enctype属性，要用encoding
            this.Form.attr("encoding", "multipart/form-data");
        },
        // 非Html5添加附件 
        AddAttachment: function () {
            var contentid = $.MvcSheetUI.NewGuid();
            var newContent = $("<div>").attr("id", contentid).addClass("upload").css("clear", "both");//.css("padding-bottom", "6px");
            var fileinput = $("<input type=\"file\" style=\"width:60%;\"  />").attr("name", contentid);
            var btnDel = $("<a href='#' style=\"padding-left:10px;\">" + SheetLanguages.Current.Remove + "</a>").attr("data-content", contentid);

            $(btnDel).unbind("click.DeleteAttachment").bind("click.DeleteAttachment", this, function (e) {
                e.data.Files--;
                $("#" + $(this).attr("data-content")).remove();
            });

            newContent.append(fileinput).append(btnDel);
            $(this.BtnAdd).before(newContent);
            this.Files++;
            this.Validate();
        },
        // Html5渲染
        Html5Render: function () {
            if (!this.Editable) return;
            // 是否多选
            if (this.Multiple) {
                this.FileUpload.attr("multiple", "multiple");
            }

            //上传地址
            this.SheetAttachmentHandler += "?IsMobile=" + this.IsMobile + "&" + "SchemaCode=" + encodeURI(this.SchemaCode) + "&fileid=";

            this.ActionPanel = $("<div>" + SheetLanguages.Current.DragUpload + "</div>")
            if (this.IsMobile) {
                this.ActionPanel.css("margin-left", "10px").css("margin-right", "10px").addClass("button").addClass("block");
            }
            else {
                this.ActionPanel.width("100%")
                    .addClass("btn").addClass("btn-outline").addClass("btn-lg")
                    .css("border", "1px dashed #ddd");
            }
            $(this.Element).append(this.ActionPanel);

            if (this.FileExtensions) {
                this.FileUpload.attr("accept", this.FileExtensions);
            }

            //添加上传控件
            $(this.Element).append(this.FileUpload);
            if (this.IsMobile) {
                this.ActionPanel.hide();
                this.FileUpload.hide();//
            }
            else {
                this.FileUpload.hide();
            }
            $(this.ActionPanel).unbind("click.SheetAttachment").bind("click.SheetAttachment", this, function (e) {
                $.extend(this, e.data);
                if ($(this.Element).data($.MvcSheetUI.DataFieldKey.toLowerCase()) != this.DataField) return;
                this.FileUpload.click();
            });

            this.FileUpload.unbind("change.FileUpload").bind("change.FileUpload", this, function (e) {
                e.data.AddFiles.apply(e.data, [e.data.getFiles(this.files)]);
                $(this).val("")
            });

            this.BindDrag();
        },
        //绑定拖拽上传事件
        BindDrag: function () {
            //移动端不支持拖拽
            if (this.IsMobile) return;
            $(this.ActionPanel).on({
                dragenter: function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                },
                dragleave: function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                },
                dragover: function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                }
            });

            var that = this;
            this.ActionPanel[0].addEventListener("drop", function (e) {
                e.stopPropagation();
                e.preventDefault();//取消默认浏览器拖拽效果

                var files = that.getFiles(e.dataTransfer.files);
                that.AddFiles.apply(that, [files]);
            }, false);
        },
        getFiles: function (files) {
            var filesArr = [];
            for (var i = 0; i < files.length; i++) {
                filesArr.push(files[i]);
            }
            return filesArr;
        },
        //链接点击时打开图片
        _OpenImage: function (e) {
            var thisAnchor = $(e.target);
            if (!thisAnchor.is("[data-img-url]")) {
                thisAnchor = $(thisAnchor).closest("[data-img-url]");
            }
            var panelId = $(thisAnchor).attr("img-panel-id");

            if (!panelId) {
                panelId = $.uuid();
                $(thisAnchor).attr("img-panel-id", panelId);

                var _panel = $("<div>").addClass("panel").attr("id", panelId).attr("js-scrolling", "false").attr("data-footer", "none");
                var _imgWrapper = $("<div>").addClass("img-wrapper");
                var img = document.createElement("img");
                _imgWrapper.append(img);
                _panel.append(_imgWrapper);
                _panel.appendTo("#content");
                $.ui.loadContent(panelId);

                img.onload = function () {
                    var thisImg = $(arguments[0].target);
                    var imgWidth = thisImg.width();
                    //var imgheight = thisImg.height();
                    var panelWidth = $(thisImg).closest(".panel").width();
                    //var panelHeight = $("#content").height();

                    //默认缩放
                    var zoomMin = 1;
                    //如果图片过宽，将图片默认显示为适应屏幕宽度
                    if (imgWidth > panelWidth) {
                        zoomMin = panelWidth / imgWidth;
                    }

                    setTimeout(function () {
                        imgScroll = new IScroll(_imgWrapper.get(0), {
                            zoom: true,
                            zoomMin: zoomMin,
                            zoomMax: 4,
                            scrollX: true,
                            scrollY: true,
                            wheelAction: "zoom"
                        });
                        imgScroll.zoom(zoomMin);
                    }, 600)
                }
                //img.src = $(thisAnchor).attr("data-img-url");
                var url = $(thisAnchor).attr("data-img-url");
                $.ajax({
                    type: "POST",
                    url: url,
                    success: function (data) {
                        img.src = data;
                    }
                });
            }
            else {
                $.ui.loadContent(panelId);
            }
        },
        //渲染图片链接
        RenderImageAnchor: function (anchor, url) {
            anchor.unbind("click").bind("click", this._OpenImage);
        },

        //创建上传元素
        //有url就是已经上传的控件，不需要判断size 大小
        CreateFileElement: function (fileid, name, size, url, contentType) {
            var fileSizeStr = 0;
            if (size > 1024 * 1024)
                fileSizeStr = (Math.round(size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
            else
                fileSizeStr = (Math.round(size * 100 / 1024) / 100).toString() + 'KB';
            var fileSize = $("<td data-filesize='" + fileid + "'><span data-filerate='" + fileid + "'>" + SheetLanguages.Current.Loading + "</span> (" + fileSizeStr + ")</td>").addClass("text-info");
            var actionTd = $("<td data-action='" + fileid + "' class=\"printHidden\"></td>");


            //岩竹玉雨注：图片删除标签
            var actionTdimg = $("<span data-action='" + fileid + "' class=\"printHidden\"></span>");
            //岩竹玉雨注：只为修改字体颜色为白色而添加
            var actionStrimg = $("<a href='javascript:void(0);' class='fa fa-minus' style='color:#fcfcfc'>" + SheetLanguages.Current.Remove + "</a>");



            //移动端使用span
            if (this.IsMobile) {
                fileSize = $("<span class='item-note' data-filesize='" + fileid + "'>（" + fileSizeStr + "）</span><span class='item-note' data-filerate='" + fileid + "'>" + SheetLanguages.Current.Loading + "</span>")
                actionTd = $("<span data-action='" + fileid + "' class=\"printHidden\"></span>");
            }
            //移动端不需要actionStr
            //var actionStr = $("<a href='javascript:void(0);' class='fa fa-minus'>" + SheetLanguages.Current.Remove + "</a>");
            var actionStr = $("<a href='#' class='fa fa-minus'>" + SheetLanguages.Current.Remove + "</a>");
            if (this.Editable) {
                actionStr.unbind("click.fileDeleteBtn").bind("click.fileDeleteBtn", this, function (e) {
                    if (confirm(SheetLanguages.Current.ConfirmRemove)) {
                        e.data.RemoveFile.apply(e.data, [$(this).closest("tr").attr("id")]);
                    }
                });

                //岩竹玉雨注：只为修改字体颜色为白色而添加
                actionStrimg.unbind("click.fileDeleteBtn").bind("click.fileDeleteBtn", this, function (e) {
                    if (confirm(SheetLanguages.Current.ConfirmRemove)) {
                        e.data.RemoveFile.apply(e.data, [$(this).closest("tr").attr("id")]);
                    }
                });
            }
            else {
                actionStr.hide();
            }

            //标志是否能上传
            var flag = true;
            var fileName = name;
            var fileType = "";
            if (fileName.lastIndexOf(".") > 0) {
                fileName = name.substring(0, name.lastIndexOf("."));
                fileType = name.substring(name.lastIndexOf("."), name.length);
            }
            if (url == undefined) {
                if (this.FileExtensions) {
                    //文件格式校验
                    if (fileType != "") {
                        if (this.FileExtensions.indexOf(fileType) < 0) {
                            flag = false;
                        }
                    }
                    else {
                        flag = false;
                    }
                }
                if (!flag) {

                    if (this.IsMobile) {
                        fileSize = $("<span data-filesize='" + fileid + "'data-filerate='" + fileid + "' style='color:red;'>" + SheetLanguages.Current.FileExtError + "</span>" + "<span>(" + fileSizeStr + ")</span>")
                    } else {
                        fileSize = $("<td data-filesize='" + fileid + "'><span data-filerate='" + fileid + "' style='color:red;'>" + SheetLanguages.Current.FileExtError + "</span> (" + fileSizeStr + ")</td>").addClass("text-info");
                    }
                }
                else {
                    //判断文件大小 
                    var mbSize = Math.round(size * 100 / (1024 * 1024)) / 100;
                    if (size > 1024 * 1024 && mbSize > this.MaxUploadSize) {
                        flag = false;

                        if (this.IsMobile) {
                            fileSize = $("<span data-filesize='" + fileid + "'data-filerate='" + fileid + "' style='color:red;'>" + SheetLanguages.Current.OverMaxLength + "</span>" + "<span>(" + fileSizeStr + ")</span>")
                        } else {
                            fileSize = $("<td data-filesize='" + fileid + "'><span data-filerate='" + fileid + "'  style='color:red;'>" + SheetLanguages.Current.OverMaxLength + "</span> (" + fileSizeStr + ")</td>").addClass("text-info");
                        }
                    }
                }


            }
            else {


                if (!this.IsMobile) {
                    actionTd.append($("<a href='" + url + "' class='fa fa-download' target='_blank' UC=true>" + SheetLanguages.Current.Download + "</a>"));
                    actionTd.append("&nbsp;&nbsp;");
                    //岩竹玉雨注：给图片actionTdimg 添加下载标签。修改字体颜色为白色
                    actionTdimg.append($("<a href='" + url + "' class='fa fa-download' style='color:#fcfcfc' target='_blank' UC=true>" + SheetLanguages.Current.Download + "</a>"));
                    actionTdimg.append("&nbsp;&nbsp;");
                }
                if (this.IsMobile) {
                    fileSize = $("<span class='item-note' data-filesize='" + fileid + "'>" + fileSizeStr + "</span>")
                } else {
                    fileSize = $("<td data-filesize='" + fileid + "'>" + fileSizeStr + "</td>").addClass("text-info");
                }
            }


            //岩竹玉雨注：附件为图片时，tr添加自定义样式，使其横向排列。
            var trRow = null;
            if (contentType.toLowerCase().indexOf("image/") == 0) {
                trRow = $("<tr style='float:left;position: relative;white-space:nowrap'></tr>").attr("id", fileid);
            } else {
                trRow = $("<tr></tr>").attr("id", fileid);
            }
            if (this.IsMobile) {
                trRow = $("<a class='item item-input item-icon-right' style='white-space:nowrap' href='javascript:void(0)'></a>").attr("id", fileid);
            }

            if (!this.IsMobile || url == undefined) {
                //岩竹玉雨注：新上传文件添加html标签使其显示在网页中。
                if (contentType.toLowerCase().indexOf("image/") == 0) {//如为图片显示图片格式
                    trRow.append("<td colspan='3'><div class='file-item thumbnail'><img class='fileimgs_" + fileid + "' src='" + url + "' style='width:300px;height:150px' /><div class='info' id='info_" + fileid + "'>" + name + "</div></div><div style='height: 30px;' class='file-panel' id='file-panel_" + fileid + "'></div></td>");
                } else {

                    trRow.append("<td ><div class='LongWord'>" + name + "</div></td>");
                }

                //if (url == undefined && this.IsMobile) {
                //    trRow.append("<label class='input-label'>" + name + "<label>")
                //    trRow.bind("click.mobilerow", this, function (e) {
                //        e.data.MobileItemClick.apply(e.data, [trRow.attr("id"), url]);
                //    });
                //} else {
                //    trRow.append("<td ><div class='LongWord'>" + name + "</div></td>");
                //}

            }
            else {
                //移动端显示图片在Div里
                if (this.IsMobile && contentType && contentType.toLowerCase().indexOf("image/") == 0) {
                    trRow.attr("data-img-url", url);
                    trRow.append("<label  class='input-label'>" + name + "<label>")
                    trRow.attr("data-url", url);
                    trRow.bind("click.mobilerow", this, function (e) {
                        e.data.MobileItemClick.apply(e.data, [trRow.attr("id"), url, true]);
                    });
                }
                else {
                    if (this.IsMobile) {
                        trRow.append("<label  class='input-label'>" + name + "<label>")
                        trRow.attr("data-url", url);
                        trRow.unbind("click.mobilerow").bind("click.mobilerow", this, function (e) {
                            e.data.MobileItemClick.apply(e.data, [trRow.attr("id"), url]);
                        });
                    } else {
                        trRow.append("<td ><a href='" + url + "' class='fa fa-download' target='_blank' UC=true><div class='LongWord'>" + name + "</div></a></td>");
                    }
                }
            }

            //岩竹玉雨注： 添加条件判断。
            if (contentType.toLowerCase().indexOf("image/") != 0) {
                trRow.append(fileSize.css("text-align", "right"));
                trRow.append(actionTd.append(actionStr).css("text-align", "center"));
            }
            this.UploadList.append(trRow);

            //岩竹玉雨注： 添加下载删除标签，放在UploadList.append之后，才有$("#file-panel_" + fileid)
            if (contentType.toLowerCase().indexOf("image/") == 0) {
                $("#file-panel_" + fileid).append(actionTdimg.append(actionStrimg));
            }

            //trRow.append(fileSize.css("text-align", "right"));
            //if (!this.IsMobile) {
            //    trRow.append(actionTd.append(actionStr).css("text-align", "center"));
            //}
            if (flag) {
                this.Files++;
            }

            var divWidth = 150;
            if ($(this.Element).width() > 100)
                divWidth = $(this.Element).width() / 2;

            trRow.find(".LongWord").width(divWidth + "px");
            //计算文字的长度
            var temID = $.MvcSheetUI.NewGuid();
            var wordWidth = $("<span>").attr("id", temID).text(name).appendTo("body").width();
            $("#" + temID).remove();
            if (divWidth < wordWidth) {
                trRow.find(".LongWord").attr("title", name).css("float", "left").after(fileType);
            }

            return flag;
        },
        //添加文件
        AddFiles: function (files) {
            if (!this.Multiple) {
                this.ClearFiles();
            }
            // 改成列队上传模式
            if (files && files.length > 0) {
                var fileid = $.MvcSheetUI.NewGuid();
                if (this.CreateFileElement(fileid, files[0].name, files[0].size, null, files[0].type)) {
                    //需要添加的附件
                    this.AddAttachments[fileid] = {
                        fileid: fileid,
                        file: files[0],
                        ContentType: files[0].type,
                        xhr: new XMLHttpRequest(),
                        state: 0//0:未上传完，1:已上传完,100:失败
                    };
                    files.splice(0, 1);
                    this.UploadFile(fileid, files);
                }
            }

        },
        //上传
        UploadFile: function (fileid, files) {
            if (this.AddAttachments[fileid] == null && this.AddAttachments[fileid].state != 0) return;

            var fd = new FormData();
            fd.append('fileToUpload', this.AddAttachments[fileid].file);
            fd.append('MaxSize', this.MaxUploadSize * 1024);

            var xhr = this.AddAttachments[fileid].xhr;
            xhr.context = this;
            xhr.files = files;
            xhr.upload.fileid = fileid;
            xhr.abort.fileid = fileid;

            xhr.upload.addEventListener('progress', this.UploadProgress, false);
            xhr.addEventListener('load', this.UploadComplete, false);
            xhr.addEventListener('error', this.UploadFailed, false);
            xhr.addEventListener('abort', this.UploadCanceled, false);

            xhr.open('POST', this.SheetAttachmentHandler + fileid);
            xhr.send(fd);
        },
        UploadProgress: function (evt) {
            if (evt.lengthComputable) {
                var percentComplete = Math.round(evt.loaded * 100 / evt.total);
                /*
                 * 在上传大文件的时候，在后台处理的时间会比较久
                 * 先只将上传进度显示为99%，在UploadComplete里改为100%
                 */
                if (percentComplete >= 100) percentComplete = 99;
                $("span[data-filerate='" + evt.currentTarget.fileid + "']").html(percentComplete + "%");
            }
            else {
                this.context.AddAttachments[evt.currentTarget.fileid].state = 100;
                $("span[data-filerate='" + evt.currentTarget.fileid + "']").css("color", "red").html(SheetLanguages.Current.UploadError);
            }
        },
        UploadComplete: function (evt) {
            if (evt.target.status == 200) {
                var resultObj = eval('(' + evt.target.responseText + ')');
                var fileid = resultObj.FileId;
                this.context.AddAttachments[fileid].state = 1;
                this.context.AddAttachments[fileid].AttachmentId = resultObj.AttachmentId;
                $("td[data-action='" + fileid + "']").prepend("&nbsp;&nbsp;");
                if (this.context.IsMobile) {
                    //显示图片
                    if (this.context.AddAttachments[fileid].ContentType && this.context.AddAttachments[fileid].ContentType.toLowerCase().indexOf("image/") == 0) {
                        $("#" + fileid).attr("data-img-url", resultObj.Url)
                        .attr("data-url", resultObj.Url)
                        .unbind("click.mobilerow")
                        .bind("click.mobilerow", this.context, function (e) {
                            e.data.MobileItemClick.apply(e.data, [fileid, resultObj.Url, true]);
                        });
                    }
                    else {
                        $("#" + fileid)
                        .attr("data-url", resultObj.Url)
                        .unbind("click.mobilerow")
                        .bind("click.mobilerow", this.context, function (e) {
                            e.data.MobileItemClick.apply(e.data, [fileid, resultObj.Url]);
                        });
                    }
                }
                else {
                    console.log("电脑端");
                    //岩竹玉雨注：图片附件处理
                    if (this.context.AddAttachments[fileid].ContentType && this.context.AddAttachments[fileid].ContentType.toLowerCase().indexOf("image/") == 0) {
                        //岩竹玉雨注：添加图片地址
                        $(".fileimgs_" + fileid).attr("src", resultObj.Url);
                        //岩竹玉雨注：添加下载标签
                        $("#file-panel_" + fileid).prepend($("<a href='" + resultObj.Url + "' class='fa fa-download' target='_blank' UC=true>" + SheetLanguages.Current.Download + "</a>"));

                    } else {
                        $("td[data-action='" + fileid + "']").prepend($("<a href='" + resultObj.Url + "' class='fa fa-download' target='_blank' UC=true>" + SheetLanguages.Current.Download + "</a>"));
                    }
                }

                /*
                 *android对upload的progress事件支持不完善
                 *在Complete事件里将上传进度赋值为100%
                 */
                $("span[data-filerate='" + fileid + "']").html("100%");
                this.context.Validate();
            }
            else {
                this.context.UploadFailed(evt);
            }
            // 单个附件上传完成，继续下一个
            this.context.AddFiles(this.files);
        },

        UploadFailed: function (evt) {
            this.context.AddAttachments[evt.currentTarget.fileid].state = 100;
            $("span[data-filerate='" + evt.currentTarget.fileid + "']").html(SheetLanguages.Current.UploadError);
        },

        UploadCanceled: function () {
        },

        RemoveFile: function (fileID) {
            fileID = $.trim(fileID);
            $("#" + fileID).remove();
            this.Files--;
            this.Files = this.Files < 0 ? 0 : this.Files;
            if (this.AddAttachments[fileID]) {
                this.AddAttachments[fileID].xhr.abort();
                delete this.AddAttachments[fileID];
            }
            else {
                this.RomveAttachments.push(fileID);
            }
            this.Validate();
        }
    });
})(jQuery);