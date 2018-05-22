<%--
    Document   : reservation
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="application/xml" import="java.util.*" import="uts.wsd.*"%>--%>
<%@page import="uts.wsd.*" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Information</title>
    </head>

    <jsp:include page="navbar.jsp"/>
    <%
        String filePath = application.getRealPath("WEB-INF/reservation.xml");
        String resultPath = application.getRealPath("WEB-INF/result3.xml");
    %>

    <jsp:useBean id="reservationApp" class="uts.wsd.ReservationApplication" scope="application">
        <jsp:setProperty name="reservationApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <%
        Reservations reservations = reservationApp.getReservations();

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        ArrayList<Reservation> matches = reservations.getReservationsByBookId(bookId);

        reservationApp.setFilePath(resultPath);
        Reservations results = reservationApp.getReservations();
        results.addAll(matches);
        reservationApp.updateXML(results, resultPath);
    %>
    <body>
    <center>
        <div class="container">
            <!--Breadcrumb navigation bar-->
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="main.jsp">Main</a></li>
                    <li class="breadcrumb-item"><a href="bookDetails.jsp" onclick="history.back(-1)">Book Details</a></li>
                    <li class="breadcrumb-item" active>Reservation</li>
                </ol>
            </nav>

            <div class="wrapper" style="text-align: left;">
                <c:import url="WEB-INF/result3.xml" var="inputDoc" />
                <c:import url="WEB-INF/reservation.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                </x:transform>
                <br><input type="button" class="btn btn-primary btn-sm" value="Go Back!" onclick="history.back(-1)" />

            </div>
        </div>
    </center>
</body>
</html>


