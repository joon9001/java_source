<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="pack.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="boardMgr" class="pack.board.BoardMgr"></jsp:useBean>
<jsp:useBean id="dto" class="pack.board.BoardDto"></jsp:useBean>


<%
int spage = 1, pageSu = 0;
int start, end;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">

<script type="text/javascript">
window.onload = () => {
	document.querySelector("#btnSearch").onclick = function(){
		if(frm.sword.value === ""){
			frm.sword.focus();
			frm.sword.placeholder = "검색어를 입력하세요";
			return;
		}
		frm.submit();
	}
}
</script>

</head>
<body>
<table>
	<tr>
		<td>
			<a href="../guest/guest_index.jsp">메인으로</a>&nbsp;
			<a href="boardlist.jsp?page=1">최근목록</a>&nbsp;
			<a href="boardwrite.jsp">새글작성</a>&nbsp;
			<a href="#" onclick="window.open('admin.jsp','','width=300,height=150,top=200,left=300')">관리자용</a>&nbsp;
			<br><br>
			<table style="width: 100%">
				<tr style="background-color: silver;">
					<th>번호</th><th>제    목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
				<%
				try{
					spage = Integer.parseInt(request.getParameter("page"));
				}catch(Exception e){
					spage = 1; // 에러가 날 경우 현재페이지 = 1페이지로 설정
				}
				if(spage <= 0) spage = 1; 
				// 페이지 번호를 음수로 입력할 경우 현재 페이지 = 1페이지로 설정
				
				// 검색일 경우 ----------
				String stype = request.getParameter("stype");
				String sword = request.getParameter("sword");
				
				// ----------------------
				boardMgr.totalList(); //전체 레코드 수 확인
				pageSu = boardMgr.getPageSu(); //전체 페이지 수 얻기
				
				//ArrayList<BoardDto> list = boardMgr.getDataAll(spage);
				ArrayList<BoardDto> list = boardMgr.getDataAll(spage, stype, sword); //검색도 처리
				
				for(int i = 0; i <list.size(); i++){
					dto = (BoardDto)list.get(i);
					// 댓글 들여쓰기 준비 -------------------------
					int nst = dto.getNested();
					String tab = "";
					for(int k=0; k < nst; k++){
						tab += "&nbsp;&nbsp;";
					}
					//------------------------------------
				%>
				<tr>
					<td><%=dto.getNum() %></td>
					<td>
					<%=tab %><a href="boardcontent.jsp?num=<%=dto.getNum() %>&page=<%=spage%>"><%=dto.getTitle() %></a>
					</td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getBdate() %></td>
					<td><%=dto.getReadcnt() %></td>
					
				</tr>
				<%	
				}
				%>
			</table>
			<br>
			<table style="width: 100%">
				<tr>
					<td style="text-align: center;">
					<%
					for(int i= 1; i <= pageSu; i++){
						if(i==spage){ // i가 spage(현재페이지)와 같다면 아래 css 적용
						out.print("<b style='font-size:14pt; color:red'>["+ i + "]</b>");
						}else{
							
						out.print("<a href='boardlist.jsp?page=" + i +"'>["+ i + "]</a>");
						}
					}
					%>
					
					<br><br>
					<form action="boardlist.jsp" name="frm"	method="get">
						<select name="stype">
						<option value="title" selected="selected">글제목</option>
						<option value="name">작성자</option>
						</select>
						<input type="text" name="sword">
						<input type="button" value="검색" id="btnSearch"	>
					</form>
					</td>
				</tr>			
			</table>
		</td>	
	</tr>

</table>
</body>
</html>