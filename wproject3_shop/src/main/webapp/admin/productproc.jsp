<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="r productM" class="w pack.Product.ProductM"/>

<%
request.setCharacterEncoding("utf-8");

//controller 역할
String flag = request.getParameter("flag");
boolean result = false;

if(flag.equals("insert")){
	result = productMgr.insertProduct(request); //httpServletRequest의 객체 변수 request
}else if(flag.equals("update")){
	result = productMgr.updateProduct(request); //httpServletRequest의 객체 변수 request
}if(flag.equals("delete")){
	result = productMgr.deleteProduct(request.getParameter("no")); //httpServletRequest의 객체 변수 request
}else{
	response.sendRedirect("productmanager.jsp");
}

if(result){
%>
	<script>
		alert("정상 처리되었습니다");
		location.href="productmanager.jsp"
	</script>
<%}else{%>	
 	<script>
		alert("오류 발생!");
		location.href="productmanager.jsp"
	</script>
<%	
}
%>