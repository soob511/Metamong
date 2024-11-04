$(document).ready(function() {
	$('.menu-item').removeClass('active');
	$('.menu-item:eq(2)').addClass('active');
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

$("#noticeSearch").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        noticeSearch(1);
    }
});

$('.bi-search').on('click', function() {
	noticeSearch(1);
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

function noticeSearch(pageNo){
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