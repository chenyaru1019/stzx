/**
 * Created by LX on 2017/12/21.
 * 出差情况概况
 */
var scheduleCalendarBytravelName = {
    travelName: '',
    initEvents: null,
    currentYear: new Date().getFullYear(),
    currentMonth: new Date().getMonth() + 1,
    interfaceDomain: url,

    initCalendar: function () {
        var _this = this;
        _this.getCalendarEvents(_this.travelName, _this.currentYear, _this.currentMonth, function(data){
            _this.initEvents = data;

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month'
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
                    if (event.title !== undefined) {
                        _this.showCalendarEventsDetail(event, $(this).offset());
                    }
                },
                eventMouseout: function(event, jsEvent, view){
                    $('#tip').remove();
                },
                select: function(start, end) {
                },
                eventLimit: true, // allow "more" link when too many events
                events: _this.initEvents,
                eventRender: function(event, element) {
                    switch (event.Status) {
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
        _this.toggleCalendarEventsBytravelName();
        // _this.toggleCalendarEventsBymonth();

        $('#myModal').on('hide.bs.modal', function () {
            $.cookie('HYS_obj', null);
        })
    },



getCalendarEvents: function(travelName, year, month, callback) {
        var eventsArr = new Array();
        var _this = this;
        $.ajax({
            type: "POST",
            url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=QueryBusinessTrip",   //处理页的相对地址
            data: {
                Year: year,
                Month:month,
                SearchStr:travelName
            },
            async: false,
            success: function (data) {
                    $(data).each(function (index, term) {
                        var startTime;var endTime;
                            startTime = term.TripDate.split('~')[0];
                        endTime = term.TripDate.split('~')[term.TripDate.split('~').length-1];
                        // console.log( );
                        // var data1 = +endTime.split(' ')[0].split('-')[2]+1;
                        // EndTime = endTime.split(' ')[0].split('-')[0] +"-"+ endTime.split(' ')[0].split('-')[1] +"-"+ data1  +" "+endTime.split(' ')[1];
                        // console.log(EndTime);
                        var day = endTime.split(' ');
                        //获取日期部分的年月日
                        var days = day[0].split('-');
                        //获取时间部分的 时分秒
                        var mi = day[day.length - 1].split(':');
                        //获取当前date类型日期
                        var date = new Date();
                        //给date赋值  年月日
                        date.setUTCFullYear(days[0], days[1] - 1, days[2]);
                        //给date赋值 时分秒  首先转换utc时区 ：+8      
                        date.setUTCHours(mi[0] - 8, mi[1], mi[2]);
                        // var date  = NewDate(endTime);
                        date.setTime(date.getTime()+24*60*60*1000);
                        var Month = (date.getMonth()+1)<10?"0"+(date.getMonth()+1):(date.getMonth()+1);
                        var Data = date.getDate()<10?"0"+date.getDate():date.getDate();
                        var EndTime = date.getFullYear()+"-" + Month + "-" + Data+" 00:00:00";
                        var msg = term.TripAddress.split('、')[0].split('-')[1];
                        var render_obj = {
                            title: term.Travers,
                            start: startTime,
                            end: EndTime,
                            TripNum: term.Num,
                            applyer: term.Applyer,
                            TripDetails: term.TripDetails,
                            Status:term.Status,
                            msg:msg,
                            // moderator:term.moderator,
                            objectId:term.ObjectId
                        };
                        eventsArr[index] = render_obj;
                    });
                    if ($.isFunction(callback)) {
                        callback(eventsArr);
                        // console.log(eventsArr);
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
        var TripDetails_html = '';
        if(obj.TripDetails.indexOf('、') == -1){
            var termHtml = obj.TripDetails.split('~')[1].split(' ').slice(1,3).join(' — ');
            TripDetails_html += '<span>'+obj.TripDetails.split('~')[0]+':'+termHtml+'</span><br>';
        }else {
            $(obj.TripDetails.split('、')).each(function (index,term) {
                var termHtml = term.split('~')[1].split(' ').slice(1,3).join(' — ');
                TripDetails_html += '<span>'+term.split('~')[0]+':'+termHtml+'</span><br>';
            });
        }

        if(!obj.end ){
            obj.end = "";
        }
        if(!obj.start ){
            obj.start = "";
        }
        var eInfo = '<div id="tip" style="width: 18%;font-size: 13px"><ul>';
        eInfo += '<li class="subject">' +'出差人数:'+ obj.TripNum + '人<br/> </li>';
        eInfo += '<li class="applyer">' +'申请人:'+ obj.applyer + '<br/> </li>';
        eInfo += '<li class="start">' +'出差地点<br/> </li>';
        eInfo += '<li class="start">'+ TripDetails_html + '<br/> </li>';
        eInfo += '</ul></div>';
        $(eInfo).appendTo($('body'));
        $('#tip').css({"position": "absolute", "z-index": "9999", "background-color": "#fff", 'border':'1px solid #FFCAB2', 'box-shadow':'2px 9px 15px 2px rgba(215,215,215,0.50) ', "display":"block", "left":(offset.left) + "px", "top":(offset.top - $('#tip').height()-25) + "px"}).fadeTo(600, 0.9);
        //鼠标移动效果
        $('.fc-event-inner').mousemove(function(e){
            $('#tip').css({'top': (offset.top + 60), 'left': (offset.left)});
        });
    },

    toggleCalendarEventsBytravelName: function () {
        var _this = this;
        $('#btn').on('click', function() {
            travel_name = $("#travelName").val();
            var date1 = $('#calendar').fullCalendar('getDate');
            var currentyear = $.fullCalendar.formatDate(date1,'Y');
            var currentmonth = $.fullCalendar.formatDate(date1,'M');
            console.log(travel_name,currentyear,currentmonth);
            //remove the old eventSources
            $('#calendar').fullCalendar('removeEventSource', _this.initEvents);
            $('#calendar').fullCalendar('refetchEvents');
            _this.getCalendarEvents(travel_name, currentyear, currentmonth, function(data){
                var newEvents = data;
                //attach the new eventSources
                $('#calendar').fullCalendar('addEventSource', newEvents);
                $('#calendar').fullCalendar('refetchEvents');
                _this.initEvents = newEvents;
                _this.travelName = travel_name;
            });
        });
    },

    toggleCalendarEventsBymonth: function() {
        var _this = this;
        $('body').on('click', '.calendarByTravel .fc-left .fc-button-group button', function() {
            var date1 = $('#calendar').fullCalendar('getDate');
            var currentyear = $.fullCalendar.formatDate(date1,'Y');
            var currentmonth = $.fullCalendar.formatDate(date1,'M');
            $('#calendar').fullCalendar('removeEventSource', _this.initEvents);
            $('#calendar').fullCalendar('refetchEvents');
            _this.getCalendarEvents(_this.travelName, currentyear, currentmonth, function(data){
                var newEvents = data;
                //attach the new eventSources
                $('#calendar').fullCalendar('addEventSource', newEvents);
                $('#calendar').fullCalendar('refetchEvents');
                _this.initEvents = newEvents;
            });
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


    hideOverlay: function() {
        $('#calendar-overlay').css('display', 'none');
    },

};

$(function () {
    scheduleCalendarBytravelName.toggleCalendarEventsBymonth();
});
