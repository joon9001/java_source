<<<<<<< HEAD
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//csv 형태로 결과 반환
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("org.mariadb.jdbc.Driver");
	String url="jdbc:mariadb://localhost:3306/test";
	conn = DriverManager.getConnection(url, "root", "123");
	//데이터베이스 연결을 위한 Connection, SQL 쿼리 실행을 위한 PreparedStatement, 
	//쿼리 결과를 저장할 ResultSet 객체를 선언합니다.
	String keyword = request.getParameter("keyword");
	//System.out.println("keyword : " + keyword);
	
	String sql = "select jikwon_name from jikwon where jikwon_name like ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, keyword + "%");
	rs = pstmt.executeQuery();
	
	ArrayList<String> list = new ArrayList<String>();
	
	while(rs.next()){
		list.add(rs.getString("jikwon_name"));
	}
	out.print(list.size());
	out.print("|");
	for(int i=0; i < list.size(); i++){
		String data = list.get(i);
		out.print(data);
		if(i < list.size() - 1){  //2|홍길동,홍두깨   마지막 콤마는 제외
			out.print(","); //마지막 요소 전까지만 ,를 추가한다.
		}
	}
}catch(Exception e){
	System.out.println("에러 : " + e);
}finally{
	try{
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		
	}
}
=======
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//csv 형태로 결과 반환
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("org.mariadb.jdbc.Driver");
	String url="jdbc:mariadb://localhost:3306/test";
	conn = DriverManager.getConnection(url, "root", "123");
	//데이터베이스 연결을 위한 Connection, SQL 쿼리 실행을 위한 PreparedStatement, 
	//쿼리 결과를 저장할 ResultSet 객체를 선언합니다.
	String keyword = request.getParameter("keyword");
	//System.out.println("keyword : " + keyword);
	
	String sql = "select jikwon_name from jikwon where jikwon_name like ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, keyword + "%");
	rs = pstmt.executeQuery();
	
	ArrayList<String> list = new ArrayList<String>();
	
	while(rs.next()){
		list.add(rs.getString("jikwon_name"));
	}
	out.print(list.size());
	out.print("|");
	for(int i=0; i < list.size(); i++){
		String data = list.get(i);
		out.print(data);
		if(i < list.size() - 1){  //2|홍길동,홍두깨   마지막 콤마는 제외
			out.print(","); //마지막 요소 전까지만 ,를 추가한다.
		}
	}
}catch(Exception e){
	System.out.println("에러 : " + e);
}finally{
	try{
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		
	}
}
<<<<<<< HEAD
=======
>>>>>>> branch 'main' of https://github.com/joon9001/java_source.git
>>>>>>> branch 'main' of https://github.com/joon9001/java_source.git
%>