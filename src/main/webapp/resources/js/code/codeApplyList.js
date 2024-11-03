$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:eq(1)').addClass('active');
});

function codeApplyDetail(applyNo, indexNo) {
	location.href = "/Metamong/code/codeApplyDetail?applyNo=" + applyNo + "&indexNo=" + indexNo;
}