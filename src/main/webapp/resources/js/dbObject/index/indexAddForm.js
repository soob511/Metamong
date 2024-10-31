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
    	applyIndex();
    });

});

let indexCount = 1;

$('#columnTableBody').on('click', '.form-check-input', function() {
    var row = $(this).closest('tr');
    var colId = row.find('td[data-name="colId"]').text();
    var colOrder = row.find('td[data-name="colOrder"] select').val();

    if ($(this).is(':checked')) {
        const newRow = `
            <tr>
                <td data-name="indexCount" data-value="${indexCount}">${indexCount++}</td>
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

    $('#columnTableBody .form-check-input').prop('checked', isChecked);

    if (isChecked) {
        $('#columnTableBody .form-check-input').each(function() {
            var row = $(this).closest('tr');
            var colId = row.find('td[data-name="colId"]').text();
            var colOrder = row.find('td[data-name="colOrder"] select').val();

            const newRow = `
                <tr data-value="${colId}">
                    <td data-name="indexCount">${indexCount++}</td>
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
        $(this).find('td[data-name="indexCount"]').text(index + 1);
    });
}

const checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
const checkFirstChar = /^[A-Za-z]/;
const checkInvalidChars = /[^A-Za-z0-9_]/;

$(document).on("input", "#indexName", function () {
  let inputId = $("#indexName").val().trim();
  const msg = $("#indexValidMessage");

  if (!checkFirstChar.test(inputId)) {
    msg.text("첫 글자는 영문이어야 합니다.");
    msg.addClass('warn');
  } else if (inputId.length < 1 || inputId.length > 30) {
    msg.text("1~30자 이내로 작성해야 합니다.");
    msg.addClass('warn');
  } else if (checkKor.test(inputId)) {
    msg.text("한글을 사용할 수 없습니다.");
    msg.addClass('warn');
  } else if (checkInvalidChars.test(inputId)) {
    msg.text("특수문자는 언더스코어(_)만 사용할 수 있습니다.");
    msg.addClass('warn');
  } else {
    msg.text("");
    msg.removeClass('warn');
  }
});


function filterTable() {
	const schemaName = $('#schemaSelect').val();

	$.ajax({
		type : 'GET',
		url : '/Metamong/table/searchTableBySchema',
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
		url : '/Metamong/column/searchColumnBySchema',
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
	                        <td data-name="colId" data-value="${column.colId}">${column.colId}</td>
	                        <td>${column.dataType}</td>
	                        <td>${column.colLength}</td>
	                        <td>${column.colIsnullable}</td>
							<td>${column.colIspk}</td>
							<td data-name="colOrder">
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

function applyIndex() {
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
	
	$.ajax({
		type : 'POST',
		url : 'applyIndex',
	    contentType: 'application/json',
	    data: JSON.stringify(applyRequestDto),
		success : function(data) {
			Swal.fire({ 
				  icon: 'success',
				  title: '인덱스 신청이 완료되었습니다.',
				  text: '인덱스 승인 후, 사용이 가능합니다.',
				  }).then(result=>{
	    			  location.href="/Metamong/index/indexApplyList";
	    		  })
		},
		error : function(xhr, status, error) {
			Swal.fire({ 
				  icon: 'error',
				  title: '인덱스 신청을 실패하였습니다.',
				  text: '확인 후 다시 신청해주세요.',
				  })
		}
	});
}    
