<%@page import="com.cample.model.CPMemberDTO"%>
<%@page import="com.cample.model.CPCommentDAO"%>
<%@page import="com.cample.model.CPCommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.cample.model.CPBoardDAO"%>
<%@page import="com.cample.model.CPBoardDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>Forty by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <!-- <link rel="stylesheet" href="assets/css1/main.css" /> -->
      <link rel="stylesheet" href="assets/css1/board.css" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
<header id="header">
									<strong class="f">HomePage</strong>
									<ul class="icons">
										<li><a href="https://twitter.com" target=”_blank” class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="https://www.facebook.com/" target=”_blank” class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="https://www.youtube.com/" target=”_blank” class="icon brands fa-youtube"><span class="label">Youtube</span></a></li>
										<li><a href="https://www.instagram.com/" target=”_blank” class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="https://github.com/" target=”_blank” class="icon brands fa-brands fa-github"><span class="label">Github</span></a></li>
									</ul>
								</header> 
		<%
		String num = null;
				if(request.getParameter("num")!=null){
				num=request.getParameter("num");
				}
				System.out.print(num);
																						
			    CPBoardDTO boar= new CPBoardDAO().getboard(num); 
				String num1 = boar.getNum();
				System.out.print("DB에서 넘어온 num : " + num1);
		%>
		
		<%
			List<CPCommentDTO> board_list=new CPCommentDAO().getcomments(num1);
			System.out.print(board_list);
		%>
		
		<% 
			CPMemberDTO member=(CPMemberDTO)session.getAttribute("loginId");
			String name=member.getMem_name();
		%>
         <!-- Q19. 게시글 세부내용 조회 기능 -->   
         <div id = "board">
            <table id="list">
               <tr>
                  <td colspan="2">제목: <%=boar.getTitle() %> </td>
                  
               </tr>
               <tr>
                   <td colspan="2">작성자: <%=boar.getWriter() %> </td>
               </tr>
               <tr>
                  <td colspan="2">내용</td>
                  
               </tr>
               
               <tr>
                  <td colspan="2">
               		<%=boar.getContent() %>      
                  </td>
               </tr>
               
               <tr>
                   <td colspan="2"><h3>댓글 쓰기</h3> </td>
               </tr>
               <tr>
               		<td colspan="2"> <form action="WriteComment?num=<%=num1 %>&name=<%=name %>" method="post">
               		<input type="text" name="comments">
               		<input type="submit" value="작성하기">
               		</form>
               		 </td>
               </tr> 
               <tr>
                   <td><h3>댓글</h3>  </td>
                   <td><h3>작성자</h3>  </td>
               </tr>
               <%for(int i=0; i<board_list.size(); i++){ %>
               <tr>
               		<td>
               			<%=board_list.get(i).getComments() %>
               		</td>
               		<td><%=board_list.get(i).getName() %></td>
               </tr>
               <%} %>
               
               <tr>
                  <td colspan="2"><a href="BoardMain.jsp"><button>뒤로가기</button></a></td>
               </tr>
            </table>
         </div>
         <!-- Scripts -->
         <script src="assets/js1/jquery.min.js"></script>
         <script src="assets/js1/jquery.scrolly.min.js"></script>
         <script src="assets/js1/jquery.scrollex.min.js"></script>
         <script src="assets/js1/skel.min.js"></script>
         <script src="assets/js1/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="assets/js1/main.js"></script>
</body>
</html>