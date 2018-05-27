<%--
    Document   : main
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*" %>
<%@page import="java.io.PrintWriter"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>

    <jsp:include page="navbar.jsp"/>
    <%
        String filePath = application.getRealPath("WEB-INF/books.xml");
        String resultPath = application.getRealPath("WEB-INF/result.xml");
    %>
    <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="page">
        <jsp:setProperty name="bookApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <%

        bookApp.setFilePath(filePath);
        Books books = bookApp.getBooks();

        bookApp.setFilePath(resultPath);
        Books results = books.getBooksList(books);

        bookApp.updateXML(results, resultPath);
    %>
    <body>
    <center>
        <div class="container">
            <!--Breadcrumb navigation bar-->
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active">Main</li>
                </ol>
            </nav>

            <div class="wrapper" style="text-align: left;">
                <!-- Input form of search query sorted by BookTitle or Username -->
                <form action="bookDetails.jsp" method="POST">
                    <table class="table-responsive">
                        <tr>
                            <td>
                                <select class="form-control" name="select" id="select">
                                    <option value="" disabled selected>Choose by:</option>
                                    <option value="booktitle">Book Title</option>
                                    <option value="username">Username</option>
                                </select>
                            </td>
                            <td>
                                <input class="form-control" name="search" type="text" style="margin-left:10px; margin-right:10px;">
                            </td>
                            <td>
                                <input class="form-control" type="Submit" value="Submit">
                            </td>
                        </tr>
                    </table>
                </form>

                <!-- Get all the information from books.xsl -->
                <c:import url="WEB-INF/result.xml" var="inputDoc" />
                <c:import url="WEB-INF/books.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                </x:transform>

            </div>
        </div>
    </center>
</body>
</html>


