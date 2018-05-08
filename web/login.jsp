<%-- 
    Document   : login
    Created on : Apr 12, 2018, 10:45:25 AM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login</h1>
        
        <form action="loginAction.jsp" method="POST"> 
        <table>     
            <tr>
                <td>Email</td>
                <td><input type="email" name="email"> </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"> </td>
            </tr>
            <tr>
                <td></td><td><input type="submit" value="login"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
