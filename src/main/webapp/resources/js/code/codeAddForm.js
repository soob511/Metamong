$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');
    
    $('#code-apply').click(function() {
    	const codeNm = $('#codeNm').val();
    	const codeId = $('#codeId').val();
    	const codeContent = $('#codeContent').val();
    	const applyReason = $('#applyReason').val();
    	const items = [];
    	
		items.push({
			itemId: "1",
    		itemNm: "name1", 
    		itemContent: "내용1", 
		})
		
		items.push({
			itemId: "2",
    		itemNm: "name2", 
    		itemContent: "내용2", 
		})
		
    		/*$().each(function() {})*/

    	let codeData = {
			codeNm: codeNm, 
			codeId: codeId, 
			codeContent: codeContent, 
			applyReason: applyReason, 
			items: items
		};

    	$.ajax({
    		url: "/Metamong/code/addApplyCode",
    		type: "POST",
    		contentType: "application/json",
            data: JSON.stringify(codeData),
    		success: function(data) {
    			console.log("성공");
    			 /* Swal.fire({ 
    	    		  icon: 'success',
    	    		  title: '코드 생성 신청이 완료되었습니다.',
    	    		  text: '신청 승인 후, 코드 사용가능합니다.',
    	    		  }).then(result=>{
    	    			  location.href="/Metamong/code/codeApplyList";
    	    		  })*/
    		}
    	});
    });
});   	
