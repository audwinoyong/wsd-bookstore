<%--
    Document   : reservationComplete
    Created on : May 19, 2018, 4:56:20 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.Books"%>
<%@page import="uts.wsd.Reservation"%>
<%@page import="uts.wsd.Reservations"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Complete</title>
    </head>

    <jsp:include page="navbar.jsp"/>

    <%
        String reservationFilePath = application.getRealPath("WEB-INF/reservation.xml");
        String bookfilePath = application.getRealPath("WEB-INF/books.xml");
    %>

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
        Reservations reservations = reservationApp.getReservations();
        reservations.addReservation(reservation);
        reservationApp.saveReservations();

        bookApp.getBooks().getBookByBookId(bookId).setAvailablilty("Reserved");
        bookApp.saveBooks();
    %>

    <body>
    <center>
        <div class="container">
            <p class="alert alert-success" style="text-align: center">Reservation complete!</p>

            <table align="center">
                <tr>
                    <td>Your book Id:</td>
                    <td><%=bookId%></td>
                </tr>
                <tr>
                    <td>Your book title:</td>
                    <td><%=booktitle%></td>
                </tr>
                <tr>
                    <td>Your name:</td>
                    <td><%=username%></td>
                </tr>
                <tr>
                    <td>Your email</td>
                    <td><%=email%></td>
                </tr>

            </table>
            <br><a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
        </div>
    </div>
</center>
</body>
</html>
