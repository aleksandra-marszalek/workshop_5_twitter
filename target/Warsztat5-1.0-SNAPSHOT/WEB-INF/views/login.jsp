<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Log in</title>
</head>
<body>
<h1>Log in</h1>

<form action="/login" method="POST">
    <p>${info}</p>
    <label>
        Email:
        <input type="text" name="email">
    </label>
    <label>
        password:
        <input type="text" name="password">
    </label>
    <input type="submit" value="log in">
</form>

<h1> I am new user </h1>
<a href="/newuser"> Create account </a>
</body>



</html>