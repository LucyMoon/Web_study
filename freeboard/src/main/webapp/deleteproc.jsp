<%@ page import="com.example.freeboard.BoardManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.freeboard.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idx = request.getParameter("idx");

    BoardManager bm = new BoardManager();
    bm.dodelete(Integer.parseInt(idx));

    response.sendRedirect("board.jsp");
%>