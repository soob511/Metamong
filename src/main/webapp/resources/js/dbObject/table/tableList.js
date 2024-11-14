$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:first').addClass('active');
    
    $('.btn-typeEdit').prop('disabled', true);
    //데이터타입
    $("#dataTypeList").on("click", "tr", function() {
        $("#dataTypeList tr").removeClass("table-active");
        $(this).addClass("table-active");
    });
    
    $.ajax({
        url: "/Metamong/dataType/dataTypeList",
        type: "GET",
        dataType: "json",
        success: function(data) {
    		let count = 0;
    		let html = "";
    		
    		  data.forEach((type) => {
    	            html += `<tr data-inupdate="0">
    	                <td>${++count}</td>
    	                <td class="dataType">${type.dataType}</td>
    	                <td class="datatypeIsactive">${type.datatypeIsactive == 1 ? 'Y' : 'N'}</td>
    	            </tr>`;
    	        });     		
    		$('#dataTypeList').html(html);
        }
    });
    
    let selectedRow = null;
    
    $('.btn-typeAdd').on('click', function() {
    	 const dataType = $('#dataType').val();
    	    const isActive = $('#dataTypeIsActive').val();
    	    const isActiveText = isActive == 1 ? 'Y' : 'N';
    	    
    	    if (!dataType) {
    	        Swal.fire({
    	            icon: 'warning',
    	            title: '데이터 타입의 이름을 입력해 주세요.',
    	            text: '데이터 타입 이름을 입력해야 추가할 수 있습니다.'
    	        });
    	        return;
    	    }

    	    let isDuplicate = false;
    	    $('#dataTypeList .dataType').each(function() {
    	        if ($(this).text() === dataType) {
    	            isDuplicate = true;
    	            return false; 
    	        }
    	    });

    	    if (isDuplicate) {
    	        Swal.fire({
    	            icon: 'warning',
    	            title: '같은 이름의 <br/>데이터 타입이 있습니다.',
    	            text: '중복된 데이터 타입을 추가할 수 없습니다.'
    	        });
    	    } else {
    	        const count = $('#dataTypeList tr').length + 1;
    	        const newRow = `
    	            <tr data-isupdate="1">
    	                <td>${count}</td>
    	                <td class="dataType">${dataType}</td>
    	                <td class="datatypeIsactive">${isActiveText}</td>
    	            </tr>`;

    	        $('#dataTypeList').append(newRow);

    	        $('#dataType').val('');
    	        $('#dataTypeIsActive').val('1');
    	    }
    });

    $('#dataTypeList').on('click', 'tr', function() {
        selectedRow = $(this);  

        const dataType = selectedRow.find('.dataType').text();
        const isActiveText = selectedRow.find('.datatypeIsactive').text();

        $('#dataType').val(dataType);
        $('#dataTypeIsActive').val(isActiveText === 'Y' ? '1' : '0');

        $('.btn-typeEdit').prop('disabled', false);
    });

    $('.btn-typeEdit').on('click', function() {
        if (selectedRow) {
            const updatedDataType = $('#dataType').val();
            const updatedIsActive = $('#dataTypeIsActive').val();
            const updatedIsActiveText = updatedIsActive == 1 ? 'Y' : 'N';

            selectedRow.find('.dataType').text(updatedDataType);
            selectedRow.find('.datatypeIsactive').text(updatedIsActiveText);
            
            selectedRow.attr('data-isupdate', '2');

            selectedRow = null;
            $('#dataType').val('');
            $('#dataTypeIsActive').val('1');
            $('.btn-typeEdit').prop('disabled', true);
        }
    });

    $('#btn-save').on('click', function() {
        const dataList = [];

        $('#dataTypeList tr').each(function() {
            const dataType = $(this).find('.dataType').text();
            const isActive = $(this).find('.datatypeIsactive').text() === 'Y' ? 1 : 0; // 바로 isActive 설정
            const isUpdate = $(this).attr('data-isupdate'); 

            dataList.push({
                dataType: dataType,
                datatypeIsactive: isActive,
                isUpdate: isUpdate
            });
        });

        $.ajax({
            url: '/Metamong/dataType/saveData',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(dataList),
            success: function(response) {
                Swal.fire({
                    icon: 'success',  
                    title: '데이터타입이 저장되었습니다.'  
                }).then(() => {
                    $('#dataTypeModal').modal('hide');
                });
            }
        });
    });

    //테이블
    
    $("#tableList").on("click", "tr", function() {
        $("#tableList tr").removeClass("table-active");
        $(this).addClass("table-active");
    });
    
    $(".btn-search").on("click", function() {
        searchTable();
    });


    $("#tableNameSearch").on("keydown", function(event) {
        if (event.keyCode === 13) { 
        	 event.preventDefault()
            searchTable();
        }
    });
    
    $("#schemaSelect").on("change", function() {
        searchTable();
    });
    
    
    $(".btn-edit").on("click", function() {
        var selectedRow = $("#tableList .table-active");
        var tableNo = selectedRow.data("table-no");
        var updateNo = 0;
        
        if (tableNo) {
            $.ajax({
                url: "/Metamong/table/tableUpdateForm",
                type: "Get",
                data: { tableNo: tableNo,updateNo:updateNo},
                success: function(response) {
                	  location.href = "/Metamong/table/tableUpdateForm?tableNo=" + tableNo + "&updateNo=" + updateNo;
                }
           });
            
        } else {
            Swal.fire({
                icon: 'warning',
                title: '수정할 테이블을 선택해 주세요.'
            });
        }
    });
});

function showColumnList(tableId) {
    $.ajax({
        url: "/Metamong/column/columnList",      
        type: "GET",
        data: { tableId: tableId },   
        success: function(data) {
        	var html=" ";
        	var count = 0;
            data.forEach(column => {
                html += `<tr>
                			<td>${++count}</td>
                            <td>${column.colNm}</td>
                			<td>${column.colId}</td>
                            <td>${column.dataType}</td>
                            <td>${column.colLength}</td>
                            <td>${column.colIsnullable==0 ? 'NOT NULL' : 'NULL'}</td>
                            <td>${column.colIspk==1 ? 'Y' : 'N'}</td>
                        </tr>`;
            });

            $('#columnList').html(html);
        }
    });
}

function searchTable() {
    var content = $("#tableNameSearch").val().trim();
    var schema= $("#schemaSelect").val();

    $.ajax({
        url: "/Metamong/table/tableSearch",
        type: "GET",
        data: { content: content ,
        			schema:schema},
        success: function(data) {
        	var html = "";
        	var cHtml=`<tr><th colspan="7">테이블을 선택해 주세요.</th><tr>`; 
        	if(Object.keys(data).length>0){
        		var count = 0;
        		data.forEach(table => {
        			html += `<tr data-table-no="${table.tableNo}" onclick="showColumnList(${table.tableNo})">
        				<td>${++count}</td>
        				<td>${table.schemaNm}</td>
        				<td>${table.tableNm}</td>
        				<td>${table.tableId}</td>
        				<td>${table.tableContent}</td>
        				</tr>`;
        		});
        	}else{
        		html+= `<tr>
    				<th colspan="5">해당 조건에 맞는 테이블이 없습니다.</th>
    		
    				</tr>`;
        	}
            $('#tableList').html(html);
            $('#columnList').html(cHtml);
        }
    });
}


