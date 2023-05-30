package com.cample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cample.model.CPCalendarDAO;

@WebServlet("/calendarInsertService")
public class calendarInsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String calendar_start = request.getParameter("start");
		String calendar_end = request.getParameter("end");
		String id = request.getParameter("id");
		
		System.out.println("title : " + title);
		System.out.println("start : " + calendar_start);
		System.out.println("end : " + calendar_end);
		System.out.println("id : " + id);
		
		
		String [] startArr = calendar_start.split(" ");
		String [] endArr = calendar_end.split(" ");
		
		switch(startArr[1]) {
		case "January": 
			startArr[1] = "01";
			break;
		case "February":
			startArr[1] = "02";
			break;
		case "March":
			startArr[1] = "03";
			break;
		case "April":
			startArr[1] = "04";
			break;
		case "May":
			startArr[1] = "05";
			break;
		case "June":
			startArr[1] = "06";
			break;
		case "July":
			startArr[1] = "07";
			break;
		case "August":
			startArr[1] = "08";
			break;
		case "September":
			startArr[1] = "09";
			break;
		case "October":
			startArr[1] = "10";
			break;
		case "November":
			startArr[1] = "11";
			break;
		case "December":
			startArr[1] = "12";
			break;
		}
		
		switch(endArr[1]) {
		case "January": 
			endArr[1] = "01";
			break;
		case "February":
			endArr[1] = "02";
			break;
		case "March":
			endArr[1] = "03";
			break;
		case "April":
			endArr[1] = "04";
			break;
		case "May":
			endArr[1] = "05";
			break;
		case "June":
			endArr[1] = "06";
			break;
		case "July":
			endArr[1] = "07";
			break;
		case "August":
			endArr[1] = "08";
			break;
		case "September":
			endArr[1] = "09";
			break;
		case "October":
			endArr[1] = "10";
			break;
		case "November":
			endArr[1] = "11";
			break;
		case "December":
			endArr[1] = "12";
			break;
		}
		
		calendar_start = startArr[3] + "-" + startArr[1] + "-" + startArr[2];
		calendar_end = endArr[3] + "-" + endArr[1] + "-" + endArr[2];
		
		CPCalendarDAO dao = new CPCalendarDAO();
		int result = dao.InsertCalendar(title, calendar_start, calendar_end, id);
		
		if (result > 0) {
			System.out.println("일정 등록 성공");
			
		} else {
			System.out.println("일정 등록 실패");
		}
		
	}
}














