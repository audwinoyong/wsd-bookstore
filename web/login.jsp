<%-- 
    Document   : login
    Created on : 06/04/2018, 1:42:27 PM
    Author     : Audwin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <% 
        String emailError = request.getParameter("emailError");
        String passwordError = request.getParameter("passwordError");
        String emptyError = request.getParameter("emptyError");
    %>
    <body>
        <h1>Login</h1>
        <p>Enter details to login: <c:if test="${emptyError != null}"> <c:out value="${emptyError}"/></c:if></p>
        <form action="loginAction.jsp" method="POST">
            <table>
                <tr><td>Email</td><td><input type="text" name="email"> <c:if test="${emailError != null}"> <c:out value="${emailError}"/></c:if></td></tr>
                <tr><td>Password</td><td><input type="password" name="password"> <c:if test="${passwordError != null}"> <c:out value="${passwordError}"/></c:if></td></tr>
                <tr><td></td><td><input type="submit" value="Login"></td></tr>
            </table>
        </form>
    </body>
</html>
