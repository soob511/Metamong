$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
    
    $('#schemaSelect').change(function() {
    	filterIndex()
    });
	
	$(document).on('click', '#biSearch', function() {
		filterIndex()
	});
	
	$(document).on('click', '#indexSearchBtn', function() {
		filterIndex()
	});
	
	$('#indexNameSearch').on('keyup', function() {
		if (event.key != "Enter") {
			return;
		}
		filterIndex();
	});
	
	$('#flexCheckDefault').change(function () {
		const isChecked = $(this).is(':checked');
		$('#indexTableBody input').prop('checked', isChecked);		
	});
	
	$('#indexDeleteReason').on('input', function () {
	    let inputId = $("#indexDeleteReason").val().trim();
	    const msg = $("#reasonValidMessage");

	    if (inputId.length === 0) {
	        msg.text("신청사유를 입력해주세요.");
	        msg.addClass('warn');
	    } else {
	        msg.text("");
	        msg.removeClass('warn');
	    }
	});
});

function filterIndex() {
	const schemaName = $('#schemaSelect').val();
	const indexName = $('#indexNameSearch').val().toUpperCase();
	
	if (schemaName == 'ALL') {
		$.ajax({
			type : 'GET',
			url : 'searchIndexAll',
			data : {
				indexName : indexName
			},
			success : function(data) {
				let html = '';
				let count = 1;
				console.log(data);
				if (Object.keys(data).length > 0) {
					data.forEach(function(index) {
						html += `
							<tr>
							<th>
								<input class="form-check-input" type="checkbox">
							</th>
							<td>${count++}</td>
							<td>${index.indexName}</td>
							<td>${index.schemaName}</td>
							<td>${index.tableName}</td>
							<td>${index.columnName}</td>
							<td>${index.uniqueness}</td>
							</tr>`;
					});
				} else {
					html += '<th colspan="6">조건에 맞는 인덱스가 없습니다</th>'
				}
				$('#indexTableBody').html(html);			 
			},
			error : function(xhr, status, error) {
				console.log('오류: ' + xhr.responseText);
			}
		});
	} else {
		$.ajax({
			type : 'GET',
			url : 'searchIndex',
			data : {
				schemaName : schemaName,
				indexName : indexName
			},
			success : function(data) {
				let html = '';
				let count = 1;
				
				if (Object.keys(data).length > 0) {
					data.forEach(function(index) {
						html += `
							<tr>
							<th>
								<input class="form-check-input" type="checkbox">
							</th>
							<td>${count++}</td>
							<td>${index.indexName}</td>
							<td>${index.schemaName}</td>
							<td>${index.tableName}</td>
							<td>${index.columnName}</td>
							<td>${index.uniqueness}</td>
							</tr>`;
					});
				} else {
					html += '<th colspan="6">조건에 맞는 인덱스가 없습니다</th>'
				}
				$('#indexTableBody').html(html);			 
			},
			error : function(xhr, status, error) {
				console.log('오류: ' + xhr.responseText);
			}
		});
	}
}
