<%@page import="user.UserBean"%>
<%@page import="admin.AdminMgr"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="adminMgr" class="admin.AdminMgr" />
 
<%
try {
    String noStr = request.getParameter("no");
    if (noStr != null && !noStr.isEmpty()) {
        int no = Integer.parseInt(noStr);
        // no 변수로 추가 로직 처리
        UserBean user = adminMgr.getUser(no);
        request.setAttribute("user", user);
       // out.println("user");
    } else {
        out.println("No parameter is missing or empty");
    }
} catch (NumberFormatException e) {
    out.println("Invalid number format for no parameter");
}
%>

<%--
<%
request.setCharacterEncoding("utf-8");
int no = Integer.parseInt(request.getParameter("no"));
UserBean user = adminMgr.getUser(no);
request.setAttribute("user", user);
out.println("user");
%>

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js/adminUserDetail.js"></script>
<link rel="stylesheet" href="../css/userModal.css">
</head>
<body>
	<div class="container2">
		<main class="main-content2">
		<h3>회원 상세 정보</h3><br>
			<span class="close">&times;</span>
			
		<tr style="text-align: center;">
		
		 		<td>번호: ${user.no}</td><br><br>
				<td>아이디: ${user.id}</td><br><br>
				<td>비밀번호: ${user.pw}</td><br><br>
				<td>이름: ${user.uname}</td><br><br>
				<td>이메일: ${user.email}</td><br><br>
				<td>성별: ${user.gender}</td><br><br>
				<td>탈퇴 여부: ${user.signout_is}</td><br><br>
				<td>가입일: ${user.sign_up_date}</td>
				
		</tr>
		<br>
			<div>
			<br>
			<!-- <button id="btnUpdate" class="btn">수정</button>
			<button id="btnDelete" class="btn">삭제</button> -->
		</div>
			
			  
			
			
			</div>
		</main>
	</div>
	

	
</body>
</html>
