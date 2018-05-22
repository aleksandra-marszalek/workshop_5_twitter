<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="base/Header.jsp"%>
<div class="card mb-3">
    <div class="card-header">
        <h1>Send new message</h1>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable3" width="100%" cellspacing="0">

                <tbody>

                <form:form method="post" modelAttribute="message">
                    <p>${info}</p>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleInputName">title: </label>
                                <form:input path="title" placeholder="title" class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp"/>
                                <form:errors path="title"/>
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Receiver</label>
                                <form:select class="form-control" id="exampleFormControlSelect1" path="receiver.id"
                                        items="${receivers}"
                                        itemLabel="username"
                                        itemValue="id"/>
                                <form:hidden path="sender.id" value="${message.sender.id}"/>
                            </div>
                            <div class="col-md-6">
                                <label for="exampleInputName">text: </label>
                                <form:textarea path="text" placeholder="your message" class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp"/>
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

