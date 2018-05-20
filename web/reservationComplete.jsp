<%-- 
    Document   : reservationComplete
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.Books"%>
<%@page import="uts.wsd.Reservations"%>
<%@page import="uts.wsd.Reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String reservationFilePath = application.getRealPath("WEB-INF/reservation.xml"); %>
<% String bookfilePath = application.getRealPath("WEB-INF/books.xml");%>
   <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="application">
       <jsp:setProperty name="bookApp" property="filePath" value="<%=bookfilePath%>"/>
   </jsp:useBean>
<jsp:useBean id="reservationApp" class="uts.wsd.ReservationApplication" scope="application">
       <jsp:setProperty name="reservationApp" property="filePath" value="<%=reservationFilePath%>"/>
   </jsp:useBean>
    <% 
          int bookId = Integer.parseInt(request.getParameter("bookId"));
          String booktitle = request.getParameter("booktitle");
          String username = request.getParameter("fullName");
          String email = request.getParameter("email");
          Reservation reservation = new Reservation(bookId, booktitle, username, email);

    %>   
   <% Reservations reservations = reservationApp.getReservations(); 
      reservations.addReservation(reservation);
      reservationApp.saveReservations();
      bookApp.getBooks().getBookByBookId(bookId).setAvailablilty("Reserved");
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
        <h1>Reservation complete!</h1>
       <div class="container">
            <div class="wrapper" style="width:500px; text-align: center">

                <table align="center">
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
            <br><a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
            </div>
            </div>
       </div>
    </body>
</html>
