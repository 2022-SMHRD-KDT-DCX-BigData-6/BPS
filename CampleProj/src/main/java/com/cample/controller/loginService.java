package com.cample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cample.model.CPMemberDAO;
import com.cample.model.CPMemberDTO;

@WebServlet("/loginService")
public class loginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mem_id = request.getParameter("id");
		String mem_pw = request.getParameter("pw");
		
		CPMemberDAO dao = new CPMemberDAO();
		CPMemberDTO member = dao.selectMember(mem_id, mem_pw);
		
		if (member!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", member);
			System.out.println("로그인 한 아이디 : " + mem_id);
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("로그인 실패");
			response.sendRedirect("login.html");
		}
		
	}

}
