<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>All tweets</h1>
<ul>
    <c:forEach items="${usertweets}" var="tweet">
        <li>
            <h4>${tweet.user.username}</h4>
            <p><c:out value="${tweet.created}"/></p>
            <p><c:out value="${tweet.text}"/></p>
        </li>
    </c:forEach>
</ul>
<a href="/home">Go back to homePage</a>
</body>
</html>
