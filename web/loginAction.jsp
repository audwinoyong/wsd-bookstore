<%-- 
    Document   : loginAction
    Created on : 06/04/2018, 1:47:13 PM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="uts.wsd.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
   
    <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
    <jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
        <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>" />
    </jsp:useBean>

    <body>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Users users = diaryApp.getUsers();
            User user = users.login(email, password);

            Validator validator = new Validator();
        %>
        <%
            if (validator.isEmpty(email, password)) {
                session.setAttribute("emptyError", "[All fields are mandatory]");
                response.sendRedirect("login.jsp");
            } else if (!validator.validEmail(email)){
                session.setAttribute("emailError", "[Incorrect email format]");
                response.sendRedirect("login.jsp");
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
                <p>Login successful. Click <a href="index.jsp">here</a> to return to the main page.</p>
            <% } else {
                // clear the errors
                session.setAttribute("emptyError", "");
                session.setAttribute("emailError", "");
                session.setAttribute("passwordError", "");
            %>
                <p>Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
            <% } %>
            
    </body>
</html>
