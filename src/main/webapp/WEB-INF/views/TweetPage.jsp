<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="base/Header.jsp"%>
<div class="card mb-3">
    <div class="card-header">
        <h1>Tweet</h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Created</th>
                    <th>Text</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${tweet.user.username}</td>
                        <td>
                            <c:out value="${tweet.created}"/>
                        </td>
                        <td><c:out value="${tweet.text}"/></td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="card mb-3">
    <div class="card-header">
        <h1>Add new comment</h1>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable3" width="100%" cellspacing="0">

                <tbody>

                    <form:form method="post" modelAttribute="comment">
                        <p>${info}</p>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="exampleInputName">text: </label>
                                    <form:textarea path="text" placeholder="your comment" class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp"/>
                                    <form:errors path="text"/>
                                </div>
                            </div>
                        </div>
                        <div>
                            <input type="submit" value="save"/>
                        </div>
                    </form:form>
                </tbody>
            </table>
        </div>
    </div>
</div>


<div class="card mb-3">
    <div class="card-header">
        <h1>All comments</h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Created</th>
                    <th>Text</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Username</th>
                    <th>Created</th>
                    <th>Text</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${comments}" var="comment">
                    <tr>
                        <td>${comment.user.username}</td>
                        <td>
                            <c:out value="${comment.created}"/>
                        </td>
                        <td><c:out value="${comment.text}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>

<%@include file="base/Footer.jsp"%>
