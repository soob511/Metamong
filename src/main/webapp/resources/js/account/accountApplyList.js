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

$("#memberSearch").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        memberSearch();
    }
});


$('.bi-search').on('click', function() {
	memberSearch();
});

function memberSearch(pageNo=1){
	var option = $('#schemaSelect').val();
	console.log(option);
	var keyword = $('#memberSearch').val();
	console.log(keyword);
	
	$.ajax({
		url:"/Metamong/account/accountApplySearch",
		type:"GET",	
		data:{option : option, keyword : keyword , pageNo : pageNo},
		success : function(data) {
			$('#memberList').html(data);
			}		
	});
}