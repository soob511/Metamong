<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
<!-- STOMP CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div id="toast-container" class="position-fixed bottom-0 end-0 p-3"
    style="z-index: 1050; width: 350px; height: 200px; max-width: 100%; font-size: 1.2em; pointer-events: none;"></div>

<script src="${pageContext.request.contextPath}/resources/js/common/alarm.js"></script>
</body>
</html>