/**
 * Created by LX on 2017/7/25.
 *  车辆使用情况
 */
var scheduleCalendarByCar = {
    models: '',
    initEvents: null,
    currentYear: new Date().getFullYear(),
    currentMonth: new Date().getMonth() + 1,
    interfaceDomain: url,

    initCalendarCar: function () {
        var _this = this;

        _this.getCalendarCarEvents(_this.models, _this.currentYear, _this.currentMonth, function (data) {
            _this.initEvents = data;

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                locale: 'zh-cn',
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectHelper: true,
                editable: false,
                eventClick: function (calEvent, jsEvent, view) {
                    url = 'InstanceSheets.html?InstanceId='+calEvent.objectid;
                    $(".app-aside-right").find('iframe').attr('src',url);
                    $('.app-aside-right').addClass('show');
                },
                eventMouseover: function (event, jsEvent, view) {
                    if (event.models !== undefined) {
                        _this.showCalendarEventsCarDetail(event, $(this).offset());
                    }
                },
                eventMouseout: function (event, jsEvent, view) {
                    $('#tip').remove();
                },
                select: function (start, end) {

                    var error = 0;
                    var starttime = new Date($.fullCalendar.formatDate(start, 'Y-M-DD HH:m:s'));
                    var endtime = new Date($.fullCalendar.formatDate(end, 'Y-M-DD HH:m:s'));
                    _this.initEvents.forEach(function (obj, index) {
                        if (endtime > new Date(obj.start) && starttime < new Date(obj.end)) {
                            error++;
                        }
                    });

                    if (error === 0) {
                        var car_obj = { 'start': $.fullCalendar.formatDate(start, 'Y-M-DD HH:m:s'), 'end': $.fullCalendar.formatDate(end, 'Y-M-DD HH:m:s'), 'car_number': _this.models };
                        $.cookie('car_obj', JSON.stringify(car_obj), { expires: 7 });
                        $('#myModal').modal({ keyboard: true, show: true, backdrop: false });
                        $("#iframeId").attr("src", "StartInstance.html?WorkflowCode=car&PageAction=Close");
                    } else {
                        alert('您选中的事件与已经存在的事件重合');
                    }
                },
                eventLimit: true, // allow "more" link when too many events
                events: _this.initEvents,
                eventRender: function (event, element,view ) {
                    switch (event.status) {
                        case '0':
                            element.addClass('pending');
                            break;
                        case '1':
                            element.addClass('approval');
                            break;
                        case '2':
                            element.addClass('Restitution');
                            break;
                        case '3':
                            element.addClass('approved');
                            break;
                    }
                },
                viewRender: function (view, element) {
                },
            });
        });
        _this.hoverCarConfigInfo();
        _this.toggleCalendarEventsByCar();
        // _this.toggleCalendarCarEventsBymonth();

        $('#myModal').on('hide.bs.modal', function () {
            $.cookie('car_obj', null);

        })
    },

    getCalendarCarEvents: function (carNum, year, month, callback) {
        var eventsArr = new Array();
        var _this = this;
        $.ajax
        (
            {
                type: "GET",
                async: false,
                url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=QueryCarInfo",   //处理页的相对地址
                data: {
                    Year: year,
                    Month:month,
                    VehicleId:carNum
                },
                beforeSend: function () {
                    _this.showOverlay();
                },
                success: function (msg) {
                    var eventsArr = [];
                    $.each(msg, function (index, term) {
                        var startTime = term.StartTime;
                        var endTime = term.EndTime;
                        var render_obj = {
                            title: term.DriverName,
                            start: startTime,
                            end: endTime,
                            status: term.Status,
                            num: term.Num,
                            msg:term.Plate,
                            applyer: term.Applyer,
                            address1: term.StartAddress,
                            address2: term.EndAddress,
                            models: term.Model,
                            moderator: term.DriverName,
                            objectid:term.InstanceId

                        };
                            eventsArr.push(render_obj);
                    });
                    if ($.isFunction(callback)) {
                        callback(eventsArr);
                    }
                },
                complete: function () {
                    _this.hideOverlay();
                },
            }
        );
    },

    showCalendarEventsCarDetail: function (obj, offset) {
        if (!obj.end) {
            obj.end = "";
        }
        if (!obj.start) {
            obj.start = "";
        }
        var eInfo = '<div id="tip" style="font-size: 13px;text-align: center;width: 16%"><ul>';
        eInfo += '<li class="msg">' + obj.msg + '<br/> </li>';
        eInfo += '<li class="moderator" style="margin-bottom: 5px">司机:' + obj.moderator + '<br/> </li>';
        eInfo += '<li class="start">' + '路线:' + obj.address1 + '——' + obj.address2 + '<br/> </li>';
        eInfo += '<li class="start">' + '用车开始时间:' + obj.start._i + '<br/> </li>';
        eInfo += '<li class="end">' + '用车结束时间:' + obj.end._i + '<br/> </li>';
        eInfo += '<li class="num">' + '乘车人数:' + obj.num + '<br/> </li>';
        eInfo += '<li class="Route">' + '申请人:' + obj.applyer + '<br/> </li>';
        eInfo += '</ul></div>';
        $(eInfo).appendTo($('body'));
        $('#tip').css({ "position": "absolute", "z-index": "9999", "background-color": "#fff", 'border': '1px solid #FFCAB2', 'box-shadow': '2px 9px 15px 2px rgba(215,215,215,0.50) ', "display": "block", "left": ((offset.left)-30) + "px", "top": (offset.top - $('#tip').height()-25) + "px" }).fadeTo(600, 0.9);
        //鼠标移动效果
        $('.fc-event-inner').mousemove(function (e) {
            $('#tip').css({ 'top': (offset.top + 60), 'left': (offset.left) });
        });
    },

    getCarInfo: function (carNum, callback) {
        var _this = this;
        $.ajax({
            type: "POST",    //页面请求的类型
            url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=GetVehicleinfo",   //处理页的相对地址
            async: false,
            success: function (msg) {
                msg.forEach(function (obj, index) {
                    if (obj.objectId === carNum && $.isFunction(callback)) {
                        if ($.isFunction(callback)) {
                            callback(obj);
                        };
                    }
                    return false;
                });
            }
        });



    },

    popupCarInfo: function (element) {
        $('.carMsg').remove();
        var carNum = element.find('input').val();
        this.getCarInfo(carNum, function (data) {
            data.gdate = data.gdate.split('T');
            if (data.photo === null) {
                data.photo = 'img/timg.jpg';
            }
            var html = '<div class="carMsg row">'
                + '<div class="carMsg_left col-md-6">'
                + '<p><span>车辆型号：</span>' + data.model + '</p>'
                + '<p><span>驾驶员：</span>' + data.fullname + '</p>'
                + '<p><span>车辆类型：</span>' + data.type + '</p>'
                + '<p><span>车牌号：</span>' + data.plate + '</p>'
                + '<p><span>购置日期：</span>' + data.gdate[0] + '</p>'
                + '</div>'
                + '<div class="carMsg_right col-md-6">'
                + '<img src="' + data.photo + '" style="width: 331px;height: 248.25px;margin-top: 11px;"/>'
                + '</div>'
                + '</div>';
            $(html).appendTo($('#modal-body'));
            $('#myModal-meeting').modal({ keyboard: true, show: true, backdrop: false, });
        });
    },

    hoverCarConfigInfo: function () {
        // var carElements = $('.car_right li');
        var _this = this;
        $('.car_right').on('mouseenter','.list',function (e) {
            _this.popupCarInfo($(this));
            $("#myModal-meeting").stop(true,false).slideDown(500);
        });
        $('.car_right').on('mouseleave','.list',function (e) {
            $("#myModal-meeting").stop(true,false).slideUp(500);
        })
    },

    toggleCalendarEventsByCar: function () {
        var _this = this;
        $('.car_right').on('click', 'li', function () {
            $(this).css('background-color', 'rgba(241,241,241,1.50)').siblings().css('background-color', '#CDCDCD');
            $(this).addClass('has-active').siblings().removeClass('has-active');
            car_string = $(this).find('input').val();
            var date1 = $('#calendar').fullCalendar('getDate');
            var currentyear = $.fullCalendar.formatDate(date1, 'Y');
            var currentmonth = $.fullCalendar.formatDate(date1, 'M');
            //remove the old eventSources
            $('#calendar').fullCalendar('removeEventSource', _this.initEvents);
            $('#calendar').fullCalendar('refetchEvents');
            _this.getCalendarCarEvents(car_string, currentyear, currentmonth, function (data) {
                var newEvents = data;
                //attach the new eventSources
                $('#calendar').fullCalendar('addEventSource', newEvents);
                $('#calendar').fullCalendar('refetchEvents');
                _this.initEvents = newEvents;
                _this.models = car_string;
            });
        });
    },

    //切换月份
    toggleCalendarCarEventsBymonth: function () {
        var _this = this;
        $('body').on('click', '.calendarByCar .fc-left .fc-button-group button', function () {
            var date1 = $('#calendar').fullCalendar('getDate');
            var currentyear = $.fullCalendar.formatDate(date1, 'Y');
            var currentmonth = $.fullCalendar.formatDate(date1, 'M');

            $('#calendar').fullCalendar('removeEventSource', _this.initEvents);
            $('#calendar').fullCalendar('refetchEvents');
            _this.getCalendarCarEvents(_this.models, currentyear, currentmonth, function (data) {
                var newEvents = data;
                //attach the new eventSources
                $('#calendar').fullCalendar('addEventSource', newEvents);
                $('#calendar').fullCalendar('refetchEvents');
                _this.initEvents = newEvents;
            });

            //跳转当前日期
            if(!$('.fc-today-button').hasClass('fc-state-disabled')){
                $('.fc-today-button').on('click',function () {
                    $('#calendar').fullCalendar('removeEventSource', _this.initEvents);
                    $('#calendar').fullCalendar('refetchEvents');
                    _this.getCalendarCarEvents(_this.meetRoom, _this.currentYear, _this.currentMonth, function(data){
                        var newEvents = data;
                        //attach the new eventSources
                        $('#calendar').fullCalendar('addEventSource', newEvents);
                        $('#calendar').fullCalendar('refetchEvents');
                        _this.initEvents = newEvents;
                    });
                })
            }
        });
    },

    showOverlay: function () {
        $('#calendar-overlay').css('display', 'block');
    },

    hideOverlay: function () {
        $('#calendar-overlay').css('display', 'none');
    }
};

$(function () {
    scheduleCalendarByCar.toggleCalendarCarEventsBymonth();
});
