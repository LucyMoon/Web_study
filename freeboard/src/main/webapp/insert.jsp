<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container">
    <h1>insert.jsp</h1>
    <form action="insertproc.jsp">
        제목 <input type="text" class="form-control mb-3" name="title" placeholder="title"/>
        <textarea class="form-control mb-3" placeholder="content" rows="10" name="content"></textarea>
        작성자 <input class="form-control mb-3" type="text" name="name" placeholder="name"/>
        <input class="btn btn-primary" type="submit" value="저장"/>
    </form>
</div>
</body>
</html>
