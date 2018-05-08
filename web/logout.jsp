<%-- 
    Document   : logout
    Created on : Mar 30, 2018, 10:42:13 AM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loutout Page</title>
    </head>
    <body>
        <%
            session.invalidate();
        %>
        <p>You have been logged out. Click <a href="index.jsp">here</a> to return to the main page.</p>
        
    </body>
</html>
