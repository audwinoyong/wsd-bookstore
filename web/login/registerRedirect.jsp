<%-- 
    Document   : loginRedirect
    Created on : 12/05/2018, 6:40:10 PM
    Author     : Dalley
--%>

<%@page import="thunderSeller.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Register Redirect</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="css/my-login.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">
    </head> 

    <body>
        <%
            boolean submitted = request.getParameter("submitted") != null;
            if (submitted) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String filePath = application.getRealPath("WEB-INF/users.xml");
        %>

        <jsp:useBean id="thunderSellerApp" class="thunderSeller.thunderSellerApplication" scope="application">
            <jsp:setProperty name="thunderSellerApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

        <%
            Users users = thunderSellerApp.getUsers();

            boolean valid = users.getUser(email) == null;

            if (valid) {
                User user = new User(name, email, password);
                session.setAttribute("user", user);
                users.addUser(user);
                thunderSellerApp.updateXML(users, filePath);
        %>

        <script>
            setTimeout(function () {
                window.location = "../listItem/listItem.jsp";
            }, 3000);
        </script>

    <center><img src="../assets/img/camion.gif" alt="" width="400px" height="300px" style="margin-top: 100px"/>

        <!-- Check if the user email address has been created -->
        <%} else {%>
        <div>
            <center><img src="../assets/img/mainpage_logo.png" alt="Thunder" id="logo" style="margin-top: 15px;"/></center><hr>
            <p class="alert alert-danger"> This email has been created. Click <a href="../login/register.jsp">here</a> to try again.</p>
        </div>

        <%}%>

        <!-- Check user has been submitted-->
        <%} else {%>
        <div>
            <center><img src="../assets/img/mainpage_logo.png" alt="Thunder" id="logo" style="margin-top: 15px;"/></center><hr>
            <p class="alert alert-danger"> No registration information has been added. Click <a href="../login/register.jsp">here</a> to register.</p>
        </div>

        <%}%>

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
