<%-- 
    Document   : registerAction
    Created on : 17/05/2018, 11:06:16 AM
    Author     : Audwin
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Register Action</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="css/my-login.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">
    </head> 

    <body>
        <div class="container">
            <%
                boolean submitted = request.getParameter("submitted") != null;
                if (submitted) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String filePath = application.getRealPath("WEB-INF/users.xml");
            %>

            <jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
                <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>

            <%
                Validator validator = new Validator();

                Users users = diaryApp.getUsers();

                if (validator.isEmpty(name, email, password)) {
                    session.setAttribute("emptyError", "[All fields are mandatory]");
                    response.sendRedirect("register.jsp");
                } else if (!validator.validName(name)) {
                    session.setAttribute("nameError", "[Incorrect name format]");
                    response.sendRedirect("register.jsp");
                } else if (!validator.validEmail(email)) {
                    session.setAttribute("emailError", "[Incorrect email format]");
                    response.sendRedirect("register.jsp");
                } else if (!validator.validPassword(password)) {
                    session.setAttribute("passwordError", "[Incorrect password format]");
                    response.sendRedirect("register.jsp");
                } else if (users.getUser(email) == null) {

                    User user = new User(name, email, password);
                    session.setAttribute("user", user);
                    users.addUser(user);
                    diaryApp.updateXML(users, filePath);

                    // clear the errors
                    session.setAttribute("emptyError", "");
                    session.setAttribute("nameError", "");
                    session.setAttribute("emailError", "");
                    session.setAttribute("passwordError", "");
            %>
            <div>
                <center><img src="wsdbookstore_logo.png" alt="WSD Bookstore" id="logo" style="margin-top: 15px;"/></center><hr>
                <p class="alert alert-success" style="text-align: center">Registration successful. Click <a href="main.jsp">here</a> to return to the main page.</p>
            </div>

            <script>
                setTimeout(function () {
                    window.location = "main.jsp";
                }, 3000);
            </script>

            <!--<center><img src="../assets/img/camion.gif" alt="" width="400px" height="300px" style="margin-top: 100px"/>-->

            <!-- The email address has already exists -->
            <% } else {%>
            <div>
                <center><img src="wsdbookstore_logo.png" alt="WSD Bookstore" id="logo" style="margin-top: 15px;"/></center><hr>
                <p class="alert alert-danger" style="text-align: center"> This email address: <%= email%> has already been registered. Click <a href="register.jsp">here</a> to try again.</p>
            </div>

            <% }%>

            <% }%>

            <!-- JQuery -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <!-- Bootstrap tooltips -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
            <!-- Bootstrap core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
            <!-- MDB core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/js/mdb.min.js"></script>

        </div>
    </body>
</html>