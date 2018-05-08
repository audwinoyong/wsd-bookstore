<%-- 
    Document   : edit_user
    Created on : Mar 30, 2018, 11:12:12 AM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            User user = (User)session.getAttribute( "user" );
        %>
        
    </head>
    <body>
       <h1>My Account</h1>
        <%-- used post to store user data, and it contains sensitive data--%>
        <form action="updated.jsp" method="POST"> 
        <table>     
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" value="<%=user.getEmail()%>"> </td>
            </tr>
            <tr>
                <td>Full name</td>
                <td><input type="text" name="name" value="<%=user.getName()%>"> </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" value="<%=user.getPassword()%>"</td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
      
                    <input type="radio" name="gender" value="male" <%= (user.getGender().equalsIgnoreCase("male") ? "checked": "")%>>Male<br>
                    <input type="radio" name="gender" value="female" <%= (user.getGender().equalsIgnoreCase("female") ? "checked": "")%>>Female
                </td>
            </tr>
            <tr>
                <td>Favourite colour</td>
                <td>
                    <select name="favcol">
                        <option value="Red" <%= (user.getFavouriteColour().equalsIgnoreCase("red") ? "selected": "")%>>Red</option>
                        <option value="yellow" <%= (user.getFavouriteColour().equalsIgnoreCase("yellow") ? "selected": "")%>>Yellow</option>
                        <option value="orange" <%= (user.getFavouriteColour().equalsIgnoreCase("orange") ? "selected": "")%>>Orange</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Save"></td>
            </tr>
        </table>
                    <input type="hidden" name="submitted" value="yes">
        </form>
        <p>Return to the <a href="index.jsp">main page</a>.</p>
    </body>
</html>
