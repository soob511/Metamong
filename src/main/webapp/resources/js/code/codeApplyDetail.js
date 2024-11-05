$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:eq(1)').addClass('active'); 
});

function codeApplyProcess(status){
	const params = new URL(location.href).searchParams;
	const applyNo = params.get('applyNo');
	const indexNo = params.get('indexNo');
	let reason;
	
	Swal.fire({
	    icon: status == 1 ? "success" : "warning",
	    title: status == 1 ? "코드/항목 신청내역이<br/>승인 되었습니다." : "반려 사유를<br/>입력하세요.",
	    input: status == 1 ? null : 'text'
	}).then(result => {
	    const reason = (status == 1) ? '' : result.value;
	    
	    $.ajax({
	        url: "/Metamong/code/codeApplyProcess",
	        type: "POST",        
	        data: { applyNo: applyNo, status: status, reason: reason },
	        success: function(data) {
	            location.href = data + "&indexNo=" + indexNo;    
	        }
	    });
	});
};
