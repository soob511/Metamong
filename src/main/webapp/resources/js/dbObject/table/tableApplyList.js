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
        var schema= $("#schemaSelect").val();
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
    			$('#applyTableList').html(data);
    		}
    	})	
    }

    
    });

function tableListDetail(applyNo,indexNo) {
	console.log(indexNo);
	location.href = "/Metamong/table/tableListDetail?applyNo=" + applyNo + "&indexNo=" + indexNo;

}