<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>Forty by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="assets/css1/main.css" />
      <link rel="stylesheet" href="assets/css1/board.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
         <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
         <div id = "board">
            <form action="WriteService" method="post" >
            <!-- enctype 기본값:application/x-www-form-urlencoded  
            					> key value 형태로 데이터 전송 
            				: 파일 업로드 시 multipart/form-data
            					> 이미지 등과 같은 용량이 큰 데이터를 전송-->
            <table id="list">
            	<tr>
                  <td>번호</td>
                  <td><input type="text" name="num"> </td>
               </tr>
               <tr>
                  <td>제목</td>
                  <td><input type="text" name="title"> </td>
               </tr>
               <tr>
                  <td>작성자</td>
                  <td><input  type="text" name="writer"> </td>
               </tr>
               <tr>
                  <td colspan="2">내용</td>
               </tr>
               
               <tr>
                  <td colspan="2">
                     
                     <textarea  rows="10" name="content" style="resize: none;"></textarea>         
                  </td>
               </tr>
               
               <tr>
                  <td colspan="2">
                     <input type="reset" value="초기화">
                     <input type="submit" value="작성하기">
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