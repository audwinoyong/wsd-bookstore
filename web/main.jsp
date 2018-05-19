<%-- 
    Document   : main
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="application/xml" import="java.util.*" import="uts.wsd.*"%>--%>
<%@page import="uts.wsd.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookingAction</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="css/my-login.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">
    </head>
    <%
        String filePath = application.getRealPath("WEB-INF/books.xml");
        String resultPath = application.getRealPath("WEB-INF/result.xml");
    %>
    <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="application">
        <jsp:setProperty name="bookApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <%
        User user = (User) session.getAttribute("user");

        bookApp.setFilePath(filePath);
        Books books = bookApp.getBooks();

        bookApp.setFilePath(resultPath);
        Books results = books.getBooksList(books);

        bookApp.updateXML(results, resultPath);
    %>
    <body>
    <center>
        <div class="container">
            <% if (user != null) {%>
            <div class="float-right">
                <table class="table-responsive">
                    <tr align="right"><td>Welcome, <%= user.getName()%>! &lt;<%= user.getEmail()%>&gt;</td></tr>
                    <tr align="right">
                        <td>
                            <a href="main.jsp">Main</a> | 
                            <a href="listnewbook.jsp">List New Book</a> | 
                            <a href="bookings.jsp">Show My Booking</a> | 
                            <a href="logout.jsp">Logout</a>
                        </td>
                    </tr>
                </table>
            </div>

            <% } else { %>
            <div class="float-right">
                <table class="table-responsive" align="right">
                    <tr align="right"><td>You are not logged in</td></tr>
                    <tr align="right">
                        <td>
                            <a href="main.jsp">Main</a> | 
                            <a href="login.jsp">Login</a>
                        </td>
                    </tr>
                </table>
            </div>
            <% } %>
            
            <br/>
            <br/>
            <br/>
            
            <div class="wrapper" style="width:500px; text-align: center">
                <form action="bookDetails.jsp" method="POST" style="text-align: center;">
                    <table class="table-responsive">
                        <tr>
                            <td>
                                <select class="form-control" name="select" id="select">
                                    <option value="">Choose by:</option>
                                    <option value="booktitle">book title</option>
                                    <option value="username">username</option>
                                </select>
                            </td>
                            <td>
                                <input class="form-control" name="search" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                            <td>
                                <input class="form-control" type="Submit" value="Submit">
                            </td>
                        </tr>
                    </table>
                </form>        

                <c:import url="WEB-INF/result.xml" var="inputDoc" />
                <c:import url="WEB-INF/books.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                </x:transform>
            </div>
        </div>
    </center>
</body>
</html>


