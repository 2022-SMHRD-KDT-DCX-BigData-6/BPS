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
			case "Jan":
				startArr[1] = "01";
				break;
			case "Feb":
				startArr[1] = "02";
				break;
			case "Mar":
				startArr[1] = "03";
				break;
			case "Apr":
				startArr[1] = "04";
				break;
			case "May":
				startArr[1] = "05";
				break;
			case "Jun":
				startArr[1] = "06";
				break;
			case "Jul":
				startArr[1] = "07";
				break;
			case "Aug":
				startArr[1] = "08";
				break;
			case "Sep":
				startArr[1] = "09";
				break;
			case "Oct":
				startArr[1] = "10";
				break;
			case "Nov":
				startArr[1] = "11";
				break;
			case "Dec":
				startArr[1] = "12";
				break;
			}

			switch (endArr[1]) {
			case "Jan":
				endArr[1] = "01";
				break;
			case "Feb":
				endArr[1] = "02";
				break;
			case "Mar":
				endArr[1] = "03";
				break;
			case "Apr":
				endArr[1] = "04";
				break;
			case "May":
				endArr[1] = "05";
				break;
			case "Jun":
				endArr[1] = "06";
				break;
			case "Jul":
				endArr[1] = "07";
				break;
			case "Aug":
				endArr[1] = "08";
				break;
			case "Sep":
				endArr[1] = "09";
				break;
			case "Oct":
				endArr[1] = "10";
				break;
			case "Nov":
				endArr[1] = "11";
				break;
			case "Dec":
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
