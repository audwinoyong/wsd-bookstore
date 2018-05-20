<%-- 
    Document   : navbar
    Created on : 19/05/2018, 9:17:46 PM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navigation Bar</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="css/my-login.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">
    </head>
    <body>
    <center>
        <div class="container">
            <%
                User user = (User) session.getAttribute("user");
                if (user != null) {
            %>

            <nav class="navbar navbar-light navbar-expand-md bg-light justify-content-center">
                <a class="navbar-brand d-flex w-50 mr-auto" href="main.jsp"><img src="wsdbookstore_logo.png" alt="logo" style="width: 100px;"> </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar3">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
                    <ul class="navbar-nav w-100 justify-content-center">
                        <li class="nav-item">
                            <a class="nav-link">Hi, <%= user.getName()%>! &lt;<%= user.getEmail()%>&gt;</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="main.jsp">Main</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="bookForm.jsp">List New Book</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="booklist.jsp">My Listings</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="reservationList.jsp">My Reservations</a>
                        </li>                        
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <% } else { %>

            <nav class="navbar navbar-light navbar-expand-md bg-light justify-content-center">
                <a class="navbar-brand d-flex w-50 mr-auto" href="main.jsp"><img src="wsdbookstore_logo.png" alt="logo" style="width: 100px;"> </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar3">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
                    <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="main.jsp">Main</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>

                    </ul>
                </div>
            </nav>

            <% }%>

            <br/>
        </div>
    </center>
</body>
</html>
