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

$(".btn-delete").click(function () {
	var noticeId = $(this).data('notice-id');
	console.log(noticeId);
	var pageNo = $(this).data('page-no');
	console.log(pageNo);
    Swal.fire({
      title: '글을 삭제하시겠습니까?',
      text: "글을 삭제하시면 다시 복구할 수 없습니다.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '확인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
      
    }).then(result => {
      if (result.isConfirmed) {

    	  $.ajax({
    		  url: "/Metamong/notice/deleteNotice",
    		  type: "GET",
    		  data: {noticeId : noticeId},
    		  success: function(pageNo) {
    			  console.log(pageNo);
    			  if(pageNo>0) {
    			  Swal.fire({
    				  icon: 'success',
			          title: '삭제가 완료되었습니다.'
    			  }).then(result => {
    				  location.href = "/Metamong/notice/noticeList?pageNo=" + pageNo;
		         });
    			}
    		  }
    	   });
      	}
    });
  });