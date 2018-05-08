<%-- 
    Document   : register
    Created on : Mar 19, 2018, 12:59:18 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register</h1>
        <%-- used post to store user data, and it contains sensitive data--%>
        <form action="welcome.jsp" method="POST"> 
        <table>     
            <tr>
                <td>Email</td>
                <td><input type="email" name="email"> </td>
            </tr>
            <tr>
                <td>Full name</td>
                <td><input type="text" name="name"> </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"> </td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <input type="radio" name="gender" value="male" checked>Male<br>
                    <input type="radio" name="gender" value="female">Female
                </td>
            </tr>
            <tr>
                <td>Favourite colour</td>
                <td>
                    <select name="favcol">
                        <option value="Red">Red</option>
                        <option value="yellow">Yellow</option>
                        <option value="orange">Orange</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Agree to TOS</td>
                <td>
                    <input type="checkbox" name="tos"><br>
                    <input type="submit" value="Register">
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
