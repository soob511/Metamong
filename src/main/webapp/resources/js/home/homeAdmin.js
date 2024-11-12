$(document).ready(function() {
	$('.menu-item').removeClass('active');
	$('.menu-item:first').addClass('active');
	getSignupStatus();
	getApprovalStatus();

});

function getSignupStatus() {
	let ctxLline = document.getElementById('line-chart').getContext('2d');
	let adminLineChart = new Chart(ctxLline, {
		type : 'line',
		data : {
			labels : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
					'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ],
			datasets : [ {
				data : [ 10, 12, 23, 14, 5, 26, 2, 8, 2, 10, 5, 3 ],
				label : "USER",
				borderColor : "#FF6384",
				fill : false
			}, {
				data : [ 5, 12, 7, 1, 7, 6, 3, 5, 8, 1, 6, 12 ],
				label : "DBA",
				borderColor : "#36A2EB",
				fill : false
			} ]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true,  // Y축이 0에서 시작하도록 설정
					ticks: {
						stepSize: 1  // Y축 단위를 5로 설정
					}
				}
			}
		}
	});
	$.ajax({
		url : "/Metamong/getSignupStatus",
		type : "GET",
		data : { 
			roleUser : 'ROLE_USER',
			roleDba : 'ROLE_DBA'
			},
		success : function(data) {
	        let userMonthlyData = Array(12).fill(0);
	        data.userList.forEach(member => {
	        	let month = parseInt(member.month.split('-')[1], 10) - 1;
	            let count = member.count;

	            userMonthlyData[month] += count;
	        });

	        let dbaMonthlyData = Array(12).fill(0);
	        data.dbaList.forEach(member => {
	        	let month = parseInt(member.month.split('-')[1], 10) - 1;
	            let count = member.count;

	            dbaMonthlyData[month] += count;
	        });

	        adminLineChart.data.datasets[0].data = userMonthlyData;
	        adminLineChart.data.datasets[1].data = dbaMonthlyData;

	        adminLineChart.update();
            
		},
		error : function(xhr, status, error) {
			console.log('오류: ' + xhr.responseText);
		}
	});
}

function getApprovalStatus() {
	let ctx = document.getElementById('chart').getContext('2d');
	let adminPieChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : [ '접수', '승인', '반려' ],
			datasets : [ {
				data : [ 0, 0, 0 ],
				backgroundColor : [ 
					'rgba(255, 175, 163)',
					'rgba(128, 202, 255)', 
					'rgba(255, 217, 102)' ],
				hoverOffset : 4,
				spacing : 0
			} ]
		},
		options : {
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
		url : "/Metamong/getApprovalMemberStatus",
		type : "GET",
		success : function(data) {
			
			const chartData = data.map(item => item.count);
            const summarySpans = $(".summary-box .fw-bold");

            summarySpans.eq(0).text(data[0].count);  
            summarySpans.eq(1).text(data[1].count);  
            summarySpans.eq(2).text(data[2].count);  
            
            adminPieChart.data.datasets[0].data = chartData;
            adminPieChart.options.plugins.title.text = `전체 ${chartData.reduce((a, b) => a + b)}건`;
            adminPieChart.update();
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
