<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="com.example.freeboard.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String idx = request.getParameter("idx");
    if(idx == null) idx = "1";

    TableManager tm = new TableManager();
    Member member = tm.doselectmemberinfo(Integer.parseInt(idx));
    //int pagecnt = tm.getPageCnt();
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
    <h1>memberinfo.jsp</h1>
    <div class="row">
        <div class="col">
            <table class="table table-hover">
                <tr>
                    <th>ID : <%=member.getId()%></th>
                </tr>
                <tr>
                    <th>PASSWORD : <%=member.getPassword()%></th>
                </tr>
            </table>
        </div>
    </div>
    <div class="mb-3">
        <a class="btn btn-primary" href="updatemember.jsp?idx=<%=member.getIdx()%>">글수정</a>
        <a class="btn btn-primary" href="deletememberproc.jsp?idx=<%=member.getIdx()%>">글삭제</a>
    </div>
</div>
</body>
</html>
