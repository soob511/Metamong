$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
    filterTable();
    
    $('#schemaSelect').change(function() {
    	filterTable();
    });
    
    $('#tableSelect').change(function() {
    	filterColumn();
    });
    
    $('#upButton').on('click', function() {
    	moveUp();
    });
    
    $('#downButton').on('click', function() {
    	moveDown();
    });
    
    $('#indexApplyColumn').on('click', 'tr', function() {
    	$('#indexApplyColumn tr').removeClass('colSelect');
    	$(this).addClass('colSelect');
    });
    
    $('#uniqueCheckBox').change(function() {
        if ($(this).is(':checked')) {
            const value = $(this).val();
        }
    });
    
    $('#btn-apply').click(function() {
    	var indexName = $('#indexName').val();
    	var indexApplyReason = $('#indexApplyReason').val();
    	getIndexValues();
    });
    
    
    
});

let indexCount = 1;

$('#columnTableBody').on('click', '.form-check-input', function() {
    var row = $(this).closest('tr');
    var colId = row.find('td[name="colId"]').text();
    var colOrder = row.find('td[name="colOrder"] select').val();

    if ($(this).is(':checked')) {
        const newRow = `
            <tr data-value="${colId}">
                <td name="indexCount" data-value="${indexCount}">${indexCount++}</td>
                <td name="colId" data-value="${colId}">${colId}</td>
                <td name="colOrder" data-value="${colOrder}">${colOrder}</td>
                <td><i class="bi bi-trash3"></i></td>
            </tr>
        `;
        $('#indexApplyColumn').append(newRow);
    } else {
        var rowColId = $(`#indexApplyColumn td[data-value="${colId}"]`).closest('tr');
        rowColId.remove();
        updateCount();
        if (indexCount > 1) {
            --indexCount;    	
        }
    }
});

$('#flexCheckDefault').change(function() {
    const isChecked = $(this).is(':checked');

    $('#columnTableBody .form-check-input').prop('checked', isChecked);

    if (isChecked) {
        $('#columnTableBody .form-check-input').each(function() {
            var row = $(this).closest('tr');
            var colId = row.find('td[name="colId"]').text();
            var colOrder = row.find('td[name="colOrder"] select').val();

            const newRow = `
                <tr data-value="${colId}">
                    <td name="indexCount">${indexCount++}</td>
                    <td data-value="${colId}">${colId}</td>
                    <td data-value="${colOrder}">${colOrder}</td>
                    <td><i class="bi bi-trash3"></i></td>
                </tr>
            `;
            $('#indexApplyColumn').append(newRow);
        });
    } else {
        $('#indexApplyColumn').empty();
        indexCount = 1;
    }
});

function moveUp() {
    var selectedRow = $('#indexApplyColumn tr.colSelect');
    var prevRow = selectedRow.prev('tr');
    
    if (prevRow.length) {
        swapTdValues(selectedRow, prevRow, 0);
        selectedRow.insertBefore(prevRow);
    }
}

function moveDown() {
    var selectedRow = $('#indexApplyColumn tr.colSelect');
    var nextRow = selectedRow.next('tr');

    if (nextRow.length) {
        swapTdValues(selectedRow, nextRow, 0);
        selectedRow.insertAfter(nextRow);
    }
}

function swapTdValues(row1, row2, index) {
    var td1 = row1.find('td').eq(index);
    var td2 = row2.find('td').eq(index);

    var tempValue = td1.html();
    td1.html(td2.html());
    td2.html(tempValue);
}
	
$(document).on('click', '.bi-trash3', function() {
    var row = $(this).closest('tr');
    var rowValue = row.data('value');

    $('#columnTableBody .form-check-input').each(function() {
        var colRow = $(this).closest('tr');
        var colRowValue = colRow.data('value');

        if (rowValue === colRowValue) {
            $(this).prop('checked', false);
        }
    });
    row.remove();
    updateCount();

    if (indexCount > 1) {
        --indexCount;
    }
});

function updateCount() {
    $('#indexApplyColumn tr').each(function(index) {
        $(this).find('td[name="indexCount"]').text(index + 1);
    });
}

function filterTable() {
	const schemaName = $('#schemaSelect').val();

	$.ajax({
		type : 'GET',
		url : '/Metamong/table/searchTable',
		data : {
			schemaName : schemaName
		},
		success : function(data) {
			let html = '<option>선택</option>';

			data.forEach(function(table) {
				html += `
					<option value="${table.tableNo}">${table.tableId}</option>`
			});
			$('#tableSelect').html(html);
			$('#indexApplyColumn').html('');
			$('#columnTableBody').html('');
			$('#flexCheckDefault').prop('checked', false);
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

function filterColumn() {
	let schemaName = $('#schemaSelect').val();
	let tableNo = $('#tableSelect').val();
	if (tableNo === '선택') {
		return;
	}

	$.ajax({
		type : 'GET',
		url : 'searchColumn',
		data : {
			schemaName : schemaName,
			tableNo : tableNo
		},
		success : function(data) {
			let count = 1;
			let html = '';

			data.forEach(function(column) {
				html += `
					<tr data-value="${column.colId}">
						<th>
							<input class="form-check-input" type="checkbox" value=""></th>
	                        <th>${count++}</th>
	                        <td>${column.colNm}</td>
	                        <td name="colId" data-value="${column.colId}">${column.colId}</td>
	                        <td>${column.dataType}</td>
	                        <td>${column.colLength}</td>
	                        <td>${column.colIsnullable}</td>
							<td>${column.colIspk}</td>
							<td name="colOrder">
								<select class="form-select" aria-label="Default select">
									<option selected>ASC</option>
									<option>DESC</option>
								</select>
						</td>
                    </tr>
                    `;
				console.log(column.colId);
			});
			$('#columnTableBody').html(html);
			$('#indexApplyColumn').html('');
			$('#flexCheckDefault').prop('checked', false);
			indexCount = 1;
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

//function applyIndex() {
//	const schemaName = $('#schemaSelect').val();
//	const tableNo = $('#tableSelect').val();
//	const columnName = $()
//	
//	$.ajax({
//		type : 'GET',
//		url : 'searchTable',
//		data : {
//			schemaName : schemaName
//		},
//		success : function(data) {
//			let html = '<option>선택</option>';
//
//			data.forEach(function(table) {
//				html += `
//					<option value="${table.tableNo}">${table.tableId}</option>`
//			});
//			$('#tableSelect').html(html);
//		},
//		error : function(xhr, status, error) {
//			console.log('오류: ' + xhr.responseText);
//		}
//	});
//}


//function getIndexValues() {
//    const tableValues = [];
//    
//    $('#indexApplyColumn tr').each(function() {
//        const rowValues = {}; // 객체 형태로 초기화
//        
//        $(this).find('td').each(function() {
//            const cellValue = $(this).attr('value'); // 각 셀의 value 속성 값
//            const cellText = $(this).text().trim(); // 각 셀의 텍스트 값
//            
//            if (cellValue) { // value가 있는 경우에만 추가
//                rowValues[cellValue] = cellText; // value를 키로 하고 텍스트를 값으로 저장
//            }
//        });
//        
//        if (Object.keys(rowValues).length > 0) { // rowValues가 비어있지 않은 경우에만 추가
//            tableValues.push(rowValues);
//        }
//    });
//    
//    $.ajax({
//		type : 'GET',
//		url : 'searchTable',
//		data : {
//			tableValues
//		},
//		success : function(data) {
//			let html = '<option>선택</option>';
//
//			data.forEach(function(table) {
//				html += `
//					<option value="${table.tableNo}">${table.tableId}</option>`
//			});
//			$('#tableSelect').html(html);
//		},
//		error : function(xhr, status, error) {
//			console.log('오류: ' + xhr.responseText);
//		}
//	});
//}
    

    
