<<<<<<< HEAD
package pack;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletEx3")
public class ServletEx3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int num = 0;
	
	
	public void init(ServletConfig config) throws ServletException {
		// 웹 서버 서비스가 시작되면 자동 호출됨. 
		// 현재 서블릿 클래스의 초기화를 담당 (최초의 요청에 의해 1회만 수행)
		num = 1;
		System.out.println("init 수행 : num=" + num);
	}
	/*
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get, post 요청 시 매번 수행 (service()가 doGet(), doPost()보다 우선순위가 높다.)
		// doGet, doPost를 호출 가능.
		// 참고 : jsp 파일은 service 메소드 만을 가진 파일
		num += 1;
		System.out.println("service 수행 num=" + num);
		
	//	doGet(request, response); // doGet 방식으로만 실행
		
	}
*/
//위의 service()를 주석 처리하면 요청 방식에 따라 doGet()과 doPost()를 모두 쓸 수 있다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 요청 시 매번 수행
		num += 1;
		System.out.println("doGet 수행 num=" + num);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 요청 시 매번 수행
		num += 1;
		System.out.println("doPost 수행 num=" + num);
	}

	public void destroy() {
		// 웹 서버 서비스가 종료되면 자동 호출됨. 
		// 마무리 작업 담당
		System.out.println("destroy 수행");
	}
}
=======
<<<<<<< HEAD
package pack;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletEx3")
public class ServletEx3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int num = 0;
	
	
	public void init(ServletConfig config) throws ServletException {
		// 웹 서버 서비스가 시작되면 자동 호출됨. 
		// 현재 서블릿 클래스의 초기화를 담당 (최초의 요청에 의해 1회만 수행)
		num = 1;
		System.out.println("init 수행 : num=" + num);
	}
	/*
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get, post 요청 시 매번 수행 (service()가 doGet(), doPost()보다 우선순위가 높다.)
		// doGet, doPost를 호출 가능.
		// 참고 : jsp 파일은 service 메소드 만을 가진 파일
		num += 1;
		System.out.println("service 수행 num=" + num);
		
	//	doGet(request, response); // doGet 방식으로만 실행
		
	}
*/
//위의 service()를 주석 처리하면 요청 방식에 따라 doGet()과 doPost()를 모두 쓸 수 있다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 요청 시 매번 수행
		num += 1;
		System.out.println("doGet 수행 num=" + num);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 요청 시 매번 수행
		num += 1;
		System.out.println("doPost 수행 num=" + num);
	}

	public void destroy() {
		// 웹 서버 서비스가 종료되면 자동 호출됨. 
		// 마무리 작업 담당
		System.out.println("destroy 수행");
	}
}
=======
package pack;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletEx3")
public class ServletEx3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int num = 0;
	
	
	public void init(ServletConfig config) throws ServletException {
		// 웹 서버 서비스가 시작되면 자동 호출됨. 
		// 현재 서블릿 클래스의 초기화를 담당 (최초의 요청에 의해 1회만 수행)
		num = 1;
		System.out.println("init 수행 : num=" + num);
	}
	/*
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get, post 요청 시 매번 수행 (service()가 doGet(), doPost()보다 우선순위가 높다.)
		// doGet, doPost를 호출 가능.
		// 참고 : jsp 파일은 service 메소드 만을 가진 파일
		num += 1;
		System.out.println("service 수행 num=" + num);
		
	//	doGet(request, response); // doGet 방식으로만 실행
		
	}
*/
//위의 service()를 주석 처리하면 요청 방식에 따라 doGet()과 doPost()를 모두 쓸 수 있다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 요청 시 매번 수행
		num += 1;
		System.out.println("doGet 수행 num=" + num);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 요청 시 매번 수행
		num += 1;
		System.out.println("doPost 수행 num=" + num);
	}

	public void destroy() {
		// 웹 서버 서비스가 종료되면 자동 호출됨. 
		// 마무리 작업 담당
		System.out.println("destroy 수행");
	}
}
>>>>>>> branch 'main' of https://github.com/joon9001/java_source.git
>>>>>>> branch 'main' of https://github.com/joon9001/java_source.git
