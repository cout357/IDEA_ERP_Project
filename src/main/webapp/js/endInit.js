$('#totalInfoLink').trigger('click');
//回到顶部按钮
//回到顶部
$(function () {
    if ($(window).width() >= 700) {//本人的项目是响应式的,但是移动端不显示回到顶部,自己可以去掉
        $(window).scroll(function () {
            if ($(window).scrollTop() <= 200) {
                if ($(".back-top").css("display") != "none") {
                    $(".back-top").slideUp("normal"); //缓慢下降隐藏
                }
            }
            else {
                if ($(".back-top").css("display") == "none") {
                    $(".back-top").slideToggle("normal"); //缓慢上升显示
                }
            }
        });
    }
});
$(".back-top").click(function () {
    $("html").animate({ scrollTop: 0 }, "slow"); //回到顶部
});
//默认按id倒序
signsort[0] = document.getElementsByClassName("sortSign")[0];

