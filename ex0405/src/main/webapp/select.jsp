<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ex0405.MemberDBManager"%>
<%@ page import="ex0405.Member"%>
<%@ page import="java.util.List"%>
<%
	MemberDBManager mdm = new MemberDBManager();
	List<Member> list = mdm.doselect();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400"
	rel="stylesheet">
<link href="./mystyle.css" rel="stylesheet">
</head>
<body>
	<%@ include file="nav.jsp"%>
	<form action="delete.jsp">
		<div class="main">
			<h1>select페이지</h1>
			<table class="table">
				<tr>
					<th>#</th>
					<th>ID</th>
					<th>USERNAME</th>
					<th>PASSWORD</th>
				<tr>
					<% for (Member member : list){ %>
				
				<tr>
					<td><input type="checkbox" name="id"
						value="<%=member.getId() %>" /></td>
					<td><%=member.getId() %></td>
					<td><a href="update.jsp?id=<%=member.getId() %>">
							<%out.println(member.getUsername()); %>
					</a></td>
					<td><%=member.getPassword() %></td>
				<tr>
					<% }%>
				
			</table>
			<input type="submit" value="삭제" />
		</div>
	</form>
</body>
</html>