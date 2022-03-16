<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		padding: 10px;
		margin: 10px;
	}
	#adiv{
		background-color: pink;
	}
	#bdiv{
		background-color: pink;
	}
</style>
</head>
<body>
 <div id="adiv">
	 <form action="b.jsp" method="post">
		아이디<input type="text" name="id">
		비번<input type="text" name="pw">
		<input type="submit" value="전송">
	</form>
 </div>
 <div id="bdiv">
	두개의 넣기 +, -
	<form action="c.jsp" method="post">
		숫자 : <input type="text" name="num1"><br>
		숫자 : <input type="text" name="num2"><br>
		<input type="submit" value="전송">
	</form>
 </div>
</body>
</html>