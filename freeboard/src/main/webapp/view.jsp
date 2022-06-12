<%@ page import="com.example.freeboard.BoardManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.freeboard.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idx = request.getParameter("idx");
    if(idx == null) idx = "1";

    BoardManager bm = new BoardManager();
    Board board = bm.doselectrow(Integer.parseInt(idx));
    //int pagecnt = bm.getPageCnt();
//    out.println("pagecnt = "+pagecnt);

%>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container">
    <h1>view.jsp</h1>
    <div class="row">
        <div class="col">
            <table class="table table-hover">
                <tr class="table-primary">
                    <th class="display-4"><%=board.getTitle()%></th>
                </tr>
                <tr class="table-primary">
                    <th><%=board.getWdate()%></th>
                </tr>
                <tr>
                    <td class="p-1" style="height: 20rem"><%=board.getContent()%></td>
                </tr>
                <tr class="table-primary">
                    <th><%=board.getName()%></th>
                </tr>
            </table>
        </div>
    </div>
    <div class="mb-3">
        <a class="btn btn-primary" href="update.jsp?idx=<%=board.getIdx()%>">글수정</a>
        <a class="btn btn-primary" href="deleteproc.jsp?idx=<%=board.getIdx()%>">글삭제</a>
    </div>
</div>
</body>
</html>
