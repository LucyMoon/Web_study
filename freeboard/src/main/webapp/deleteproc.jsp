<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.freeboard.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idx = request.getParameter("idx");

    TableManager tm = new TableManager();
    tm.dodelete(Integer.parseInt(idx));

    response.sendRedirect("board.jsp");
%>