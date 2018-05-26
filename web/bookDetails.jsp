<%--
    Document   : bookDetails
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="application/xml" import="java.util.*" import="uts.wsd.*"%>--%>
<%@page import="uts.wsd.*" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Details</title>
    </head>
    <!-- import navigation bar -->
    <jsp:include page="navbar.jsp"/>
    <%
        String filePath = application.getRealPath("WEB-INF/books.xml");
        String resultPath = application.getRealPath("WEB-INF/result2.xml");
    %>
    <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="request">
        <jsp:setProperty name="bookApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <%
        //This page displays after user selecting a book title from main page.
        Books books = bookApp.getBooks(); //get all the books from the XML file
        String booktitle = request.getParameter("booktitle"); //receive the title of the book selected
        ArrayList<Book> matches = books.getBooksByTitle(booktitle); // This arraylist stores books with selected title.

        //Passing search options and searching keywords.
        String select = request.getParameter("select"); //search option e.g.booktitle, username .. etc.
        String search = request.getParameter("search"); //search keyword e.g. "Romeo and Juliet"

        if (select != null) { // it only happens when user is searching through the books
            if (select.equals("booktitle")) {
                matches = books.getBooksByTitle(search); // find books by title
            } else if (select.equals("username")) {
                matches = books.getBooksByUsername(search); // find books by lister
            } else if (select.equals("Available")) {
                matches = books.getBooksByStatus("Available"); // find books available
            }
        }
        if (matches.isEmpty()) {
            response.sendRedirect("error.jsp"); // if nothing is found, redirect user to error page.
        }
        //save search results temporarily in result.xml.
        bookApp.setFilePath(resultPath);
        Books results = bookApp.getBooks();
        results.addAll(matches);
        bookApp.updateXML(results, resultPath); // update xml where search results are stored temporarily.
    %>
    <body>
    <center>
        <div class="container">
            <!--Breadcrumb navigation bar-->
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="main.jsp">Main</a></li>
                    <li class="breadcrumb-item active">Book Details</li>
                </ol>
            </nav>

            <div class="wrapper" style="text-align: left;">
                <form action="bookDetails.jsp" method="POST">
                    <table class="table-responsive">
                        <tr>
                            <td>
                                <select class="form-control" name="select" id="select">
                                    <option value=""> Choose by:</option>
                                    <option value="bookstitle">book title</option>
                                    <option value="username">username</option>
                                    <option value="Available">available only</option>
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
                <!-- Display results after transformation of xml into html by xslt -->
                <c:import url="WEB-INF/result2.xml" var="inputDoc" />
                <c:import url="WEB-INF/bookdetail.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                </x:transform>
                <br>
                <input type="button" class="btn btn-primary btn-sm" value="Go Back!" onclick="history.back(-1)" />
            </div>
        </div>
    </center>
</body>
</html>


