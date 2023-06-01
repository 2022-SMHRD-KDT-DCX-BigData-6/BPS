<%@page import="com.cample.model.CPMemberDTO"%>
<%@page import="com.cample.model.CPCalendarDAO"%>
<%@page import="com.cample.model.CPCalendarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='assets/css/calMain.css' rel='stylesheet' />
<script src='assets/js/calMain.js'></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
<body>

	<div id='calendar'></div>

</body>
</html>
