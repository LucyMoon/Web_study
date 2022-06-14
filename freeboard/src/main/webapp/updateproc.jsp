<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.freeboard.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idx = request.getParameter("idx");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String name = request.getParameter("name");

    Board board = new Board();
    board.setTitle(title);
    board.setContent(content);
    board.setIdx(Integer.parseInt(idx));

    TableManager tm = new TableManager();
    tm.doupdate(board);

    response.sendRedirect("board.jsp");
%>