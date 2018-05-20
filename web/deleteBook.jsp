<%-- 
    Document   : reservationComplete
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.Book"%>
<%@page import="uts.wsd.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String bookfilePath = application.getRealPath("WEB-INF/books.xml");%>
   <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="application">
       <jsp:setProperty name="bookApp" property="filePath" value="<%=bookfilePath%>"/>
   </jsp:useBean>
    <%
          int bookId = Integer.parseInt(request.getParameter("bookId"));
          Book book = bookApp.getBooks().getBookByBookId(bookId);
          bookApp.getBooks().removeBook(book);
          bookApp.saveBooks();

    %>   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <jsp:include page="navbar.jsp"/>
    <body>
       <h1>Your Book has been deleted!</h1>
    </body>
        <div class="container">
        <div class="wrapper" style="width:500px; text-align: center">

            <br><a class="btn btn-primary btn-sm" href="booklist.jsp">Back to My Listings</a>
            <a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
        </div>
        </div>

</html>
