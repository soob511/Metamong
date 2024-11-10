$(document).ready(function() {
	// WebSocket 연결 및 메시지 수신
	const socket = new SockJS('/Metamong/ws');
	const stompClient = Stomp.over(socket);

	stompClient.connect({}, function (frame) {
	    console.log('Connected: ' + frame);

	    // 메시지 수신 시 Toast 알림 표시
	    stompClient.subscribe('/user/topic/recieveMessage', function (message) {
	        const notificationContent = JSON.parse(message.body).content;
	        showToast(notificationContent);
	    });
	});
});
// Toast 알림 표시 함수
function showToast(content) {
    // 현재 시간을 표시하는 포맷
    const currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

    // Toast HTML 구조 생성
    const toastHTML = `
        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
  <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <img src="..." class="rounded me-2" alt="...">
      <strong class="me-auto">Metamong</strong>
      <small>11 mins ago</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
     ${content}
    </div>
  </div>
</div>
    `;

    // Toast를 컨테이너에 추가
    const toastContainer = document.getElementById('toast-container');
    const toastElement = document.createElement('div');
    toastElement.innerHTML = toastHTML;
    toastContainer.appendChild(toastElement);

    // Bootstrap Toast 초기화 및 표시
    const toast = new bootstrap.Toast(toastElement.querySelector('.toast'));
    toast.show();

    // 5초 후 자동으로 알림 제거
    setTimeout(() => {
        toastElement.remove();
    }, 5000);
}
