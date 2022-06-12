<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.freeboard.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    TableManager tm = new TableManager();
    boolean ret = tm.doselectmember(id, pw);
    if (ret) {
        session.setAttribute("username", id);
        response.sendRedirect("board.jsp");
    } else {
        out.println("<script>");
        out.println("alert('아이디와 비밀번호를 확인하세요');");
        out.println("location.href='index.jsp';");
        out.println("</script>");
    }
%>