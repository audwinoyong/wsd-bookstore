<%--
    Document   : booklistComplete
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Book"%>
<%@page import="uts.wsd.Books"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List New Book Complete</title>

        <style>
            table td, th { padding-right: 50px; padding-bottom: 5px }
        </style>
    </head>

    <jsp:include page="navbar.jsp"/>
    <% String bookfilePath = application.getRealPath("WEB-INF/books.xml");%>

    <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="application">
        <jsp:setProperty name="bookApp" property="filePath" value="<%=bookfilePath%>"/>
    </jsp:useBean>

    <%
        //List a new book with information filled by lister from previous page(booklist.jsp)
        User user = (User) session.getAttribute("user");
        String booktitle = request.getParameter("booktitle");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        String condition = request.getParameter("condition");
        String isbn = request.getParameter("isbn");
        int publishYear = Integer.parseInt(request.getParameter("publishYear"));
        String publisher = request.getParameter("publisher");
        String username = user.getName();
        String abst = request.getParameter("abst");

        //create new book with corresponding details and save it to xml.
        Book book = new Book(booktitle, author, category, condition, isbn, publishYear, publisher, username, abst);
        bookApp.getBooks().addBook(book);
        bookApp.saveBooks();

    %>
    <body>
    <center>
        <div class="container">
            <p class="alert alert-success" style="text-align: center">Your book has been listed!</p>

            <table align="center">
                <tr>
                    <td style="font-weight: bold;">Book Title:</td>
                    <td><%=booktitle%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Author:</td>
                    <td><%=author%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Category:</td>
                    <td><%=category%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Condition:</td>
                    <td><%=condition%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">ISBN:</td>
                    <td><%=isbn%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Year of Publication:</td>
                    <td><%=publishYear%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Publisher:</td>
                    <td><%=publisher%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Abstract:</td>
                    <td><%=abst%></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Your Name:</td>
                    <td><%=username%></td>
                </tr>
            </table>
            <br>
            <p><a class="btn btn-primary btn-sm" href="booklist.jsp">Back to My Listings</a> <a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a></p>
        </div>
    </center>
</body>
</html>
