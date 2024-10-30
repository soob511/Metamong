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

/*$(".btn-add").on("click", function () {
	
	  var noticeTitle = $("#noticeTitle").val();
	  var noticeRegdate = $("#noticeRegdate").val();
	  var noticeContent = $("#noticeContent").val();
	  var noticeFile = $("#noticeFile").val();
  
	  var NoticeAddData = {
	    noticeTitle : noticeTitle,
	    noticeRegdate : noticeRegdate,
	    noticeContent : noticeContent,
	    noticeFile : noticeFile,
	  };
	  
	console.log(NoticeAddData);
	  $.ajax({
	    url: "/Metamong/notice/insertNotice",
	    type: "POST",
	    contentType: "application/json; charset=UTF-8",
	    data: JSON.stringify(NoticeAddData),
	    success: function (data) {
	      if (data>0) {
	    	  Swal.fire({ 
	    		  icon: 'success',
	    		  title: '글 등록이 완료되었습니다.',
	    		  text: '등록하신 글은 목록에서 확인가능합니다.',
	    		  }).then(result=>{
	    			  location.href="/Metamong/notice/noticeList";
	    		  })
	      } 
	    }
	  });
	});*/

$(".btn-add").on("click", function (e) {
    e.preventDefault(); // 기본 form 제출 방지

    var formData = new FormData();
    formData.append("noticeTitle", $("#noticeTitle").val());
    formData.append("noticeRegdate", $("#noticeRegdate").val());
    formData.append("noticeContent", $("#noticeContent").val());
    
    var fileInput = $("#noticeFile")[0].files;
    if (fileInput.length>0) {
        formData.append("noticeFile", fileInput[0]);
    }

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
        }
    });
});
