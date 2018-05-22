<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Message</h1>

            <h4>${message.title}</h4>
            <p>Created: <c:out value="${message.created}"/></p>
            <p>Sender: <c:out value="${message.sender.username}"/></p>
            <p>Receiver: <c:out value="${message.receiver.username}"/></p>
            <p>Text: <c:out value="${message.text}" /></p>

<a href="/home">Go back to homepage</a>
</body>
</html>
