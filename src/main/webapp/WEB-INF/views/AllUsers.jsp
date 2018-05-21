<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>All users</h1>
<ul>
    <c:forEach items="${users}" var="user">
        <li>
            <h4>${user.username}</h4>
            <p><a href="/user/${user.id}/all">Show user's tweets</a></p>
        </li>
    </c:forEach>
</ul>



<a href="/home">Go back to homepage</a>

</body>
</html>
