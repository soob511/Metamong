$(document).ready(function() {
	$('.nav-link').removeClass('active');
	$('.nav-link:eq(0)').addClass('active');
	$('.menu-item').removeClass('active');
	$('.menu-item:eq(2)').addClass('active');
	$('.sub-menu:eq(1)').addClass('active');
	$('.sub-menu:eq(1) .sub-item').removeClass('active');
	$('.sub-menu:eq(1) .sub-item:eq(3)').addClass('active');

	$(".btn-reflect").on("click", function() {
		var applyNo = $("#applyContainer").attr("data-applyno");
		var indexNo = $("tr").data("indexno");
		
		$.ajax({
			url: "/Metamong/table/reflectTable",
			type: "POST",
			data: { applyNo: applyNo}, 
			success: function(data) {
				if(data==0){
					Swal.fire({
						icon: 'success',
						title: '반영이 완료되었습니다!'
					}).then(() => {
						location.href="/Metamong/table/tableListDetail?applyNo=" + applyNo +"&indexNo=" + indexNo;		
					});				
				}else{
					Swal.fire({
						icon: 'error',
						title: '반영할 수 없습니다!'
					}).then(() => {
						location.href="/Metamong/table/tableListDetail?applyNo=" + applyNo +"&indexNo=" + indexNo;		
					});
				}
				
			}
		});
	});
	
	$(".btn-reapply").on("click", function() {
		var applyNo = $("#applyContainer").attr("data-applyno");	
		$.ajax({
			url: "/Metamong/table/reApplyTable",
			type: "POST",
			data: { applyNo: applyNo}, 
			success: function(data) {
				 location.href = data + "?applyNo=" + applyNo;
			}
		});
	});
	
	$(".btn-rollback").on("click", function() {
		var applyNo = $("#applyContainer").attr("data-applyno");	
		$.ajax({
			url: "/Metamong/table/rollbackApplyTable",
			type: "POST",
			data: { applyNo: applyNo}, 
			success: function(data) {
				Swal.fire({
					icon: 'success',
					title: '테이블 신청이<br/> 승인취소 되었습니다.'
				}).then(() => {
				location.reload();
				});	
			}
		});
	});
	
	
});


function  tableApplyProcess(status){
	var applyNo = $("#applyContainer").attr("data-applyno");
	 var indexNo = $("tr").data("indexno");
	 let reason;
	 
		Swal.fire({
		    icon: status == 1 ? "success" : "warning",
		    title: status == 1 ? "테이블 신청내역이<br/>승인 되었습니다." : "반려 사유를<br/>입력하세요.",
		    input: status == 1 ? null : 'text'
		}).then(result => {
		    const reason = (status == 1) ? '' : result.value;
		    console.log(reason);
		    
			$.ajax({
				url : "/Metamong/table/tableProcessApproval",
				type : "POST",
				data : {
					status : status,
					applyNo:applyNo,
					reason:reason
				},
				success : function(data) {
					
			    	location.href=data +"&indexNo=" + indexNo;					    	
				
				}
			});
		});
};
