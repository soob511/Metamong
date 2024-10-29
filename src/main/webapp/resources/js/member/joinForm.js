$(document).ready(function() {
    $.ajax({
        url: "/Metamong/team/getTeamList",
        type: "GET",
        dataType: "json",
        success: function(data) {
        		console.log(data);
        		var selectBox = $('#teamId');
        		$.each(data, function(index, team) {
        			selectBox.append($('<option>', {
        				value: team.teamId,
        				text: team.teamName
        			}));
        		});	
        }
    });
});

$(".btn-confirm").on("click",function(){
	const msg = $(".username-message");
	var MId = $("#MId").val();
	
	var data={
			MId
	}
	 $.ajax({
		    url: "/Metamong/member/idCheck",
		    type: "POST",
		    data: data,
		    success: function (response) {
		    	if(response>0){
		     		 msg.text("이미 사용중인 아이디입니다.");
		    	      msg.removeClass('success');
		    	      msg.addClass('warn');
		    	}else{
		    	      msg.text("사용가능한 아이디 입니다.");
		    	      msg.removeClass('warn');
		    	      msg.addClass('success');
		    	}
		    }
		  });
	
});

$(".btn-join").on("click", function () {
  var MId = $("#MId").val();
  var MPassword = $("#MPassword").val();
  var MName = $("#MName").val();
  var TeamId = parseInt($("#teamId").val());
  var MEmpId = $("#MEmpId").val();
  var MTel = $("#MTel").val();
  var MRole = $("input[name='MRole']:checked").val();
  
  MRole = MRole=="User"?"ROLE_USER":"ROLE_DBA";

  var joinData = {
    MId: MId,
    MPassword: MPassword,
    MName: MName,
    teamId: TeamId,
    MEmpId: MEmpId,
    MTel: MTel,
    MRole: MRole,
  };
console.log(joinData);
  $.ajax({
    url: "/Metamong/member/join",
    type: "POST",
    contentType: "application/json; charset=UTF-8",
    data: JSON.stringify(joinData),
    success: function (response) {
      if (response > 0) {
    	  Swal.fire({ 
    		  icon: 'success',
    		  title: '회원가입 신청이 완료되었습니다.',
    		  text: '계정 승인 후, 로그인 가능합니다.',
    		  }).then(result=>{
    			  location.href="/Metamong/member/loginForm";
    		  })
      } 
    }
  });
});


$(document).ready(function () {
  const checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
  const checkPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]/;

  $("#MId").on("input", function () {
    let inputId = $("#MId").val().trim();
    const msg = $(".username-message");

    if (
      (inputId && inputId.length < 4) ||
      inputId.length > 12 ||
      checkKor.test(inputId)
    ) {
      msg.text("아이디는 영문 또는 숫자 4~12자로 작성해야 합니다.");
      msg.addClass('warn');
    } else {
    	msg.removeClass('warn');
    }
  });

  $("#MPassword").on("input", function () {
    let password = $("#MPassword").val().trim();
    const msg = $(".password-message");
    if (!password) {
      msg.css("opacity", "0");
    } else if (password.length < 8 || password.length > 16) {
      msg.text("비밀번호는 8~16자로 작성해야 합니다.");
      msg.addClass('warn');
    } else if (checkKor.test(password) || !checkPassword.test(password)) {
      msg.text("비밀번호는 영어와 숫자를 포함해야 합니다.");
      msg.addClass('warn');
    } else {
      msg.text("사용가능한 비밀번호 입니다.");
      msg.removeClass('warn');
      msg.addClass('success');
    }
  });

  $("#MPasswordConfirm").on("input", function () {
    let confirmPassword = $("#MPasswordConfirm").val().trim();
    let password = $("#MPassword").val().trim();
    const msg = $(".password-confirm-message");
    if (confirmPassword == password) {
      msg.text("비밀번호가 일치합니다.");
      msg.removeClass('warn');
      msg.addClass('success');
    } else {
      msg.text("비밀번호가 일치하지 않습니다.");
      msg.removeClass('success');
      msg.addClass('warn');
    }
  });

  $("#MId,#MPassword,#MPasswordConfirm,#MName,#MEmpId,#MTel").on(
    "input",
    function () {
      let id = $("#MId").val().trim();
      let password = $("#MPassword").val().trim();
      let cPassword = $("#MPasswordConfirm").val().trim();
      let name = $("#MName").val().trim();
      let empId = $("#MEmpId").val().trim();
      let tel = $("#MTel").val().trim();

      if (
        id !== "" &&
        password !== "" &&
        cPassword !== "" &&
        name !== "" &&
        empId !== "" &&
        tel !== ""
      ) {
        $("#btn-signup").prop("disabled", false);
      } else {
        $("#btn-signup").prop("disabled", true);
      }
    }
  );
});
