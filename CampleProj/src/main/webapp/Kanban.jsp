<%@page import="com.cample.model.CPProjectDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cample.model.CPProjectDAO"%>
<%@page import="com.cample.model.CPMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main2.css" />
<title>test</title>
<script src="https://kit.fontawesome.com/652d42f858.js" crossorigin="anonymous"></script>
</head>
<body class="is-preload">
	<%
		CPMemberDTO loginId =(CPMemberDTO)session.getAttribute("loginId");
		if (loginId != null) {
			System.out.println(loginId.getMem_id());
			System.out.println(loginId.getMem_college());
		}
	%>
	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
								<h1 class="z">Project Management</h1>
						</div>
						  		<button id="add"><i class="fa-solid fa-plus"></i></button>
									<div class="dropzone-container">
										<div class="dropzone" id="create">
											<h3 class="list">List</h3>
										</div>
										<div class="dropzone" id="todo">
											<h3 class="todo">To-Do</h3>
										</div>
										<div class="dropzone" id="inprogress">
											<h3 class="inprogress">In-Progress</h3>
										</div>
										<div class="dropzone" id="done">
											<h3 class="done">Completed</h3>
										</div>
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
			<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
			<script src="assets/js/Kanban.js"></script>
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	
</body>
<%
	CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");
	ArrayList<CPProjectDTO> projList = new ArrayList<>();
	
	if (member != null) {
		CPProjectDAO dao = new CPProjectDAO();
		System.out.println(member.getMem_id());
		projList = dao.SelectAllProj(member.getMem_id());
	}
%>
<script>
	const listBox = document.getElementById("create");
	const todoBox = document.getElementById("todo");
	const inprogressBox = document.getElementById("inprogress");
	const doneBox = document.getElementById("done");
	const div = new Array(<%= projList.size()%>);
	const input = new Array(<%= projList.size()%>); 
	const deleteBtn = new Array(<%= projList.size()%>);
	const updateBtn = new Array(<%= projList.size()%>);
	console.log(listBox);
	console.log(listBox);
	<% for (int i = 0; i < projList.size(); i++ ) { %>
		div[<%=i%>] = document.createElement("div");
		div[<%=i%>].setAttribute("id", <%= projList.get(i).getId()%>)
		div[<%=i%>].setAttribute("draggable", "true");
		div[<%=i%>].setAttribute("class", "drag");
		<% if (projList.get(i).getStatus().equals("create")){ %>
			listBox.appendChild(div[<%=i%>]);
		<%} else if (projList.get(i).getStatus().equals("todo")) {%>
			todoBox.appendChild(div[<%=i%>]);
		<%} else if (projList.get(i).getStatus().equals("inprogress")) {%>
			inprogressBox.appendChild(div[<%=i%>]);
		<%} else if (projList.get(i).getStatus().equals("done")) {%>
			doneBox.appendChild(div[<%=i%>]);
	<%}%>
		
		input[<%=i%>] = document.createElement("input");
		div[<%=i%>].appendChild(input[<%=i%>]);
		input[<%=i%>].setAttribute("value", "<%=projList.get(i).getContent()%>");

		deleteBtn[<%=i%>] = document.createElement("button");
		updateBtn[<%=i%>] = document.createElement("button");
		deleteBtn[<%=i%>].classList.add("delete");
		updateBtn[<%=i%>].classList.add("update");
		deleteBtn[<%=i%>].innerText = "❌";
		updateBtn[<%=i%>].innerText = "✔";

		div[<%=i%>].appendChild(deleteBtn[<%=i%>]);
		div[<%=i%>].appendChild(updateBtn[<%=i%>]);
		
		
		deleteBtn[<%=i%>].addEventListener("click", (event) => {
			div[<%=i%>].remove();
			const id = event.target.parentNode.id;
			$.ajax({
				url: "./DeleteProj?id="+id,
				success: function(data) {
					console.log("success");
				},
				error: function(xhr, status) {
					console.log("Failed");
				},
				complete: function(xhr, status) {
					console.log("Complete");
				}
			});
		});
		
		updateBtn[<%=i%>].addEventListener("click", (event) => {
			const id = event.target.parentNode.id;
			const status = event.target.parentNode.parentNode.id;
			const content = event.target.parentNode.children[0].value;
			$.ajax({
				url: "./AddUpdateProj?id="+id+"&status="+status+"&content="+content,
				success: function(data) {
					console.log("success");
				},
				error: function(xhr, status) {
					console.log("Failed");
				},
				complete: function(xhr, status) {
					console.log("Complete");
				}
			});
		});
	<%} %>
	</script>
</html>