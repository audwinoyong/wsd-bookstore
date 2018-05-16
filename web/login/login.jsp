<%-- 
    Document   : test
    Created on : May 8, 2018, 12:03:36 PM
    Author     : Dalley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Signin Page</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="css/my-login.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">



    </head> 
    <body class="my-login-page">
    <center>
        <div class="container">
            <a href="../main/mainpage.jsp"><img src="../assets/img/thunder_logo.png" alt="Thunder" id="logo" style="padding-top:20px;text-align:center"/></a>

            <!-- Header -->
            <div class="wrapper" style="width:500px; text-align: left">
                <br/><h4 class="card-title font-weight-monospace">Sign in to Thunder Seller</h4>
                <p class="font-weight-light">Enter your details below</p><br/>

                <!-- Login Form -->
                <form method="POST" action="loginRedirect.jsp">
                    <div class="form-group">
                        <label for="email">E-Mail Address</label>
                        <input id="email" type="email" class="form-control" name="email" value="" required="" autofocus="">
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password
                            <a href="forgot.jsp" class="float-right font-weight-monospace text-muted" style="text-align:right; margin-left: 300px ">
                                Forgot Password?
                            </a>
                        </label>

                        <div style="position:relative"><input id="password" type="password" class="form-control font-weight-monospace" name="password" required="" data-eye="">
                        </div>
                    </div>

                    <div class="form-group no-margin">
                        <br><button type="submit" value="login" class="btn btn-danger btn-block">
                            Login
                        </button>
                        <input type="hidden" name="submitted" value="true">
                    </div>
                    <div class="margin-top20 text-center">
                        Don't have an account? <a href="register.jsp" class="text-muted font-weight-light" data-toggle="">Create One</a>
                    </div>
                </form>
            </div>
        </div>
    </center>


    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/js/mdb.min.js"></script>
</body>
</html>
