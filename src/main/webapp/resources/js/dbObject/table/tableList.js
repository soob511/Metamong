$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:first').addClass('active');
    
    $("#tableList").on("click", ".tableListTr", function() {
	    $(".tableListTr").removeClass("table-active");
	    $(this).addClass("table-active");
	});
    
    $(".bi-search").on("click", function() {
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
        	var cHtml=`<th colspan="7">테이블을 선택해 주세요.</th>`; 
        	if(Object.keys(data).length>0){
        		var count = 0;
        		data.forEach(table => {
        			html += `<tr  onclick="showColumnList(${table.tableNo})">
        				<td>${++count}</td>
        				<td>${table.tableNm}</td>
        				<td>${table.tableId}</td>
        				<td>${table.schemaNm}</td>
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


