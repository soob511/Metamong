<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>눈누난나</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" />
    	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
	</head>
	<body>
		<div>> 코드/항목 내역 관리</div>
		<form>
			<div class="d-flex">
			<div>코드명(논리/물리)</div>
			<input type="text">
			<button type="submit"></button>
			<div>사용여부</div>
			<select>
				<option>전체</option>
				<option>Y</option>
				<option>N</option>
			</select>
			</div>			
		</form>
		<hr>
		<table>
			<tr>
				<th>No.</th>
				<th>코드(논리)</th>
				<th>코드(물리)</th>
				<th>사용여부</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>2</td>
				<td>재산</td>
				<td>PPRT</td>
				<td>Y</td>
				<td>좋아요</td>
			</tr>
		</table>
	</body>
</html>