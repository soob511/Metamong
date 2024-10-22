<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
    <link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col-10">
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div>
                <div class="content">
                    <h4 class="fw-bold notice-title">> 공지사항 등록</h4>
                    <form>
                        <table class="table">
                            <tr>
                                <td class="table-primary form-label">제목<span class="form-required">(*)</span></td>
                                <td><input type="text" class="form-control" id="title" value="" required></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">작성자</td>
                                <td id="author"><span>관리자</span></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">등록일</td>
                                <td><input type="date" class="form-control" id="date" value="sysdate" required></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">내용</td>
                                <td><textarea class="form-control" id="exampleFormControlTextarea1" rows="12" required></textarea></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label">첨부파일</td>
                                <td><input class="form-control" type="file" id="file"></td>
                            </tr>
                        </table>
                        <div class="d-flex justify-content-end mt-3">
                            <button type="button" class="btn-cancel me-2">취소</button>
                            <button type="submit" class="btn-add me-2">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/notice/notice.js"></script>
</body>
</html>