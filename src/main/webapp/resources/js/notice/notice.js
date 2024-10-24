$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(3)').addClass('active');
});

document.querySelector('form').addEventListener('submit', function(event) {
    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;

    if (title.trim() === "") {
        alert('제목을 입력해 주세요.');
        event.preventDefault();
    }

    if (content.length < 10) {
        alert('내용은 최소 10자 이상이어야 합니다.');
        event.preventDefault();
    }
    return "notice/NoticeList"
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