/**
 * Created by xiaoxiaobing on 17-8-29.
 */
var isIn = false;

function showProductsIn(index) {
    // $("#showProductsList>li").each(function () {
    //     var li = $(this)
    //     li.addClass("hidden")
    // })
    $($("#showProductsList>li")[index]).removeClass("hidden")
}

function showProductsOut(index) {
    // $("#showProductsList>li").each(function () {
    //     var li = $(this)
    //     li.addClass("hidden")
    // })
    setTimeout(function () {
        if (!isIn) {
            $($("#showProductsList>li")[index]).addClass("hidden")
        }
    }, 100)
}

function showProduct() {
    isIn = true
}

function showProductOut(obj) {
    isIn = false;
    $(obj).addClass("hidden")
}
