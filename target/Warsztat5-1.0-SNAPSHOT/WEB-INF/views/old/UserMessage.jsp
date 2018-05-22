<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>All user's messages</h1>
<ul>
    <c:forEach items="${messages}" var="message">
        <li>
            <h4>${message.title}</h4>
            <p><c:out value="${message.sender}"/></p>
            <p><c:out value="${message.created}"/></p>
            <p><c:out value="${message.text}"/></p>
            <p><a href="/message/${message.id}/show">Show message</a></p>
        </li>
    </c:forEach>
</ul>

<a href="/home">Go back to homepage</a>
</body>
</html>
