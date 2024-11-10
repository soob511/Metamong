$(document).ready(function() {
    function connectWebSocket() {
        const socket = new SockJS('/Metamong/ws'); // 서버의 WebSocket 엔드포인트와 일치해야 합니다.
        stompClient = Stomp.over(socket);

        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/user/topic/recieveMessage', function (message) {
                const content = JSON.parse(message.body).content;
                console.log("알림 메시지:", content); // 알림 메시지 출력
                showToast(content); // 수신된 알림을 Toast로 표시
            });
        }, function (error) {
            console.log("WebSocket 연결 실패. 재시도 중...");
            setTimeout(connectWebSocket, 5000); // 5초 후 재연결 시도
        });
    }

    // 페이지 로드 시 WebSocket 연결
    connectWebSocket();
});

// Toast 알림 표시 함수
function showToast(content) {
    // 현재 시간을 표시하는 포맷
    const currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

    // Toast HTML 구조 생성
    const toastHTML = `
        <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 11">
            <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Metamong</strong>
                    <small>${currentTime}</small>
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
