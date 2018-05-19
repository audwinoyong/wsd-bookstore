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
    %>

    <body class="my-register-page">
    <center>
        <div class="container">
            <!--<a href="main.jsp"><img src="wsdbookstore_logo.png" alt="WSD Bookstore" id="logo" style="margin-top: 15px;"/></a>-->

            <!-- Header -->
            <div class="wrapper" style="width:500px; text-align: left">
                <br/><h4 class="card-title font-weight-monospace">Register into WSD Bookstore</h4>
                <p class="font-weight-light">Enter your details below: 
                    <c:if test="${emptyError != null}"> <span class="float-right" style="color: red; font-weight: bold; text-align:right; margin-left: 100px"><c:out value="${emptyError}"/></c:if></span>
                </p><br/>

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

                        <div style="position:relative"><input id="password" type="password" class="form-control font-weight-monospace" name="password" data-eye="">
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


    <!-- Bootstrap core JavaScript
        ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>
        window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')
    </script>
    <script src="../../../../assets/js/vendor/popper.min.js"></script>
    <script src="../../../../dist/js/bootstrap.min.js"></script>
    <script src="../../../../assets/js/vendor/holder.min.js"></script>
    <svg xmlns="http://www.w3.org/2000/svg" width="348" height="225" viewBox="0 0 348 225" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="17" style="font-weight:bold;font-size:17pt;font-family:Arial, Helvetica, Open Sans, sans-serif">Thumbnail</text></svg>
</body>
</html>
