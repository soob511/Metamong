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
        height: 300,                 
        minHeight: null,         
        maxHeight: null,             
        focus: true             
    });
});