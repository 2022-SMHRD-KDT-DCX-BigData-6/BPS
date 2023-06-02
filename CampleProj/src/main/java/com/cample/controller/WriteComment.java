package com.cample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cample.model.CPCommentDAO;
import com.cample.model.CPCommentDTO;




@WebServlet("/WriteComment")
public class WriteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comments=request.getParameter("comments");
		String num=request.getParameter("num");
		String name=request.getParameter("name");
		System.out.println(comments);
		System.out.println(name);
		 
		if(comments!="") {
			CPCommentDTO dto = new CPCommentDTO(comments);
			CPCommentDAO dao= new CPCommentDAO();
			int cnt=dao.commentUpload(dto,num,name);
			
			if(cnt>0) {
				/*
				 * HttpSession session=request.getSession(); session.setAttribute("com", com);
				 */
				System.out.println("success");
			}
			else {
				System.out.println("fail");
			}
		}
		response.sendRedirect("BoardMain.jsp");
		
		
	}

}
