/**
 * Created by PhpStorm.
 * User: chen
 * Date: 2017/6/24
 * Time: 18:22
 */
(function(window, $) {
    window.weather = {
        curentLocation: "上海",
        day: 1,
        IP: '0.0.0.0',
        appkey: '26455',
        sign: '896d7552bf724e425b30ed1c7b8d32e1',

        initWeatherData: function(curentLocation, ip) {
            if (curentLocation) {
                this.curentLocation = curentLocation;
            } else {
                this.getCityByIp();
                this.getCurrentIP();
            }

            if (ip) {
                this.ip = ip;
            }
        },

        getCityByIp: function() {
            var _this = this;
            $.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js', function(_result) {
                if (remote_ip_info.ret == '1' && remote_ip_info.city.length > 0) {
                    // console.log(remote_ip_info.city);
                    this.location = remote_ip_info.city;
                }
            });
        },

        getCurrentIP: function(callback) {
            $.getJSON('https://freegeoip.net/json/?callback=?', function(data) {
                // console.log(data.ip);
                if ($.isFunction(callback)) {
                    callback(data.ip);
                }
            });
        },

        // 新浪数据源
        getWeatherData_js: function(callback) {
            var url = 'http://php.weather.sina.com.cn/js.php';
            var password = 'DJOYnieT8234jlsK';
            var site = url + '?city=' +this.location+ '&password=' + password + '&day=' + this.day;

            $.getScript(url + '?city=' + this.location + '&password=' + password + '&day=' + this.day, function(_result) {
                var imgUrl = 'http://php.weather.sina.com.cn/images/yb3/';
                var sizeSmall = '78_78/';
                var sizeBig = '180_180/';
                var day = '_0.png';
                var night = '_1.png';

                var data = {
                    'day': {
                        'status': status1,
                        'figure': figure1,
                        'direction': direction1,
                        'power': power1,
                        'temperature': temperature1,
                        'img': imgUrl + sizeBig + figure1 + day,
                    },
                    'night': {
                        'status': status2,
                        'figure': figure2,
                        'direction': direction2,
                        'power': power2,
                        'temperature': temperature2,
                        'img': imgUrl + sizeBig + figure2 + night,
                    },
                    'city': city,
                };

                if ($.isFunction(callback)) {
                    callback(data);
                }
            });
        },

        //
        getWeatherData_json: function(callback) {
            var _this = this;

            _this.getCurrentIP(function(currentIP) {
                $.ajax({
                    type: 'get',
                    async: false,
                    url: 'http://api.k780.com/?app=weather.future&weaid='+currentIP+'&appkey='+_this.appkey+'&sign='+_this.sign+'&format=json&jsoncallback=data',
                    dataType: 'jsonp',
    //                jsonp: 'callback',
                    jsonpCallback: 'data',
                    success : function(data){
                        if ($.isFunction(callback)) {
                            callback(data.result);
                        }
                    },
                    error:function(){
                        alert('fail');
                    }
                });
            });
        },

    };

    $.fn.extend({
        weather: function() {
            var _this = $(this);

            window.weather.initWeatherData();
            window.weather.getWeatherData_json(function(data) {
                // console.log(data[0].temperature.split("/").reverse().join("~"));
                data[0].temperature = data[0].temperature.split("/").reverse().join("-");
                var date =  data[0].days.split('-')[0]+"年" + data[0].days.split('-')[1]+"月" +data[0].days.split('-')[2]+"日";
                var html = '<div class="weatherTop">'
                          +'<h1 style="font-size: 30px;">'+data[0].temperature+'</h1>'
                    +'<div><span class="weatherState">'+data[0].weather+'<span></div>'
                          +'<div style="font-size: 15px;"><span>'+data[0].wind+'</span><span style="margin-left: 25px;">'+data[0].winp+'</span></div>'
                          +'</div>'
                          +'<div style="font-size: 24px;position: absolute;right: 10%;bottom: 5%;" >'+data[0].citynm+'</div>'
                          +'<div class="weatherBottom">'
                          +'<div>'
                          +'<div style="text-align: right;"><p>'+date+'</p><p style=" margin-left: 5px;">'+data[0].week+'</p></div>'
                          +'</div>'
                          +'</div>';
                $(html).appendTo(_this);
                var weather = $('.weatherState').text();
                if(weather.indexOf('雨')!=-1){
                    $('.weatherTop').css('background-image','url("img/weather/雨-白天.png")');
                    $('.weatherTop').css('background-size','100% 100%')
                }
                else if(weather.indexOf('晴')!=-1) {
                    $('.weatherTop').css('background-image','url("img/weather/晴-白天.png")');
                    $('.weatherTop').css('background-size','100% 100%')
                }
                else if(weather.indexOf('阴')!=-1) {
                    $('.weatherTop').css('background-image','url("img/weather/阴-白天.png")');
                    $('.weatherTop').css('background-size','100% 100%')
                }else if(weather.indexOf('雪')!=-1) {
                    $('.weatherTop').css('background-image','url("img/weather/雪-白天.png")');
                    $('.weatherTop').css('background-size','100% 100%')
                }else if(weather.indexOf('多云')!=-1) {
                    $('.weatherTop').css('background-image','url("img/weather/多云-白天.png")');
                    $('.weatherTop').css('background-size','100% 100%')
                }else if(weather.indexOf('风')!=-1) {
                    $('.weatherTop').css('background-image','url("img/weather/大风-白天.png")');
                    $('.weatherTop').css('background-size','100% 100%')
                }else if(weather.indexOf('雾')!=-1 || weather.indexOf('霾')!=-1){
                    $('.weatherTop').css('background-image','url("img/weather/雾霾-白天.png")');
                    $('.weatherTop').css('background-size','100% 100%')
                }
                // console.log($('.weatherState').text());
            });
        }
    });
}(this, jQuery));