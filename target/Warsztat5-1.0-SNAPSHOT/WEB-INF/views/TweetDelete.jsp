<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="base/Header.jsp"%>



<div class="row">
    <div class="col-12">
        <h1>Delete all tweets</h1>
        <p>Are you sure you want to delete all your tweets?</p>

        <form method="post" action="/user/deleteTweets/${user.id}">

            <div class="form-check">

                <input class="form-check-input" type="radio" name="agree" id="exampleRadios1" value="no" checked>
                <label class="form-check-label" for="exampleRadios1">
                    No
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="agree" id="exampleRadios2" value="yes">
                <label class="form-check-label" for="exampleRadios2">
                    Yes
                </label>
            </div>
            <input type="submit" value="save">
        </form>
    </div>
</div>

<%@include file="base/Footer.jsp"%>
