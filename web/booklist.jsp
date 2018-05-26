<%--
    Document   : booklist
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Listings</title>
    </head>

    <jsp:include page="navbar.jsp"/>
    <body>
    <center>
        <%
            String filePath = application.getRealPath("WEB-INF/books.xml");
            String resultPath = application.getRealPath("WEB-INF/result2.xml");
        %>

        <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="request">
            <jsp:setProperty name="bookApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

        <%
            // Load books by username
            Books books = bookApp.getBooks();
            User user = (User) session.getAttribute("user"); // Set the login user to the session.

            String username = user.getName();
            ArrayList<Book> matches = books.getBooksByUsername(username); // This arraylist stores books listed by user.

            //save search results temporarily in result.xml.
            bookApp.setFilePath(resultPath);
            Books results = bookApp.getBooks();
            results.addAll(matches);
            bookApp.updateXML(results, resultPath);
        %>
        <div class="container">
            <!--Breadcrumb navigation bar-->
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="main.jsp">Main</a></li>
                    <li class="breadcrumb-item" active>My Listings</li>
                </ol>
            </nav>

            <div class="wrapper">
                <form action="bookDetails.jsp" method="POST">
                    <table class="table-responsive" style="text-align: left;">
                        <tr>
                            <td>
                                <select class="form-control" name="select" id="select">
                                    <option value="">Choose by:</option>
                                    <option value="bookstitle">Book Title</option>
                                    <option value="username">Username</option>
                                    <option value="Available">Available Only</option>
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
                <br>

                <c:import url="WEB-INF/result2.xml" var="inputDoc" />
                <c:import url="WEB-INF/booklist.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                </x:transform>

                <br><a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
            </div>
        </div>
    </center>
</body>
</html>


