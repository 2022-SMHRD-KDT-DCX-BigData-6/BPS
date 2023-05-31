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

@WebServlet("/calendarUpdateService")
public class calendarUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");

		if (member != null) {

			String title = request.getParameter("title");
			String start = request.getParameter("start");
			String end = request.getParameter("end");

			String[] startArr = start.split(" ");
			String[] endArr = end.split(" ");

			switch (startArr[1]) {
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

			switch (endArr[1]) {
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

			start = startArr[3] + "-" + startArr[1] + "-" + startArr[2];
			end = endArr[3] + "-" + endArr[1] + "-" + endArr[2];

			CPCalendarDAO dao = new CPCalendarDAO();
			int result = dao.UpdateCalendar(title, start, end);

			if (result > 0) {
				System.out.println("수정 성공!");
			} else {
				System.out.println("수정 실패!");
			}
		} else {
			System.out.println("로그인을 해주세요~!");
		}

	}
}
