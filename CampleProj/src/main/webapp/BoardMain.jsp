<%@page import="com.cample.model.CPMemberDTO"%>
<%@page import="com.cample.model.CPBoardDAO"%>
<%@page import="com.cample.model.CPBoardDTO"%>
<%@page import="com.cample.model.CPMemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>게시판</title>
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
										         	<%
         	//session 값 가져오기
      			CPMemberDTO member=(CPMemberDTO)session.getAttribute("loginId");
         		ArrayList<CPBoardDTO> board_list = new ArrayList<>();
         		if (member != null) {
			 		CPBoardDAO dao = new CPBoardDAO();
         			board_list= dao.selall(member.getMem_college());
         		}
         	%>
							<!-- Banner -->

							<!-- Section -->

							<!-- Section -->

						</div>
						         <div id="board">
				<div class="bt">
				<%if (member != null){ %>
		            <a href="BoardWrite.jsp"><button class="button">작성하러가기</button></a>
		            <%}else{ %>
		            <a href="login.html"><button class="button">작성하러가기</button></a>
		            <%} %>
		        </div>
            <table id = "list">
               <tr>
                  <td><h3 class="a1">번호</h3></td>
                  <td><h3 class="a1">제목</h3></td>
                  <td><h3 class="a1">작성자</h3></td>
                  
               </tr>
               
               <%for(int i=0; i<board_list.size(); i++){ %>
               		<tr>
	                  <td><%=i+1 %></td>
	                  <%-- <td><a href="BoardDetail?num=<%= board_list.get(i).getNum()%>"><%=board_list.get(i).getTitle() %></a></td> --%>
	                  <td>
	                  <a href="BoardDetail.jsp?num=<%=board_list.get(i).getNum() %>" ><%=board_list.get(i).getTitle() %></a> 
	                  </td>
	                  <td><%=board_list.get(i).getWriter() %></td>
	                  
	               </tr>
               <%} %> 
            
            
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