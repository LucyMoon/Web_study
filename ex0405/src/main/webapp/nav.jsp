<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<ul>
		<li><a href="index.jsp">index</a></li>
		<li><a href="insert.jsp">insert</a></li>
		<li><a href="select.jsp">select</a></li>
	</ul>
	<div>
		<form>
			<table>
				<tr>
					<td>id</td>
					<td><input type="text" name="id" /></td>
					<td rowspan=2><input type="button" value="로그인" /></td>
				</tr>
				<tr>
					<td>pw</td>
					<td><input type="text" name="password" /></td>
				</tr>
			</table>
		</form>
	</div>

</div>