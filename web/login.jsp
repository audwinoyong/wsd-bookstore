<%--
    Document   : login
    Created on : 17/05/2018, 11:05:00 AM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Login Page</title>
    </head>

    <jsp:include page="navbar.jsp"/>
    <%
        String emptyError = request.getParameter("emptyError");
        String emailError = request.getParameter("emailError");
        String passwordError = request.getParameter("passwordError");
    %>

    <body class="my-login-page">
    <center>
        <div class="container">
            <!-- Header -->
            <div class="wrapper" style="width: 500px; text-align: left">
                <br>
                <h4 class="card-title font-weight-monospace">Login to WSD Bookstore</h4>
                <p class="font-weight-light">Enter your details below:
                    <c:if test="${emptyError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align:right; margin-left: 100px"> <c:out value="${emptyError}"/></span> </c:if>
                    </p>
                    <br>

                    <!-- Login Form -->
                    <form method="POST" action="loginAction.jsp">
                        <div class="form-group">
                            <label for="email">Email Address
                            <c:if test="${emailError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align: right; margin-left: 220px"> <c:out value="${emailError}"/></span> </c:if>
                            </label>
                            <input id="email" type="text" class="form-control" name="email" value="" autofocus="">
                        </div>

                        <div class="form-group">
                            <label for="password">Password
                            <c:if test="${passwordError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align: right; margin-left: 222px"> <c:out value="${passwordError}"/></span> </c:if>
                        </label>

                        <div style="position: relative"><input id="password" type="password" class="form-control font-weight-monospace" name="password" data-eye="">
                        </div>
                    </div>

                    <div class="form-group no-margin">
                        <br>
                        <button type="submit" value="login" class="btn btn-primary btn-block">Login</button>
                        <input type="hidden" name="submitted" value="true">
                    </div>
                    <div class="margin-top20 text-center">
                        Don't have an account? <a href="register.jsp" class="text-muted font-weight-light" data-toggle="">Register</a>
                    </div>
                </form>

            </div>
        </div>
    </center>
</body>
</html>
