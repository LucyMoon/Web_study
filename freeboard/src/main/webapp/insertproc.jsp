<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="com.example.freeboard.Board" %>
<%

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String name = request.getParameter("name");

    Board board = new Board();
    board.setTitle(title);
    board.setName(name);
    board.setContent(content);

    TableManager tm = new TableManager();
    tm.doinsert(board);
    response.sendRedirect("board.jsp");

%>