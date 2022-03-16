<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
request jsp 내장객체
<%
	String a = request.getParameter("id");
	out.println("a = "+a);
	String b = request.getParameter("pw");
	out.println("b = "+b);
%>

</body>
</html>