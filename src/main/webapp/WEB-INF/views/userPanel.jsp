
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="base/Header.jsp"%>

<div class="card mb-3">
    <div class="card-header">
        <h1>User panel</h1></div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                <tr>
                    <td><a class="btn btn-outline-primary" href="/user/edit/${id}" role="button">Edit User</a></td>
                </tr>
                <tr>
                    <td><a class="btn btn-outline-warning" href="/user/deleteTweets/${id}" role="button">Delete all tweets</a></td>
                </tr>
                <tr>
                    <td><a class="btn btn-outline-danger" href="/user/delete/${id}" role="button">Delete your account</a></td>
                </tr>

            </table>
        </div>
    </div>
</div>


<%@include file="base/Footer.jsp"%>
