<%@page import="pack.pack.Product.ProductDto"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="r orderM" class="w pack.order.OrderM" />
<jsp:useBean id="r productM" class="w pack.Product.ProductM" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>* 주문 상품 정보 *</h2>
<%@ include file = "guest_top.jsp" %>
<table>
	<tr style="background-color: blue;color:white;">
		<th>주문정보</th><th>상품명</th><th>주문 수</th><th>주문일</th><th>주문상태</th>
	</tr>
<%
String id = (String)session.getAttribute("idKey");

ArrayList<OrderBean> list = orderMgr.getOrder(id);

if(list.isEmpty()){
%>
	<tr>
		<td colspan="5"><%=id %>고객님~ 주문한 상품이 없습니다</td>
	</tr>
<% 
}else{
	for(OrderBean ord:list){
		ProductDto product = productMgr.getProduct(ord.getProduct_no());
%>
	<tr>
		<td><%=ord.getNo() %></td>
		<td><%=product.getName() %></td>
		<td><%=ord.getQuantity() %></td>
		<td><%=ord.getSdate() %></td>
		<!-- 
		<td><%=ord.getState() %></td>
		 -->
		<!-- //1:접수, 2:입금확인, 3:배송준비, 4:배송중, 5:처리완료 -->
		<td>
		<%
		switch(ord.getState()){
		case "1":out.println("접수"); break;
		case "2":out.println("입금확인"); break;
		case "3":out.println("배송준비"); break;
		case "4":out.println("배송중"); break;
		case "5":out.println("처리완료"); break;
		default:out.println("접수중");
		}
		%>
		</td>
	</tr>
<%
	}
}
%>
	</table>
<%@ include file = "guest_bottom.jsp" %>
</body>
</html>