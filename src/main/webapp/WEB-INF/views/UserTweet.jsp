<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="base/Header.jsp"%>


<div class="card mb-3">
    <div class="card-header">
        <h1>All user's tweets</h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Created</th>
                    <th>Text</th>
                    <th>Comments</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Username</th>
                    <th>Created</th>
                    <th>Text</th>
                    <th>Comments</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${usertweets}" var="tweet">
                    <tr>
                        <td>${tweet.user.username}</td>
                        <td>
                            <c:out value="${tweet.created}"/>
                        </td>
                        <td><c:out value="${tweet.text}"/></td>
                        <td><p>Comments: <c:out value="${fn:length(tweet.comments)}" /></p></td>
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
