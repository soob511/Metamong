$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');

    const items = [];
    
    /* 항목 추가 */
    $('#item-add').click(function() {
        const itemId = $('#itemId').val();
        const itemNm = $('#itemNm').val();
        const itemContent = $('#itemContent').val();
        
        if (itemId && itemNm) {
        	 items.push({
         		itemId: itemId,
         		itemNm:itemNm,
         		itemContent: itemContent
         	})
        	 
        	$('.item-list').append(
        		    `<tr class="item">
        		        <th>${$('.item-list tr').length + 1}</th>
        		        <td class="itemId">${itemId}</td>
        		        <td class="itemNm">${itemNm}</td>
        		        <td>Y</td>
        		        <td class="itemContent">${itemContent ? itemContent : '-'}</td>
        		        <td><i class="bi bi-trash3"></i></td>
        		    </tr>`
        		);


            $('#itemId').val('');
            $('#itemNm').val('');
            $('#itemContent').val('');
        } else {
            alert("항목코드 또는 항목명을 입력해주세요.");
        }
    });

    /* 항목 수정 */
    
    /* 항목 삭제 */
    $('.item-list').on('click', '.bi-trash3', function() {
		const delItem = $(this).closest('tr');
		const itemId = delItem.find('.itemId').text();
		delItem.remove();
		const index = items.findIndex(item => item.itemId === itemId);
		items.splice(index, 1);
    });

    
    /* 항목 초기화 */
    $('.btn-init').click(function() {
    	$('#itemId').val('');
        $('#itemNm').val('');
        $('#itemContent').val('');
    });
    
    
    /* 코드, 항목 생성 신청 */
    $('#code-apply').click(function() {
    	const codeNm = $('#codeNm').val();
    	const codeId = $('#codeId').val();
    	const codeContent = $('#codeContent').val();
    	const applyReason = $('#applyReason').val();

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
            traditional: true,
    		success: function(data) {
    			console.log(data);
    			 Swal.fire({ 
    	    		  icon: 'success',
    	    		  title: '코드 생성 신청이 완료되었습니다.',
    	    		  text: '신청 승인 후, 코드 사용가능합니다.',
    	    		  }).then(result=>{
    	    			  location.href="/Metamong/code/codeApplyList";
    	    		  })
    		}
    	});
    });
    
});   	
