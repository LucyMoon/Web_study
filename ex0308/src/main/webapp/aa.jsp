<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ex0308.AA" %>
<%
	//메모리화 한다. 인스턴스화
	//메모리에 올린다.
	AA a1 = new AA();
	int b = 20;
	a1.doA();
	int c = a1.doB();
	String d = a1.doC();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.aa{
		background-color: red;
	}
</style>
</head>
<body>
1. aa
2. bb
<div class="aa">
<% out.println(c); %><br>
<%=d%><br>
<%=LocalDateTime.now()%>
</div>
</body>
</html>