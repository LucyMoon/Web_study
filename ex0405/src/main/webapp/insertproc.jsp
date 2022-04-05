<%@page import="ex0405.MemberDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String u = request.getParameter("username");
	String p = request.getParameter("password");

	MemberDBManager mdm = new MemberDBManager();
	mdm.doInsert(u, p);
	
	out.println("insert 했음");
	
	response.sendRedirect("select.jsp");
	%>