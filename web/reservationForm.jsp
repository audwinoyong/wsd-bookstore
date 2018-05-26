<%--
    Document   : reservationForm
    Created on : May 19, 2018, 4:40:56 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve Book</title>

        <style>
            table td, th { padding-right: 50px; }
        </style>
    </head>

    <jsp:include page="navbar.jsp"/>
    
    <%
        User user = (User) session.getAttribute("user");
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String booktitle = request.getParameter("booktitle");

    %>
    <body>
    <center>
        <div class="container">
            <!--Breadcrumb navigation bar-->
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="main.jsp">Main</a></li>
                    <li class="breadcrumb-item"><a href="bookDetails.jsp" onclick="history.back(-1)">Book Details</a></li>
                    <li class="breadcrumb-item" active>Reserve Book</li>
                </ol>
            </nav>

            <div class="wrapper" style="width: 500px; text-align: left">
                <form action="reservationComplete.jsp" method="POST">
                    <table align="center">
                        <tr>
                            <td>Your Full Name:</td><td>
                                <input name="fullName" type="text" class="form-control" value="<%= (user != null ? user.getName() : "")%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Your Email:</td>
                            <td>
                                <input name="email" type="text" class="form-control" value="<%= (user != null ? user.getEmail() : "")%>" required>
                                <input name="bookId" type="hidden" value="<%=bookId%>">
                                <input name="booktitle" type="hidden" value="<%=booktitle%>">
                            </td>
                        </tr>
                        <tr>
                            <td align="center"><input type="button" class="btn btn-warning btn-sm" value="Go Back!" onclick="history.back(-1)" />
                            </td>
                            <td align="center">
                                <input class="btn btn-primary btn-block" type="Submit" value="Submit">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </center>
</body>
</html>