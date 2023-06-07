<%@page import="com.cample.model.CPBoardDAO"%>
<%@page import="com.cample.model.CPBoardDTO"%>
<%@page import="com.cample.model.CPMemberDTO"%>



<%@page import="java.util.List"%>

<%@page import="java.util.ArrayList"%>
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
         <!-- Q17. 게시글 목록 조회 기능 -->
         <!-- webboard 테이블에 있는 모든 게시글 출력
         	select * from webboard order by b_date desc -->
         	<%
         	//session 값 가져오기
      			CPMemberDTO member=(CPMemberDTO)session.getAttribute("loginId");
         		ArrayList<CPBoardDTO> board_list = new ArrayList<>();
         		if (member != null) {
			 		CPBoardDAO dao = new CPBoardDAO();
         			board_list= dao.selall(member.getMem_college());
         		}
         	%>
         	
         <!-- Q18. 게시글 목록 세부페이지 기능(제목을 클릭하면 세부페이지 BoardDetail.jsp로 이동)-->
         <div id="board">
            <table id = "list">
               <tr>
                  <td>번호</td>
                  <td>제목</td>
                  <td>작성자</td>
                  
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
            
            <a href="main.jsp"><button id="writer">홈으로가기</button></a>
            <a href="BoardWrite.jsp"><button id="writer">작성하러가기</button></a>
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