package com.cample.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.cample.model.CPBoardDAO;
import com.cample.model.CPBoardDTO;
import com.cample.model.CPMemberDTO;

@WebServlet("/WriteService")
public class WriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");

		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");
		
		/*
		 * System.out.println("번호:"+num); System.out.println("제목"+title);
		 * System.out.println("내용"+content);
		 */

		
			if (member != null) {
				
				
					String campus = member.getMem_college();
					System.out.println(member.getMem_college());
		
					System.out.println(num);
					CPBoardDTO dto = new CPBoardDTO(num, title, writer, content);
		
					CPBoardDAO dao = new CPBoardDAO();
					int cnt = dao.boardUpload(dto, campus,writer);
		
					/* boardDTO com = dao.selectMember(title, writer, content); */
					
					if (cnt > 0) {
						/*
						 * HttpSession session=request.getSession(); session.setAttribute("com", com);
						 */
						System.out.println("success");
					} else {
						System.out.println("fail");
					}
				
	
			} else {
				System.out.println("로그인을 해주세요~!");
			}
			
		response.sendRedirect("BoardMain.jsp");
	}

}
