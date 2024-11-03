$(document).ready(function() {
    $('.nav-link').removeClass('active');
    $('.nav-link:eq(2)').addClass('active');
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(3)').addClass('active');

    $('#schemaSelect').change(filterApplyIndex);
    $('#statusSelect').change(filterApplyIndex);
    $('#biSearch').click(filterApplyIndex);
    $('#indexNameSearch').on('keyup', function(event) {
    	if (event.key != "Enter") {
    		return;
    	}
    	filterApplyIndex();
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

function filterApplyIndex() {
	let schemaName = $('#schemaSelect').val();
	let approvalStatus = parseInt($('#statusSelect').val(), 10);
	let indexName = $('#indexNameSearch').val();
	
	$.ajax({
		type : 'GET',
		url : 'searchApplyIndex',
		data : {
			schemaName : schemaName,
			approvalStatus : approvalStatus,
			indexName : indexName
		},
		success : function(data) {
			let html = '';
			let count = 1;
			
			if (data.length > 0) {
				data.forEach(function(index) {
					html += `
						<tr>
	                      <th>${count}</th>
	                      <td>${index.fmtApplyDate}</td>
	                      <td>${index.mname}</td>
	                      <td>${index.schemaName}</td>
	                      <td>${index.idxName}</td>
	                      <td>${index.applyObj}</td>
	                      	<td>
	                      		<a href="indexDetail?applyNo=${index.applyNo}&no=${count++}"><button class="btn-history-details">상세보기</button></a>
                  			</td>
	                      <td>
              	            <span id="status-${getStatusId(index.approvalStatus)}">${getStatusText(index.approvalStatus)}</span>
	                      </td>
                    	</tr>
                    	`
				});
			} else {
				html += '<th colspan="8">조건에 맞는 인덱스가 없습니다</th>'
			}
			$('#indexApplyTable').html(html);			 
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}
