package com.cample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cample.model.CPMemberDAO;

@WebServlet("/joinService")
public class joinService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("id");
		String mem_pw = request.getParameter("pw");
		String mem_name = request.getParameter("name");
		String mem_college = request.getParameter("college");
		
		CPMemberDAO dao = new CPMemberDAO();
		int result = dao.InsertMember(mem_id, mem_pw, mem_name, mem_college);
		
		if (result > 0) {
			System.out.println("회원 정보 등록 성공");
			response.sendRedirect("login.html");
		} else {
			System.out.println("회원 정보 등록 실패");
			response.sendRedirect("login.html");
			
		}
		
	}

}
