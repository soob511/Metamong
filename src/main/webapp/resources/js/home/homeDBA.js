$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:first').addClass('active');
    
    getApprovalStatus();
    searchTable().then(function() {
		let tableId = $("#tableList tr").data('value');
	    showColumnList(tableId);
	});
	$("#schemaSelect").on("change", function() {
		searchTable().then(function() {
			let tableId = $("#tableList tr").data('value');
		    showColumnList(tableId);
		});
    });
});

function getApprovalStatus() {
	let ctx = document.getElementById('chart').getContext('2d');
	let myChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: {
	    	labels: ['코드/항목', '테이블', '시퀀스', '인덱스'],
	        datasets: [{
	            data: [0, 0, 0, 0],
	            backgroundColor: [
	                'rgba(255, 175, 163)',
	                'rgba(128, 202, 255)',
	                'rgba(133, 224, 163)',
	                'rgba(255, 217, 102)'
	            ],
	            hoverOffset: 4,
	            spacing: 0
	        }]
	    },
	    options: {
	        plugins: {
	            legend: {
	              position: 'top',
	            },
	            title: {
	              display: true,
	              text: '전체 0건'
	            }
	          }
	    }
	});
	$.ajax({
		url : "/Metamong/getDbObjApprovalStatus",
		type : "GET",
		success : function(data) {
			console.log(data);
			const chartData = [0, 0, 0, 0];

	        const summarySpans = $(".summary-box .fw-bold");
	        
	        data.forEach(item => {
	            if (item.applyObj === 'CODE') {
	                chartData[0] = item.count;
	                summarySpans.eq(0).text(item.count);
	            } else if (item.applyObj === 'TABLE') {
	                chartData[1] = item.count;
	                summarySpans.eq(1).text(item.count);
	            } else if (item.applyObj === 'SEQUENCE') {
	                chartData[2] = item.count;
	                summarySpans.eq(2).text(item.count);
	            } else if (item.applyObj === 'INDEX') {
	                chartData[3] = item.count;
	                summarySpans.eq(3).text(item.count);
	            }
	        });
	        console.log(chartData);
	        myChart.data.datasets[0].data = chartData;
	        myChart.options.plugins.title.text = `전체 ${chartData.reduce((a, b) => a + b)}건`;
	        myChart.update();
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

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
    var content = '';
    var schema= $("#schemaSelect").val();

    return $.ajax({
        url: "/Metamong/table/tableSearch",
        type: "GET",
        data: { content: content,
        		schema:schema
        		},
        success: function(data) {
        	var html = "";
        	var cHtml=`<th colspan="7">테이블을 선택해 주세요.</th>`; 
        	if(Object.keys(data).length>0){
        		var count = 0;
        		data.forEach(table => {
        			html += `
	        			<tr data-value="${table.tableNo}" 
	        			onclick="showColumnList(${table.tableNo})">
        				<td>${++count}</td>
        				<td>${table.tableId}</td>
        				<td>${table.tableNm}</td>
        				<td>${table.schemaNm}</td>
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
