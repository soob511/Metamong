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
        noticeSearch();
    }
});


$('.bi-search').on('click', function() {
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

function noticeSearch(){
	var option = $('#schemaSelect').val();
	console.log(option);
	var keyword = $('#noticeSearch').val();
	console.log(keyword);
	
	$.ajax({
		url:"/Metamong/notice/noticeSearch",
		type:"GET",		
		data:{option : option, keyword : keyword},
		success : function(data) {
			var html = "";
			
			if(Object.keys(data).length>0){
				var count=0;
				data.forEach(notice => {
					html += `<tr onclick="showDetail(${notice.noticeId})">
						<td>${++count}</td>
						<td>${notice.noticeTitle}</td>
						<td>${new Date(notice.noticeRegdate).toISOString().slice(0, 10)}</td>
						<td>${notice.noticeHitcount}</td>
						</tr>`;
				});
			}else{
				html+=`<tr>
						<th colspan="5">검색 결과가 없습니다.</th>
					   </tr>`;
			}	
			$('#noticeList').html(html);			
			$('#noticeCount').text(count);
			}		
	});
}