$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:eq(1)').addClass('active');
});

$("#memberTable").on("click", ".table-row", function() {
    $(".table-row").removeClass("table-active");
    $(this).addClass("table-active");
});

$("#memberSearch").off("keydown").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        accountApplySearch(1);
    }
});

$('#statusSelect').off('change').on('change', function() {
    accountApplySearch(1);
});

$('.bi-search').off('click').on('click', function() {
    accountApplySearch(1);
});

function accountApplySearch(pageNo){
	
	var status = $('#statusSelect option:selected').data('status');
	console.log(status);
	var option = $('#searchSelect').val();
	console.log(option);
	var keyword = $('#memberSearch').val();
	console.log(keyword);
	
	$.ajax({
		url:"/Metamong/account/accountApplySearch",
		type:"GET",	
		data:{status: status, option : option, keyword : keyword , pageNo : pageNo},
		success : function(data) {
			$('#memberList').html(data);
			}		
	});
}

function accountApplyProcess(MId, status){
	const params = new URLSearchParams(window.location.search);
    const pageNo = params.get('pageNo') ;
	
	Swal.fire({
	    icon: status == 1 ? "success" : "warning",
	    title: status == 1 ? "계정 신청이<br/>승인 되었습니다." : "계정 신청이<br/>반려 되었습니다."
	}).then(() => {
	  
	    $.ajax({
	        url: "/Metamong/account/accountApplyProcess",
	        type: "POST",        
	        data: { MId : MId, status: status},
	        success: function(data) {
	            location.href = `/Metamong/account/accountApplyList?pageNo=${pageNo}`;
	        }
	    });
	});
};