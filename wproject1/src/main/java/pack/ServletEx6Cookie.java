<<<<<<< HEAD
package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletEx6Cookie")
public class ServletEx6Cookie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); // Mime type과 문자 코드
		PrintWriter out = response.getWriter(); 
		//response 객체를 썼으므로 printwriter는 단순 출력이 아니라 
		//웹용으로 서버에서 클라이언트 쪽으로 데이터를 전송해주는 역할을 한다.
		out.println("<html><body><head><meta charset=\"UTF-8\">"
				+ "<title>Insert title here</title></head><body>");
		// 쿠키가 있는 경우 로그인한 상태를 알리고 없다면 로그인 화면 출현
		String id = null;
		String pwd = null;
		
		try {
			Cookie[] cookies = request.getCookies(); // 클라이언트의 모든 쿠기 읽기
			for(int i = 0; i < cookies.length; i++) {
				// 쿠기는 키이름:값 형태로 구성됨
				String name = cookies[i].getName();
				System.out.println("name : " + name);
				
				if(name.equalsIgnoreCase("id")){
					//쿠키값 디코딩(암호 해제)
					id = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}	//쿠키값 디코딩(암호 해제)
					if(name.equals("pwd")) {
					pwd = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(id != null && pwd != null) { //id, pwd가 있는 경우
			out.println(id+ "님 쿠키를 통해 로그인한 상태입니다");
			out.println("</body></html>");
			out.close();
			return;
		}
		
		
		//id, pwd가 없는 경우
		out.println("<h2>로그인</h2>");
		out.println("<form method='post'>");
		out.println("id : <input type='text' name='id'><br>");
		out.println("pwd : <input type='text' name='pwd'><br>");
		out.println("<input type='submit' value='로그인'>");
		out.println("</form>");
		out.println("</body></html>");
		out.close();
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); 
		out.println("<html><body>");
			
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//System.out.println(id + " " + pwd);
	
		if(id.equals("aaa") && pwd.equals("111")) {
			//쿠키 생성
			try {
				id = URLEncoder.encode(id, "utf-8"); //암호화
				Cookie idCookie = new Cookie("id", id);
				idCookie.setMaxAge(60 * 60 * 24 * 365); // 쿠키 유효기간 1년 할당
				
				pwd = URLEncoder.encode(pwd, "utf-8"); //암호화
				Cookie pwdCookie = new Cookie("pwd", pwd);
				pwdCookie.setMaxAge(60 * 60 * 24 * 365); // 쿠키 유효기간 1년 할당
				
				response.addCookie(idCookie);
				response.addCookie(pwdCookie);   // 클라이언트 컴에 쿠키를 저장

				out.println("login success - setting ok!!!");
			} catch (Exception e) {
				
			}
		}else {
			out.println("login fail");
		}
		
		out.println("</body></html>");
		out.close();
		
	}

}
=======
<<<<<<< HEAD
package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletEx6Cookie")
public class ServletEx6Cookie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); // Mime type과 문자 코드
		PrintWriter out = response.getWriter(); 
		//response 객체를 썼으므로 printwriter는 단순 출력이 아니라 
		//웹용으로 서버에서 클라이언트 쪽으로 데이터를 전송해주는 역할을 한다.
		out.println("<html><body><head><meta charset=\"UTF-8\">"
				+ "<title>Insert title here</title></head><body>");
		// 쿠키가 있는 경우 로그인한 상태를 알리고 없다면 로그인 화면 출현
		String id = null;
		String pwd = null;
		
		try {
			Cookie[] cookies = request.getCookies(); // 클라이언트의 모든 쿠기 읽기
			for(int i = 0; i < cookies.length; i++) {
				// 쿠기는 키이름:값 형태로 구성됨
				String name = cookies[i].getName();
				System.out.println("name : " + name);
				
				if(name.equalsIgnoreCase("id")){
					//쿠키값 디코딩(암호 해제)
					id = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}	//쿠키값 디코딩(암호 해제)
					if(name.equals("pwd")) {
					pwd = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(id != null && pwd != null) { //id, pwd가 있는 경우
			out.println(id+ "님 쿠키를 통해 로그인한 상태입니다");
			out.println("</body></html>");
			out.close();
			return;
		}
		
		
		//id, pwd가 없는 경우
		out.println("<h2>로그인</h2>");
		out.println("<form method='post'>");
		out.println("id : <input type='text' name='id'><br>");
		out.println("pwd : <input type='text' name='pwd'><br>");
		out.println("<input type='submit' value='로그인'>");
		out.println("</form>");
		out.println("</body></html>");
		out.close();
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); 
		out.println("<html><body>");
			
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//System.out.println(id + " " + pwd);
	
		if(id.equals("aaa") && pwd.equals("111")) {
			//쿠키 생성
			try {
				id = URLEncoder.encode(id, "utf-8"); //암호화
				Cookie idCookie = new Cookie("id", id);
				idCookie.setMaxAge(60 * 60 * 24 * 365); // 쿠키 유효기간 1년 할당
				
				pwd = URLEncoder.encode(pwd, "utf-8"); //암호화
				Cookie pwdCookie = new Cookie("pwd", pwd);
				pwdCookie.setMaxAge(60 * 60 * 24 * 365); // 쿠키 유효기간 1년 할당
				
				response.addCookie(idCookie);
				response.addCookie(pwdCookie);   // 클라이언트 컴에 쿠키를 저장

				out.println("login success - setting ok!!!");
			} catch (Exception e) {
				
			}
		}else {
			out.println("login fail");
		}
		
		out.println("</body></html>");
		out.close();
		
	}

}
=======
package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletEx6Cookie")
public class ServletEx6Cookie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); // Mime type과 문자 코드
		PrintWriter out = response.getWriter(); 
		//response 객체를 썼으므로 printwriter는 단순 출력이 아니라 
		//웹용으로 서버에서 클라이언트 쪽으로 데이터를 전송해주는 역할을 한다.
		out.println("<html><body><head><meta charset=\"UTF-8\">"
				+ "<title>Insert title here</title></head><body>");
		// 쿠키가 있는 경우 로그인한 상태를 알리고 없다면 로그인 화면 출현
		String id = null;
		String pwd = null;
		
		try {
			Cookie[] cookies = request.getCookies(); // 클라이언트의 모든 쿠기 읽기
			for(int i = 0; i < cookies.length; i++) {
				// 쿠기는 키이름:값 형태로 구성됨
				String name = cookies[i].getName();
				System.out.println("name : " + name);
				
				if(name.equalsIgnoreCase("id")){
					//쿠키값 디코딩(암호 해제)
					id = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}	//쿠키값 디코딩(암호 해제)
					if(name.equals("pwd")) {
					pwd = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(id != null && pwd != null) { //id, pwd가 있는 경우
			out.println(id+ "님 쿠키를 통해 로그인한 상태입니다");
			out.println("</body></html>");
			out.close();
			return;
		}
		
		
		//id, pwd가 없는 경우
		out.println("<h2>로그인</h2>");
		out.println("<form method='post'>");
		out.println("id : <input type='text' name='id'><br>");
		out.println("pwd : <input type='text' name='pwd'><br>");
		out.println("<input type='submit' value='로그인'>");
		out.println("</form>");
		out.println("</body></html>");
		out.close();
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); 
		out.println("<html><body>");
			
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//System.out.println(id + " " + pwd);
	
		if(id.equals("aaa") && pwd.equals("111")) {
			//쿠키 생성
			try {
				id = URLEncoder.encode(id, "utf-8"); //암호화
				Cookie idCookie = new Cookie("id", id);
				idCookie.setMaxAge(60 * 60 * 24 * 365); // 쿠키 유효기간 1년 할당
				
				pwd = URLEncoder.encode(pwd, "utf-8"); //암호화
				Cookie pwdCookie = new Cookie("pwd", pwd);
				pwdCookie.setMaxAge(60 * 60 * 24 * 365); // 쿠키 유효기간 1년 할당
				
				response.addCookie(idCookie);
				response.addCookie(pwdCookie);   // 클라이언트 컴에 쿠키를 저장

				out.println("login success - setting ok!!!");
			} catch (Exception e) {
				
			}
		}else {
			out.println("login fail");
		}
		
		out.println("</body></html>");
		out.close();
		
	}

}
>>>>>>> branch 'main' of https://github.com/joon9001/java_source.git
>>>>>>> branch 'main' of https://github.com/joon9001/java_source.git
