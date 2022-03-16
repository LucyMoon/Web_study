<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//함수 선언할 수 있다.
	public void doA(){
	System.out.println("asdfasdf");
	}
	public String doB(){
		return "doB";
	}
%>
<%
	//함수 선언할 수 없다.
	//public void doC()
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	doA();
	out.println(doB());
%>

</body>
</html>