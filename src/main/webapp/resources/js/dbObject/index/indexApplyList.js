$(document).ready(function() {
    $('.nav-link').removeClass('active');
    $('.nav-link:eq(2)').addClass('active');
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(3)').addClass('active');
});