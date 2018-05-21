<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 12.05.2018
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

Hello, ${userLog.username}!

<a href="/userpanel/${userLog.id}">Go to user panel</a>

<a href="/allUsers">Go to all users</a>

<h1>Add new tweet</h1>
<form:form method="post" modelAttribute="tweet">



    text:
    <form:textarea path="text" placeholder="your tweet text"/>
    <form:errors path="text"/>


    <%--<form:hidden path="user.id" item="user" value="${userLog.id}"/>--%>


    <input type="submit" value="save"/>



</form:form>


<a href="/add">Add</a>

<h1>All tweets</h1>
<ul>
    <c:forEach items="${alltweets}" var="tweet">
        <li>
            <h4>${tweet.user.username}</h4>
            <p><c:out value="${tweet.created}"/></p>
            <p><c:out value="${tweet.text}"/></p>
            <p><a href="/tweet/${tweet.id}/show">Show tweet</a></p>
        </li>
    </c:forEach>
</ul>


    </body>
</html>
