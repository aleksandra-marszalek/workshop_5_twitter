<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="base/Header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="card mb-3">
    <div class="card-header">
        <h1>Send new message</h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <a class="btn btn-primary" href="/newMessage" role="button">Send new message</a>
            </table>
        </div>
    </div>
</div>

<div class="card mb-3">
    <div class="card-header">
        <h1>All messages received</h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Created</th>
                    <th>Sender</th>
                    <th>Text</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Title</th>
                    <th>Created</th>
                    <th>Sender</th>
                    <th>Text</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
                <tbody>
                    <c:forEach items="${messagesReceived}" var="message">
                        <tr>
                            <td>${message.title}</td>
                            <td>
                                <c:out value="${message.created}"/>
                            </td>
                            <td><c:out value="${message.sender.username}"/></td>
                            <td>
                                    <c:if test="${message.readed=='1'}"><c:out value="${fn:substring(message.text, 0, 30)}" /></c:if>
                                    <c:if test="${message.readed=='0'}"><b><c:out value="${fn:substring(message.text, 0, 30)}" /></b></c:if>
                            </td>
                            <td>
                                <a href="/message/${message.id}/show">Show message</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>


<div class="card mb-3">
    <div class="card-header">
        <h1>All messages sent</h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Created</th>
                    <th>Receiver</th>
                    <th>Text</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Title</th>
                    <th>Created</th>
                    <th>Receiver</th>
                    <th>Text</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${messagesSent}" var="message">
                    <tr>
                        <td>${message.title}</td>
                        <td>
                            <c:out value="${message.created}"/>
                        </td>
                        <td><c:out value="${message.receiver.username}"/></td>
                        <td>
                            <c:out value="${fn:substring(message.text, 0, 30)}"/>
                        </td>
                        <td>
                            <a href="/message/${message.id}/show">Show message</a>
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

