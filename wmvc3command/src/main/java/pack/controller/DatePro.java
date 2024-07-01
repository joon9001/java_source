package pack.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pack.model.DateModel;

public class DatePro implements CommandInter{
	public String showData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		DateModel dateModel = new DateModel(); // 원래는 싱글톤 처리
		ArrayList<String> list = dateModel.getDate();
		request.setAttribute("datas", list);
				return "view2.jsp";
	}
}
