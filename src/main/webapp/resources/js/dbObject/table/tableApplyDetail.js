$(document).ready(function() {
	$('.nav-link').removeClass('active');
	$('.nav-link:eq(0)').addClass('active');
	$('.menu-item').removeClass('active');
	$('.menu-item:eq(2)').addClass('active');
	$('.sub-menu:eq(1)').addClass('active');
	$('.sub-menu:eq(1) .sub-item').removeClass('active');
	$('.sub-menu:eq(1) .sub-item:eq(3)').addClass('active');

	$(".btn-approve").on("click", function() {
		var status = 1;
		var applyNo = $("#applyContainer").attr("data-applyno");
		 var indexNo = $("tr").data("indexno");
		$.ajax({
			url : "/Metamong/table/tableProcessApproval",
			type : "POST",
			data : {
				status : status,
				applyNo:applyNo
			},
			success : function(data) {
				location.href=data +"&indexNo=" + indexNo;
			}
		});

	});

	$(".btn-reject").on("click", function() {
		var status = 2;
		var applyNo = $("#applyContainer").attr("data-applyno");
		 var indexNo = $("tr").data("indexno");
		$.ajax({
			url : "/Metamong/table/tableProcessApproval",
			type : "POST",
			data : {
				status : status,
				applyNo:applyNo
			},
			success : function(data) {
				location.href=data +"&indexNo=" + indexNo;
			}
		});

	});

});
