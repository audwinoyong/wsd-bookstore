<%--
    Document   : deleteBook
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.Book"%>
<%@page import="uts.wsd.Books"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Book</title>
    </head>

    <jsp:include page="navbar.jsp"/>
    <% String bookfilePath = application.getRealPath("WEB-INF/books.xml");%>

    <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="application">
        <jsp:setProperty name="bookApp" property="filePath" value="<%=bookfilePath%>"/>
    </jsp:useBean>

    <%
        //Remove book by finding its book ID.
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Book book = bookApp.getBooks().getBookByBookId(bookId);
        bookApp.getBooks().removeBook(book);
        bookApp.saveBooks();
    %>
    <body>
    <center>
        <div class="container">
            <p class="alert alert-danger" style="text-align: center">Your book has been deleted!</p>

            <div class="wrapper" style="width:500px; text-align: center">
                <br><a class="btn btn-primary btn-sm" href="booklist.jsp">Back to My Listings</a>
                <a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
            </div>
        </div>
    </center>
</body>
</html>
