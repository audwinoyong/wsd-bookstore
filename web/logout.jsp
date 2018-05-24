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
            <p class="alert alert-danger" style="text-align: center">You have been logged out. Click <a href="main.jsp">here</a> to return to the main page.</p>
        </div>

        <script>
            setTimeout(function () {
                window.location = "main.jsp";
            }, 3000);
        </script>
    </body>
</html>