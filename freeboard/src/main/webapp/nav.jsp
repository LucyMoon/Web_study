<nav class="navbar navbar-expand-sm navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">MYSITE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/board.jsp">BOARD</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/member.jsp">MEMBER</a>
                </li>
            </ul>
            <form class="d-flex" action="loginproc.jsp">
                <%
                    String username = (String) session.getAttribute("username");
                    if (username == null) {
                %>
                <input class="form-control me-2" type="text" placeholder="ID" name="id">
                <input class="form-control me-2" type="text" placeholder="PASSWORD" name="pw">
                <input class="btn btn-info" type="submit" value="Login"/>
                <%
                    }else {
                %>
                <h4 class="text-info"><%=username%></h4>
                <a class="btn btn-info" href="logout.jsp">LOGOUT</a>
                <%
                    }
                %>
            </form>
        </div>
    </div>
</nav>