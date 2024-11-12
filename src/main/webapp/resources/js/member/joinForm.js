$(document).ready(function() {
	console.log("실행");
	$.ajax({
        url: "/Metamong/team/getTeamList",
        type: "GET",
        dataType: "json",
        success: function(data) {
            var selectBox = $('#teamId');
            $.each(data, function(index, team) {
                selectBox.append($('<option>', {
                    value: team.teamId,
                    text: team.teamName
                }));
            });
        }
    });
	
    const checkId = /^[a-zA-Z0-9]{4,12}$/;
    const checkPassword = /^[a-zA-Z0-9]{8,16}$/;
    const checkTelNum = /^\d{2,3}-\d{3,4}-\d{3,4}$/;

    let isIdAvailable = false;

    function validCheck() {
        let id = $("#MId").val().trim();
        let password = $("#MPassword").val().trim();
        let cPassword = $("#MPasswordConfirm").val().trim();
        let name = $("#MName").val().trim();
        let empId = $("#MEmpId").val().trim();
        let tel = $("#MTel").val().trim();

        const idValid = checkId.test(id) && isIdAvailable;  
        const passwordValid = checkPassword.test(password);
        const passwordsMatch = password === cPassword;
        const telValid = checkTelNum.test(tel);

        $("#btn-signup").prop("disabled", !(idValid && passwordValid && passwordsMatch && name && empId && telValid));
    }

    // 아이디 중복 확인
    $(".btn-confirm").on("click", function() {
        const msg = $(".username-message");
        var MId = $("#MId").val().trim();

        var data = { MId };

        $.ajax({
            url: "/Metamong/member/idCheck",
            type: "POST",
            data: data,
            success: function(response) {
                if (response > 0) {
                    msg.text("이미 사용중인 아이디입니다.");
                    msg.removeClass('success');
                    msg.addClass('warn');
                    isIdAvailable = false;
                } else {
                    msg.text("사용가능한 아이디 입니다.");
                    msg.removeClass('warn');
                    msg.addClass('success');
                    isIdAvailable = true;
                }
                validCheck();
            }
        });
    });

    // 비밀번호
    $("#MPassword, #MPasswordConfirm").on("input", function() {
        const password = $("#MPassword").val().trim();
        const confirmPassword = $("#MPasswordConfirm").val().trim();
        const passwordMsg = $(".password-message");
        const confirmMsg = $(".password-confirm-message");

        if (password && !checkPassword.test(password)) {
            passwordMsg.text("비밀번호는 영문 또는 숫자 8~16자로 작성해야 합니다.");
            passwordMsg.addClass('warn');
        } else {
            passwordMsg.removeClass('warn');
        }

        if (!confirmPassword) {
            confirmMsg.text("");
        } else if (confirmPassword !== password) {
            confirmMsg.text("비밀번호가 일치하지 않습니다.");
            confirmMsg.addClass('warn');
        } else {
            confirmMsg.removeClass('warn');
        }

        validCheck();
    });

    // 연락처
    $("#MTel").on("input", function() {
        const telNum = $("#MTel").val().trim();
        const msg = $(".tel-message");

        if (!telNum) {
            msg.text("");
        } else if (!checkTelNum.test(telNum)) {
            msg.text("연락처는 예시와 같이 숫자와 '-'로 작성해야 합니다.");
            msg.addClass('warn');
        } else {
            msg.removeClass('warn');
        }
        validCheck();
    });

    // 이름, 사번
    $("#MName, #MEmpId").on("input", function() {
        validCheck();
    });

    $("#MId, #MPassword, #MPasswordConfirm, #MName, #MEmpId, #MTel").on("input", function() {
        validCheck();
    });

    $(".btn-join").on("click", function() {
        var MId = $("#MId").val().trim();
        var MPassword = $("#MPassword").val().trim();
        var MName = $("#MName").val().trim();
        var TeamId = parseInt($("#teamId").val().trim());
        var MEmpId = $("#MEmpId").val().trim();
        var MTel = $("#MTel").val().trim();
        var MRole = $("input[name='MRole']:checked").val();

        MRole = MRole === "User" ? "ROLE_USER" : "ROLE_DBA";

        var joinData = {
            MId: MId,
            MPassword: MPassword,
            MName: MName,
            teamId: TeamId,
            MEmpId: MEmpId,
            MTel: MTel,
            MRole: MRole,
        };

        $.ajax({
            url: "/Metamong/member/join",
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(joinData),
            success: function(response) {
                if (response > 0) {
                    Swal.fire({
                        icon: 'success',
                        title: '회원가입 신청이 완료되었습니다.',
                        text: '계정 승인 후, 로그인 가능합니다.',
                    }).then(result => {
                        location.href = "/Metamong/member/loginForm";
                    });
                }
            }
        });
    });
});