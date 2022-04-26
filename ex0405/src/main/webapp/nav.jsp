<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<ul>
		<li><a href="index.jsp">index</a></li>
		<li><a href="insert.jsp">insert</a></li>
		<li><a href="select.jsp">select</a></li>
	</ul>
	<div>
		<%
			String username = (String) session.getAttribute("username");
			if (username == null) {
		%>

		<form action="loginproc.jsp">
			<table>
				<tr>
					<td>id</td>
					<td><input type="text" name="username" /></td>
					<td rowspan=2><input type="submit" value="로그인" /></td>
				</tr>
				<tr>
					<td>pw</td>
					<td><input type="text" name="password" /></td>
				</tr>
			</table>
		</form>

		<%
		} else {
			out.println(username + "님 로그인 했음");
		%>

		<a href="logout.jsp">로그아웃</a>

		<%
		}
		%>

	</div>

</div>