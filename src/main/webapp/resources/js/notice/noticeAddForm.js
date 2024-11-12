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

$(".btn-add").on("click", function () {  
    var noticeTitle = $("#noticeTitle").val();
    var noticeIsimp = $("#noticeIsimp").val();
    var noticeRegdate = $(this).data('notice-regdate'); 
    var noticeContent = $("#noticeContent").val();
    var fileInput = $("#noticeFile")[0].files;
    var MId = $("#MId").val();

    var formData = new FormData();
    formData.append("noticeTitle", noticeTitle);
    formData.append("noticeIsimp", noticeIsimp);
    formData.append("noticeRegdate", noticeRegdate);
    formData.append("noticeContent", noticeContent);
    formData.append("MId", MId);
 
    if (fileInput.length > 0) {
        formData.append("noticeFile", fileInput[0]);
    }
    
    if (!noticeTitle ||  !noticeContent || !noticeIsimp) {
        Swal.fire({
          icon: "warning",
          title: "필수내역을 공란없이<br/>입력해 주세요.",
          text: "필수입력사항: 제목, 중요도, 내용",
        });
        return;
      }
    console.log(formData);
    $.ajax({
        url: "/Metamong/notice/insertNotice",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            Swal.fire({
                icon: 'success',
                title: '글 등록이 완료되었습니다.',
                text: '등록하신 글은 목록에서 확인 가능합니다.'
            }).then(result => {
                location.href = "/Metamong/notice/noticeList";
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