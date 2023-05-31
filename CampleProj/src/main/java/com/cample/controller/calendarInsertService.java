package com.cample.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cample.model.CPCalendarDAO;
import com.cample.model.CPMemberDTO;

@WebServlet("/calendarInsertService")
public class calendarInsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");
		
		if (member != null) {
			String title = request.getParameter("title");
			String calendar_start = request.getParameter("start");
			String calendar_end = request.getParameter("end");
			String id = member.getMem_id();
			
			System.out.println("title : " + title);
			System.out.println("start : " + calendar_start);
			System.out.println("end : " + calendar_end);
			System.out.println("id : " + id);
			
			
			CPCalendarDAO dao = new CPCalendarDAO();
			int result = dao.InsertCalendar(title, calendar_start, calendar_end, id);
			
			if (result > 0) {
				System.out.println("일정 등록 성공");
				
			} else {
				System.out.println("일정 등록 실패");
			}
		} else {
			System.out.println("로그인을 해주세요~!");
		}
	}
}














