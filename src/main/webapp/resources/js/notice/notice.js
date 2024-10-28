$(document).ready(function() {
	$('.menu-item').removeClass('active');
	$('.menu-item:eq(3)').addClass('active');
});

document.querySelector('form').addEventListener('submit', function(event) {
	const title = document.getElementById('noticeTitle').value;
	const content = document.getElementById('noticeContent').value;
	const regdate = document.getElementById('noticeRegdate').value;

	if (title.trim() === "") {
		alert('제목을 입력해 주세요.');
		event.preventDefault();
	}

	if (regdate.trim() === "") {
		alert('날짜를 입력해 주세요.');
		event.preventDefault();
	}

	if (content.length < 10) {
		alert('내용은 최소 10자 이상이어야 합니다.');
		event.preventDefault();
	}
	return "notice/noticeList"
});

$(document).ready(function() {
	$('.notice-toggle-menu').on('click', function(e) {
		e.preventDefault();
		$(this).next('.notice-sub-menu').toggleClass('active');
	});
});

$(document).ready(function() {
	$('#noticeContent').summernote({
		height : 300,
		minHeight : null,
		maxHeight : null,
		focus : true
	});

});

$(document).ready(function() {
	// 새 파일 선택 시 파일명 표시
	$('#noticeFile').on('change', function() {
		var fileName = $(this).val().split('\\').pop(); // 파일명만 추출
		$('#selectedFileName').text("선택된 파일: " + fileName);
	});

	// 삭제 버튼 클릭 시
	$('#removeFileBtn').on('click', function() {
		$('#existingFile').hide(); // 기존 파일명 숨기기
		$('#noticeFile').show(); // 파일 선택 input 보이기
		$('#deleteFile').val("true"); // 서버에 파일 삭제 요청
	});
});

/*$('#noticeSearch').on('input', function() {
	filterNotices();
});*/
$("#noticeSearch").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        noticeSearch();
    }
});


$('.bi-search').on('click', function() {
	noticeSearch();
});

function noticeSearch(){
	var option = $('#schemaSelect').val();
	var keyword = $('#noticeSearch').val();
	console.log(option);
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
					html += `<tr>
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
			}
	});
}
