<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%
    String idx = request.getParameter("idx");
%>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container">
    <h1>updatemember.jsp</h1>
    <form action="updatememberproc.jsp">
        <input type="hidden" name="idx" value="<%=idx%>">
        아이디 <input type="text" class="form-control mb-3" name="id" placeholder="ID"/>
        패스워드 <input class="form-control mb-3" placeholder="PASSWORD" name="password"/>
        <input class="btn btn-primary" type="submit" value="저장"/>
    </form>
</div>
</body>
</html>
