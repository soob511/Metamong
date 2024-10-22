<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@4.0.0-beta.4/dist/css/coreui.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/notice.js"></script>
<link	href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">

</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col-10">
			<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
			<div class="container mt-12">
				<div class="content">
        <h5 class="fw-bold">> 공지사항 > 상세</h5>
        <table class="table table-bordered">
        <tr>
        	<td class="table-primary">제목<span class="form-required">(*)</span></td>
        	<td id="table-contents" colspan="5">주요 반려 사유</td>
        </tr>
        <tr>
        	<td class="table-primary" >작성자</td>
        	<td id="table-contents" style="width:20%">관리자</td>
        	<td class="table-primary" style="width:16.66%">작성일자</td>
        	<td id="table-contents" style="width:16.66%">2024-10-21</td>
        	<td class="table-primary" style="width:16.66%">조회수</td>
        	<td id="table-contents" style="width:16.66%">24</td>
        </tr>
        <tr>
        	<td class="table-primary">첨부파일</td>
        	<td id="table-contents" colspan="5">반려사유.pdf</td>
        </tr>
        <tr>
        	<td class="table-primary">내용</td>
        	<td colspan="5"><textarea class="form-control" id="exampleFormControlTextarea1" rows="12" required>최근 반려건 수가 급증하고 있습니다. 이에 따라 주요 반려사유에 대해 공지드립니다.
        	1. 중복되는 테이블명
        	2. 신청 사유 기재 안된 경우
        	3. 많은 양의 코드</textarea></td>
        	
        </tr>
        
        </table>
 
        <table class="table table-bordered">
        	<tr>
        		<td class="table-primary">이전글</td>
        		<td id="table-contents">코드 추가 요청에 관한 공지입니다.</td>
        	</tr>
        	<tr>
        		<td class="table-primary">다음글</td>
        		<td id="table-contents">DB 신청양식 폼</td>
        	</tr>
        </table>
 <div class="d-flex justify-content-end mt-3">
                <button type="button" class="btn btn-write me-2" style="border-color:#003567; color:#003567;" >삭제</button>
                <button type="submit" class="btn btn-write me-2" style="background-color:#003567; color:white;">수정</button>
                <button type="submit" class="btn btn-write me-2" style="background-color:#949494; color:white;">목록</button>
            </div>
				</div>
 			</div>
		</div>
	</div>
</div>
    
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@4.0.0-beta.4/dist/js/coreui.bundle.min.js"></script>

</body>
</html>