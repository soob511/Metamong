<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link href="${pageContext.request.contextPath}/resources/css//notice/notice.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col-10">
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div>
                <div class="content">
                    <h4 class="fw-bold notice-title">> 공지사항 상세</h4>
                    <table class="table table-bordered">
                        <tr>
                            <td class="table-primary">제목<span class="form-required">(*)</span></td>
                            <td id="table-contents" colspan="5">주요 반려 사유</td>
                        </tr>
                        <tr>
                            <td class="table-primary">작성자</td>
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
                            <td colspan="5">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="12" required>
                                    최근 반려건 수가 급증하고 있습니다. 이에 따라 주요 반려사유에 대해 공지드립니다.
                                    1. 중복되는 테이블명
                                    2. 신청 사유 기재 안된 경우
                                    3. 많은 양의 코드
                                </textarea>
                            </td>
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
                        <button type="button" class="btn-cancel me-2">삭제</button>
                        <button type="submit" class="btn-add me-2">수정</button>
                        <button type="button" class="btn-list">목록</button>
                    </div>                 
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/notice/notice.js"></script>
</body>
</html>