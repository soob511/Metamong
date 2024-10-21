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
        <h4 class="fw-bold">> 공지사항 > 등록</h4>
        
        <form>
            <table class="table">
                <tr>
                    <td class="table-primary form-label" >제목<span class="form-required">(*)</span></td>
                    <td><input type="text" class="form-control" id="title" value="" required></td>
                </tr>
                <tr>
                    <td class="table-primary form-label" >작성자</td>
                    <td><input type="text" class="form-control" id="author" value="관리자" ></td>
                </tr>
                <tr>
                    <td class="table-primary form-label" >등록일</td>
                    <td><input type="date" class="form-control" id="date" value="sysdate" required></td>
                </tr>
                <tr>
                    <td class="table-primary form-label" >내용</td>
                    <td><textarea class="form-control" id="exampleFormControlTextarea1" rows="12" required></textarea></td>
                </tr>
                <tr>
                    <td class="table-primary form-label" >첨부파일</td>
                    <td><input class="form-control" type="file" id="file"></td>
                </tr>
            </table>

            <div class="d-flex justify-content-end mt-3">
                <button type="button" class="btn btn-write me-2" style="border-color:#003567; color:#003567;" >취소</button>
                <button type="submit" class="btn btn-write me-2" style="background-color:#003567; color:white;">등록</button>
            </div>
        </form>
		    	</div>
		    </div>
		</div>
	</div>
</div>
    
    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@4.0.0-beta.4/dist/js/coreui.bundle.min.js"></script>

</body>
</html>