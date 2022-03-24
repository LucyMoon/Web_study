<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="aaa.DriverTest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String u = request.getParameter("username");
	String p = request.getParameter("password");
	
	out.println("u = "+u);
	out.println("p = "+p);
	
	DriverTest dt = new DriverTest();
	String ret = dt.doInsert(u, p);
	if(ret.equals("suc"))
		response.sendRedirect("index.jsp");
	else
		out.println("insert 실패");
%>
</body>
</html>