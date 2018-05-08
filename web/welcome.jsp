<%-- 
    Document   : welcome
    Created on : Mar 19, 2018, 1:29:28 PM
    Author     : sungrinrhee
--%>
<!DOCTYPE html>
<%@page import="uts.wsd.Users"%>
<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String filePath = application.getRealPath("WEB-INF/users.xml");
%>
<jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
    <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String favcol = request.getParameter("favcol");
    String tos = request.getParameter("tos");
    
    User user = new User(email, name, password, gender, favcol);
    session.setAttribute("user", user);
    Users users = diaryApp.getUsers();   
    users.addUser(user);
    diaryApp.setUsers(users);
    diaryApp.saveUsers();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%if(tos !=null){%>
        <body bgcolor="<%=favcol%>">
        <p>Welcome, <%=name%>!</p>
        <p>Your Email is <%=email%>.</p>
        <p>Your password is <%=password%>.</p>
        <p>Your gender is <%=gender%>.</p>
        <p>Your favourite colour is <%=favcol%>.</p>
        <p>Click <a href="index.jsp">here </a> to proceed to the main page.</p>

    <%}else{%>
    <p>Sorry, you must agree to the Terms of Service.</p>
    <p>Click <a href="register.jsp">here </a>to go back.</p>
    <%}%>
    </body>

</html>
