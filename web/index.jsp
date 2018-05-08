<%-- 
    Document   : index
    Created on : Mar 30, 2018, 10:29:40 AM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index JSP Page</title>
        <style>
            div { background-color:#cc0000; text-align: right; padding-right: 10px;}
            p {text-aligh: right; padding-right: 10px}
            ul {list-style-type: circle;}
        </style>
    </head>
    <body>
        <h1>Diary Keeper</h1>
        <% User user = (User) session.getAttribute("user"); %>
        <% if(user != null) {%>
        <div>You are logged in as <%=user.getName()%> &lt;<%=user.getEmail()%>&gt;</div>
        <p><a href="logout.jsp">Logout</a></p>
        <ul>
            <li><a href="edit_user.jsp">My Account</a></li>
        </ul>        
        </div>
        <% } else { %>
        <div>You are not logged in</div>
        <p><a href="login.jsp">Login</a></p>
        <p><a href="register.jsp">Register</a></p>

        
        <%} %>
    </body>
</html>
