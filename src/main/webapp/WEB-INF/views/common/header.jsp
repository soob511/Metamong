<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<div class="header d-flex justify-content-end gap-3">
    <div class="bell">
        <i class="bi bi-bell"></i>
        <div class="alarm">5</div>
    </div>
    <div class="profile-container">
        <c:choose>
            <c:when test="${not empty member.profFilename}">
                <img class="profile-img" alt="profile" id="existingProf"
                     src="${pageContext.request.contextPath}/member/getMemberProf?MId=${member.MId}">

                <i class="bi bi-pencil edit-icon" data-bs-toggle="dropdown" aria-expanded="false"></i>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" onclick="document.getElementById('fileInput').click();">프로필 변경</a></li>
                    <li><a class="dropdown-item" id="deleteProfile" onclick="document.getElementById('deleteProf').click();">기본이미지로 변경</a></li>
                </ul>
            </c:when>

            <c:otherwise>
               <img class="profile-img" alt="profile" 
                     src="${pageContext.request.contextPath}/resources/image/general_prof.png">
                
                <i class="bi bi-pencil edit-icon" data-bs-toggle="dropdown" aria-expanded="false"></i>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" onclick="document.getElementById('fileInput').click();">프로필 변경</a></li>
                </ul>
            </c:otherwise>
        </c:choose>

 <input type="file" id="fileInput" data-m-id="${member.MId}" accept="image/*"style="display: none;" onchange="handleFileUpload(event)"> 
 <input type="hidden" id="deleteProf" data-m-id="${member.MId}" name="deleteProf" value="${member.profFilename != null ? 0 : 1}" onchange="handleFileUpload(event)">      
       
    </div>
    <div>
        <p>[${member.teamName}]${member.MName}</p>
        <span>${member.MEmpId}</span>
    </div>
</div>
