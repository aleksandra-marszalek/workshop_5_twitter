<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 13.05.2018
  Time: 02:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User Panel</h1>
<a href="/user/edit/${id}">Change username</a>
<a href="/user/deleteTweets/${id}">Delete tweets</a>
<a href="/user/delete/${id}">Delete user</a>

<a href="/home">Go back to homepage</a>
</body>
</html>
