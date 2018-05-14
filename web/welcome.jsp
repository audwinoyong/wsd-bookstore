<%-- 
    Document   : welcome
    Created on : 16/03/2018, 10:52:36 PM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="uts.wsd.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
        <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <% Users users = diaryApp.getUsers(); %>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String favcol = request.getParameter("favcol");
        String tos = request.getParameter("tos");

        if (tos == null) {
            favcol = "white";
        }
    %>
        
    <body bgcolor="<%= favcol %>">
        <% 
            if (tos != null) { 
                if (users.getUser(email) == null) {
        %>
                    <p>Welcome, <%= name %>!</p>
                    <p>Your Email is <%= email %>.</p>
                    <p>Your password is <%= password %>.</p>
                    <p>Your gender is <%= gender %>.</p>
                    <p>Your favourite colour is <%= favcol %>.</p>

                    <p>Click <a href="index.jsp">here</a> to proceed to the main page.</p>

                    <% 
                        User user  = new User(email, name, password, gender, favcol);
                        session.setAttribute("user", user);

                        users.addUser(user);
                        diaryApp.saveUsers();
                    %>
                <% } else { %>
                    <p>This email address: <%= email %> has already been registered.</p>
                    <p>Click <a href="register.jsp">here</a> to go back.</p>
                <% } %>
        <% } else { %>
            <p>Sorry, you must agree to the Terms of Service.</p>
            <p>Click <a href="register.jsp">here</a> to go back.</p>
        <% } %>
    </body>
</html>
