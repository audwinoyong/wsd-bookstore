<%-- 
    Document   : register
    Created on : 17/05/2018, 11:05:42 AM
    Author     : Audwin
--%>

<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Register Page</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="css/my-login.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">
    </head>
s
    <body class="my-register-page">
    <center>
        <div class="container">
            <!-- Header -->
            <a href="../main/mainpage.jsp"><img src="wsdbookstore_logo.png" alt="WSD Bookstore" id="logo" style="padding-top:20px;text-align:center"/></a>
            <div class="wrapper" style="width:500px; text-align: left">
                <br/><h4 class="card-title font-weight-monospace">Get started with WSD Bookstore</h4><br>

                <!-- Register Form -->
                <form action="registerRedirect.jsp" method="POST">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input id="name" type="text" class="form-control" name="name" value="" required="" autofocus="">
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input id="email" type="email" class="form-control" name="email" value="" required="" autofocus="">
                    </div>
                    <div class="form-group">
                        <label for="password">Password
                        </label>

                        <div style="position:relative"><input id="password" type="password" class="form-control font-weight-monospace" name="password" required="" data-eye="">
                        </div>
                    </div>

                    <div class="form-group no-margin">
                        <br><button type="submit" value="register" class="btn btn-danger btn-block" name="submit">Register</button>
                    </div>
                    <input type="hidden" name="submitted" value="true"/>
                </form>

                <div class="margin-top20 text-center">
                    Already have an account? <a href="login.jsp" class="text-muted font-weight-light" data-toggle="">Sign in</a>
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
