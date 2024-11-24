$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
    
    $('#schemaSelect').change(function() {
    	filterTable();
    });
    
    $('#tableSelect').change(function() {
    	filterColumn();
    });
    
    $('#columnTableBody').on('click', 'tr', function() { 
    	if ($(event.target).closest('input').length === 0) {
            let columnName = $(this).data('value');

            if (!$(event.target).closest('td[data-name="colOrder"]').length) {
                filterIndex(columnName);   
            }
        }
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
    
    $('#btn-apply').click(function() {
    	applyIndex();
    });

});


function getCheckedOnePk() {
    let checkedCount = $('#columnTableBody .form-check-input:checked').length;

    if (checkedCount === 1) {
        let checkedRow = $('#columnTableBody .form-check-input:checked').closest('tr'); 
        let seventhTdValue = checkedRow.find('td').eq(6).text(); 
        return seventhTdValue;
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

let indexCount = 1;

$('#columnTableBody').on('change', 'select.form-select', function() {
    const selectedOrder = $(this).val();
    const colId = $(this).closest('tr').data('value');
    const targetRow = $('#indexApplyColumn').find(`tr td[data-name="colId"][data-value="${colId}"]`).closest('tr');
    const colOrderCell = targetRow.find('td[data-name="colOrder"]');
    colOrderCell.attr('data-value', selectedOrder).text(selectedOrder);
});

$('#columnTableBody').on('click', '.form-check-input', function() {
    var row = $(this).closest('tr');
    var colId = row.find('td[data-name="colId"]').text();
    var colOrder = row.find('td[data-name="colOrder"] select').val();

    if ($(this).is(':checked')) {
        const newRow = `
            <tr data-value="${colId}">
                <td data-name="indexCount">${indexCount++}</td>
                <td data-name="colId" data-value="${colId}">${colId}</td>
                <td data-name="colOrder" data-value="${colOrder}">${colOrder}</td>
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

    if (isChecked) {
        $('#columnTableBody .form-check-input').each(function() {
        	if (!$(this).is(':checked')) {
        		$(this).prop('checked', true);
            
	            var row = $(this).closest('tr');
	            var colId = row.find('td[data-name="colId"]').text();
	            var colOrder = row.find('td[data-name="colOrder"] select').val();
	
	            const newRow = `
	                <tr data-value="${colId}">
	                    <td data-name="indexCount">${indexCount++}</td>
	                    <td data-name="colId" data-value="${colId}">${colId}</td>
	                    <td data-name="colOrder" data-value="${colOrder}">${colOrder}</td>
	                    <td><i class="bi bi-trash3"></i></td>
	                </tr>
	            `;
	            $('#indexApplyColumn').append(newRow);
        	}
        });
    } else {
        $('#indexApplyColumn').empty();
        indexCount = 1;
        $('#columnTableBody .form-check-input').prop('checked', false);
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
        $(this).find('td[data-name="indexCount"]').text(index + 1);
    });
}

const checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
const checkFirstChar = /^[A-Z]/;
const checkInvalidChars = /[^A-Z_]/;

$(document).on("input", "#indexName", function () {
  let inputId = $("#indexName").val().trim();
  const msg = $("#nameValidMessage");

  if (!checkFirstChar.test(inputId)) {
    msg.text("첫 글자는 대문자 영어로 시작해야 합니다.");
    msg.addClass('warn');
  } else if (inputId.length < 1 || inputId.length > 30) {
    msg.text("1~30자 이내로 작성해야 합니다.");
    msg.addClass('warn');
  } else if (checkKor.test(inputId)) {
    msg.text("한글을 사용할 수 없습니다.");
    msg.addClass('warn');
  } else if (checkInvalidChars.test(inputId)) {
    msg.text("영어 대문자와 언더스코어(_)만 사용할 수 있습니다.");
    msg.addClass('warn');
  } else {
    msg.text("");
    msg.removeClass('warn');
  }
});

$(document).on("input", "#indexApplyReason", function () {
	let inputId = $("#indexApplyReason").val().trim();
	const msg = $("#reasonValidMessage");

	if (inputId.length === 0) {
	    msg.text("신청사유를 입력해주세요.");
	    msg.addClass('warn');
	} else {
	    msg.text("");
	    msg.removeClass('warn');
	}
});

function filterTable() {
	$('#indexTableBody').html('');
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
				if (table != null) {
					html += `
						<option value="${table.tableNo}" data-name="${table.tableId}">
							${table.tableId}
						</option>`;					
				}
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
	$('#indexTableBody').html('');
	let schemaName = $('#schemaSelect').val();
	let tableName = $('#tableSelect').find(':selected').data('name');
	let tableNo = $('#tableSelect').val();
	if (tableNo === '선택') {
		$('#columnTableBody').html('');
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
			let count = 1;
			let html = '';
			
			data.forEach(function(column) {
				html += `
					<tr data-value="${column.colId}">
						<th>
							<input class="form-check-input" type="checkbox" value="">
						</th>
                        <td>${count++}</td>
                        <td>${column.colNm}</td>
                        <td data-name="colId" data-value="${column.colId}">${column.colId}</td>
                        <td>${column.dataType}</td>
                        <td>${column.colLength}</td>
                        <td>${column.colIsnullableText}</td>
						<td>${column.colIspkText}</td>
						<td data-name="colOrder">
							<select class="form-select" aria-label="Default select">
								<option selected>ASC</option>
								<option>DESC</option>
							</select>
						</td>
                    </tr>
                    `;
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

function filterIndex(clickColumnName) {
	let schemaName = $('#schemaSelect').val();
	let tableName = 
		$('#tableSelect').find(':selected').data('name') == '선택' ? 'NONE' : $('#tableSelect').find(':selected').data('name');
	let columnName = clickColumnName;
	let indexName = 'NONE';
	
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
						<th>${count++}</th>
						<td>${getSchemaName(index.schemaName)}</td>
						<td>${index.indexName}</td>
						<td>${index.tableName}</td>
						<td>${index.columnName}</td>
	                    <td>${index.columnPosition}</td>
	                    <td>${index.uniqueness}</td>
	                    <td>${index.descend}</td>
						</tr>`;
				});
			} else {
				html += '<tr><th colspan="8">해당 조건에 맞는 인덱스가 없습니다</th></tr>'
			}
			$('#indexTableBody').html(html);			 
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

function applyIndex() {
	var checkedOnePkValue = getCheckedOnePk();	
	var refColumn = [];
    
    $('#indexApplyColumn tr').each(function() {
        var dataObject = {
            colId: $(this).find('td').eq(1).data('value'),
            colOrder: $(this).find('td').eq(2).data('value')										
        };
        refColumn.push(dataObject);
    });
	
	var applyListDto = {
		applyReason: $('#indexApplyReason').val(),
		approvalStatus: 0,
		schemaName: $('#schemaSelect').val(),
		applyObj: 'INDEX',
		applyType: 'CREATE'
	};

	var applyIndexDto = {
			tableNo: $('#tableSelect').val(),
			idxName: $('#indexName').val(),
			isUnique: $('#uniqueCheckBox').is(':checked') ? 1 : 0			
	};
	
	var applyRequestDto = {
		    applyListDto: applyListDto,
		    applyIndexDto: applyIndexDto,
		    refColumn: refColumn
	};
	
	if (refColumn.length === 0 || applyIndexDto.idxName === '' || 
			applyListDto.applyReason === '') {
		Swal.fire({
  		  	icon: 'warning',                  
  		  	title: '필수내역을 공란없이<br/>입력해 주세요.',
  		  	text: '필수입력사항: 컬럼 선택, 인덱스 이름, 신청사유'
  		});
	} else if (checkedOnePkValue == 'Y') {
		Swal.fire({
			icon: 'warning',                  
			title: '인덱스를 다시<br/>선택해 주세요.',
			text: '오류입력사항: PK컬럼에는 단일 인덱스 신청이 불가합니다'
		});
	} else if ($("#nameValidMessage").hasClass("warn")) {
		Swal.fire({
			icon: 'warning',                  
			title: '인덱스 이름을<br/>확인해 주세요.',
			text: '오류입력사항: 인덱스 이름'
		});
	} else {
		$.ajax({
			type : 'GET',
			url : 'checkDuplicateIndexName',
			data: {
				schemaName: $('#schemaSelect').val(),
				indexName: $('#indexName').val(),
			},
			success : function(data) {
				
				if (data === 1) {
					Swal.fire({
                        icon: 'warning',
                        title: '인덱스 이름을<br/>확인해 주세요.',
                        text: '해당 스키마에 동일 인덱스 이름이 존재합니다.'
                    });
				} else {
                    $.ajax({
                        type: 'POST',
                        url: 'applyIndex',
                        contentType: 'application/json',
                        data: JSON.stringify(applyRequestDto),
                        success: function(data) {
                            Swal.fire({ 
                                icon: 'success',
                                title: '인덱스 신청이<br/> 완료되었습니다.',
                                text: '인덱스 승인 후, 사용이 가능합니다.'
                            }).then(result => {
                                location.href = "/Metamong/index/indexApplyList";
                            });
                        },
                        error: function(xhr, status, error) {
                            Swal.fire({ 
                                icon: 'error',
                                title: '인덱스 신청을<br/> 실패하였습니다.',
                                text: '확인 후 다시 신청해주세요.'
                            });
                        }
                    });
                }
            },
            error: function(xhr, status, error) {
                Swal.fire({ 
                    icon: 'error',
                    title: '인덱스 신청을<br/> 실패하였습니다.',
                    text: '서버 오류가 발생했습니다. 다시 시도해주세요.'
                });
            }
        });
    }
}