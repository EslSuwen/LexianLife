/**
 * Created by xiaoxiaobing on 17-8-27.
 */
function changeviliCodeImg() {
    $("#valicodeImg").attr("src", "/valicode.do?date=" + new Date().getTime());
}

var sendPswMsg = true;

function sendMailMsg(btn, url) {
    if (!sendPswMsg) return
    sendPswMsg = false
    $(btn).removeClass("am-btn am-btn-success")
    $(btn).addClass("am-btn am-btn-default")
    $.getJSON(url, function (data) {
        if ("success" == data.result) {
            var second = 0
            var timer = setInterval(function () {
                if (second == 60) {
                    clearInterval(timer)
                    $(btn).removeClass("am-btn am-btn-default")
                    $(btn).addClass("am-btn am-btn-success")
                    $(btn).text("发送验证邮件")
                    sendPswMsg = true
                    return
                }
                second = second + 1;
                $(btn).text((60 - second) + "秒后重新发送")
            }, 1000);
            alert("验证码邮件已发送至您的邮箱，请注意查看")
        } else {
            sendPswMsg = true
            $(btn).removeClass("am-btn am-btn-default")
            $(btn).addClass("am-btn am-btn-success")
            alert("获取邮箱验证码失败")
        }
    });
}
