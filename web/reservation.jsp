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
    <body>
<% String filePath = application.getRealPath("WEB-INF/reservation.xml");
   String resultPath = application.getRealPath("WEB-INF/result3.xml");%>
   <jsp:useBean id="reservationApp" class="uts.wsd.ReservationApplication" scope="application">
       <jsp:setProperty name="reservationApp" property="filePath" value="<%=filePath%>"/>
   </jsp:useBean>
   
   <% Reservations reservations = reservationApp.getReservations(); %>
   <%
       int bookId = Integer.parseInt(request.getParameter("bookId"));
       ArrayList<Reservation> matches = reservations.getReservationsByBookId(bookId);

       
       reservationApp.setFilePath(resultPath);
       Reservations results = reservationApp.getReservations();
       results.addAll(matches);
       reservationApp.updateXML(results, resultPath);
       
   
   %>    
<!--        <form action="main.jsp" method="POST">
                <table class="table-responsive">
                    <tr>
                        <td>
                        <select class="form-control" name="select" id="select">
                            <option value=""> Choose by:</option>
                            <option value="bookstitle">book title</option>
                            <option value="username">username</option>
                        </select>
                        </td>
                        <td>
                        <input class="form-control" name="search" type="text" style="margin-left:10px;margin-right:10px;">
                        </td>
                        <td>
                        <input class="form-control" type="Submit" value="Submit">
                        </td>
                    </tr>
                </table>
            </form>    -->
        <c:import url="WEB-INF/result3.xml" var="inputDoc" />
        <c:import url="WEB-INF/reservation.xsl" var="stylesheet" />
        <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
        </x:transform>
             
        
    </body>
</html>


