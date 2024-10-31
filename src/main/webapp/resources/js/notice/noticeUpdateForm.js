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

$(document).ready(function() {
	$("#noticeContent").summernote({
		height : 300,
		minHeight : null,
		maxHeight : null,
		focus : true
	});
});



$(".btn-update").on("click", function () { 
    var noticeId = $(this).data('notice-id'); 
    var noticeTitle = $("#noticeTitle").val();
    var noticeRegdate = $("#noticeRegdate").val();
    var noticeContent = $("#noticeContent").val();
    var fileInput = $("#noticeFile")[0].files;
    
    var formData = new FormData();
    formData.append("noticeId", noticeId);
    formData.append("noticeTitle", noticeTitle);
    formData.append("noticeRegdate", noticeRegdate);
    formData.append("noticeContent", noticeContent);

    if (fileInput.length > 0) {
        formData.append("noticeFile", fileInput[0]);
    }

    $.ajax({
        url: "/Metamong/notice/updateNotice",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            Swal.fire({
                icon: 'success',
                title: '글 수정이 완료되었습니다.',
                text: '수정된 글을 확인해주세요.'
            }).then(result => {
                location.href = "/Metamong/notice/noticeDetail?noticeId=" + noticeId;
            });
        },
        error: function (xhr, status, error) {
            console.error("Error:", error);
            Swal.fire({
                icon: 'error',
                title: '수정 실패',
                text: '오류가 발생했습니다. 다시 시도해주세요.'
            });
        }
    });
});




$(document).ready(function() {
	$('#noticeFile').on('change', function() {
		var fileName = $(this).val().split('\\').pop(); 
	});	
	$('#removeFileBtn').on('click', function() {
		$('#existingFile').hide(); 
		$('#noticeFile').show(); 
		$('deleteFile').val("true");
	});
});

