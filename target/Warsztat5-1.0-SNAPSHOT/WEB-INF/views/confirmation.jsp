<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Delete</h1>
<p>Do you want to create the account for ${user.username} ?</p>
<form method="post" action="/user/enable/${user.id}">
    yes, I want to create the account: <input type="checkbox" name="agree" value="yes">
    <input type="submit" value="save">
</form>
<a href="/index"> Go back, I don't want to activate this profile. </a>
</body>
</html>
