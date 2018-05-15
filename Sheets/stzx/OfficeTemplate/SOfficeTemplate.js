
//设置设置轮播图
function setCarouselFigure() {
    var objectId = $.MvcSheetUI.SheetInfo.BizObjectID;
    // var objectId = '1af4dcc3-e665-43c5-a9f0-592f6796eeab';
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "SOfficeTemplate.ashx?Command=GetCarouselFigure",   //处理页的相对地址
        data: {
            ObjectId: objectId
        },
        async: false,
        success: function (e) {    //这是处理后执行的函数，msg是处理页返回的数据
            var fileUrl = '/Portal/ReadAttachment/Read?BizObjectSchemaCode=OfficeTemplate&BizObjectID=' + objectId + '&AttachmentID=' + e.FileId + '&OpenMethod=0';
            $('#fileLoad').attr('href',fileUrl);
            if (e.imageList.length > 0) {
                var html= '';
                var html1= '';
                for (var i = 0; i < e.imageList.length; i++) {
                    console.log(e.imageList);
                    var imageUrl = '/Portal/ReadAttachment/Read?BizObjectSchemaCode=OfficeTemplate&BizObjectID=' + objectId + '&AttachmentID=' + e.imageList[i].imageId + '&OpenMethod=0';
                    html+= '<img src="'+imageUrl+'" width="100%" height="100%">';
                    html1+= '<li><img src="'+imageUrl+'"><tt></tt></li>'
                }
                $(html).appendTo($('#img'));
                // $('#img').html(html);
                $('#cSlideUl ul').html(html1);
            }

        },
        complete:function () {

            var index=0;
            var length=$("#img img").length;
            var i=1;
            //关键函数：通过控制i ，来显示图片
            function showImg(i){
                $("#img img")
                    .eq(i).stop(true,true).fadeIn(800)
                    .siblings("img").hide();
                $("#cbtn li")
                    .eq(i).addClass("hov")
                    .siblings().removeClass("hov");

            }

            function slideNext(){
                if(index >= 0 && index < length-1) {
                    ++index;
                    showImg(index);
                }else{
                    // if(confirm("已经是最后一张,点击确定重新浏览！")){
                    //     showImg(0);
                    //     index=0;
                    //     aniPx=(length-4)*142+'px'; //所有图片数 - 可见图片数 * 每张的距离 = 最后一张滚动到第一张的距离
                    //     $("#cSlideUl ul").animate({ "left": "+="+aniPx },200);
                    //     i=1;
                    // }
                    return false;
                }
                if(i<0 || i>length-4) {return false;}
                $("#cSlideUl ul").animate({ "left": "-=142px" },200);
                i++;
            }

            function slideFront(){
                if(index >= 1 ) {
                    --index;
                    showImg(index);
                }
                if(i<2 || i>length+4) {return false;}
                $("#cSlideUl ul").animate({ "left": "+=142px" },200)
                i--;
            }
            $("#img img").eq(0).show();
            $("#cbtn li").eq(0).addClass("hov");
            // $("#cbtn tt").each(function(e){
            //     var str=(e+1)+""+length;
            //     $(this).html(str)
            // })

            $(".picSildeRight,#next").click(function(){
                slideNext();
            })
            $(".picSildeLeft,#front").click(function(){
                slideFront();
            });
            $("#cbtn li").click(function(){
                index  =  $("#cbtn li").index(this);
                showImg(index);
            });
            $("#next,#front").hover(function(){
                $(this).children("a").fadeIn();
            },function(){
                $(this).children("a").fadeOut();
            })

        }
    });
}
$(function () {

    $('.hov img').css('border','0');
    //鼠标的移入移出
    $("#cbtn").mouseover(function (){
        $(".picSildeLeft").show();
        $(".picSildeRight").show();
    }).mouseout(function (){
        $(".picSildeLeft").hide();
        $(".picSildeRight").hide();
    });
});