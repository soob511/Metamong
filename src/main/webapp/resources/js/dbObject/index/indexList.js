$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
    
    $('#schemaSelect').change(function() {
    	filterTable()
    	filterIndex()
    });
    
    $('#tableSelect').change(function() {
    	filterColumn()
    	filterIndex()
    });
    
    $('#columnSelect').change(function() {
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
});

function getSchemaName(schemaName) {
    switch (schemaName) {
        case 'USER_2024_OTI_FINAL_TEAM1_1': return 'SPM';
        case 'USER_2024_OTI_FINAL_TEAM1_2': return 'PMS';
        case 'USER_2024_OTI_FINAL_TEAM1_3': return 'HR';
        default: return '';
    }
}

function filterTable() {
	const schemaName = $('#schemaSelect').val();
	console.log(schemaName);
	$.ajax({
		type : 'GET',
		url : '/Metamong/table/searchTableByDic',
		data : {
			schemaName : schemaName
		},
		success : function(data) {
			let html = '<option>선택</option>';
			console.log(data);
			data.forEach(function(table) {
				html += `
					<option>${table.tableNm}</option>`
			});
			$('#tableSelect').html(html);
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

function filterColumn() {
	let schemaName = $('#schemaSelect').val();
	let tableName = $('#tableSelect').val();

	$.ajax({
		type : 'GET',
		url : '/Metamong/column/searchColumnByDic',
		data : {
			schemaName : schemaName,
			tableName : tableName
		},
		success : function(data) {
			let html = '<option>선택</option>';
			console.log(data);
			data.forEach(function(column) {
				html += `
					<option>${column.colNm}</option>
					`;
			});
			$('#columnSelect').html(html);
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

function filterIndex() {
	let schemaName = $('#schemaSelect').val();
	let tableName = $('#tableSelect').val() == '선택' ? 'NONE' : $('#tableSelect').val();
	let columnName = $('#columnSelect').val() == '선택' ? 'NONE' : $('#columnSelect').val();
	let indexName = $('#indexNameSearch').val().toUpperCase() == '' ? 'NONE' :$('#indexNameSearch').val().toUpperCase();
	console.log(schemaName);
	console.log(tableName);
	console.log(columnName);
	console.log(indexName);
	
	$.ajax({
		type : 'GET',
		url : 'searchIndex',
		data : {
			indexName : indexName,
			columnName : columnName,
			tableName : tableName,
			schemaName : schemaName
		},
		success : function(data) {
			let html = '';
			let count = 1;
			console.log(data);
			if (data.length > 0) {
				data.forEach(function(index) {
					html += `
						<tr>
						<th>${count++}</th>
						<td>${index.indexName}</td>
						<td>${getSchemaName(index.schemaName)}</td>
						<td>${index.tableName}</td>
						<td>${index.columnName}</td>
	                    <td>${index.columnPosition}</td>
	                    <td>${index.uniqueness}</td>
	                    <td>${index.descend}</td>
						</tr>`;
				});
			} else {
				html += '<th colspan="8">해당 조건에 맞는 인덱스가 없습니다</th>'
			}
			$('#indexTableBody').html(html);			 
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}
