<%-- 
    Document   : main
    Created on : May 18, 2018, 10:22:16 PM
    Author     : sungrinrhee
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="application/xml" import="java.util.*" import="uts.wsd.*"%>--%>
<%@page import="uts.wsd.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<% String filePath = application.getRealPath("WEB-INF/books.xml");
   String resultPath = application.getRealPath("WEB-INF/result.xml");%>
   <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="application">
       <jsp:setProperty name="bookApp" property="filePath" value="<%=filePath%>"/>
   </jsp:useBean>
   <%
       bookApp.setFilePath(filePath);
       Books books = bookApp.getBooks();

        bookApp.setFilePath(resultPath);
        Books results = books.getBooksList(books);   

     
        bookApp.updateXML(results, resultPath);   
    %>   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookingAction</title>
    </head>
    <body>
          <button class="btn btn primary" style="float:right;"><a href="bookings.jsp" style="">Show My Booking.</a></button>
            <form action="bookDetails.jsp" method="POST">
                <table class="table-responsive">
                    <tr>
                        <td>
                        <select class="form-control" name="select" id="select">
                            <option value=""> Choose by:</option>
                            <option value="booktitle">book title</option>
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


            </form>        
        
        <c:import url="WEB-INF/result.xml" var="inputDoc" />
        <c:import url="WEB-INF/books.xsl" var="stylesheet" />
        <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
        </x:transform>
        
    </body>
</html>


