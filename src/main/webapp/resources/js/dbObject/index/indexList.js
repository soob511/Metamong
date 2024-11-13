$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
    filterIndex();
    
    $('#schemaSelect').change(function() {
    	filterIndex()
    	filterTable()
    });
    
    $('#tableSelect').change(function() {
    	filterIndex()
    	filterColumn()
    });
    
    $('#columnSelect').change(function() {
    	filterIndex()
    });
	
    $('#indexTableBody').on('change', '.form-check-input', function () {
		checkCheckBox(this);
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
	$(document).on('click', '#btnDelete', function() {
		navToDeletePage();
	});
	
});

function checkCheckBox(checkbox) {
    const isChecked = $(checkbox).is(':checked');
    const dataValue = $(checkbox).closest('tr').find('td:nth-child(3)').text().trim();
    
    if (!isChecked) {
        $('#indexTableBody tr').each(function () {
            const rowCheckBox = $(this).find('.form-check-input');
            rowCheckBox.prop('checked', false);
            rowCheckBox.css('display', 'block');
            rowCheckBox.css('margin', '0 auto');
        });
    } else {
        $('#indexTableBody tr').each(function () {
            const rowDataValue = $(this).find('td:nth-child(3)').text().trim();
            const rowCheckBox = $(this).find('.form-check-input');
            
            if (rowDataValue === dataValue) {
                rowCheckBox.prop('checked', isChecked);
                rowCheckBox.css('display', 'block');
                rowCheckBox.css('margin', '0 auto');
            } else {
                rowCheckBox.prop('checked', false);
                rowCheckBox.css('display', 'none');
            }
        });
    }
}

function getSchemaName(schemaName) {
    switch (schemaName) {
        case 'USER_2024_OTI_FINAL_TEAM1_1': return 'SRM';
        case 'USER_2024_OTI_FINAL_TEAM1_2': return 'PMS';
        case 'USER_2024_OTI_FINAL_TEAM1_3': return 'HR';
        default: return '';
    }
}

function filterTable() {
	const schemaName = $('#schemaSelect').val();
	
	$.ajax({
		type : 'GET',
		url : '/Metamong/table/searchTableInfo',
		data : {
			schemaName : schemaName
		},
		success : function(data) {
			let html = '<option data-name="선택">선택</option>';
			
			data.forEach(function(table) {
				html += `
						<option value="${table.tableNo}" data-name="${table.tableId}">
							${table.tableId}
						</option>
						`;
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
	let tableName = $('#tableSelect').find(':selected').data('name');
	let tableNo = $('#tableSelect').val();
	if (tableNo === '선택') {
		return;
	}

	$.ajax({
		type : 'GET',
		url : '/Metamong/column/searchColumnInfo',
		data : {
			schemaName : schemaName,
			tableName : tableName,
			tableNo : tableNo
		},
		success : function(data) {
			let html = '<option>선택</option>';
			
			data.forEach(function(column) {
				html += `
					<option data-name="colId" data-value="${column.colId}">
						${column.colId}
					</option>
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
	let tableName = 
		$('#tableSelect').find(':selected').data('name') == '선택' ? 'NONE' : $('#tableSelect').find(':selected').data('name');
	let columnName = $('#columnSelect').val() == '선택' ? 'NONE' : $('#columnSelect').val();
	let indexName = $('#indexNameSearch').val().toUpperCase() == '' ? 'NONE' :$('#indexNameSearch').val().toUpperCase();
	if (schemaName == 'MAIN') {
		tableName = 'NONE';
	}
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
			
			if (data.length > 0) {
				data.forEach(function(index) {
					html += `
						<tr>
						<th>
							<input class="form-check-input" type="checkbox">
						</th>
						<td>${count++}</td>
						<td data-name="idxName" data-value="${index.indexName}">
							${index.indexName}
						</td>
						<td data-name="schemaName" data-value="${getSchemaName(index.schemaName)}">
							${getSchemaName(index.schemaName)}
						</td>
						<td data-name="tableName" data-value="${index.tableName}">
							${index.tableName}
						</td>
						<td data-name="refColumn" data-value="${index.columnName}">
							${index.columnName}
						</td>
						<td data-name="columnPosition" data-value="${index.columnPosition}">
							${index.columnPosition}
						</td>
						<td data-name="isUnique" data-value="${index.uniqueness}">
							${index.uniqueness}
						</td>
						<td data-name="descend" data-value="${index.descend}">
							${index.descend}
						</td>
						<td data-name="pkStatus" data-value="${index.pkStatus}">
							${index.pkStatus}
						</td>
						<td data-name="tableNo" data-value="${index.tableNo}" style="display: none;"></td>
						</tr>`;
				});
			} else {
				html += '<tr><th colspan="9">해당 조건에 맞는 인덱스가 없습니다</th></tr>'
			}
			$('#indexTableBody').html(html);			 
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

function navToDeletePage() {
	var row = $('input[type="checkbox"]:checked').closest('tr');
	var schemaName = row.find('[data-name="schemaName"]').data('value');
	var tableName = row.find('[data-name="tableName"]').data('value');
	var columnName = 'NONE';
    var indexName = row.find('[data-name="idxName"]').data('value');
    var pkStatus = row.find('[data-name="pkStatus"]').data('value');
    
    if (row.length === 0) {
    	Swal.fire({ 
			icon: 'warning',
			title: '삭제할 인덱스를<br>선택해주세요.'
		})
    } else if (row.length === 1 && pkStatus === 'Y') {
    	Swal.fire({ 
			icon: 'warning',
			title: 'PK컬럼에 있는 인덱스는<br>삭제불가합니다.'
		})
    } else {
    	document.location.href = '/Metamong/index/indexDeleteForm?schemaName=' + schemaName + '&indexName=' + indexName + '&columnName=' + columnName + '&tableName=' + tableName;    	    	
    }
    console.log(row.length);
}