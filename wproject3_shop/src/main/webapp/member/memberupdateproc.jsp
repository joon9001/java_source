<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="memberBean" class="pack.member.MemberBean" scope="page" />
<jsp:setProperty property="*" name="memberBean" />
<%--memberupdate.jsp 파일의 form 태그에서 보낸 모든 파라미터값이 setproperty를 통해 memberBean의 setter로 등록된다. --%>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr" />

<%
String id = (String)session.getAttribute("idKey");
//위의 setproperty로 수정된 memberBean 객체와 올바른 id 값을 가지고 memberUpdate()로 간다.
boolean b = memberMgr.memberUpdate(memberBean, id); 

if(b){
%>
	<script>
	alert("수정 성공");
	location.href="../guest/guest_index.jsp";
	</script>
<%}else{%>
	<script>
	alert("수정 실패\n관리자에게 문의 바람");
	history.back();
	</script>
<%	
}
%>






