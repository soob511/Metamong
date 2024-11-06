$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
    
    $('#schemaSelect').change(function() {
    	filterIndex();
    	filterTable();
    });
    
    $('#tableSelect').change(function() {
    	filterIndex();
    	filterColumn();
    });
    
    $('#columnSelect').change(function() {
    	filterIndex();
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
	
	$('#indexTableBody').on('change', '.form-check-input', function () {
		checkCheckBox(this);
	});
	
	$('#indexApplyReason').on('input', checkDeleteReason);
	
	$('#btnApply').click(function() {
		applyIndex();
	});
});

function getCheckedRowsData() {
    var selectedRows = [];

    $('#indexTableBody tr').each(function() {
        var checkbox = $(this).find('input[type="checkbox"]');
        if (checkbox.is(':checked')) {
            var rowData = {};

            $(this).find('td[data-name]').each(function() {
                var dataName = $(this).data('name');
                var dataValue = $(this).data('value');
                rowData[dataName] = dataValue;
            });
            selectedRows.push(rowData);
        }
    });
    console.log(selectedRows);
    return selectedRows;
}

function getSchemaName(schemaName) {
    switch (schemaName) {
        case 'USER_2024_OTI_FINAL_TEAM1_1': return 'SPM';
        case 'USER_2024_OTI_FINAL_TEAM1_2': return 'PMS';
        case 'USER_2024_OTI_FINAL_TEAM1_3': return 'HR';
        default: return '';
    }
}

function checkCheckBox(checkbox) {
    const isChecked = $(checkbox).is(':checked');
    const dataValue = $(checkbox).closest('tr').find('td:nth-child(3)').text().trim();
    
    $('#indexTableBody tr').each(function () {
        const rowDataValue = $(this).find('td:nth-child(3)').text().trim();
        
        if (rowDataValue === dataValue) {
            $(this).find('.form-check-input').prop('checked', isChecked);
        }
    });
}

function createRefColumn(dataList) {

    dataList.sort((a, b) => parseInt(a.columnPosition) - parseInt(b.columnPosition));

    let refColumn = dataList.map(data => `${data.refColumn} ${data.descend}`).join(', ');

    list = {
            "idxName": dataList[0].idxName,
            "tableName": dataList[0].tableName,
            "refColumn": refColumn,
            "isUnique": dataList[0].isUnique == 'UNIQUE' ? 1 : 0
        };
    console.log(list);
    return list;
}

function checkDeleteReason () {
    let inputId = $("#indexApplyReason").val().trim();
    const msg = $("#reasonValidMessage");

    if (inputId.length === 0) {
        msg.text("신청사유를 입력해주세요.");
        msg.addClass('warn');
    } else {
        msg.text("");
        msg.removeClass('warn');
    }
}

function applyIndex() {
	
	var list = createRefColumn(getCheckedRowsData());
	
	var applyListDto = {
		applyReason: $('#indexApplyReason').val(),
		approvalStatus: 0,
		schemaName: $('#schemaSelect').val(),
		applyObj: 'INDEX',
		applyType: 'DROP'
	};

	var applyIndexDto = {
			tableNo: $('#tableSelect').val(),
			idxName: list.idxName,
			isUnique: list.isUnique,
			refColumn: list.refColumn
	};
	
	var applyRequestDto = {
		    applyListDto: applyListDto,
		    applyIndexDto: applyIndexDto,
		    refColumn: []
	};
	console.log(applyListDto);
	console.log(applyIndexDto);
	console.log(applyRequestDto);
	if (applyListDto.applyReason === '') {
		Swal.fire({
  		  	icon: 'warning',                  
  		  	title: '필수내역을 공란없이<br/>입력해 주세요.',
  		  	text: '필수입력사항: 신청사유'
  		});
	} else {		
		$.ajax({
			type : 'POST',
			url : '/Metamong/index/applyIndexDel',
			contentType: 'application/json',
			data: JSON.stringify(applyRequestDto),
			success : function(data) {
				Swal.fire({ 
					icon: 'success',
					title: '인덱스 삭제 신청이 완료되었습니다.',
					text: '인덱스 삭제 반영 후, 조회가 불가합니다.',
				}).then(result=>{
					location.href="/Metamong/index/indexApplyList";
				})
			},
			error : function(xhr, status, error) {
				Swal.fire({ 
					icon: 'error',
					title: '인덱스 삭제 신청을 실패하였습니다.',
					text: '확인 후 다시 신청해주세요.',
				})
			}
		});
	}
}    

function filterColumn() {
	let schemaName = $('#schemaSelect').val();
	let tableName = $('#tableSelect').find(':selected').data('name');
	let tableNo = $('#tableSelect').val();
	let tableValue = $('#tableSelect').val();
	console.log(tableValue);
	if (tableValue == '선택') {
		$('#columnSelect').html('<option>선택</option>');
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
			console.log(data);
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

function filterTable() {
	const schemaName = $('#schemaSelect').val();
	
	$.ajax({
		type : 'GET',
		url : '/Metamong/table/searchTableInfo',
		data : {
			schemaName : schemaName
		},
		success : function(data) {
			console.log(data);
			let html = '<option>선택</option>';
			$('#columnSelect').html(html);
			
			data.forEach(function(table) {
				if (table != null) {
					html += `
						<option value="${table.tableNo}" data-name="${table.tableId}">
							${table.tableId}
						</option>`;					
				}
			});
			$('#tableSelect').html(html);
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
	if (tableName === undefined) {
		tableName = 'NONE'
	}
	if (schemaName === 'MAIN') {
		$('#indexTableBody').html('');
		return;
	}
	console.log(schemaName);
	console.log(tableName);
	console.log(columnName);
	console.log(indexName);
	$.ajax({
		type : 'GET',
		url : 'searchIndexNoPk',
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
						<th>
							<input class="form-check-input" type="checkbox">
						</th>
						<td>${count++}</td>
						<td data-name="idxName" data-value="${index.indexName}">
							${index.indexName}
						</td>
						<td>${getSchemaName(index.schemaName)}</td>
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
						</tr>`;
				});
			} else {
				html += '<th colspan="10">해당 조건에 맞는 인덱스가 없습니다</th>'
			}
			$('#indexTableBody').html(html);			 
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}
