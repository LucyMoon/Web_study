<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ex0405.MemberDBManager"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	MemberDBManager mdm = new MemberDBManager();
	boolean ret = mdm.loginchk(username, password);
	if (ret) {
		session.setAttribute("username", username);
		response.sendRedirect("index.jsp");
	} else {
		out.println("<script>");
		out.println("alert('아이디와 비밀번호를 확인하세요');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	}
%>