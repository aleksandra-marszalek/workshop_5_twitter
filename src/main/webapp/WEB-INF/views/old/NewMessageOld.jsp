<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Send message</h1>
<form:form method="post" modelAttribute="message">

    <form:hidden path="sender.id" value="${message.sender.id}"/>

    <label>Receiver: </label>
    <form:select path="receiver.id"
                 items="${receivers}"
                 itemLabel="username"
                 itemValue="id"/>

    title: <form:input path="title"/>
    <form:errors path="title"/>


    text: <form:input path="text"/>
    <form:errors path="text"/>



    <input type="submit" value="save"/>


</form:form>

<a href="/home">Go back to home</a>
</body>



</html>
