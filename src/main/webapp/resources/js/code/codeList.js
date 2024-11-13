$(document).ready(function () {
    $(".menu-item").removeClass("active");
    $(".menu-item:eq(1)").addClass("active");
    $(".sub-menu:eq(0)").addClass("active");
    $(".sub-menu:eq(0) .sub-item").removeClass("active");
    $(".sub-menu:eq(0) .sub-item:first").addClass("active");
    
    $(".excel-codes").on("click", ".code-row", function() {
	    $(".code-row").removeClass("table-active");
	    $(this).addClass("table-active");
	}); 
    
    $(".btn-search").on("click", function () {
        searchCode();
    });

    $("#codeNameSearch").on("keydown", function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            searchCode();
        }
    });

    $("#useSelect").on("change", function () {
        searchCode();
    });

    $("#codeList").on("click", ".code-row", function () {
        $(".code-row").removeClass("table-active");
        $(this).addClass("table-active");
    });

    $(".btn-edit").on('click', function () {
        let codeNo = $('.table-active').data('code-no');
        if (!codeNo) {
            Swal.fire({
                icon: 'warning',
                title: '수정할 코드를<br/>선택해 주세요.'
            });
        } else {
            $.ajax({
                url: "/Metamong/code/codeUpdateForm",
                type: "GET",
                data: { codeNo: codeNo, isUpdated: 0 },
                success: function (data) {
                    location.href = "/Metamong/code/codeUpdateForm?codeNo=" + codeNo + "&isUpdated=0";
                }
            });
        }
    });
    
    /* 초기화 */
    $('.btn-refresh').click(function() {
    	$('#fileInput').val('');
    	$('.excel-codes').html(`<tr><td colspan="5">파일을 등록해 주세요.</td></tr>`);
    	$('.excel-items').html(`<tr><td colspan="4">파일을 등록해 주세요.</td></tr>`);
    });

    /* EXCEL 업로드 */
    $('#fileInput').change(function () {
        let file = $('#fileInput')[0].files[0];

        let formData = new FormData();
        formData.append('file', file);

        $.ajax({
            url: "/Metamong/code/codeExcelUpload",
            type: "POST",
            data: formData,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            success: function (data) {
                let cHtml = "";
                let iHtml = `<tr class="no-file"><th colspan="5">코드를 선택해 주세요.</th></tr>`;

                data.codeList.forEach((code) => {
                    cHtml += `<tr class="code-row" onclick="getExcelItems(${code.id})">
                        <td>${code.id}</td>
                        <td class="codeNm">${code.codeNm}</td>
                        <td class="codeId">${code.codeId}</td>
                        <td class="codeLength">${code.codeLength}</td>
                        <td class="codeContent">${code.codeContent}</td>
                    </tr>`;
                });

                data.itemList.forEach((item) => {
                    iHtml += `<tr class="code-row" style="display: none;">
                        <td>${item.id}</td>
                        <td class="itemId">${item.itemId}</td>
                        <td class="itemNm">${item.itemNm}</td>
                        <td class="itemContent">${item.itemContent}</td>
                    </tr>`;
                });

                $('.excel-codes').html(cHtml);
                $('.excel-items').html(iHtml);
            },
            error: function (error) {
                Swal.fire({
                    icon: 'error',
                    title: '파일 업로드에<br/>실패했습니다.'
                });
            }
        });
    });
});

function getExcelItems(id) {
    $('.no-file').hide();
    $('.excel-items .code-row').each(function () {
        let clickId = $(this).find('td:eq(0)').text();
        (clickId == id) ? $(this).show() : $(this).hide();
    });
}

function searchCode() {
    let keyword = $("#codeNameSearch").val().trim();
    let option = $("#useSelect option:selected").val();

    $.ajax({
        url: "/Metamong/code/codeSearch",
        type: "GET",
        data: { keyword: keyword, option: option },
        success: function (data) {
            let cHtml = "";
            let iHtml = `<tr class="no-item"><th colspan="5">코드를 선택해 주세요.</th></tr>`;
            if (data.length > 0) {
                let count = 0;
                data.forEach((code) => {
                    cHtml += `<tr class="code-row" onclick="showItemList(${code.codeNo})" data-code-no="${code.codeNo}">
                        <td>${++count}</td>
                        <td>${code.codeNm}</td>
                    	<td>${code.codeId}</td>
                    	<td>${code.codeLength}</td>
                        <td>${code.codeIsActive == 1 ? "Y" : "N"}</td>
                        <td>${!code.codeContent ? '' : code.codeContent}</td>
                    </tr>`;
                });
            } else {
                cHtml += `<tr class="no-code"><th colspan="6">조건에 맞는 코드가 없습니다.</th></tr>`;
            }
            $("#codeList").html(cHtml);
            $("#itemList").html(iHtml);
        },
    });
}

function showItemList(codeNo) {
    $.ajax({
        url: "/Metamong/item/itemList",
        type: "GET",
        data: { codeNo: codeNo },
        success: function (data) {
            let html = " ";
            let count = 0;
            data.forEach((item) => {
                html += `<tr>
                    <td>${++count}</td>
                    <td>${item.itemId}</td>
                    <td>${item.itemNm}</td>
                    <td>${item.itemIsActive == 1 ? "Y" : "N"}</td>
                    <td>${!item.itemContent ? '' : item.itemContent}</td>
                </tr>`;
            });
            $("#itemList").html(html);
        },
    });
}

/* 엑셀 코드 신청 */
function codeApplyExcel() {
	let codeDatas = [];	
	let applyReason = $('.applyReason').val().trim();
	console.log(applyReason);
	$('.excel-codes .code-row').each(function() {
		let id = $(this).find('td:eq(0)').text()
		let codeNm = $(this).find('.codeNm').text();
		let codeId = $(this).find('.codeId').text();
		let codeLength = $(this).find('.codeLength').text();
		let codeContent = $(this).find('.codeContent').text();
		let items = [];
		
		$('.excel-items .code-row').each(function() {
		    let itemId = $(this).find('.itemId').text();
		    let itemNm = $(this).find('.itemNm').text();
		    let itemContent = $(this).find('.itemContent').text();

		    if (id == $(this).find('td:eq(0)').text()) {
		        items.push({
		            itemId: itemId,
		            itemNm: itemNm,
		            itemIsActive: 1,
		            itemContent: itemContent,
		            itemIsUpdate: 0
		        });
		    }
		});

		codeDatas.push({
			codeNo: 0,
		    codeNm: codeNm,
		    codeId: codeId,
		    codeLength: codeLength,
		    codeContent: codeContent,
		    codeIsActive: 1,
		    applyType: 'EXCEL',
		    applyReason: applyReason,
		    items: items,
		});
	});
	
	if($('.excel-codes .code-row').length == 0) {
		Swal.fire({
		    icon: "warning",
		    title: "파일을 등록해 주세요."
		})
		return;
	} else if(!applyReason) {
		Swal.fire({
		    icon: "warning",
		    title: "신청사유를 입력해 주세요."
		})
		return;
	}
	
    $.ajax({
        url: "/Metamong/code/codeApplyExcel",
        type: "POST",
        contentType: "application/json",
	    data: JSON.stringify(codeDatas),
	    traditional: true,
        success:function (data) {
	        Swal.fire({
	          icon: "success",
	          title: "코드/항목 생성 신청이<br/>완료되었습니다.",
	          text: "신청 승인 후, 코드 사용이 가능합니다.",
	        }).then(() => {
	         location.href = data;
	        });
	      },
    });
}