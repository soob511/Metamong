$(".btn-join").on("click", function() {
	var MId = $("#MId").val();
	var MPassword = $("#MPassword").val();
	var MName = $("#MName").val();
	var teamId = parseInt($("#teamId").val());
	var MEmpId = $("#MEmpId").val();
	var MTel = parseInt($("#MTel").val());
	var MRole = $("input[name='MRole']:checked").val();
	 
	
	var joinData = {
			MId,MPassword,MName,teamId,MEmpId,MTel,MRole
	};
	
	console.log(joinData);
	
	$.ajax({
		url : "/Metamong/member/join",
		type: "POST",
		contentType : "application/json",
		 data: JSON.stringify(joinData),
		success:function(response){
			
			if(response>0){
				console.log("성공");				
			}else{
				console.log("실패");
			}
		}
	
	
	})
	
	
	
	
});