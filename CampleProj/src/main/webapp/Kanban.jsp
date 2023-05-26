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
	<h1>Kanban Board</h1>
	<button id="add">Add Card</button>
	<div class="dropzone-container">
		<div class="dropzone" id="create">
			<h3>list</h3>
		</div>
		<div class="dropzone">
			<h3>todo</h3>
		</div>
		<div class="dropzone">
			<h3>doing</h3>
		</div>
		<div class="dropzone">
			<h3>done</h3>
		</div>
	</div>
</body>
<script src="assets/js/Kanban.js"></script>
</html>