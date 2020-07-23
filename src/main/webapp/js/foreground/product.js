/**
 * Created by xiaoxiaobing on 17-8-29.
 */
function mouseInProductItem(obj) {
    $(obj).css("border-color", "orangered")
}

function mouseOutProductItem(obj) {
    $(obj).css("border-color", "lavender")
}

function concernIn(obj, imgId) {
    $(obj).css("border-color", "orangered")
    $("#" + imgId).attr("src", "../../../img/concern2.png")
}

function concernOut(obj, imgId) {
    $(obj).css("border-color", "white")
    $("#" + imgId).attr("src", "../../../img/concern1.png")
}

function viewProductPic(obj) {
    $("#productPic").attr("src", $(obj).attr("src"))
}

function moreAddress() {
    if ($($("#addressList>li")[1]).attr("class") == "") {
        $("#addressList>li").each(function () {
            $(this).attr("class", "hidden")
        })
        $("#moreAddress").html("更多地址")
    } else {
        $("#addressList>li").each(function () {
            $(this).removeClass("hidden")
        })
        $("#moreAddress").html("收起地址")
    }
    $($("#addressList>li")[0]).attr("class", "")
}

function selectAddress(obj) {
    var div = $($($("#addressList>li")[0]).find(".receiverName")[0])
    div.removeClass("receiverName")
    div.addClass("receiverName1")
    $(obj).removeClass("receiverName1")
    $(obj).addClass("receiverName")
    var temp = $(obj).parents("li").html()
    $(obj).parents("li").html($($("#addressList>li")[0]).html())
    $($("#addressList>li")[0]).html(temp)
}
