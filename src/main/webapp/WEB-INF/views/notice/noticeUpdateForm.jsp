<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
   
    <link href="${pageContext.request.contextPath}/resources/css/notice/notice.css"  rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" />
        <div class="col-10">
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div>
                <div class="content">
                    <h4 class="fw-bold notice-title">> 공지사항 수정</h4>
                    <form id="updateNoticeForm" action="updateNotice" method="post" enctype="multipart/form-data">
                        <table class="table"> 
                            <tr>
                                <td class="table-primary form-label" id="tdth">제목<span class="form-required">(*)</span></td>
                                <td><input type="text" class="form-control" id="noticeTitle" name ="noticeTitle" value="${notice.noticeTitle}"></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label" id="tdth">작성자</td>
                                <td id="author"><span>관리자</span></td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label" id="tdth">수정일</td>
                                <td>
                                	<c:if test="${notice.noticeRegdate !=null}">
                                		<div id="existingRegdate">
                                			<span><fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd"/></span>
                                			 <button type="button" id="removeDateBtn" class="btn btn-sm btn-outline-secondary">재설정</button>
                                		</div>
                               		</c:if>
                                	<input type="date" class="form-control"  id="noticeRegdate" name="noticeRegdate" style="display: ${notice.noticeRegdate != null ? 'none' : 'block'};">
                                	<input type="hidden" id="updateDate" name="updateDate" value="false">
                                </td>
                            </tr>
                            <tr>
                                <td class="table-primary form-label" id="tdth">내용</td>
                                <td id="noticeContentTd">                                   
                                    <textarea class="form-control" id="noticeContent" name="noticeContent" rows="12">${notice.noticeContent}</textarea>
                                </td>
                            </tr>
						    <tr>
						        <td class="table-primary form-label" id="tdth">첨부파일</td>
						        <td>
						        	<c:if test="${notice.noticeFilename != null}">
							            <div id="existingFile">
							                <span>${notice.noticeFilename}</span>
							                <button type="button" id="removeFileBtn" class="btn btn-sm btn-outline-danger">삭제</button>
							            </div>
							        </c:if>
					        	  <input id="noticeFile" type="file" name="noticeFile" class="form-control" style="display: ${notice.noticeFilename != null ? 'none' : 'block'};">					        	   
					        	  <input type="hidden" id="deleteFile" name="deleteFile" value="false">
					           </td>
						    </tr>
                        </table>
                        <div class="d-flex justify-content-end mt-3">
                            <button type="button" class="btn-update me-2" data-notice-id="${notice.noticeId}">수정</button>                        
                            <button type="button" class="btn-lists me-2"><a href="noticeList?pageNo=${pager.pageNo}" style="color:white;">목록</a></button>
                            
                        </div>
                        <input type="hidden" name="noticeId" value="${notice.noticeId}">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notice/noticeUpdateForm.js"></script>
</body>
</html>
