<%-- 
    Document   : loginAction
    Created on : Apr 12, 2018, 10:50:41 AM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.Users"%>
<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%  
    String filePath = application.getRealPath("WEB-INF/users.xml");
%>
    <jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
        <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Users users = diaryApp.getUsers();
    User user = users.login(email, password);
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginAction JSP Page</title>
        
    </head>
    <body>

    <%if(user != null)
    {
        session.setAttribute("user", user);
    %>
    <p>Login successful.</p>
    <p>Click <a href="index.jsp">here </a>to return to the main page.</p>
    </body>
    <%} else {%>
    <p>Password incorrect. </p>
    <p>Click <a href="login.jsp">here </a>to try again.</p>
    <% } %>
</html>