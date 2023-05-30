<%@page import="com.cample.model.CPMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>CAMPLE</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
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

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1 class="d"><span class="e">C</span><span class="e">A</span><span class="e">M</span><span class="e">P</span><span class="e">L</span><span class="e"></span><span class="e">E</span></h1>
											<p class="c">대학생 위주의 협업 프로그램</p>
										</header>
										<p class="a">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra</p>
										<ul class="actions">
										<%
											CPMemberDTO loginId =(CPMemberDTO)session.getAttribute("loginId");
											if (loginId != null) {
												System.out.println(loginId.getMem_id());
												System.out.println(loginId.getMem_college());
											}
										%>
										<%
											if (loginId == null) {%>
												<li><a href="login.html" class="button">LOGIN</a></li>
											<%} else { %>
												<li><a href="logoutService" class="button">LOGOUT</a></li>
												<li><%=loginId.getMem_id() + "님 환영합니다." %></li>
											<%}
										%>
										</ul>
									</div>
									<span class="image object">
										<img src="images/pic12.jpg" class="image" alt="" />
									</span>
								</section>

							<!-- Section -->

							<!-- Section -->

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
										<li><a href="main.html" class="a">홈페이지</a></li>
										<%
											if (loginId == null) {%>
												<li><a href="generic.html" class="a">대학교</a></li>
												<%} else {
														if (loginId.getMem_college().equals("전남대학교")){%>
															<li><a href="generic.html" class="a">전남대학교</a></li>
														<%} else if (loginId.getMem_college().equals("서울대학교")) {%>
															<li><a href="generic.html" class="a">서울대학교</a></li>
														<%} else {%>
															<li><a href="generic.html" class="a">대학교</a></li>
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