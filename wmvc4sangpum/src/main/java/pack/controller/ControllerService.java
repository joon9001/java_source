package pack.controller;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class ControllerService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//방법1: parameter를 요청으로 사용
		//String command = request.getParameter("command");
		
		//방법 2 : 파일명을 요청으로 사용
		String ss = request.getRequestURI();
		// ss: /wmvc4sangpum/sang.do 이런식으로 들어옴
		int idx = ss.lastIndexOf('/');
		StringTokenizer st = new StringTokenizer(ss.substring(idx+1),".");
		ss = st.nextToken();  // 배열 이동
		//System.out.println("ss : " + ss);  //ss: sang, ss: jikwon과 같이 파일명 출력
		
		String command = ss;
		CommandInter inter = null;
		String viewName = "/WEB-INF/views/";
		
		try {
			if(command.equals("sang")) {
				inter = new SangpumImpl();
				viewName += inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("jikwon")) {
				//...
			}else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println("service err : " + e);
		}
	}

}
