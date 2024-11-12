$(document).ready(function() {
  $('#openModal').on('click', function() {
	  openModal();
  })
  $('#closeModal').on('click', function() {
	  closeModal();
  })
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
        let mName = $('#mName').val(); 
        let mTel = $('#mTel').val();
        console.log(mId);
        $.ajax({
    		type : 'POST',
    		url : '/Metamong/member/checkValidUser',
    		data : {
    			mName : mName,
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