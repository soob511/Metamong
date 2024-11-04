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
	
	$('#indexApplyReason').on('input', checkDeleteReason);
	
	$('#btnApply').click(function() {
	     getCheckedData();
	});
});

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

function getCheckedData() {
    const mappedData = [];
    var applyListDtoList = [];
    var applyIndexDtoList = [];
    
    // 각 체크된 행에 대해 데이터 매핑
    $('#indexTableBody tr').each(function() {
        const checkbox = $(this).find('.form-check-input');
        if (checkbox.is(':checked')) {
            const rowData = {};
            $(this).find('td').each(function() {
                const name = $(this).data('name');
                const value = $(this).data('value');
                rowData[name] = value; // data-name을 키로 하고 data-value를 값으로 매핑
            });
            mappedData.push(rowData); // 각 행의 매핑된 데이터 객체를 배열에 추가
        }
    });
    
    console.log(mappedData);
    
    // mappedData에서 applyListDto와 applyIndexDto 생성
    mappedData.forEach(function(item) {
        if (item.idxName) { // idxName이 존재하는 경우
            var applyListDto = {
                applyReason: $('#indexApplyReason').val(),
                approvalStatus: 0,
                schemaName: item.schemaName,
                applyObj: 'INDEX',
                applyType: 'DROP'
            };
            
            var applyIndexDto = {
                tableNo: item.tableNo,
                idxName: item.idxName, // 현재 아이템의 idxName을 넣음
                isUnique: item.isUnique
            };
            
            applyListDtoList.push(applyListDto); // 생성한 applyListDto를 리스트에 추가
            applyIndexDtoList.push(applyIndexDto); // 생성한 applyIndexDto를 리스트에 추가
        }
    });
    
    console.log(applyListDtoList);
    console.log(applyIndexDtoList); // 수정된 부분
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
		applyType: 'DROP'
	};

	var applyIndexDto = {
			tableNo: $('#tableSelect').val(),
			idxName: $('#indexName').val(),
			isUnique: $('#uniqueCheckBox').is(':checked') ? 1 : 0,
			refColumn: refColumn
	};
	
	if (applyListDto.applyReason === '') {
		Swal.fire({
  		  	icon: 'warning',                  
  		  	title: '필수내역을 공란없이<br/>입력해 주세요.',
  		  	text: '필수입력사항: 신청사유'
  		});
	} else {		
		$.ajax({
			type : 'POST',
			url : 'applyIndex',
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
							<td data-name="idxName" data-value="${index.indexName}">${index.indexName}</td>
							<td data-name="schemaName" data-value="${index.schemaName}">${index.schemaName}</td>
							<td data-name="tableNo" data-value="${index.tableName}">${index.tableName}</td>
							<td data-name="refColumn" data-value="${index.columnName}">${index.columnName}</td>
							<td data-name="isUnique" data-value="${index.uniqueness}">${index.uniqueness}</td>
							</tr>
							`
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
							<td data-name="idxName" data-value="${index.indexName}">${index.indexName}</td>
							<td data-name="schemaName" data-value="${index.schemaName}">${index.schemaName}</td>
							<td data-name="tableNo" data-value="${index.tableName}">${index.tableName}</td>
							<td data-name="refColumn" data-value="${index.columnName}">${index.columnName}</td>
							<td data-name="isUnique" data-value="${index.uniqueness}">${index.uniqueness}</td>
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
