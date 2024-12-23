$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');

    let num = $('.item-list').data('item-length');
    let items = [];

    $('.item-list .item').each(function() {
        items.push({ 
            itemId: $(this).find('.itemId').text(), 
            itemNm: $(this).find('.itemNm').text(), 
            itemIsActive: $(this).find('.itemIsActive').text() === 'Y' ? 1 : 0, 
            itemContent: $(this).find('.itemContent').text(),
            itemIsUpdate: $(this).data('item-isupdate')
        });
    });

    /* 항목 추가 */
    $('#item-add').click(function() {
        const itemId = $('#itemId').val();
        const itemNm = $('#itemNm').val();
        const itemIsActive = $("#itemIsActive option:selected").val();
        const itemContent = $('#itemContent').val();
        
        if(itemCheck(0) != 0) {
            items.push({ itemId: itemId, itemNm: itemNm, itemIsActive: itemIsActive, itemContent: itemContent, itemIsUpdate: 1 });
            itemList();
        }
    });
    
    /* 항목 수정 */
    let itemIndex, updateItem;

    $('.item-list').on('click', '.item', function() {
    	$(".item").removeClass("table-active");
	    $(this).addClass("table-active");
	    $(this).hasClass('oldItem') &&  $('#itemId').prop('disabled', true);
	    
        const itemId = $(this).find('.itemId').text();
        const itemNm = $(this).find('.itemNm').text();
        const itemIsActive = $(this).find('.itemIsActive').text();
        const itemContent = $(this).find('.itemContent').text();
        
        $('#itemId').val(itemId);
        $('#itemNm').val(itemNm);
        (itemIsActive == 'Y') ? $('#itemIsActive option:first').prop("selected", true) : $('#itemIsActive option:last').prop("selected", true);   
        $('#itemContent').val(itemContent);
        
        itemIndex = items.findIndex(item => item.itemId === itemId);
        $(".btn-edit").prop("disabled", false);
    });
    
    $('.btn-edit').on('click', function() {
    	const itemId = $('#itemId').val();
        const itemNm = $('#itemNm').val();
        const itemIsActive = $("#itemIsActive option:selected").val();
        const itemContent = $('#itemContent').val();
        
        if(itemCheck(1) != 0) {
	    	updateItem = { itemId: itemId, itemNm: itemNm, itemIsActive: itemIsActive, itemContent: itemContent, itemIsUpdate: 1 };
	    	items.splice(itemIndex, 1, updateItem);
	        itemList();
        }
    });
    
    /* 항목 삭제 */
    $('.item-list').on('click', '.bi-trash3', function(e) {
    	e.stopPropagation();
        const itemId = $(this).closest('tr').find('.itemId').text();
        const index = items.findIndex(item => item.itemId === itemId);
        items.splice(index, 1);
        itemList();
    });

    /* 항목 초기화 */
    $('.btn-init').click(function() {
    	refresh();
    });

    /* 코드, 항목 수정 신청 */
    $('#code-apply').click(function() {
    	const codeNo = $('.codeAdd-subtitle').data('code-no');
    	const codeNm = $('#codeNm').val();
        const codeId = $('#codeId').val();
        const codeLength = $('#codeLength').val();
        const codeContent = $('#codeContent').val();
        const codeIsActive = $("#codeIsActive option:selected").val();
        const applyReason = $('#applyReason').val();

        let codeData = {
        	codeNo: codeNo,
            codeNm: codeNm,
            codeId: codeId,
            codeLength: codeLength,
            codeContent: codeContent,
            codeIsActive: codeIsActive,
            applyType: 'UPDATE',
            applyReason: applyReason,
            items: items
        };
        
        if (!codeNm || !codeId || !codeLength || !applyReason) {
            Swal.fire({
                icon: 'warning',
                title: '필수내역을 공란없이<br/>입력해 주세요.',
                text: '필수입력사항: 코드명(논리/물리), 코드길이, 신청사유'
            });
            return;
        }

        $.ajax({
            url: "/Metamong/code/applyCode",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(codeData),
            traditional: true,
            success: function(data) {
                Swal.fire({
                    icon: 'success',
                    title: '코드/항목 수정 신청이<br/>완료되었습니다.',
                    text: '신청 승인 후, 코드 사용이 가능합니다.'
                }).then(result => {
                    location.href = data;
                });
            }
        });
    });
    
    $('.btn-compare').click(function() {
    	const codeNo = $('.codeAdd-subtitle').data('code-no');
    	const codeNm = $('#codeNm').val();
        const codeId = $('#codeId').val();
        const codeLength = $('#codeLength').val();
        const codeContent = $('#codeContent').val();
        const codeIsActive = $("#codeIsActive option:selected").val();
        const applyReason = $('#applyReason').val();

        let codeData = {
        	codeNo: codeNo,
            codeNm: codeNm,
            codeId: codeId,
            codeLength: codeLength,
            codeContent: codeContent,
            codeIsActive: codeIsActive,
            applyType: 'UPDATE',
            applyReason: applyReason,
            items: items
        };

        $.ajax({
            url: "/Metamong/code/codeCompare",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(codeData),
            traditional: true,
            success: function(data) {
            	location.href = data;
            }
        });
    });
    
    function itemCheck(isEdit) {
    	const itemId = $('#itemId').val().trim();
    	const itemNm = $('#itemNm').val().trim();
    	
    	 let isExist = false;
         for (let i = 0; i <  items.length; i++) {
        	 if(isEdit == 0) {
        		 if(itemId == items[i].itemId)
                     isExist = true;
        	 } else {
        		 if(itemId == items[i].itemId && i != itemIndex)
                     isExist = true;
        	 }
         }
         
         if (!itemId || !itemNm) {
             Swal.fire({
                 icon: 'warning',
                 title: '항목코드 또는 항목명을<br/>입력해주세요.'
             });
             return 0;
         } 
         
         if (isExist) {
             Swal.fire({
                 icon: 'warning',
                 title: '동일한 이름의 항목코드가<br/>존재합니다.'
             });
             return 0;
         };
    };
    
    function refresh() {
    	itemIndex = null;
    	$('#itemId').val('');
        $('#itemNm').val('');
        $('#itemContent').val('');
        $('#itemId').prop('disabled', false);
        $(".btn-edit").prop("disabled", true);
        $(".item").removeClass("table-active");
        $('#itemIsActive option:first').prop("selected", true);
    };

    function itemList() {
        $('.item-list').empty();

        for (let i = 0; i < items.length; i++) {
            $('.item-list').append(
                `<tr class="item ${i < num ? 'oldItem' : null }">
                    <td>${i+1}</td>
                    <td class="itemId" >${items[i].itemId}</td>
                    <td class="itemNm">${items[i].itemNm}</td>
                    <td class="itemIsActive">${items[i].itemIsActive == 1 ? 'Y' : 'N'}</td>
                    <td class="itemContent">${items[i].itemContent ? items[i].itemContent : ''}</td>
                    <td>${i < num ? '-' : '<i class="bi bi-trash3"></i>'}</td>              
                </tr>`
            );
        }
        refresh();
    }
});