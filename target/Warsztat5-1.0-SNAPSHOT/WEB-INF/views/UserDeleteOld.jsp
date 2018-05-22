<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Delete</h1>
<p>Are you sure you want to delete the user?</p>
<form method="post" action="/user/delete/${user.id}">
    yes: <input type="radio" name="agree" value="yes">
    no: <input type="radio" name="agree" value="no">
    <input type="submit" value="save">
</form>

<a href="/home">Go back to homepage</a>
</body>
</html>
