<%-- 
    Document   : main
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="application/xml" import="java.util.*" import="uts.wsd.*"%>--%>
<%@page import="uts.wsd.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Details</title>
    </head>
    
    <jsp:include page="navbar.jsp"/>
    <body>
<% String filePath = application.getRealPath("WEB-INF/reservation.xml");
   String resultPath = application.getRealPath("WEB-INF/result3.xml");%>
   <jsp:useBean id="reservationApp" class="uts.wsd.ReservationApplication" scope="application">
       <jsp:setProperty name="reservationApp" property="filePath" value="<%=filePath%>"/>
   </jsp:useBean>
   
   <% Reservations reservations = reservationApp.getReservations(); 
       User user = (User) session.getAttribute("user");
       String username = user.getName();
       ArrayList<Reservation> matches = reservations.getReservationsByUsername(username);

       reservationApp.setFilePath(resultPath);
       Reservations results = reservationApp.getReservations();
       results.addAll(matches);
       reservationApp.updateXML(results, resultPath);
    %>    
    <div class="container">
      <div class="wrapper" style="width:500px; text-align: center">

        <c:import url="WEB-INF/result3.xml" var="inputDoc" />
        <c:import url="WEB-INF/reservationlist.xsl" var="stylesheet" />
        <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
        </x:transform>
        <br><input type="button" class="btn btn-primary btn-sm" value="Go Back!" onclick="history.back(-1)" />
            <a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
                    
      </div>
    </div>
        
    </body>
</html>


