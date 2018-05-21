<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<p><a href="/newMessage">Send new message</a></p>

<h1>All messages received</h1>
<ul>
    <c:forEach items="${messagesReceived}" var="message">
        <li>
            <h4>${message.title}</h4>
            <p><c:out value="${message.created}"/></p>
            <p><c:out value="${message.sender.username}"/></p>
            <p>Text: <c:out value="${fn:substring(message.text, 0, 30)}" /></p>
            <p><a href="/message/${message.id}/show">Show message</a></p>
        </li>
    </c:forEach>
</ul>

<h1>All messages sent</h1>
<ul>
    <c:forEach items="${messagesSent}" var="message">
        <li>
            <h4>${message.title}</h4>
            <p><c:out value="${message.created}"/></p>
            <p><c:out value="${message.receiver.username}"/></p>
            <p>Text: <c:out value="${fn:substring(message.text, 0, 30)}" /></p>
            <p><a href="/message/${message.id}/show">Show message</a></p>
        </li>
    </c:forEach>
</ul>
<a href="/home">Go back to homepage</a>
</body>
</html>

