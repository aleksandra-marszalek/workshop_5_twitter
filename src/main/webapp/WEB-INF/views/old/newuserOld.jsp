
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add user</h1>
<form:form method="post" modelAttribute="user">
    <p>${info}</p>
    Username: <form:input path="username" placeholder="username"/>
    <form:errors path="username"/>


    Email: <form:input path="email"/>
    <form:errors path="email"/>


    Password: <form:input path="password"/>
    <form:errors path="password"/>



    <form:hidden path="id" value="${user.id}"/>

    <form:hidden path="enabled" value="${user.enabled}"/>

    <input type="submit" value="save"/>


</form:form>

<a href="/home">Go back to home</a>
</body>



</html>
