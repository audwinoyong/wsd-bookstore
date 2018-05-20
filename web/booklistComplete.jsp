<%-- 
    Document   : reservationComplete
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Book"%>
<%@page import="uts.wsd.Books"%>
<%@page import="uts.wsd.Reservations"%>
<%@page import="uts.wsd.Reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String bookfilePath = application.getRealPath("WEB-INF/books.xml");%>
   <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="application">
       <jsp:setProperty name="bookApp" property="filePath" value="<%=bookfilePath%>"/>
   </jsp:useBean>
    <%
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
          Book book = new Book(booktitle, author, category, condition, isbn, publishYear, publisher, username, abst);
          bookApp.getBooks().addBook(book);
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
       <h1>Your Book has been listed!</h1>
       <div class="container">
            <div class="wrapper" style="width:500px; text-align: center">
                <form action="booklistComplete.jsp" method="POST" style="text-align: center;">
                <table>
                       <tr>
                           <td>
                           Book title:   
                           </td>

                           <td>
                               <%=booktitle%>
                           </td>
                       </tr> 
                       <tr>
                           <td>
                           Author:
                           </td>

                           <td>
                               <%=author%>
                           </td>
                       </tr>                 
                       <tr>
                           <td>
                           Category: 
                           </td>

                           <td>
                               <%=category%>
                           </td>
                       </tr> 
                       <tr>
                           <td>
                           condition:    
                           </td>

                           <td>
                               <%=condition%>
                           </td>
                       </tr> 
                       <tr>
                           <td>
                           ISBN:    
                           </td>

                           <td>
                               <%=isbn%>
                           </td>
                       </tr>                 
                       <tr>
                           <td>
                           Publish year:   
                           </td>

                           <td>
                               <%=publishYear%>
                           </td>
                       </tr> 
                       <tr>
                           <td>
                           Publisher    
                           </td>

                           <td>
                               <%=publisher%>
                           </td>
                       </tr> 
                       <tr>
                           <td>
                           Abstract:    
                           </td>

                           <td>
                               <%=abst%>
                           </td>
                       </tr>                 
                       <tr>
                           <td>
                           Your name:    
                           </td>

                           <td>
                               <%=username%>
                           </td>
                       </tr> 
                   </table>
            <br><a class="btn btn-primary btn-sm" href="booklist.jsp">Back to My Listings</a><a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
            </div>
       </div>
    </body>
</html>
