<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="base/Header.jsp"%>


<div class="card mb-3">
    <div class="card-header">
        <h1>Message details </h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Created</th>
                    <th>Sender</th>
                    <th>Receiver</th>
                    <th>Text</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Title</th>
                    <th>Created</th>
                    <th>Sender</th>
                    <th>Receiver</th>
                    <th>Text</th>
                </tr>
                </tfoot>
                <tbody>
                    <tr>

                        <td>${message.title}</td>
                        <td><c:out value="${message.created}"/></td>
                        <td><c:out value="${message.sender.username}"/></td>
                        <td><c:out value="${message.receiver.username}"/></td>
                        <td><c:out value="${message.text}" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>

<%@include file="base/Footer.jsp"%>
