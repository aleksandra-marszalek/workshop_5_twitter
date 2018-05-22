<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ include file="base/Header.jsp"%>

<h1>Add new tweet</h1>
<div>

    <form:form method="post" modelAttribute="tweet">
        <p>${info}</p>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-6">
                    <label for="exampleInputName">text: </label>
                    <form:textarea path="text" placeholder="your tweet text" class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp"/>
                    <form:errors path="text"/>
                </div>
            </div>
        </div>
        <div>
            <input type="submit" value="save"/>
        </div>
    </form:form>
</div>


<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-table"></i>All tweets</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Created</th>
                    <th>Text</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Username</th>
                    <th>Created</th>
                    <th>Text</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${alltweets}" var="tweet">
                    <tr>
                        <td>${tweet.user.username}</td>
                        <td>
                            <c:out value="${tweet.created}"/>
                        </td>
                        <td><c:out value="${tweet.text}"/></td>
                        <td><a href="/tweet/${tweet.id}/show">Show tweet</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>

<%@include file="base/Footer.jsp"%>