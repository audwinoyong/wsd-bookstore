<%--
    Document   : deleteReservation
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.Reservation"%>
<%@page import="uts.wsd.Reservations"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Reservation</title>
    </head>

    <jsp:include page="navbar.jsp"/>
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
    <body>
    <center>
        <div class="container">
            <p class="alert alert-danger" style="text-align: center">Your reservation has been canceled!</p>
            
            <div class="wrapper" style="width:500px; text-align: center">
                <br><a class="btn btn-primary btn-sm" href="reservationList.jsp">Back to My Reservations</a>
                <a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
            </div>
        </div>
    </center>
</body>
</html>
