<%-- 
    Document   : main
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="application/xml" import="java.util.*" import="uts.wsd.*"%>--%>
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


