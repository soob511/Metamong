$(document).ready(function() {
    $('.nav-link').removeClass('active');
    $('.nav-link:eq(2)').addClass('active');
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(3)').addClass('active');

    $('#schemaSelect').change(function() {
        filterApplyIndexPaging(1);
    });
    $('#statusSelect').change(function() {
        filterApplyIndexPaging(1);
    });
    $('#biSearch').click(function() {
    	filterApplyIndexPaging(1);
    });
    $('#indexNameSearch').on('keyup', function(event) {
    	if (event.key != "Enter") {
    		return;
    	}
    	filterApplyIndexPaging(1);
    })
});

function getStatusText(approvalStatus) {
    switch (approvalStatus) {
        case 0: return '승인대기';
        case 1: return '승인';
        case 2: return '반려';
        case 3: return '반영';
        default: return '';
    }
}

function getStatusId(approvalStatus) {
    switch (approvalStatus) {
        case 0: return 'await';
        case 1: return 'approve';
        case 2: return 'rejected';
        case 3: return 'applied';
        default: return '';
    }
}

function filterApplyIndexPaging(pageNo) {
	let schemaName = $('#schemaSelect').val();
	let approvalStatus = parseInt($('#statusSelect').val(), 10);
	let indexName = $('#indexNameSearch').val();

	$.ajax({
		type : 'GET',
		url : '/Metamong/index/searchApplyIndex',
		data : { 
			schemaName : schemaName,
			approvalStatus : approvalStatus,
			indexName : indexName,
            pageNo: pageNo
			},
		success : function(data) {
			$('#indexApplyListBody').html(data);			 
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}
