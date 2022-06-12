<%@ page import="com.example.freeboard.TableManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.freeboard.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String pagenum = request.getParameter("pagenum");
    if(pagenum == null) pagenum = "1";

    TableManager tm = new TableManager();
    List<Member> list = tm.MemberList(Integer.parseInt(pagenum));
    int pagecnt = tm.getMemberCnt();
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
    <h1>member.jsp</h1>

    <table class="table table-hover">
        <thead>
        <tr class="table-primary">
            <th scope="col">순번</th>
            <th scope="col">아이디</th>
            <th scope="col">패스워드</th>
        </tr>
        </thead>
        <tbody>
        <% for(Member member: list) {%>
        <tr>
            <th scope="row"><a href="memberinfo.jsp?idx=<%=member.getIdx()%>"/><%=member.getIdx()%></th>
            <td><%=member.getId()%></td>
            <td><%=member.getPassword()%></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a class="btn btn-primary" href="register.jsp">회원가입</a>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item <%=(Integer.parseInt(pagenum) == 1)?"disabled":""%>"><a class="page-link" href="?pagenum=<%=Integer.parseInt(pagenum)-1%>">Previous</a></li>
            <% for(int i = 1; i <= pagecnt; i++){%>
            <li class="page-item <%=(Integer.parseInt(pagenum) == i)?"active":""%>">
                <a class="page-link" href="?pagenum=<%=i%>"><%=i%></a></li>
            <%}%>
            <li class="page-item <%=(Integer.parseInt(pagenum) == pagecnt)?"disabled":""%>"><a class="page-link" href="?pagenum=<%=Integer.parseInt(pagenum)+1%>">Next</a></li>
        </ul>
    </nav>
</div>
</body>
</html>
