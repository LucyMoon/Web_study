<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
<link href="./mystyle.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="main">
	<h1>insert페이지</h1>
	<form action ="insertproc.jsp">
		username <br>
		<input type ="text" name="username"/><br>
		password <br>
		<input type ="text" name="password"/><br>
		<input type ="submit" value="저장"/><br>
	</form>
</div>
</body>
</html>