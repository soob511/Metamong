$(".btn-join").on("click", function () {
  var MId = $("#MId").val();
  var MPassword = $("#MPassword").val();
  var MName = $("#MName").val();
  var teamId = parseInt($("#teamId").val());
  var MEmpId = $("#MEmpId").val();
  var MTel = parseInt($("#MTel").val());
  var MRole = $("input[name='MRole']:checked").val();

  var joinData = {
    MId,
    MPassword,
    MName,
    teamId,
    MEmpId,
    MTel,
    MRole,
  };

  console.log(joinData);

  $.ajax({
    url: "/Metamong/member/join",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(joinData),
    success: function (response) {
      if (response > 0) {
        console.log("성공");
      } else {
        console.log("실패");
      }
    },
  });
});


$(document).ready(function () {
/*$("#btn-signup").click(function () {
	    Swal.fire({
	      icon: 'success',
	      title: '회원가입 신청이 완료되었습니다.',
	      text: '계정 승인 후, 로그인 가능합니다.',
	    });
	  });*/

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
      msg.css("opacity", "1");
      msg.css("color", "red");
    } else {
      msg.css("opacity", "0");
    }
  });

  $("#MPassword").on("input", function () {
    let password = $("#MPassword").val().trim();
    const msg = $(".password-message");
    if (!password) {
      msg.css("opacity", "0");
    } else if (password.length < 8 || password.length > 16) {
      msg.text("비밀번호는 8~16자로 작성해야 합니다.");
      msg.css("color", "red");
      msg.css("opacity", "1");
    } else if (checkKor.test(password) || !checkPassword.test(password)) {
      msg.text("비밀번호는 영어와 숫자를 포함해야 합니다.");
      msg.css("color", "red");
      msg.css("opacity", "1");
    } else {
      msg.text("사용가능한 비밀번호 입니다.");
      msg.css("color", "blue");
      msg.css("opacity", "1");
    }
  });

  $("#MPasswordConfirm").on("input", function () {
    let confirmPassword = $("#MPasswordConfirm").val().trim();
    let password = $("#MPassword").val().trim();
    const msg = $(".password-confirm-message");
    if (confirmPassword == password) {
      msg.text("비밀번호가 일치합니다.");
      msg.css("color", "blue");
      msg.css("opacity", "1");
    } else {
      msg.text("비밀번호가 일치하지 않습니다.");
      msg.css("color", "red");
      msg.css("opacity", "1");
    }
  });

  $("#MId,#MPassword,#MPasswordConfirm,#MName,#MEmpId,#MPhone").on(
    "input",
    function () {
      let id = $("#MId").val().trim();
      let password = $("#MPassword").val().trim();
      let cPassword = $("#MPasswordConfirm").val().trim();
      let name = $("#MName").val().trim();
      let empId = $("#MEmpId").val().trim();
      let phone = $("#MPhone").val().trim();

      if (
        id !== "" &&
        password !== "" &&
        cPassword !== "" &&
        name !== "" &&
        empId !== "" &&
        phone !== ""
      ) {
        $("#btn-signup").prop("disabled", false);
      } else {
        $("#btn-signup").prop("disabled", true);
      }
    }
  );
});
