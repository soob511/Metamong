$(document).ready(function() {
    $('.nav-link').removeClass('active');
    $('.nav-link:eq(0)').addClass('active');
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(3)').addClass('active');
    
    $(".bi-search").on("click",function(){
    	tableSearch();
    })
    
     $("#tableNameSearch").on("keydown", function(event) {
        if (event.keyCode === 13) { 
            event.preventDefault();
        	tableSearch();
        }
    });
    
    $("#statusSelect").on("change", function() {
    	tableSearch();
    });
    
    $("#schemaSelect").on("change", function() {
    	tableSearch();
    });
    
    function tableSearch(){

    	var keyword = $("#tableNameSearch").val().toUpperCase();
    	var schema= $("#schemaSelect option:selected").data("name");
    	var status= $("#statusSelect option:selected").data("name");
    	
    	var searchData = {
    		keyword:keyword,
			schema:schema,
			status:status
    	};
    	console.log(searchData);
    	$.ajax({
    		url:"/Metamong/table/applyTableSearch",
    		type:"GET",
    		data:searchData,
    		success:function(data){
    			var html = "";
    			if (Object.keys(data).length > 0) {
    			    var count = 0;
    			    data.forEach(tableList => {
    			        let date = new Date(tableList.applyDate);
    			        let formattedDate = date.toISOString().split('T')[0];

    			        let statusText;
    			        let statusClass;
    			        switch (tableList.approvalStatus) {
    			            case 0:
    			                statusText = "승인대기";
    			                statusClass = "status-await";
    			                break;
    			            case 1:
    			                statusText = "승인";
    			                statusClass = "status-approve";
    			                break;
    			            case 2:
    			                statusText = "반려";
    			                statusClass = "status-rejected";
    			                break;
    			            case 3:
    			                statusText = "반영";
    			                statusClass = "status-applied";
    			                break;
    			            default:
    			                statusText = "";
    			                statusClass = "";
    			        }

    			        html += `<tr>
    			                    <td>${++count}</td>
    			                    <td>${formattedDate}</td>
    			                    <td>${tableList.MName}</td>
    			                    <td>${tableList.schemaName}</td>
    			                    <td>${tableList.tableId}</td>
    			                    <td>${tableList.applyObj}</td>
    			                    <td><a href="tableApplyDetail"><button class="btn-history-details">상세보기</button></a></td>
    			                    <td class="code-approve"><span id="${statusClass}">${statusText}</span></td>
    			                 </tr>`;
    			    });
    			} else {
    			    html += `<tr>
    			                <th colspan="8">해당 조건에 맞는 신청내역이 없습니다.</th>
    			             </tr>`;
    			}
    			$('#applyTableList').html(html);
    		}
    	})	
    }

    
    });

function tableListDetail(applyNo,indexNo) {
	console.log(indexNo);
	location.href = "/Metamong/table/tableListDetail?applyNo=" + applyNo + "&indexNo=" + indexNo;

}