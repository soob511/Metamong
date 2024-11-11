$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:eq(1)').addClass('active'); 
    
    $(".code-tbody").on("click", ".code", function() {
	    $(".code").removeClass("table-active");
	    $(this).addClass("table-active");
	}); 
});

/* 승인, 반려 */
function codeApplyProcess(status, applyType){
	const params = new URL(location.href).searchParams;
	const applyNo = params.get('applyNo');
	const indexNo = params.get('indexNo');
	let reason;
	
	Swal.fire({
	    icon: status == 1 ? "success" : "warning",
	    title: status == 1 ? "코드/항목 신청내역이<br/>승인 되었습니다." : "반려 사유를<br/>입력하세요.",
	    input: status == 1 ? null : 'text'
	}).then(result => {
	    const reason = (status == 1) ? '' : result.value;
	    
	    $.ajax({
	        url: "/Metamong/code/codeApplyProcess",
	        type: "POST",
	        data: { applyNo: applyNo, status: status, reason: reason },
	        success: function(data) {
	        	location.href = applyType == 'EXCEL' 
	        		? data +"codeApplyExcelDetail?applyNo=" + applyNo + "&indexNo=" + indexNo
	        		: data +"codeApplyDetail?applyNo=" + applyNo + "&indexNo=" + indexNo;
	        }
	    });
	});
};

/* 반영 */
function applyComplete(applyType) {
    const params = new URL(location.href).searchParams;
    const applyNo = params.get('applyNo');
    const indexNo = params.get('indexNo');
    
    $.ajax({
        url: "/Metamong/code/applyComplete",
        type: "POST",
        data: { applyNo: applyNo },
        success: function (data) {
            Swal.fire({
                icon: data != 0 ? "success" : "error",
                title: data != 0 ? "반영이<br/>완료되었습니다." : "반영할 수 없는 신청입니다.",
                text: data !=0 ? null : "해당 신청은 반려처리 됩니다."
            }).then(() => {
            	location.href = applyType == 'EXCEL' 
	        		? "/Metamong/code/codeApplyExcelDetail?applyNo=" + applyNo + "&indexNo=" + indexNo
	        		: "/Metamong/code/codeApplyDetail?applyNo=" + applyNo + "&indexNo=" + indexNo;
            });
        }
    });
};

/* 항목 가져오기 */
function getExcelItems(codeNo) {
	const params = new URL(location.href).searchParams;
	const applyNo = params.get('applyNo');
	
	$.ajax({
        url: "/Metamong/item/itemApplyExcelList",
        type: "GET",
        data: { applyNo: applyNo, codeNo: codeNo },
        success: function (data) {
            let html = " ";
            let count = 0;
            data.forEach((item) => {
                html += `<tr>
                    <td>${++count}</td>
                    <td>${item.itemId}</td>
                    <td>${item.itemNm}</td>
                    <td>${item.itemContent == null ? '' : item.itemContent}</td>
                </tr>`;
            });
            $(".item-tbody").html(html);
        },
    });
}