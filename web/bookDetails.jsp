<%--
    Document   : main
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
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </head>
    <jsp:include page="navbar.jsp"/>
    <%
        String filePath = application.getRealPath("WEB-INF/books.xml");
        String resultPath = application.getRealPath("WEB-INF/result2.xml");
    %>

    <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="request">
        <jsp:setProperty name="bookApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <%
        Books books = bookApp.getBooks();

        String booktitle = request.getParameter("booktitle");
        ArrayList<Book> matches = books.getBooksByTitle(booktitle);

        String select = request.getParameter("select");
        String search = request.getParameter("search");

        if (select != null) {
            if (select.equals("booktitle")) {
                matches = books.getBooksByTitle(search);
            } else if (select.equals("username")) {
                matches = books.getBooksByUsername(search);
            }
        }

        bookApp.setFilePath(resultPath);
        Books results = bookApp.getBooks();
        results.addAll(matches);
        bookApp.updateXML(results, resultPath);
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

                <c:import url="WEB-INF/result2.xml" var="inputDoc" />
                <c:import url="WEB-INF/bookdetail.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                </x:transform>
                <button onclick="goBack()">Go Back</button>

            </div>
        </div>
    </center>
</body>
</html>


