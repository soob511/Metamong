<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 전후비교</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableCompare.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container table-management">

				<a href="tableUpdateForm?tableNo=${table.tableNo}&updateNo=1">
						<button class="btn-back">뒤로가기</button>
					</a>
					<div class="row">
						<div class="col-6 before-table">
							<div class="before-management">
								<p class="before-management-title">>
									${table.tableId}(${table.tableNm}) 테이블 수정전</p>
							</div>
							<div class="table-container">
								<table class="table tablecompare">
									<thead class="table-light">
										<tr>
											<th scope="col">No.</th>
											<th scope="col">항목코드</th>
											<th scope="col">컬럼(물리)</th>
											<th scope="col">타입</th>
											<th scope="col">길이</th>
											<th scope="col">NULL</th>
											<th scope="col">PK</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${beforeColumn}" var="bColumn"
											varStatus="status">
											<tr>
												<td>${status.index+1}</td>
												<td>${bColumn.colNm}</td>
												<td>${bColumn.colId}</td>
												<td>${bColumn.dataType}</td>
												<td>${bColumn.colLength}</td>
												<td>${bColumn.colIsnullable == 1 ? 'NULL' : 'NOTNULL'}</td>
												<td>${bColumn.colIspk == 1 ? 'Y' : 'N'}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-6 after-table">
							<div class="after-management">
								<p class="after-management-title">>
									${table.tableId}(${table.tableNm}) 테이블 수정후</p>
							</div>
							<div class="table-container">
								<table class="table tablecompare">
									<thead class="table-light">
										<tr>
											<th scope="col">No.</th>
											<th scope="col">항목코드</th>
											<th scope="col">컬럼(물리)</th>
											<th scope="col">타입</th>
											<th scope="col">길이</th>
											<th scope="col">NULL</th>
											<th scope="col">PK</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${afterColumn}" var="aColumn"
											varStatus="status">
											 <tr class="${aColumn.isChange >= 1 ? 'changed' : ''}">
												<td>${status.index+1}</td>
												<td>${aColumn.colNm}</td>
												<td>${aColumn.colId}</td>
												<td>${aColumn.dataType}</td>
												<td>${aColumn.colLength}</td>
												<td>${aColumn.colIsnullable == 1 ? 'NULL' : 'NOTNULL'}</td>
												<td>${aColumn.colIspk == 1 ? 'Y' : 'N'}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/alarm.jsp" />
</body>
</html>