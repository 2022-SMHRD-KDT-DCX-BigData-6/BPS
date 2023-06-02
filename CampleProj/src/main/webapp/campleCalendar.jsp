<%@page import="com.cample.model.CPMemberDTO"%>
<%@page import="com.cample.model.CPCalendarDAO"%>
<%@page import="com.cample.model.CPCalendarDTO"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="assets/css/main3.css" />
<script src='assets/js/calMain.js'></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Calendar</title>
<script src="https://kit.fontawesome.com/652d42f858.js" crossorigin="anonymous"></script>
<script>

<%CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");

ArrayList<CPCalendarDTO> calendarList = new ArrayList<>();
if (member != null) {
	CPCalendarDAO cpDao = new CPCalendarDAO();
	calendarList = cpDao.selectAllCalendar(member.getMem_id());
}%>



  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: new Date(), // 초기 로딩 날짜
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) { // 일정 생성
        var title = prompt('일정을 입력해주세요 : ');
      	
        if (title) {
        	var uniqueKey = Date.now();
            calendar.addEvent({
            id: uniqueKey,
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
          })
          
          $.ajax({
              url: "calendarInsertService",
              data: {
            	'title':title,  
            	'start':arg.startStr,
            	'end':arg.endStr,
            	'id':calendar.getEventById(uniqueKey)._def.publicId
              },
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
          
        }
        calendar.unselect()
      },
      
   // 일정수정
  	 eventDrop: function(info){
  		console.log(info);
  		if(confirm("일정을 옮기시겠습니까?")){
	 		title = info.event._def.title;
	  		start = info.event._instance.range.start;
	  		end = info.event._instance.range.end;
	  		
	  		
	  		$.ajax({
	             url: "calendarUpdateService",
	             data: {
	             	'start' : info.event._instance.range.start,
	             	'end' : info.event._instance.range.end,
	             	'key' : info.event._def.publicId
	             },
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
  			
  		} else {
  			location.reload();
  		}
  		
  		
  	},
  	
  	// eventresize
  	
  		eventResize: function(arg){
  		console.log(arg);
  		var result = confirm('일정을 수정하시겠습니까?');
  		if(result == true){
  			
  			$.ajax({
	             url: "calendarUpdateService",
	             data: {
	             	'start' : arg.event._instance.range.start,
	             	'end' : arg.event._instance.range.end,
	             	'key' : arg.event._def.publicId
	             },
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
  		} else {
  			location.reload();
  		}
  	},
     
      // 일정 삭제
      eventClick: function(arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
          arg.event.remove()
	        $.ajax({
	            url: "calendarDeleteService",
	            data: {'key':arg.event._def.publicId},
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
        }
        
      },
      
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
    	  <%for (int i = 0; i < calendarList.size(); i++) {%>
      	{
      		id: '<%=calendarList.get(i).getCalendar_key()%>',
      		title: '<%=calendarList.get(i).getCalendar_title()%>',
      		start: '<%=calendarList.get(i).getCalendar_start()%>',
      		end: '<%=calendarList.get(i).getCalendar_end()%>'
      	},
      	<%}%>
        
      ]
    });

    calendar.render();
  });
  
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
</style>
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
								<h1 class="z">Calendar</h1>
						</div>
<!-- 						  		<button id="add"><i class="fa-solid fa-plus"></i></button>
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
									</div>   -->
									
									<div id='calendar'></div>
									
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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	
</body>

</html>