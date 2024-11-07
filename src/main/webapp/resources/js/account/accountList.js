$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');
});

$("#memberTable").on("click", ".table-row", function() {
    $(".table-row").removeClass("table-active");
    $(this).addClass("table-active");
});

$("#memberSearch").off("keydown").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        accountSearch(1);
    }
});

$('.bi-search').off('click').on('click', function() {
    accountSearch(1);
});

function accountSearch(pageNo){
	
	var option = $('#searchSelect').val();
	console.log(option);
	var keyword = $('#memberSearch').val();
	console.log(keyword);
	
	$.ajax({
		url:"/Metamong/account/accountSearch",
		type:"GET",	
		data:{option : option, keyword : keyword , pageNo : pageNo},
		success : function(data) {
			$('#memberList').html(data);
			}		
	});
}

