<%@page import="com.cample.model.CPMemberDTO"%>
<%@page import="com.cample.model.CPCommentDAO"%>
<%@page import="com.cample.model.CPCommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.cample.model.CPBoardDAO"%>
<%@page import="com.cample.model.CPBoardDTO"%>
<%@page import="com.cample.model.CPMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>CAMPLE</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css1/board.css" />
		<link rel="stylesheet" href="assets/css/main4.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<h1 class="z">Noticeboard</h1>
										<%
											CPMemberDTO loginId =(CPMemberDTO)session.getAttribute("loginId");
											if (loginId != null) {
												System.out.println(loginId.getMem_id());
												System.out.println(loginId.getMem_college());
											}
										%>
										

							<!-- Section -->

							<!-- Section -->

						</div>
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
         <hr class="hr1">
            <table id="list">
               <tr>
                  <td colspan="2"><h3 class="a1">제목: <%=boar.getTitle() %> </h3></td>
                  
               </tr>
               <tr>
                   <td colspan="2" class="a">작성자: <%=boar.getWriter() %> </td>
               </tr>
               <tr>
                  <td colspan="2" class="a"><h3 class="a1">내용</h3></td>
                  
               </tr>
               
               <tr>
                  <td colspan="2" class="a">
               		<%=boar.getContent() %>      
                  </td>
               </tr>
               </table>
               <hr class="hr1">
               <table>
               <tr>
                   <td colspan="2"><h3 class="a1">댓글 쓰기</h3> </td>
               </tr>
               <tr>
               		<td colspan="2"> <form class="fo" action="WriteComment?num=<%=num1 %>&name=<%=name %>" method="post" name="inputForm" onsubmit="return commentcheck();">
               		<input type="text" name="comments">
               	<div class="btn-find3">
               		<input type="submit" value="작성하기" class="button">
               	</div>
               		</form>
               		 </td>
               </tr> 
               </table>
               <hr class="hr1">
               <table>
               <tr>
                   <td><h3 class="a1">댓글</h3>  </td>
                   <td><h3 class="a1">작성자</h3>  </td>
               </tr>
               <%for(int i=0; i<board_list.size(); i++){ %>
               <tr>
               		<td class="a">
               			<%=board_list.get(i).getComments() %>
               		</td>
               		<td class="a"><%=board_list.get(i).getName() %></td>
               </tr>
               <%} %>
               
               <tr>
                  <td colspan="2"><a href="BoardMain.jsp"><button class="button" style="	display: inline-block;
	text-align: center;">뒤로가기</button></a></td>
               </tr>
               </table>
         </div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2 class="b">Menu</h2>
									</header>
									<ul>
										<li><a href="main.jsp" class="a">홈페이지</a></li>
										<%
											if (loginId == null) {%>
												<li><a href="school.html" class="a">학교 별 학과 일정</a></li>
												<%} else {
														if (loginId.getMem_college().equals("전남대학교")){%>
															<li><a href="전남대학교_페이지.html" class="a">전남대학교</a></li>
														<%} else if (loginId.getMem_college().equals("서울대학교")) {%>
															<li><a href="서울대학교_페이지.html" class="a">서울대학교</a></li>
														<%} else if (loginId.getMem_college().equals("광주대학교")) {%>
															<li><a href="광주대학교_페이지.html" class="a">광주대학교</a></li>
														<%} else {%>
															<li><a href="school.html" class="a">학교 별 학과일정</a></li>
														<%}
												}
										%>
										<li><a href="Kanban.jsp" class="a">일정관리</a></li>
										<li><a href="campleCalendar.jsp" class="a">캘린더</a></li>
										<li>
											<span class="opener">게시판</span>
											<ul>
												<li><a href="BoardMain.jsp">자유게시판</a></li>
												<li><a href="#">홍보게시판</a></li>
												<li><a href="#">정보게시판</a></li>
											</ul>
<!-- 										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul> -->
								</nav>
								

							<!-- Section -->
								<section>
									<header class="major">

							<!-- Section -->

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>