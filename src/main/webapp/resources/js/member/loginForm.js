$(document).ready(function() {
  $('#openModal').on('click', function() {
	  openModal();
  })
  $('#closeModal').on('click', function() {
	  closeModal();
  })
});

const checkPassword = /^[a-zA-Z0-9]{8,16}$/;

// 비밀번호
$("#newPassword, #checkPassword").on("input", function() {
    const password = $("#newPassword").val().trim();
    const confirmPassword = $("#checkPassword").val().trim();
    const passwordMsg = $(".password-message");
    const confirmMsg = $(".password-confirm-message");
    
    let isPassword = false;
    let isConfirmPassword = false;
    
    if (password && !checkPassword.test(password)) {
        passwordMsg.text("비밀번호는 영문 또는 숫자 8~16자로 작성해야 합니다.");
        passwordMsg.addClass('warn');
        isPassword = false;
    } else {
        passwordMsg.removeClass('warn');
        isPassword = true;
    }

    if (!confirmPassword) {
        confirmMsg.text("");
    } else if (confirmPassword !== password) {
        confirmMsg.text("비밀번호가 일치하지 않습니다.");
        confirmMsg.addClass('warn');
        isConfirmPassword = false;
    } else {
        confirmMsg.removeClass('warn');
        isConfirmPassword = true;
    }
    
    if( isPassword == true && isConfirmPassword == true) {
    	$('.modal-btn-submit').prop('disabled', false);    	
    }
});


function openModal() {
    const modal = document.getElementById('sqlLoadModal');
    modal.setAttribute('aria-hidden', 'false');
    modal.style.display = 'block'; // 모달을 보여주는 스타일 추가
  }

  function closeModal() {
    const modal = document.getElementById('sqlLoadModal');
    modal.setAttribute('aria-hidden', 'true');
    modal.style.display = 'none'; // 모달을 숨기는 스타일 추가
  }

function checkValidUser () {
        let mId = $('#checkId').val(); 
        let mTel = $('#mTel').val();
        console.log(mId);
        $.ajax({
    		type : 'POST',
    		url : '/Metamong/member/checkValidUser',
    		data : {
    			mId : mId,
    			mTel : mTel
    		},
    		success : function(data) {
    			console.log(data);
    			console.log(data.length);
    			if (data === 1) {
					Swal.fire({
						icon: 'success',
						title: '비밀번호를 재설정해주세요!'
					}).then(() => {
						$('#newPassword').removeAttr('disabled');
						$('#checkPassword').removeAttr('disabled');
					});				
				} else {
					Swal.fire({
						icon: 'error',
						title: '아이디 또는 핸드폰 번호를 확인해주세요'
					})
				}
    		},
    		error : function(xhr, status, error) {
    			console.log('오류: ' + xhr.responseText);
    		}
    	});
};