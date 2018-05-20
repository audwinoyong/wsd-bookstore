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
<% String filePath = application.getRealPath("WEB-INF/books.xml");
   String resultPath = application.getRealPath("WEB-INF/result2.xml");%>
   <jsp:useBean id="bookApp" class="uts.wsd.BookApplication" scope="request">
       <jsp:setProperty name="bookApp" property="filePath" value="<%=filePath%>"/>
   </jsp:useBean>
   
   <%  Books books = bookApp.getBooks(); 
       User user = (User) session.getAttribute("user");
       
       String username = user.getName();
       ArrayList<Book> matches = books.getBooksByUsername(username);

        String select = request.getParameter("select");
        String search = request.getParameter("search");

        if (select != null) {
            if (select.equals("booktitle")) {
                matches = books.getBooksByTitle(search);
            } else if (select.equals("username")) {
                matches = books.getBooksByUsername(search);
            } 
        }       
       
       bookApp.setFilePath(resultPath);
       Books results = bookApp.getBooks();
       results.addAll(matches);
       bookApp.updateXML(results, resultPath);
       
   
   %>    
        <div class="container">
           <div class="wrapper" style="width:1000px; text-align: center">
             <form action="bookDetails.jsp" method="POST" style="text-align: center;">
                     <table class="table-responsive" align="center" style="text-align: center;">
                         <tr>
                             <td>
                             <select class="form-control" name="select" id="select">
                                 <option value=""> Choose by:</option>
                                 <option value="bookstitle">book title</option>
                                 <option value="username">username</option>
                                 <option value="status"></option>
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
             <c:import url="WEB-INF/result2.xml" var="inputDoc" />
             <c:import url="WEB-INF/booklist.xsl" var="stylesheet" />
             <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
             </x:transform>
                <br><a class="btn btn-primary btn-sm"  href="main.jsp">Go to Main</a>
            </div>
        </div>
    </body>
</html>


