<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0405.MemberDBManager" %>
<%@page import="ex0405.Member" %>
<%
	String id = request.getParameter("id");
	MemberDBManager mdm = new MemberDBManager();
	Member member = mdm.doSelectone(id);
%>
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
	<h1>update페이지</h1>
	<form action ="updateproc.jsp">
		<input type="hidden" name="id" value="<%=id%>"/>
		username <br>
		<input type ="text" name="username" value="<%=member.getUsername() %>"/><br>
		password <br>
		<input type ="text" name="password" value="<%=member.getPassword() %>"/><br>
		<input type ="submit" value="저장"/><br>
	</form>
</div>
</body>
</html>