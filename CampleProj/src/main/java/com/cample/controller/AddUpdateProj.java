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
 * Servlet implementation class TestServlet
 */
@WebServlet("/AddUpdateProj")
public class AddUpdateProj extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");
		// 로그인 되어 있는지 확인
		if (member != null) {
			String id = request.getParameter("id");
			String status = request.getParameter("status");
			String content = request.getParameter("content");
			CPProjectDAO dao = new CPProjectDAO();
			boolean check = dao.CheckMember(id); // 프로젝트 db에 기존에 있는 목록인지 확인
			if (!check) {
				int result = dao.InsertMember(id, status, content, member.getMem_id());
				if (result > 0) {
					System.out.println("등록 성공!");
				} else {
					System.out.println("등록 실패!");
				}
			} else {
				int result = dao.UpdateMember(id, status, content, member.getMem_id());
				if (result > 0) {
					System.out.println("수정 성공!");
				} else {
					System.out.println("수정 실패!");
				}
			}
		} else {
			System.out.println("로그인을 해주세요~!");
		}
	}

}
