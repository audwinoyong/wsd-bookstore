<%-- 
    Document   : reservationComplete
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.Reservation"%>
<%@page import="uts.wsd.Reservations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String bookfilePath = application.getRealPath("WEB-INF/reservation.xml");%>
   <jsp:useBean id="reservationApp" class="uts.wsd.ReservationApplication" scope="application">
       <jsp:setProperty name="reservationApp" property="filePath" value="<%=bookfilePath%>"/>
   </jsp:useBean>
    <%
          int bookId = Integer.parseInt(request.getParameter("bookId"));
          Reservation reservation = reservationApp.getReservations().getReservationByBookId(bookId);
          reservationApp.getReservations().removeReservation(reservation);
          reservationApp.saveReservations();

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

            <br><a class="btn btn-primary btn-sm" href="reservationList.jsp">Back to My Listings</a>
            <a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
        </div>
        </div>

</html>
