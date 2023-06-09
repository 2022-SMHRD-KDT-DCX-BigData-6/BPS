<%@page import="com.cample.model.CPMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>글쓰기</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <!-- <link rel="stylesheet" href="assets/css1/main.css" /> -->
      <link rel="stylesheet" href="assets/css1/board.css" />
      <link rel="stylesheet" href="assets/css/main4.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

		<script>
			function boardcheck() {
				let inputs=document.inputForm;
				if(!inputs.num.value){
					alert("번호를 입력하세요");
					return false;
				}
				if(!inputs.title.value){
					alert("제목을 입력하세요");
					return false;
				}
				if(!inputs.content.value){
					alert("내용을 입력하세요");
					return false;
				}
				
			}
		</script>
</head>
<body>
<header id="header">
									<h1 class="z">Board Form</h1>

								</header> 
         <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
         <%
         	CPMemberDTO member=(CPMemberDTO)session.getAttribute("loginId");
         	String writer=member.getMem_name();
         	
         %>
         
         <div id = "board">
            <form action="WriteService?writer=<%=writer %>" method="post" name="inputForm" onsubmit="return boardcheck();">
         <div class="find-btn">
         	<input type="submit" value="작성하기" class="button">
         </div>
            <!-- enctype 기본값:application/x-www-form-urlencoded  
            					> key value 형태로 데이터 전송 
            				: 파일 업로드 시 multipart/form-data
            					> 이미지 등과 같은 용량이 큰 데이터를 전송-->
            <table id="list">
            	<tr>
                  <td><h3 class="a1">번호</h3></td>
                  <td><input type="text" name="num"> </td>
               </tr>
               <tr>
                  <td><h3 class="a1">제목</h3></td>
                  <td><input type="text" name="title"> </td>
               </tr>
              <!--  <tr>
                  <td>작성자</td>
                  <td><input  type="text" name="writer"> </td>
               </tr> -->
               <tr>
                  <td colspan="2"><h3 class="a1">내용</h3></td>
               </tr>
               
               <tr>
                  <td colspan="2">
                     
                     <textarea  rows="10" name="content" style="resize: none;"></textarea>         
                  </td>
               </tr>
               
               <tr>
                  <td colspan="2">
                  
                  
                  <div class="find-btn2">
                     <input type="reset" value="초기화" class="button">
                  </div>
                  </td>
               </tr>
            </table>
            </form>
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