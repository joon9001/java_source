<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); //request : client로부터의 요청 처리
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if(!(id.equals("aa") && pwd.equals("11"))){
	response.sendRedirect("jsp4member.html"); // response: client로 결과 출력
	
}

String[] names = request.getParameterValues("name");
String job = request.getParameter("job");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
** 전송된 입력 자료 확인 **<br>
아이디는 <% out.println(id + "<br>"); //out : 출력 스트림 개체 %> 
이름은 <% out.println(names[0] + ", 별명은 " + names[1] + "<br>"); %>
직업은 
<% 
out.println(job);
//계속해서 여러 실행문을 적을 수 있다. 그런데 출력할 실행문이 하나인 경우 아래와 같이 적을 수 있다.
%>
<%=job %>
<hr>
기타 정보 : <br>
client ip: <%= request.getRemoteAddr() %> <br>
client domain: <%= request.getRemoteHost() %> <br>
Protocol: <%= request.getProtocol() %> <br>
Method: <%= request.getMethod() %> <br>
Server domain : <%= request.getServerName() %><br>
<br>
Server buffer size= <%= response.getBufferSize() %><br>
Server CharacterEncoding= <%= response.getCharacterEncoding() %><br>
<br>
Context path : <%= application.getContextPath() %><br> <!-- 현재 실행중인 페이지의 외부 환경정보관련 객체 -->
Session : <%= pageContext.getSession() %>
<br>
session, page, config , exception 등이 내장객체에 해당됨 
</body>
</html>