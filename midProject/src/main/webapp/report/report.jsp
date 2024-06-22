<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 된 유저만 신고가 가능하다.즉  -->
<%
String id = request.getParameter("id"); // 아이디 유무
//hidden 값
/*로그인 어떻게.? 탑에서 token 유지하고 있나?
로그인
if( id != null){
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../css/report.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="../js/reportScript.js"></script>
</head>
<body>
<h2>신고유형</h2>
<form action="saveReport.jsp" name="frm" method="post">
	<div class="select">
	   <input type="radio" name="cbRep" id="cbRepo1" value="1"><label for="cbRepo1"> 불쾌한 표현 사용</label><br>
	   <input type="radio" name="cbRep" id="cbRepo2" value="2"><label for="cbRepo2"> 관련없는 리뷰</label><br>
	   <input type="radio" name="cbRep" id="cbRepo3" value="3"><label for="cbRepo3"> 스팸/홍보 글</label><br>
	   <input type="radio" name="cbRep" id="cbRepo4" value="4"><label for="cbRepo4"> 음란물</label><br>
	   <input type="radio" name="cbRep" id="cbRepo5" value="5"><label for="cbRepo5"> 청소년에게 유해한 내용</label><br>
	   <div class="repo">
		   <input type="button" value="신고하기" class="btn btn-outline-danger" onclick="report(this.form)">
		   <input type="hidden" name="cbRep">
		   <input type="hidden" name="reply_no" value="4"> <!-- 예시: 리뷰 번호 -->
		   <input type="hidden" name="reporter_user_id" value="user123"> <!-- 예시: 신고자 아이디 -->
	   </div>
	</div>
</form>
<%
/*
}else{
	//alert('로그인해주세요');
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">알림창</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        로그인해주세요.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	
	response.sendRedirect("../login/login.jsp"); //경로 재설정
}
*/

%>
</body>
</html>