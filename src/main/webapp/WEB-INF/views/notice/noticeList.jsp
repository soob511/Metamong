<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@4.0.0-beta.4/dist/css/coreui.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
			<div class="content">
			
            	<h4 class="fw-bold">> 공지사항</h4>
            	
         		<div class="d-flex justify-content-between align-items-center mb-3">
				  <div>
				    총 <span class="form-required">21</span>건의 게시물이 있습니다.
					</div>
					
				  <div class="d-flex sub">
				    <div class="btn-group me-2">
				      <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				        제목
				      </button>
				      <ul class="dropdown-menu">
				        <li><a class="dropdown-item" href="#">제목</a></li>
				        <li><a class="dropdown-item" href="#">내용</a></li>
				      </ul>
				    </div>
				    <div class="search-box">
               <form class="d-flex" action="#">
                   
                   <input class="form-control" type="search" aria-label="Search" />
                   <button class="search-btn" type="submit"><i class="bi bi-search"></i></button>
               </form>
           </div>
	
				    
				  </div>
				  
				
				</div>
         	
            	<table class="table table-hover">
				  <thead class="table">
				    <tr class="table-primary">
				      <th scope="col" >No.</th>
				      <th scope="col" >제목</th>
				      <th scope="col" >등록일</th>
				      <th scope="col" >조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  	 <tr>
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
				    </tr>
				     <tr>
				      <th scope="row">2</th>
				      <td>시퀀스 요청에 관한 공지입니다.</td>
				      <td>2024-08-26</td>
				      <td>25</td>
				    </tr>
				    <tr>
				      <th scope="row">1</th>
				      <td>2024/10/20 시스템 점검 시간</td>
				      <td>2024-08-23</td>
				      <td>45</td>
				    </tr>
 
				  </tbody>
				</table>
				
				<div class="d-flex justify-content-end" style="margin-top: 40px;">
                <button type="submit" class="btn btn-write" style="background-color:#003567; color:white;"><a href="${pageContext.request.contextPath}/notice/addNoticeForm" style="color:white;">작성하기</a></button>
            	</div>
				 
                <nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
            </div>
 	
		</div>
	</div>
</div> 
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@4.0.0-beta.4/dist/js/coreui.bundle.min.js"></script>
</body>
</html>