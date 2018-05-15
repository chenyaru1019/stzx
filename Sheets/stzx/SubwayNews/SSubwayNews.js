
function queryHitAndVoteCount() {
    var articleId = $.MvcSheetUI.SheetInfo.BizObjectID
    var userId = $.MvcSheetUI.SheetInfo.UserID;
    var type = 'subwaynews';
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=QueryHitAndVoteCount",   //处理页的相对地址
        data: {
            UserId: userId, ArticleId: articleId, Type: type
        },
        async: false,
        success: function (e) {
            //这是处理后执行的函数，msg是处理页返回的数据
            if (e != null) {
                if (e.VoteStatus == "0") {
                    $('#div174950 input').addClass('unlike');
                    $('#div174950 input').removeClass('like');

                } else if (e.VoteStatus == "1") {
                    $('#div174950 input').addClass('like');
                    $('#div174950 input').removeClass('unlike');
                }
                $('#hitCount').html(e.Hits);//浏览次数
                $('#VoteNum').html(e.VoteCount);//点赞次数


            }

        }
    });

}

function newsVote() {

    var articleId = $.MvcSheetUI.SheetInfo.BizObjectID
    var userId = $.MvcSheetUI.SheetInfo.UserID;
    var type = 'subwaynews';
    $.ajax({
        type: "POST",    //页面请求的类型
        url: "/Portal/Sheets/handlers/LogisticsHandler.ashx?Command=NewsVote",   //处理页的相对地址
        data: {
            UserId: userId, ArticleId: articleId, Type: type
        },
        async: false,
        success: function (e) {
            //这是处理后执行的函数，msg是处理页返回的数据
            if (e != null) {
                if (e.VoteStatus == "0") {
                    $('#div174950 input').addClass('unlike');
                    $('#div174950 input').removeClass('like');

                } else if (e.VoteStatus == "1") {
                    $('#div174950 input').addClass('like');
                    $('#div174950 input').removeClass('unlike');
                }

                $('#VoteNum').html(e.VoteCount);//点赞次数
            }

        }
    });

}