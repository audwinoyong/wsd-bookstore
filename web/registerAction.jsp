<%--
    Document   : registerAction
    Created on : 17/05/2018, 11:06:16 AM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Register Action</title>
    </head>
    <jsp:include page="navbar.jsp"/>

    <%
        boolean submitted = request.getParameter("submitted") != null;
        if (submitted) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String filePath = application.getRealPath("WEB-INF/users.xml");
    %>

    <jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
        <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <%
        Validator validator = new Validator();

        Users users = diaryApp.getUsers();

        // Verification of empty inputs on name, email and password
        if (validator.isEmpty(name, email, password)) {
            session.setAttribute("emptyError", "[All fields are mandatory]");
            response.sendRedirect("register.jsp");
            // Verification of Incorrect Name format
        } else if (!validator.validName(name)) {
            session.setAttribute("nameError", "[Incorrect name format]");
            response.sendRedirect("register.jsp");
            // Verification of Incorrect Email format
        } else if (!validator.validEmail(email)) {
            session.setAttribute("emailError", "[Incorrect email format]");
            response.sendRedirect("register.jsp");
            // Verification of Incorrect Passsword format
        } else if (!validator.validPassword(password)) {
            session.setAttribute("passwordError", "[Incorrect password format]");
            response.sendRedirect("register.jsp");
            // Verification of Incorrect DOB format
        } else if (!validator.validDob(dob)) {
            session.setAttribute("dobError", "[Incorrect DOB format]");
            response.sendRedirect("register.jsp");
        } else if (users.getUser(email) == null) {

            // If email address is not exists yet, register the new user
            User user = new User(name, email, password, dob);
            session.setAttribute("user", user);
            users.addUser(user);
            diaryApp.updateXML(users, filePath);

            // clear the errors
            session.setAttribute("emptyError", "");
            session.setAttribute("nameError", "");
            session.setAttribute("emailError", "");
            session.setAttribute("passwordError", "");
            session.setAttribute("dobError", "");
    %>

    <body>
        <div class="container">
            <p class="alert alert-success" style="text-align: center">Registration successful. Click <a href="main.jsp">here</a> to return to the main page.</p>
        </div>

        <script>
            setTimeout(function () {
                window.location = "main.jsp";
            }, 3000);
        </script>

        <!-- The email address has already exists feedback-->
        <% } else {%>
        <div class="container">
            <p class="alert alert-danger" style="text-align: center"> This email address &lt;<%= email%>&gt; has already been registered. Click <a href="register.jsp">here</a> to try again.</p>
        </div>
        <% }%>

        <% }%>
    </body>
</html>
