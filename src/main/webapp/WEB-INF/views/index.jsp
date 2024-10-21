<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>

</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
			<div>view</div>
		</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>