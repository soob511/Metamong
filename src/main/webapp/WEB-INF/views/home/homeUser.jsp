<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<link	href="${pageContext.request.contextPath}/resources/css/home/home.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.5/dist/chart.umd.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
			<div class="container main-container">
				<div class="row">
					<div class="col-6">
						<p class="board-title">신청 현황</p>
						<div class="container dash-board">
							<div class="row">
								<div class="col-4 chart">
									<canvas id="chart" width="400" height="400"></canvas>
								</div>
								<div class="col">							
									<p class="project-title"># MetaMong 프로젝트</p>
									<h4 class="project-user">반가워요! <span class="fw-bold">김유저</span><span class="fs-5">님</span></h4>
									<div class="summary-box d-flex justify-content-center align-items-center">
										<div>
											<p>접수</p>
											<h3><span class="fw-bold">15</span><span class="fs-4">건</span></h3>
										</div>
										<div>
											<p>승인</p>
											<h3><span class="fw-bold">10</span><span class="fs-4">건</span></h3>
										</div>
										<div>
											<p>반려</p>
											<h3><span class="fw-bold">2</span><span class="fs-4">건</span></h3>
										</div>
										<div>
											<p>반영</p>
											<h3><span class="fw-bold">3</span><span class="fs-4">건</span></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col notice-box">
						<div class="d-flex justify-content-between">
							<p class="board-title">공지사항</p>
							<a href="${pageContext.request.contextPath}/notice/noticeList"><button class="btn-notice">+ 더보기</button></a>
						</div>
						<table class="table table-hover">
                    <thead class="table">
                        <tr class="table-primary">
                            <th scope="col">No.</th>
                            <th scope="col">제목</th>
                            <th scope="col">등록일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr>
                            <th scope="row">10</th>
                            <td>회원정보 변경신청</td>
                            <td>2024-10-21</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <th scope="row">9</th>
                            <td>인덱스 신청에 관하여</td>
                            <td>2024-10-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <th scope="row">8</th>
                            <td>메타정보관리시스템에 대한 공지입니다.</td>
                            <td>2024-10-18</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <th scope="row">7</th>
                            <td>테이블 신청에 관하여 안내합니다.</td>
                            <td>2024-09-08</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <th scope="row">6</th>
                            <td>주요 반려 사유</td>
                            <td>2024-09-01</td>
                            <td>70</td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td>이렇게 신청하지 마십시오.</td>
                            <td>2024-08-30</td>
                            <td>82</td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>[재공지][중요]해킹위험 사례 안내</td>
                            <td>2024-08-27</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>[중요]해킹위험 사례 안내</td>
                            <td>2024-08-26</td>
                            <td>12</td>
                        </tr> -->
                        <c:forEach items="${list}" var="notice">           
	                        <tr>
	                            <th scope="row">${notice.noticeId}</th>
	                            <td>${notice.noticeTitle}</td>
	                            <td><fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd"/></td>
	                            <td>${notice.noticeHitcount}</td>
	                        </tr>
                      </c:forEach>    
                    </tbody>
                </table>
					</div>
				</div>
				<div class="row">
					<div class="col-5">
						<p class="board-title">테이블 목록</p>
						<div class="table-box">
						<table class="table table-hover">
                    <thead class="table">
                        <tr class="table-primary">
                            <th scope="col">No.</th>
                            <th scope="col">테이블명(물리)</th>
                            <th scope="col">테이블명(논리)</th>
                            <th scope="col">스키마</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>EMPLOYEE</td>
                            <td>사원정보</td>
                            <td>EMP</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>JOBS</td>
                            <td>직업정보</td>
                            <td>JOB</td>
                        </tr>
                    </tbody>
                </table></div>
					</div>
					<div class="col">
						<p class="board-title">속성(Column) 목록</p>
						<div class="col-box">
						<table class="table table-hover">
                    <thead class="table">
                        <tr class="table-primary">
                            <th scope="col">No.</th>
                            <th scope="col">컬럼명</th>
                            <th scope="col">데이터타입</th>
                            <th scope="col">길이</th>
                            <th scope="col">NULL</th>
                            <th scope="col">PK</th>
                            <th scope="col">내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">10</th>
                            <td>PRPT_NO</td>
                            <td>NUMBER</td>
                            <td>7</td>
                            <td>N</td>
                            <td>Y</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/home/homeUser.js"></script>
</body>
</html>