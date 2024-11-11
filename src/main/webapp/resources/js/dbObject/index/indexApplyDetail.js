$(document).ready(function() {
	var status = parseInt($('#approvalStatus').text());
	var statusText = getStatusText(status);
	$('#approvalStatus').html(statusText);
	
	var isUnique = parseInt($('#isUnique').text());
	var isUniqueText = getUniqueText(isUnique);
	$('#isUnique').html(isUniqueText);
	
	var rejectReason = $('#rejectReason').text().trim();
	
	var rejectReasonStatus = getRejectReasonStatus(rejectReason);
	$('#rejectReason').html(rejectReasonStatus);
	getSqlBtn(statusText);
	
	$(".btn-reflect").on("click", function() {
		indexReflectDba()
	});

	$(".btn-reapply").on("click", function() {
		reApply()
	});
})

function reApply() {
	let applyType = $("#detailApplyType").data("value");
	let applyNo = $("#detailApplyNo").data("value");
	let refColumn = $('#refColumn').data('value');
	let isUnique = $('#isUnique').data('value');
	let schemaName = $('#schemaName').data('value');
	let tableName = $('#tableId').data('value');
	let indexName = $('#idxName').data('value').toUpperCase();
	let columnName = 'NONE';
	let applyReason = $('#applyReason').data("value");
	
	if (applyType == 'CREATE') {
		document.location.href = '/Metamong/index/indexAddFormReApply?applyNo=' + applyNo + '&schemaName=' + schemaName;
		} else if (applyType == 'DROP') {
		document.location.href = '/Metamong/index/indexDeleteForm?schemaName=' + schemaName + '&indexName=' + indexName + '&columnName=' + columnName + '&tableName=' + tableName + '&applyReason=' + applyReason;		
	}

}

function getSqlBtn(approvalStatus) {
	if (approvalStatus === '반영') {
		let html = `
			<button class="btn-sql" data-bs-toggle="modal" data-bs-target="#sqlLoadModal">
				SQL
			</button>
			`;
		$('#sqlContents').html(html);
	}
}

function getStatusText(approvalStatus) {
    switch (approvalStatus) {
        case 0: return '승인대기';
        case 1: return '승인';
        case 2: return '반려';
        case 3: return '반영';
        default: return '-';
    }
}
    
function getUniqueText(isUnique) {
    switch (isUnique) {
        case 0: return 'N';
        case 1: return 'Y';
        default: return '-';
    }
}

function getRejectReasonStatus(rejectReason) {
    if (rejectReason == '') {
    	return '-';
    } else {
    	return rejectReason;
    }
}

function indexReflectDba() {
	let applyNo = $("#detailApplyNo").data("value");
	let schemaName = $('#schemaName').data('value');
	
	$.ajax({
		url: "/Metamong/index/indexReflectDba",
		type: "GET",
		data: { 
			applyNo : applyNo,
			schemaName : schemaName
		}, 
		success: function(data) {
			console.log(data);
			Swal.fire({
				icon: 'success',
				title: '반영이 완료되었습니다!'
			}).then(() => {
				location.reload();
			});				
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
			Swal.fire({
				icon: 'error',
				title: '반영할 수 없습니다!',
				text: "해당 신청은 반려처리 됩니다."
			}).then(() => {
				location.reload();
			});
		}
	});
};

function  indexApplyDba(status){
	let applyNo = $("#detailApplyNo").data("value");
	let applyType = $("#detailApplyType").data("value");
	let refColumn = $('#refColumn').data('value');
	let isUnique = $('#isUnique').data('value');
	let schemaName = $('#schemaName').data('value');
	let tableId = $('#tableId').data('value');
	let idxName = $('#idxName').data('value');
	
		Swal.fire({
		    icon: status == 1 ? "success" : "warning",
		    title: status == 1 ? "인덱스 신청내역이<br/>승인 되었습니다." : "반려 사유를<br/>입력하세요.",
		    input: status == 1 ? null : 'text'
		}).then(result => {
		    const rejectReason = (status == 1) ? '' : result.value;
		    let applyIndexDetail = {
	            applyNo: applyNo,
	            approvalStatus: status,
	            applyType: applyType,
	            rejectReason: rejectReason,
	            refColumn : refColumn,
	            isUnique : isUnique,
	            schemaName : schemaName,
	            tableId : tableId,
	            idxName : idxName
	        };
			$.ajax({
				url : "/Metamong/index/indexApplyDba",
				type : "POST",
				contentType: "application/json",
				data :  JSON.stringify(applyIndexDetail),
				success : function(data) {
					location.reload();
				}
			});
		});
};
