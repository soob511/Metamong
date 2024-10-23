<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원목록</title>
<link
	href="${pageContext.request.contextPath}/resources/css/notice/noticeList.css"
	rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<h4 class="fw-bold">> 계정관리</h4>
					<div class="d-flex justify-content-end align-items-center">
						<div>
							<select id="schemaSelect" class="form-select"
								aria-label="Default select example">
								<option selected>사용자명</option>
								<option value="1">이름</option>
								<option value="2">권한</option>
								<option value="3">소속</option>
								<option value="3">사번</option>
							</select>
						</div>
						<div class="search-box">
							<form>
								<input class="form-control me-2" type="search"
									id="tableNameSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
							</form>
						</div>
					</div>

					<table class="table table-hover">
						<thead class="table">
							<tr class="table-primary">
								<th scope="col">No.</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">권한</th>
								<th scope="col">소속</th>
								<th scope="col">사번</th>
								<th scope="col">연락처</th>
								<th scope="col">가입일</th>
								<th scope="col">사용여부</th>
								<th scope="col">정보수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" id="edit" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" id="edit" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>
									<div>
									<select id="schemaSelect" class="form-select"
										aria-label="Default select example">
										<option selected>USER</option>
										<option value="1">DBA</option>
										
									</select>
									</div>
								</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>개발1팀</option>
											<option value="1">개발2팀</option>
											<option value="2">개발3팀</option>
											
										</select>
										</div>
									</td>
								<td><input type="text" class="form-control" id="edit" value="20230001"  required></td>
								<td><input type="text" class="form-control" id="edit" value="010-9384-3939" required></td>
								<td>2024-10-21</td>
								<td>
									<div>
										<select id="schemaSelect" class="form-select"
											aria-label="Default select example">
											<option selected>N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</td>
								<td><button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">수정</button></td>
							</tr>
							

						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
	</div>
</div>
</body>
</html>