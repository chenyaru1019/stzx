/**
 * Created by LX on 2017/7/24.
 * 会议室使用情况
 */
var scheduleCalendarByMeetingroom = {
    meetRoom: '',
    initEvents: null,
    currentYear: new Date().getFullYear(),
    currentMonth: new Date().getMonth() + 1,
    interfaceDomain: url,

    initCalendar: function () {
        var _this = this;
        _this.getCalendarEvents(_this.meetRoom, _this.currentYear, _this.currentMonth, function(data){
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
                eventClick: function(calEvent, jsEvent, view) {
                    console.log(calEvent);
                    url = 'InstanceSheets.html?InstanceId='+calEvent.objectId;
                    $(".app-aside-right").find('iframe').attr('src',url);
                    $('.app-aside-right').addClass('show');
                },
                eventMouseover: function(event, jsEvent, view){
                    if (event.meetingRoom !== undefined) {
                        _this.showCalendarEventsDetail(event, $(this).offset());
                    }
                },
                eventMouseout: function(event, jsEvent, view){
                    $('#tip').remove();
                },
                select: function(start, end) {

                    var error = 0;
                    var starttime = new Date($.fullCalendar.formatDate(start,'Y-M-DD HH:m:s'));
                    var endtime = new Date($.fullCalendar.formatDate(end,'Y-M-DD HH:m:s'));
                    _this.initEvents.forEach(function (obj, index) {
                        if(endtime > new Date(obj.start) && starttime < new Date(obj.end)) {
                            error++;
                        }
                    });

                    if (error === 0) {
                        var HYS_obj = {'start' : $.fullCalendar.formatDate(start,'Y-M-DD HH:m:s'), 'end' : $.fullCalendar.formatDate(end,'Y-M-DD HH:m:s'), 'hys_number' : _this.meetRoom};
                        $.cookie('HYS_obj', JSON.stringify(HYS_obj), { expires: 7 });
                        $('#myModal').modal({keyboard: true, show: true, backdrop: false,});
                        $("#iframeId").attr("src", "StartInstance.html?WorkflowCode=meeting&PageAction=Close");
                    } else {
                        alert('您选中的事件与已经存在的事件重合');
                    }
                },
                eventLimit: true, // allow "more" link when too many events
                events: _this.initEvents,
                eventRender: function(event, element) {
                    switch (event.status) {
                        case '0':
                            element.addClass('pending');
                            break;
                        case '1':
                            element.addClass('approval');
                            break;
                        case '2':
                            element.addClass('approved');
                            break;

                    }
                },
            });
        });
        _this.hoverMeetingRoomConfigInfo();
        _this.toggleCalendarEventsByMeetingRoom();
        // _this.toggleCalendarEventsBymonth();

        $('#myModal').on('hide.bs.modal', function () {
            $.cookie('HYS_obj', null);

        })
    },

    getCalendarEvents: function(meetingNumber, year, month, callback) {
        var eventsArr = new Array();
        var _this = this;
        $.ajax
        (
            {
                type: "GET",
                async: false,
                url: '/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=QueryMeetingInfo',
                data: {
                    Year: year,
                    Month:month,
                    MeetingRoomId:meetingNumber
                },
                // dataType: "jsonp",//加入这个选项即可
                beforeSend: function(){
                    _this.showOverlay();
                },
                success: function (msg) {
                    console.log(msg);
                    $.each(msg, function (index, term) {
                        var startTime = _this.swichTime(term.StartTime);
                        var endTime = _this.swichTime(term.EndTime);
                        var render_obj = {
                            title: term.Title,
                            start: startTime,
                            end: endTime,
                            status: term.Status,
                            applyer: term.Applyer,
                            meetingRoom: term.MeetingRoom,
                            msg:term.MeetingRoom,
                            moderator:term.Moderator,
                            objectId:term.InstanceId

                        };

                        eventsArr[index] = render_obj;
                    });
                    if ($.isFunction(callback)) {
                        callback(eventsArr);
                    }
                },
                complete: function() {
                    _this.hideOverlay();
                },
            }
        );
    },

    //鼠标悬停弹出会议具体信息
    showCalendarEventsDetail: function (obj, offset) {
        if(!obj.end ){
            obj.end = "";
        }
        if(!obj.start ){
            obj.start = "";
        }
        var timeArr = [];
        timeArr.push(obj.start._i.split(' ')[1].split(':').slice(0,2).join(':'));
        timeArr.push(obj.end._i.split(' ')[1].split(':').slice(0,2).join(':'));
        var eInfo = '<div id="tip" style="font-size: 13px"><ul>';
        eInfo += '<li class="subject" style="font-weight: bold;font-size: 15px;">'+ obj.title + '<br/></li>';
        eInfo += '<li class="meetingroom" style="color: #58666e;margin-bottom: 5px">'+ obj.meetingRoom + '<br/> </li>';
        eInfo += '<li class="start">' +'会议日期:'+ obj.start._i.split(' ')[0] + '<br/> </li>';
        eInfo += '<li class="end">' +'会议时间:'+ timeArr.join(' - ') + '<br/> </li>';
        eInfo += '<li class="host">会议主持人:'+obj.moderator+'<br/> </li>';
        eInfo += '<li class="applyer">' +'申请人:'+ obj.applyer + '<br/> </li>';
        eInfo += '</ul></div>';
        $(eInfo).appendTo($('body'));
        $('#tip').css({"position": "absolute", "z-index": "9999", "background-color": "#fff", 'border':'1px solid #FFCAB2', 'box-shadow':'2px 9px 15px 2px rgba(215,215,215,0.50) ', "display":"block", "left":(offset.left) + "px", "top":(offset.top - $('#tip').height()-25) + "px"}).fadeTo(600, 0.9);
        //鼠标移动效果
        $('.fc-event-inner').mousemove(function(e){
            $('#tip').css({'top': (offset.top + 60), 'left': (offset.left)});
        });
    },

    getMeetingRoomInfo: function(meetingRoom, callback) {
        var _this = this;
                $.ajax({
                    type: "POST",    //页面请求的类型
                    url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=GetMeetingroominfo",   //处理页的相对地址
                    async: false,
                    success: function (msg) {
                        msg.forEach(function (obj, index) {
                            if (obj.objectId === meetingRoom && $.isFunction(callback)) {
                                if (obj.sdate) {
                                    //将数字转为星期
                                    var trimEmpty = obj.sdate.split(';');
                                    trimEmpty.pop();
                                    $(trimEmpty).each(function (index, element) {
                                        switch (element) {
                                            case '0':
                                                trimEmpty[index] = '周日';
                                                break;
                                            case '1':
                                                trimEmpty[index] = '周一';
                                                break;
                                            case '2':
                                                trimEmpty[index] = '周二';
                                                break;
                                            case '3':
                                                trimEmpty[index] = '周三';
                                                break;
                                            case '4':
                                                trimEmpty[index] = '周四';
                                                break;
                                            case '5':
                                                trimEmpty[index] = '周五';
                                                break;
                                            case '6':
                                                trimEmpty[index] = '周六';
                                                break;
                                        }
                                    });
                                    obj.sdate = trimEmpty.join(";");
                                }
                                if ($.isFunction(callback)) {
                                    callback(obj);
                                };
                            }
                            return false;
                        });


                    }
                });

    },

    popupMeetingRoomInfo: function(element) {
        $('.meetingMsg').remove();
        var meetingRoom = element.find('input').val();
        this.getMeetingRoomInfo(meetingRoom, function(data) {
            //将会议室设备转为图片
            var equipmentImg = data.equipment.split(';');
            equipmentImg.pop();
            $(equipmentImg).each(function(index,element){
                switch (element) {
                    case '投影仪':
                        equipmentImg[index] = '<img src="img/Icon/Icon_tyy.png">';
                        break;
                    case '麦克风':
                        equipmentImg[index] = '<img src="img/Icon/Icon_mkf.png">';
                        break;
                    case '音响':
                        equipmentImg[index] = '<img src="img/Icon/Icon_yx.png">';
                        break;
                    case 'WIFI':
                        equipmentImg[index] = '<img src="img/Icon/Icon_wifi.png">';
                        break;
                    case '茶水':
                        equipmentImg[index]  = '<img src="img/Icon/Icon_cs.png">';
                        break;
                    case '视频会议':
                        equipmentImg[index]  = '<img src="img/Icon/Icon_sphy.png">';
                        break;
                    case '硬件电脑':
                        equipmentImg[index]  = '<img src="img/Icon/Icon_yjdn.png">';
                        break;
                }
            });
            data.equipment = equipmentImg.join('');
            if (data.photo === null){
                data.photo = 'img/timg.jpg';
            }
            var  html = '<div class="meetingMsg row">'
                +'<div class="meetingMsg_left col-md-6">'
                +'<p style="font-size: 23px;font-weight: bold">'+data.meetingroom+'</p>'
                +'<p><span>会议室管理员：</span>'+data.administrator+'</p>'
                +'<p><span>座位数：</span>'+data.num+'</p>'
                +'<p><span>会议室位置：</span>'+data.address+'</p>'
                +'<p><span>可申请日期：</span>'+data.sdate+'</p>'
                +'<p><span>会议室设备：</span>'+data.equipment+'</p>'
                +'<p><span>是否启用：</span>'+data.enable+'</p>'
                +'</div>'
                +'<div class="meetingMsg_right col-md-6">'
                +'<img src="'+data.photo+'" style="width: 331px;height: 248.25px;margin-top: 11px;"/>'
                +'</div>'
                +'</div>';

            $(html).appendTo($('#modal-body'));
            $('#myModal-meeting').modal({keyboard: true, show: true, backdrop: false});
        });
    },

    hoverMeetingRoomConfigInfo: function() {
        var _this = this;
        $('.HYS_right').on('mouseenter','.list',function (e) {
                _this.popupMeetingRoomInfo($(this));
                $("#myModal-meeting").stop(true,false).slideDown(500);
        });
        $('.HYS_right').on('mouseleave','.list',function (e) {
            $("#myModal-meeting").stop(true,false).slideUp(500);
        })
    },
    toggleCalendarEventsByMeetingRoom: function () {
        var _this = this;
        $('.HYS_right').on('click','li', function() {
            $(this).css('background-color','rgba(241,241,241,1.50)').siblings().css('background-color','#CDCDCD');
            $(this).addClass('has-active').siblings().removeClass('has-active');
            HYS_string = $(this).find('input').val();
            var date1 = $('#calendar').fullCalendar('getDate');
            var currentyear = $.fullCalendar.formatDate(date1,'Y');
            var currentmonth = $.fullCalendar.formatDate(date1,'M');
            //remove the old eventSources
            $('#calendar').fullCalendar('removeEventSource', _this.initEvents);
            $('#calendar').fullCalendar('refetchEvents');
            _this.getCalendarEvents(HYS_string, currentyear, currentmonth, function(data){
                var newEvents = data;
                //attach the new eventSources
                $('#calendar').fullCalendar('addEventSource', newEvents);
                $('#calendar').fullCalendar('refetchEvents');
                _this.initEvents = newEvents;
                _this.meetRoom = HYS_string;
            });
        });
    },

    //月份切换
    toggleCalendarEventsBymonth: function() {
        var _this = this;
        $('body').on('click', '.calendarByMeeting .fc-left .fc-button-group button', function() {
            var date1 = $('#calendar').fullCalendar('getDate');
            var currentyear = $.fullCalendar.formatDate(date1,'Y');
            var currentmonth = $.fullCalendar.formatDate(date1,'M');
            $('#calendar').fullCalendar('removeEventSource', _this.initEvents);
            $('#calendar').fullCalendar('refetchEvents');
            _this.getCalendarEvents(_this.meetRoom, currentyear, currentmonth, function(data){
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
                    _this.getCalendarEvents(_this.meetRoom, _this.currentYear, _this.currentMonth, function(data){
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


    showOverlay: function() {
        $('#calendar-overlay').css('display', 'block');
    },

    hideOverlay: function() {
        $('#calendar-overlay').css('display', 'none');
    },

    swichTime: function($time) {
        var timearr = $time.split(' ');
        return timearr[0] + ' ' + timearr[1].replace(/-/g, ":");
    }

};

$(function () {
    scheduleCalendarByMeetingroom.toggleCalendarEventsBymonth();
});
