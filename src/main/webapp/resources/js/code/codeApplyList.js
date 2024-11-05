$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:eq(1)').addClass('active');   
});

function codeApplyDetail(applyNo, indexNo) {
	location.href = "/Metamong/code/codeApplyDetail?applyNo=" + applyNo + "&indexNo=" + indexNo;
};

$('#statusSelect').on('change', function() {
	codeApplySearch(1);
});

$("#codeNameSearch").on("keydown", function(e) {
    if (event.keyCode === 13) { 
        e.preventDefault();
        codeApplySearch(1);
    }
});

$('.bi-search').on('click', function() {
	codeApplySearch(1);
});

function codeApplySearch(pageNo){
	let status = $('#statusSelect option:selected').data('status');
	let option = $('#searchSelect').val();
	let keyword = $('#codeNameSearch').val();
	
	$.ajax({
		url:"/Metamong/code/codeApplySearch",
		type:"GET",		
		data:{status: status, option : option, keyword : keyword, pageNo : pageNo},
		success : function(data) {
			$('#codeContainer').html(data);			
		}		
	});
}