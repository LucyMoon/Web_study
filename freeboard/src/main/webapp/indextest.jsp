<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%@include file="head.jsp" %>
    <script>
        $('document').ready(function () {
            alert("됨")
            $('#adiv').on("click", function () {
                $('#adiv').attr("style", "background-color: blue");
            })
        });

        function doA() {
            alert("누름");
        }

        const doB = () => {
            alert("doB")
        };
    </script>
</head>
<body>
<h1 onclick="doA();">
    <%= "Hello World!" %>
</h1>
<br/>
<div id="adiv" style="background-color: red">
    <h1>음...</h1>
</div>
</body>
</html>