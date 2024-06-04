<%@page import="java.util.ArrayList"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//현재 jsp 파일은 비즈니스 로직 처리용으로 출력에는 참여하지 않음
String data = request.getParameter("data");
String msg = "Mr. " + data;

//1. redirect 방식으로 파일 호출 
//response.sendRedirect("jsp6invoked.jsp?data=" + msg);
//여러개의 값을 넘길 경우, response.sendRedirect("jsp6invoked.jsp?data=" + msg + "&data2=" + msg2);

//2. forward 방식으로 파일 호출
request.setAttribute("datas", msg);

ArrayList<String> list = new ArrayList<String>();
list.add("mouse");
list.add("pen");
list.add("book");
request.setAttribute("product", list);

//request.getRequestDispatcher("jsp6invoked.jsp").forward(request, response);

%>
<jsp:forward page="jsp6invoked.jsp"></jsp:forward>