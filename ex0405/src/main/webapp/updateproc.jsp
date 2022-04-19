<%@page import="ex0405.MemberDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex0405.*" %>
<%
	String u = request.getParameter("username");
	String p = request.getParameter("password");
	String i = request.getParameter("id");
	
	MemberDBManager mdm = new MemberDBManager();
	out.println("username : " + u);
	out.println("username : " + p);

	mdm.doUpdate(u, p, i);
	
	response.sendRedirect("select.jsp");
	%>