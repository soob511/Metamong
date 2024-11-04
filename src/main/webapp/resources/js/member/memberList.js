$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(4)').addClass('active');
});

$("#memberTable").on("click", ".table-row", function() {
    $(".table-row").removeClass("table-active");
    $(this).addClass("table-active");
});

$("#memberSearch").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        memberSearch(1);
    }
});


$('.bi-search').on('click', function() {
	memberSearch(1);
});

function memberSearch(pageNo){
	var option = $('#schemaSelect').val();
	console.log(option);
	var keyword = $('#memberSearch').val();
	console.log(keyword);
	
	$.ajax({
		url:"/Metamong/member/memberSearch",
		type:"GET",		
		data:{option : option, keyword : keyword , pageNo : pageNo},
		success : function(data) {
			$('#memberList').html(data);
			}		
	});
}