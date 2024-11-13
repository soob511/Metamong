$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(3)').addClass('active');
});

$(document).ready(function() {
	$('.notice-toggle-menu').on('click', function(e) {
		e.preventDefault();
		$(this).next('.notice-sub-menu').toggleClass('active');
	});
});

$(".btn-write").click(function () {
	location.href = "/Metamong/notice/noticeAddForm";
});

$("#noticeTable").on("click", ".table-row", function() {
    $(".table-row").removeClass("table-active");
    $(this).addClass("table-active");
});


$("#noticeSearch").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        noticeSearch();
    }
});

$('.btn-search').on('click', function() {
	noticeSearch();
});

function showDetail(noticeId) {
	$.ajax({
		url: "/Metamong/notice/noticeDetail",
		type: "GET",
		data:{ noticeId : noticeId },
		success: function(data) {
			location.href = "/Metamong/notice/noticeDetail?noticeId=" + noticeId;
			
		}
	})
}

function noticeSearch(pageNo=1){
	var option = $('#schemaSelect').val();
	console.log(option);
	var keyword = $('#noticeSearch').val();
	console.log(keyword);
	$.ajax({
		url:"/Metamong/notice/noticeSearch",
		type:"GET",		
		data:{option : option, keyword : keyword, pageNo : pageNo},
		success : function(data) {
			$('#noticeList').html(data);
			
		}		
	});
}