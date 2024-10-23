$(".btn-join").on("click", function() {
	var mId = $("#mId").val().trim();
	var mPassword = $("#mPassword").val().trim();
	var mName = $("#mName").val().trim();
	var mTeam
	var mTeam = $("#mTeam").val();
	var mEmpId = $("#mEmpId").val();
	var mPhone = $("#mPhone").val();
	var accountRole = $("input[name='accountRole']:checked").val();
	 
	
	var joinData = {
			mId,mPassword,mName,mEmpId,mPhone,accountRole
	};
	
	$.ajax({
		url : "/Metamong/member/join",
		type: "POST",
		contentType : "application/json",
		success:function(response){
			
			if(reponse){
				console.log("성공");				
			}
		}
	
	
	})
	
	
	
	
});