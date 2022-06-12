<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="com.example.freeboard.Member" %>
<%

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    Member member = new Member();
    member.setId(id);
    member.setPassword(password);

    TableManager tm = new TableManager();
    tm.doinsertmember(member);
    response.sendRedirect("member.jsp");

%>