$(document).ready(function() {
/*  $('#openModal').on('click', function() {
	  openModal();
  })
  $('#closeModal').on('click', function() {
	  closeModal();
  })*/
  console.log(('#loginAlertMessage'))
  if($('#loginAlertMessage').length > 0) {
	  Swal.fire({
			icon: 'error',
			title: '아이디 또는 비밀번호를<br>확인해주세요'
		})
  }
});

const checkPassword = /^[a-zA-Z0-9]{8,16}$/;

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


/*function openModal() {
	document.getElementById('formContainer').removeAttribute('inert');
  }

  function closeModal() {
    const modal = document.getElementById('sqlLoadModal');
    modal.setAttribute('aria-hidden', 'true');
    modal.style.display = 'none';
  }

const observer = new MutationObserver(() => {
    const popup = Swal.getPopup();
    if (popup && popup.getAttribute('aria-hidden') === 'true') {
        popup.setAttribute('aria-hidden', 'false'); // aria-hidden을 false로 설정
    }
});

// Observer 시작
observer.observe(document.body, {
    attributes: true,
    childList: true,
    subtree: true
});*/

function checkValidUser () {
    const modal = document.getElementById('sqlLoadModal');
    modal.setAttribute('aria-hidden', 'false');
    modal.style.display = 'block';

    let mId = $('#checkId').val(); 
    let mTel = $('#mTel').val();

    $.ajax({
        type: 'POST',
        url: '/Metamong/member/sendSms',
        data: { 
            MId: mId,
            MTel: mTel
        },
        success: function(data) {
            console.log(data);
            
            Swal.fire({
                icon: 'warning',
                title: '인증번호를 입력해주세요!',
                input: 'text',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소',
                didOpen: () => {
                	document.getElementById('sqlLoadModal').setAttribute('inert', 'true');
                	 const inputField = Swal.getInput();
                     inputField.focus();
                }
            }).then((inputCode) => {
                return new Promise((resolve, reject) => {
                	document.getElementById('sqlLoadModal').removeAttribute('inert');
                	
                    if (String(inputCode.value) === String(data)) {
                        resolve();
                    } else {
                        reject('인증번호가 일치하지 않습니다'); 
                    }
                });
            }).then(() => {
                $('#newPassword').removeAttr('disabled');
                $('#checkPassword').removeAttr('disabled');
                Swal.fire({
                    icon: 'success',
                    title: '인증번호가 일치합니다.',
                });
            }).catch((error) => {
                Swal.fire({
                    icon: 'error',
                    title: '인증번호가 일치하지 않습니다',
                });
            });
        },
        error: function(xhr, status, error) {
            console.log('오류: ' + xhr.responseText);
            Swal.fire({
                icon: 'error',
                title: '아이디 또는 핸드폰 번호를<br>확인해주세요'
            });
        }
    });
};

function resetPassword() {

	  var form = $('#resetPasswordForm')[0];
	  var formData = new FormData(form);

	  $.ajax({
	    url: '/Metamong/member/resetUserPassword',
	    type: 'POST',
	    data: formData,
	    processData: false,
	    contentType: false,
	    success: function(response) {
	        Swal.fire({
	          icon: 'success',
	          title: '비밀번호를 재설정하였습니다!'
	        }).then(() => {
	        	 $('#sqlLoadModal').modal('hide');
			});		
	    },
	    error: function(xhr, status, error) {
	      Swal.fire({
	        icon: 'error',
	        title: '비밀번호 재설정을 실패하였습니다'
	      });
	    }
	  });
	}