<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="base/Header.jsp"%>

<div class="row">
    <div class="col-12">
        <h1>Log in</h1>

        <p>
            <form action="/login" method="POST">
                <p>${info}</p>
                <label>
                    Email:
                    <input type="text" name="email">
                </label>
                <label>
                    password:
                    <input type="text" name="password">
                </label>
                <input type="submit" value="log in">
            </form>
        </p>
        <h1> I am new user </h1>
        <p>
            <a href="/newuser"> Create account </a>
        </p>
    </div>
</div>

<%@include file="base/Footer.jsp"%>
