<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String a = request.getParameter("text");
	int b = Integer.parseInt(request.getParameter("loop"));
	for(int i = 0; i < b; i++){
		out.print(a+"<br>");
	}
%>
</body>
</html>