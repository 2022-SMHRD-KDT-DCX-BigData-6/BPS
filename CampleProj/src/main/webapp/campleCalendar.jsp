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
<link href='calMain.css' rel='stylesheet' />
<script src='calMain.js'></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	<%
	CPMemberDTO member = (CPMemberDTO) session.getAttribute("loginId");
	
	ArrayList<CPCalendarDTO> calendarList = new ArrayList<>();
	CPCalendarDAO cpDao = new CPCalendarDAO();
	calendarList = cpDao.selectAllCalendar(member.getMem_id());
	%>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2023-05-01', // 초기 로딩 날짜
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) { // 일정 생성
        var title = prompt('Event Title:');
      	
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
          
          $.ajax({
              url: "calendarInsertService",
              data: {
            	'title':title,  
            	'start':arg.start,
            	'end':arg.end,
            	'id':"<%=member.getMem_id()%>"
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
      
      // 일정 삭제
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
        
        $.ajax({
            url: "calendarDeleteService",
            data: {'title':arg.event.title},
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
        
        
      },
      
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
    	  <%for (int i = 0; i < calendarList.size(); i++) {%>
      	{
      		title: '<%=calendarList.get(i).getCalendar_title()%>',
      		start: '<%=calendarList.get(i).getCalendar_start()%>',
      		end: '<%=calendarList.get(i).getCalendar_end()%>'
      	},
      	<%}%>
         /* {
          title: 'All Day Event',
          start: '2020-09-01'
        },
        {
          title: 'Long Event',
          start: '2020-09-07',
          end: '2020-09-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2020-09-11',
          end: '2020-09-13'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T10:30:00',
          end: '2020-09-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2020-09-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2020-09-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2020-09-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2020-09-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-09-28'
        }  */
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
