<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 13.05.2018
  Time: 00:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Tweet: </h1>
<h4>${tweet.user.username}</h4>
<p><c:out value="${tweet.created}"/></p>
<p><c:out value="${tweet.text}"/></p>
<h1>Add comment</h1>
<form:form method="post" modelAttribute="comment">



    text:
    <form:textarea path="text" placeholder="your comment text"/>
    <form:errors path="text"/>



    <input type="submit" value="save"/>



</form:form>
<h1>All comments</h1>
<ul>
    <c:forEach items="${comments}" var="comment">
        <li>
            <h4>${comment.user.username}</h4>
            <p><c:out value="${comment.created}"/></p>
            <p><c:out value="${comment.text}"/></p>
        </li>
    </c:forEach>
</ul>
<a href="/home">Go back to homePage</a>
</body>
</html>
