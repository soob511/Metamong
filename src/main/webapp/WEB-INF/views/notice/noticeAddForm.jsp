<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
   
    <link href="${pageContext.request.contextPath}/resources/css/notice/notice.css"  rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    
</head>
<body>
<div class="container">
    <div class="row">
        <jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" />
        <div class="col-10">
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div>
                <div class="content">
                    <h4 class="fw-bold notice-title">> 공지사항 등록</h4>
                    <form id="insertNotice" action="insertNotice" method="post" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <td class="table-primary form-label">제목<span class="form-required">(*)</span></td>
                                <td><input type="text" class="form-control" id="noticeTitle" name ="noticeTitle"  value="" required></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">작성자</td>
                                <td id="author"><span>관리자</span></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">등록일</td>
                                <td><input type="date" class="form-control"  id="noticeRegdate" name="noticeRegdate" value="sysdate" required></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">내용</td>
                                <td>                                   
                                    <textarea class="form-control" id="noticeContent" name="noticeContent" rows="12" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">첨부파일</td>
                                <td><input class="form-control" type="file" name="noticeFile" id="noticeFile"></td>
                            </tr>
                        </table>
                        <div class="d-flex justify-content-end mt-3">
                        <a href="noticeList">
                            <button type="button" class="btn-cancel me-2">취소</button>                        
                        </a>
                            <button type="submit" class="btn-add me-2" >등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notice/notice.js"></script>
</body>
</html>
