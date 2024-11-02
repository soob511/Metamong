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
		toolbar: [
			  ['style', ['style']],
			  ['font', ['bold', 'underline', 'clear','strikethrough', 'superscript', 'subscript']],
			  ['fontname', ['fontname']],
			  ['fontsize', ['fontsize']],
			  ['color', ['color']],
			  ['para', ['ul', 'ol', 'paragraph']],
			  ['table', ['table']],
			  ['insert', ['link', 'picture', 'video']],
			  ['view', ['fullscreen', 'codeview', 'help']],
			],
			popover: {
				  image: [
				    ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
				    ['float', ['floatLeft', 'floatRight', 'floatNone']],
				    ['remove', ['removeMedia']]
				  ],
				  link: [
				    ['link', ['linkDialogShow', 'unlink']]
				  ],
				  table: [
				    ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
				    ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
				  ],
				  air: [
				    ['color', ['color']],
				    ['font', ['bold', 'underline', 'clear']],
				    ['para', ['ul', 'paragraph']],
				    ['table', ['table']],
				    ['insert', ['link', 'picture']]
				  ]
				},
				
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks: {
				onInit: function() {
					// 에디터 초기화 시 기본 텍스트 정렬 설정
					$('#noticeContent').css('text-align', 'left');
				}
			}
	});
});




$(".btn-update").on("click", function () { 
    var noticeId = $(this).data('notice-id'); 
    var noticeTitle = $("#noticeTitle").val();
    var noticeIsimp = $("#noticeIsimp").val();
    var noticeContent = $("#noticeContent").val();
    var fileInput = $("#noticeFile")[0].files;
    var deleteFile = $("#deleteFile").val();
    
    var formData = new FormData();
    formData.append("noticeId", noticeId);
    formData.append("noticeTitle", noticeTitle);
    formData.append("noticeIsimp", noticeIsimp);
    formData.append("noticeContent", noticeContent);
    if (fileInput.length > 0) {
        formData.append("noticeFile", fileInput[0]);
    }
    formData.append("deleteFile", deleteFile);

    if (!noticeTitle || !noticeContent || !noticeIsimp) {
        Swal.fire({
          icon: "warning",
          title: "필수내역을 공란없이<br/>입력해 주세요.",
          text: "필수입력사항: 제목, 중요도, 내용",
        });
        return;
      }
    console.log(deleteFile);
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
		$('#deleteFile').val("1");
		
	});	
	$('#removeFileBtn').on('click', function() {
		$('#existingFile').hide(); 
		$('#noticeFile').show(); 
		$('#deleteFile').val("1");
	});
});

$(".btn-update").on("click", function () { 
    var noticeId = $(this).data('notice-id'); 
    var noticeTitle = $("#noticeTitle").val();
    var noticeIsimp = $("#noticeIsimp").val();
    var noticeContent = $("#noticeContent").val();
    var deleteFile = $("#deleteFile").val();
    
    var formData = new FormData();
    formData.append("noticeId", noticeId);
    formData.append("noticeTitle", noticeTitle);
    formData.append("noticeIsimp", noticeIsimp);
    formData.append("noticeContent", noticeContent);
    formData.append("deleteFile", deleteFile);

    if (!noticeTitle || !noticeContent || !noticeIsimp) {
        Swal.fire({
          icon: "warning",
          title: "필수내역을 공란없이<br/>입력해 주세요.",
          text: "필수입력사항: 제목, 중요도, 내용",
        });
        return;
      }
    console.log(deleteFile);
    $.ajax({
        url: "/Metamong/notice/deleteFile",
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
	
	$('#removeFileBtn').on('click', function() {
		$('#existingFile').hide(); 
		$('#noticeFile').show(); 
		$('#deleteFile').val("1");
		
	});
});
