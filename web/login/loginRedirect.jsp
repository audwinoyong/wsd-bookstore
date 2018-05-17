<%-- 
    Document   : loginRedirect
    Created on : 17/05/2018, 11:05:26 AM
    Author     : Audwin
--%>

<%@page import="uts.wsd.*"%>
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
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
            <jsp:setProperty name="thunderSeller" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Users users = diaryApp.getUsers();
            User verifyUser = users.login(email, password);
        %>

        <% if (verifyUser != null) {
                session.setAttribute("user", verifyUser);
        %>
        <script>
            setTimeout(function () {
                window.location = "../listItem/listItem.jsp";
            }, 3000);
        </script>
        
    <center><img src="../assets/img/camion.gif" alt="" width="400px" height="300px" style="margin-top: 100px"/>
        
        <%} else {%>
        
        
        <div>
            <center><img src="../assets/img/mainpage_logo.png" alt="Thunder" id="logo" style="margin-top: 15px;"/></center><hr>
            <p class="alert alert-danger"> Incorrect Password. Click <a href="../login/login.jsp">here</a> to try again.</p>
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
