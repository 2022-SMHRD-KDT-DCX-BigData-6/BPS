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

@WebServlet("/calendarDeleteService")
public class calendarDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");

		if (member != null) {
			String title = request.getParameter("title");
			System.out.println(title);

			CPCalendarDAO dao = new CPCalendarDAO();
			int result = dao.DeleteCalendar(title);

			if (result > 0) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
		} else {
			System.out.println("로그인을 해주세요~!");
		}

	}

}
