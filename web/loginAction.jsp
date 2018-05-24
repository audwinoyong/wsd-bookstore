<%--
    Document   : loginAction
    Created on : 17/05/2018, 11:05:26 AM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Login Action Page</title>
    </head>

    <jsp:include page="navbar.jsp"/>

    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
        <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>" />
    </jsp:useBean>

    <body>
        <%
            // Request the input from the login page
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Users users = diaryApp.getUsers();
            // Verify user email and password with data from users.xml
            User user = users.login(email, password);

            Validator validator = new Validator();
        %>

        <%
            // Verification of empty input on email and password
            if (validator.isEmpty(email, password)) {
                session.setAttribute("emptyError", "[All fields are mandatory]");
                response.sendRedirect("login.jsp");

                // Verification of Incorrect Email format
            } else if (!validator.validEmail(email)) {
                session.setAttribute("emailError", "[Incorrect email format]");
                response.sendRedirect("login.jsp");

                // Verification of Password format
            } else if (!validator.validPassword(password)) {
                session.setAttribute("passwordError", "[Incorrect password format]");
                response.sendRedirect("login.jsp");
            } else if (user != null) {
                session.setAttribute("user", user);

                // clear the errors
                session.setAttribute("emptyError", "");
                session.setAttribute("emailError", "");
                session.setAttribute("passwordError", "");
        %>
        <div class="container">
            <p class="alert alert-success" style="text-align: center">Login successful. Click <a href="main.jsp">here</a> to return to the main page.</p>
        </div>

        <script>
            setTimeout(function () {
                window.location = "main.jsp";
            }, 3000);
        </script>

        <% } else {
            // clear the errors
            session.setAttribute("emptyError", "");
            session.setAttribute("emailError", "");
            session.setAttribute("passwordError", "");
        %>

        <!-- Incorrect password feedback -->
        <div class="container">
            <p class="alert alert-danger" style="text-align: center"> Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
        </div>
        <% }%>

    </body>
</html>
