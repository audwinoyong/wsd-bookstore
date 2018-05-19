<%-- 
    Document   : reservationComplete
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

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
          String booktitle = request.getParameter("booktitle");
          String author = request.getParameter("author");
          String category = request.getParameter("category");
          String condition = request.getParameter("condition");
          String isbn = request.getParameter("isbn");
          int publishYear = Integer.parseInt(request.getParameter("publishYear"));
          String publisher = request.getParameter("publisher");
          String username = request.getParameter("fullName");
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
    <body>

        <h1>Reservation complete!</h1>
         <table>
                <tr>
                    <td>
                    Your book Id:  
                    </td>
                    
                    <td>
                        <%=bookId%>
                    </td>
                </tr>
                <tr>
                    <td>
                    Your book title:   
                    </td>
                    
                    <td>
                        <%=booktitle%>
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
                <tr>
                    <td>
                    Your email   
                    </td>
                    
                    <td>
                        <%=email%>
                    </td>
                </tr> 
                
            </table>
        <a href ="main.jsp">Go to Main</a>
    </body>
</html>
