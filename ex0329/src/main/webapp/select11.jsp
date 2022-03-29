<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.Member" %>
<%@page import="java.util.ArrayList" %>
<%@page import="member.DriverTest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	DriverTest dt = new DriverTest();
	ArrayList<Member> al = dt.doSelect();
	out.println(al);
%>
<hr>
<%
	for(Member member : al){
		out.println(member+"<br>");
	}
%>
<hr>
<table border="1">
	<thead>
		<tr><th>ID</th><th>USERNAME</th><th>PASSWORD</th></tr>
	</thead>
	<tbody>
	
<%
	for(Member member : al){
		out.println("<tr><td>"+member.getId()+"</td>"+
					"<td>"+member.getUsername()+"</td>"+
					"<td>"+member.getPassword()+"</td></tr>");
	}
%>
	</tbody>
</table>
<a href="index.jsp">메뉴로</a>
</body>
</html>