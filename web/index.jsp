<%-- 
    Document   : index
    Created on : 29/03/2018, 10:34:00 PM
    Author     : Audwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diary Keeper</title>
    </head>
    <% User user = (User)session.getAttribute("user"); %>
    <body>
        <h1>Diary Keeper</h1>
        
        <% if (user != null) { %>
        <table width="100%">
            <tr bgcolor="lightgrey" ><td align="right">You are logged in as <%= user.getName()%> &lt;<%= user.getEmail()%>&gt; </td></tr>
            <tr><td align="right"><a href="logout.jsp">Logout</a></td></tr>
            <tr align="left"><td><a href="edit_user.jsp">My Account</a></td></tr>         
        </table>
        
        <% } else { %>
        <table width="100%">
            <tr bgcolor="lightgrey" ><td align="right">You are not logged in</td></tr>
            <tr><td align="right"><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></td></tr>
        </table>
        <% } %>
    </body>
</html>
