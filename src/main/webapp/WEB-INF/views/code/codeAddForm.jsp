<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>코드/항목 생성</title>
    <link href="${pageContext.request.contextPath}/resources/css/code/codeAddForm.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
    <div class="container codeAdd-container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/menu.jsp" />
            
            <div class="col codeAdd-main">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />

                <div class="codeAdd-header">
                    <p class="codeAdd-title">&gt; 코드/항목 생성</p>
                </div>
                <hr>
                <div class="container">
                    <div class="row">
                        <div class="col code">
                            <div class="codeAdd-subtitle">코드</div>
                            <table class="table table-bordered code-table">
                                <tr>
                                    <td class="table-secondary">코드명(논리)</td>
                                    <td colspan="5">
                                        <input type="text" id="codeNm" class="form-control code-input" placeholder="내용 입력" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-secondary">코드명(물리)</td>
                                    <td colspan="5">
                                        <input type="text" id="codeId" class="form-control code-input" placeholder="내용 입력" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-secondary">내용</td>
                                    <td colspan="5">
                                        <input type="text" id="codeContent" class="form-control content-input" placeholder="내용 입력">
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="table-secondary">신청사유</td>
                                    <td colspan="5">
                                        <input type="text" id="applyReason" class="form-control" placeholder="내용 입력">
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="col item">
                            <div class="d-flex item-subtitle justify-content-between align-items-center">
                                <div class="itemAdd-subtitle">항목</div>
                                <button class="btn-init" type="button">초기화</button>
                            </div>
                            <table class="table table-bordered item-table">
                                <tr>
                                    <td class="table-secondary">항목코드</td>
                                    <td colspan="5">
                                        <input type="text" id="itemId" class="form-control code-input" placeholder="내용 입력" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-secondary">항목명</td>
                                    <td colspan="5">
                                        <input type="text" id="itemNm" class="form-control code-input" placeholder="내용 입력" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-secondary">내용</td>
                                    <td colspan="5">
                                        <input type="text" id="itemContent" class="form-control content-input" placeholder="내용 입력">
                                    </td>
                                </tr>
                            </table>
                            <div class="button-group">
			                    <button id="item-add" class="btn-add" type="button">추가</button>
			                    <button class="btn-edit" type="button">수정</button>
			                </div>
                        </div>
                    </div>
                </div>

                <div class="item-container">
                    <div class="item-header">항목</div>
                    <div class="item-table-container">
	                    <table class="table table-hover bottom-table">
	                        <thead class="table-secondary">
	                            <tr>
	                                <th scope="col">No.</th>
	                                <th scope="col">항목코드</th>
	                                <th scope="col">항목명</th>
	                                <th scope="col">사용여부</th>
	                                <th scope="col">내용</th>
	                                <th></th>
	                            </tr>
	                        </thead>
	                        <tbody class="item-list"></tbody>
	                    </table>
                    </div>
                </div>

                <div class="button-group">   
                    <button id="code-apply" class="btn-add" type="button">신청</button>          
                </div>
                <script src="${pageContext.request.contextPath}/resources/js/code/codeAddForm.js"></script>
            </div>
        </div>
    </div>
</body>
</html>