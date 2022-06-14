<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="com.example.freeboard.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idx = request.getParameter("idx");
    String id = session.getAttribute("username").toString();
    String password = request.getParameter("password");

    Member member = new Member();
    member.setIdx(Integer.parseInt(idx));
    member.setId(id);
    member.setPassword(password);

    TableManager tm = new TableManager();
    tm.doupdatemember(member);

    response.sendRedirect("member.jsp");
%>