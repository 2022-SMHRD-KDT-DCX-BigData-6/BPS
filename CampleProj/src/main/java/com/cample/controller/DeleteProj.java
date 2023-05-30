package com.cample.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cample.model.CPMemberDTO;
import com.cample.model.CPProjectDAO;

/**
 * Servlet implementation class DeleteProj
 */
@WebServlet("/DeleteProj")
public class DeleteProj extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");
		// 로그인 되어 있는지 확인
		if (member != null) {
			String id = request.getParameter("id");
			CPProjectDAO dao = new CPProjectDAO();
			int result = dao.DeleteMember(id); // 프로젝트 db에 기존에 있는 목록인지 확인
			
			if (result > 0) {
				System.out.println("삭제 성공!");
			} else {
				System.out.println("삭제 실패!");
			}
		} else {
			System.out.println("로그인을 해주세요~!");
		}
	}

}
