<%--
    Document   : register
    Created on : 17/05/2018, 11:05:42 AM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Register Page</title>
    </head>

    <jsp:include page="navbar.jsp"/>
    <%
        String emptyError = request.getParameter("emptyError");
        String nameError = request.getParameter("nameError");
        String emailError = request.getParameter("emailError");
        String passwordError = request.getParameter("passwordError");
        String dobError = request.getParameter("dobError");
    %>

    <body class="my-register-page">
    <center>
        <div class="container">
            <!-- Header -->
            <div class="wrapper" style="width:500px; text-align: left">
                <br>
                <h4 class="card-title font-weight-monospace">Register into WSD Bookstore</h4>
                <p class="font-weight-light">Enter your details below:
                    <c:if test="${emptyError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align:right; margin-left: 100px"><c:out value="${emptyError}"/></c:if></span>
                    </p>
                    <br>

                    <!-- Register Form -->
                    <form action="registerAction.jsp" method="POST">
                        <div class="form-group">
                            <label for="name">Name
                            <c:if test="${nameError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align:right; margin-left: 276px"> <c:out value="${nameError}"/></c:if></span>
                            </label>
                            <input id="name" type="text" class="form-control" name="name" value="" autofocus="">
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address
                            <c:if test="${emailError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align:right; margin-left: 220px"> <c:out value="${emailError}"/></c:if></span>
                            </label>
                            <input id="email" type="text" class="form-control" name="email" value="" autofocus="">
                        </div>
                        <div class="form-group">
                            <label for="password">Password
                            <c:if test="${passwordError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align:right; margin-left: 222px"> <c:out value="${passwordError}"/></c:if></span>
                            </label>

                            <div style="position: relative"><input id="password" type="password" class="form-control font-weight-monospace" name="password" data-eye="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="dob">Date of Birth
                            <c:if test="${dobError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align:right; margin-left: 236px"> <c:out value="${dobError}"/></c:if></span>
                        </label>

                        <div style="position: relative"><input id="date" type="date" class="form-control font-weight-monospace" name="dob" data-eye="">
                        </div>
                    </div>

                    <div class="form-group no-margin">
                        <br><button type="submit" value="register" class="btn btn-primary btn-block" name="submit">Register</button>
                    </div>
                    <input type="hidden" name="submitted" value="true"/>
                </form>

                <div class="margin-top20 text-center">
                    Already have an account? <a href="login.jsp" class="text-muted font-weight-light" data-toggle="">Login</a>
                </div>
            </div>

        </div>
    </center>
</body>
</html>
