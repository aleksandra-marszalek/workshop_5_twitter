<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit user</h1>
<form:form method="post" modelAttribute="user">
    <p>${info}</p>
    New Username: <form:input path="username" placeholder="username"/>
    <form:errors path="username"/>


    <form:hidden path="id" value="${user.id}"/>

    <input type="submit" value="save"/>


</form:form>
<a href="/home">Go back to home</a>


</body>
</html>
