$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
	
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
        case 'USER_2024_OTI_FINAL_TEAM1_1': return 'SRM';
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
	console.log(dataList);
    dataList.sort((a, b) => parseInt(a.columnPosition) - parseInt(b.columnPosition));

    let refColumn = dataList.map(data => `${data.refColumn} ${data.descend}`).join(', ');
    console.log(refColumn);
    list = {
            "idxName": dataList[0].idxName,
            "tableName": dataList[0].tableName,
            "tableNo": dataList[0].tableNo,
            "schemaName": dataList[0].schemaName,
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
	var schemaName = getSchemaName(list.schemaName);
	var applyListDto = {
		applyReason: $('#indexApplyReason').val(),
		approvalStatus: 0,
		schemaName: schemaName,
		applyObj: 'INDEX',
		applyType: 'DROP'
	};

	var applyIndexDto = {
			tableNo: parseInt(list.tableNo),
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
					title: '인덱스 삭제 신청이<br/>완료되었습니다.',
				}).then(result=>{
					location.href="/Metamong/index/indexApplyList";
				})
			},
			error : function(xhr, status, error) {
				Swal.fire({ 
					icon: 'error',
					title: '인덱스 삭제 신청을<br/>실패하였습니다.',
					text: '확인 후 다시 신청해주세요.',
				})
			}
		});
	}
}    
