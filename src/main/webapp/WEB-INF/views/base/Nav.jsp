<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" style="color:lightgrey">Hello, ${userLog.username}!</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="/home">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">Home</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
                <a class="nav-link" href="/userpanel/${userLog.id}">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">User Panel</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
                <a class="nav-link" href="/user/${userLog.id}/all">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">My tweets</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="/allUsers">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">All Users</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="/user/${userLog.id}/myMessages">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">My Messages</span>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <%--<li class="nav-item dropdown">--%>
                <%--<a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--<i class="fa fa-fw fa-envelope"></i>--%>
                    <%--<span class="d-lg-none">Messages--%>
              <%--<span class="badge badge-pill badge-primary">12 New</span>--%>
            <%--</span>--%>
                    <%--<span class="indicator text-primary d-none d-lg-block">--%>
              <%--<i class="fa fa-fw fa-circle"></i>--%>
            <%--</span>--%>
                <%--</a>--%>
                <%--<div class="dropdown-menu" aria-labelledby="messagesDropdown">--%>
                    <%--<h6 class="dropdown-header">New Messages:</h6>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item" href="#">--%>
                        <%--<strong>David Miller</strong>--%>
                        <%--<span class="small float-right text-muted">11:21 AM</span>--%>
                        <%--<div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item" href="#">--%>
                        <%--<strong>Jane Smith</strong>--%>
                        <%--<span class="small float-right text-muted">11:21 AM</span>--%>
                        <%--<div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item" href="#">--%>
                        <%--<strong>John Doe</strong>--%>
                        <%--<span class="small float-right text-muted">11:21 AM</span>--%>
                        <%--<div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item small" href="#">View all messages</a>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li class="nav-item dropdown">--%>
                <%--<a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--<i class="fa fa-fw fa-bell"></i>--%>
                    <%--<span class="d-lg-none">Alerts--%>
              <%--<span class="badge badge-pill badge-warning">6 New</span>--%>
            <%--</span>--%>
                    <%--<span class="indicator text-warning d-none d-lg-block">--%>
              <%--<i class="fa fa-fw fa-circle"></i>--%>
            <%--</span>--%>
                <%--</a>--%>
                <%--<div class="dropdown-menu" aria-labelledby="alertsDropdown">--%>
                    <%--<h6 class="dropdown-header">New Alerts:</h6>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item" href="#">--%>
              <%--<span class="text-success">--%>
                <%--<strong>--%>
                  <%--<i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>--%>
              <%--</span>--%>
                        <%--<span class="small float-right text-muted">11:21 AM</span>--%>
                        <%--<div class="dropdown-message small">This is an automated server response message. All systems are online.</div>--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item" href="#">--%>
              <%--<span class="text-danger">--%>
                <%--<strong>--%>
                  <%--<i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>--%>
              <%--</span>--%>
                        <%--<span class="small float-right text-muted">11:21 AM</span>--%>
                        <%--<div class="dropdown-message small">This is an automated server response message. All systems are online.</div>--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item" href="#">--%>
              <%--<span class="text-success">--%>
                <%--<strong>--%>
                  <%--<i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>--%>
              <%--</span>--%>
                        <%--<span class="small float-right text-muted">11:21 AM</span>--%>
                        <%--<div class="dropdown-message small">This is an automated server response message. All systems are online.</div>--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-divider"></div>--%>
                    <%--<a class="dropdown-item small" href="#">View all alerts</a>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<form class="form-inline my-2 my-lg-0 mr-lg-2">--%>
                    <%--<div class="input-group">--%>
                        <%--<input class="form-control" type="text" placeholder="Search for...">--%>
                        <%--<span class="input-group-append">--%>
                <%--<button class="btn btn-primary" type="button">--%>
                  <%--<i class="fa fa-search"></i>--%>
                <%--</button>--%>
              <%--</span>--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</li>--%>

            <li class="nav-item">
                <a class="btn btn-outline-secondary" href="/logout" role="button">
                    <i class="fa fa-fw fa-sign-out"></i>Logout</a>
            </li>
        </ul>
    </div>
</nav>