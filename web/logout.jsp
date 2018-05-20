<%--
    Document   : logout
    Created on : 17/05/2018, 11:05:26 AM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Logout Page</title>
    </head>
    <%
        session.invalidate();
    %>
    <jsp:include page="navbar.jsp"/>
    <body>

        <div class="container">
            <!--<center><img src="wsdbookstore_logo.png" alt="WSD Bookstore" id="logo" style="margin-top: 15px;"/></center><hr>-->
            <p class="alert alert-danger" style="text-align: center">You have been logged out. Click <a href="main.jsp">here</a> to return to the main page.</p>
        </div>

        <script>
            setTimeout(function () {
                window.location = "main.jsp";
            }, 3000);
        </script>

        <!-- Bootstrap core JavaScript ================================================== -->
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