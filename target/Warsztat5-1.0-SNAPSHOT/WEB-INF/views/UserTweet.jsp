<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>All user's tweets</h1>
<ul>
    <c:forEach items="${usertweets}" var="tweet">
        <li>
            <h4>${tweet.user.username}</h4>
            <p><c:out value="${tweet.created}"/></p>
            <p><c:out value="${tweet.text}"/></p>
            <p>Comments: <c:out value="${fn:length(tweet.comments)}" /></p>
            <p><a href="/tweet/${tweet.id}/show">Show tweet</a></p>
        </li>
    </c:forEach>
</ul>
<a href="/home">Go back to homepage</a>
</body>
</html>
