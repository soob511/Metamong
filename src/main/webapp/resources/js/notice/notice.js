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
	$('#noticeContent').summernote({
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
	      if (Object.keys(data).length>0) {
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