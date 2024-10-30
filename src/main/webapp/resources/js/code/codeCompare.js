$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');

    /* 코드, 항목 수정 신청 */
    $('.btn-compare').click(function() {
    	const codeNo = $('.codeAdd-subtitle').data('code-no');
    	const codeNm = $('#codeNm').val();
        const codeId = $('#codeId').val();
        const codeContent = $('#codeContent').val();
        const codeIsActive = $("#codeIsActive option:selected").val();
        const applyReason = $('#applyReason').val();

        let codeData = {
        	codeNo: codeNo,
            codeNm: codeNm,
            codeId: codeId,
            codeContent: codeContent,
            codeIsActive: codeIsActive,
            applyReason: applyReason,
            items: items
        };

        $.ajax({
            url: "/Metamong/code/codeCompare",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(codeData),
            traditional: true,
            success: function(data) {
            	console.log(data);
                /*    location.href = "/Metamong/code/codeCompare";*/
               
            }
        });
    });
});