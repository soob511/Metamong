<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>코드/항목 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/code/codeList.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
    <div class="container code-list-container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/menu.jsp" />
            <div class="col code-list-main">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <div class="code-list-header">
                    <p class="code-list-title">&gt; 코드/항목 관리</p>
                </div>
                <div class="code-list-filters">
                    <div class="code-search">
                        <label for="codeNameSearch" class="code-search-label">코드명(논리/물리)</label>
                        <div class="container-fluid">
                            <form class="d-flex search-form">
                                <input class="form-control me-2" type="search" id="codeNameSearch" placeholder="Search" aria-label="Search" />
                                <i class="bi bi-search"></i>
                            </form>
                        </div>
                    </div>
                    <div class="use-filter">
                        <label for="useSelect" class="use-filter-label">사용여부</label>
                        <select id="useSelect" class="form-select" aria-label="Default select">
                            <option value="2" selected>전체</option>
                            <option value="1">Y</option>
                            <option value="0">N</option>
                        </select>
                    </div>
                </div>
                <hr />
                <div class="container code-management">
                    <div class="row">
                        <div class="col-6 code-table">
                            <div class="code-management">
                                <p class="code-management-title">코드</p>
                                
                                <sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_DBA')">
									<div class="code-buttons d-flex gap-1">
										<button data-bs-toggle="modal" data-bs-target="#excelModal" class="btn-excel">EXCEL 업로드</button>
	                                    <a href="codeAddForm"><button class="btn-add">추가</button></a>
	                                    <button class="btn-edit">수정</button>
	                                </div>
								</sec:authorize>								
                            </div>
                            <div class="code-table-container">
                                <table class="table table-hover" id="codeTable">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">코드(논리)</th>
                                            <th scope="col">코드(물리)</th>
                                            <th scope="col">코드길이</th>
                                            <th scope="col">사용여부</th>
                                            <th scope="col">내용</th>
                                        </tr>
                                    </thead>
                                    <tbody id="codeList">
                                        <c:forEach items="${codeList}" var="code">
                                            <tr class="code-row" onclick="showItemList(${code.codeNo})" data-code-no="${code.codeNo}">
                                                <th>${code.codeNo}</th>
                                                <td>${code.codeNm}</td>
                                                <td>${code.codeId}</td>
                                                <td>${code.codeLength}</td>
                                                <td>${code.codeIsActive == 1 ? 'Y' : 'N'}</td>
                                                <td>${code.codeContent}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-6 item-table">
                            <div class="item-management">
                                <p class="item-management-title">항목</p>
                            </div>
                            <div class="item-table-container">
                                <table class="table table-hover" id="itemTable">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">항목코드</th>
                                            <th scope="col">항목명</th>
                                            <th scope="col">사용여부</th>
                                            <th scope="col">내용</th>
                                        </tr>
                                    </thead>
                                    <tbody id="itemList">
                                        <tr>
                                            <th colspan="5">코드를 선택해 주세요.</th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- excel 모달  -->

	<div class="modal fade" tabindex="-1" id="excelModal" data-bs-backdrop="static" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">EXCEL 업로드</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="excel-btns d-flex  justify-content-end gap-1 ms-2">
	      	<a href="codeExcelDownload">
	      	<button class="btn-download">양식 다운로드</button></a>
			<form id="uploadForm" enctype="multipart/form-data" class="d-flex">
			    <input type="file" name="file" id="fileInput" accept=".xlsx, .xls" style="display: none;" />
			    <label for="fileInput" class="btn-excel modal-btn-excel">EXCEL 업로드</label>
			</form>
			<button class="btn-refresh">초기화</button>
			</div>
	        <div class="container-fluid">
	        	<div class="row">
	        		<div class="col modal-code-table">
	        			<div class="code-management">
                                <p class="code-management-title">코드</p>
                            </div>
                            <div class="code-table-container">
                                <table class="table table-hover" id="codeTable">
                                    <thead class="table-secondary">
                                        <tr>
                                           <th scope="col">ID</th>
                                            <th scope="col">코드(논리)</th>
                                            <th scope="col">코드(물리)</th>
                                            <th scope="col">코드길이</th>
                                            <th scope="col">내용</th>
                                        </tr>
                                    </thead>
                                    <tbody id="codeList" class="excel-codes">
                                        <tr>
                                            <td colspan="5">파일을 등록해 주세요.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
	        		</div>
	        		<div class="col modal-item-table">
	        			<div class="item-management">
                                <p class="item-management-title">항목</p>
                            </div>
                            <div class="item-table-container">
                                <table class="table table-hover" id="itemTable">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">항목코드</th>
                                            <th scope="col">항목명</th>
                                            <th scope="col">내용</th>
                                        </tr>
                                    </thead>
                                    <tbody id="itemList" class="excel-items">
                                        <tr class="no-file">
                                            <td colspan="4">파일을 등록해 주세요.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
	        		</div>
	        	</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="codeApplyExcel()">신청하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	   
    <script src="${pageContext.request.contextPath}/resources/js/code/codeList.js"></script>
</body>
</html>