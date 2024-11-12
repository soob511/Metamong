$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(1)').addClass('active');
    
	$(".btn-reflect").on("click", function() {
		 var applyNo = $("#applyContainer").data("applyno"); 
		 var indexNo = $("#applyContainer").data("indexno"); 
		
		$.ajax({
			url: "/Metamong/sequence/reflectSequence",
			type: "POST",
			data: { applyNo: applyNo}, 
			success: function(data) {
				if(data==0){
					Swal.fire({
						icon: 'success',
						title: '반영이 완료되었습니다!'
					}).then(() => {
						location.href="/Metamong/sequence/sequenceApplyDetail?applyNo=" + applyNo +"&indexNo=" + indexNo;		
					});				
				}else{
					Swal.fire({
						icon: 'error',
						title: '반영할 수 없습니다!'
					}).then(() => {
						location.href="/Metamong/sequence/sequenceApplyDetail?applyNo=" + applyNo +"&indexNo=" + indexNo;		
					});
				}
				
			}
		});
	});
	
	$(".btn-rollback").on("click", function() {
		var applyNo = $("#applyContainer").attr("data-applyno");	
		$.ajax({
			url: "/Metamong/sequence/rollbackApplySequence",
			type: "POST",
			data: { applyNo: applyNo}, 
			success: function(data) {
				Swal.fire({
					icon: 'success',
					title: '시퀀스 신청이<br/> 승인취소 되었습니다.'
				}).then(() => {
				location.reload();
				});	
			}
		});
	});
});

function sequenceProcessApproval(status){
	 var applyNo = $("#applyContainer").data("applyno"); 
	 var indexNo = $("#applyContainer").data("indexno"); 
	 let reason;
	 
		Swal.fire({
		    icon: status == 1 ? "success" : "warning",
		    title: status == 1 ? "시퀀스 신청내역이<br/>승인 되었습니다." : "반려 사유를<br/>입력하세요.",
		    input: status == 1 ? null : 'text'
		}).then(result => {
		    const reason = (status == 1) ? '' : result.value;
		    console.log(reason);
		    
			$.ajax({
				url : "/Metamong/sequence/sequenceProcessApproval",
				type : "POST",
				data : {
					status : status,
					applyNo : applyNo,
					reason:reason
				},
				success : function(data) {
					
			    	location.href=data +"&indexNo=" + indexNo;					    	
				
				}
			});
		});
};
function reapply(applyNo) {
    location.href = "/Metamong/sequence/reApplySequence?applyNo=" + applyNo;
}
