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
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/Kanban.css" />
</head>
<body>
	<h1>Project Management</h1>
	<button id="add">추가</button>
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
		deleteBtn[<%=i%>].innerText = "X";
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="assets/js/Kanban.js"></script>
</html>