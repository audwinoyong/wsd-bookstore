<%-- 
    Document   : reservationForm
    Created on : May 19, 2018, 4:40:56 PM
    Author     : sungrinrhee
--%>

<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve book</title>     
    </head>
    
    <jsp:include page="navbar.jsp"/>
    <body>
        <% 
            User user = (User) session.getAttribute("user");
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            String booktitle = request.getParameter("booktitle");
              
        %>
       <div class="container">
            <div class="wrapper" style="width:500px; text-align: center">
          
                <form action="reservationComplete.jsp" method="POST" style="text-align: center;">
                    <table align="center">
                        <tr>
                            <td>
                            Your Full name: 
                            </td>

                            <td>
                             <input name="fullName" type="text" style="margin-left:10px;margin-right:10px;" value ="<%= (user!=null ? user.getName(): "")%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Your Email: 
                            </td>
                            <td>
                                <input name="email" type="text" style="margin-left:10px;margin-right:10px;">
                                <input name="bookId" type="hidden" value="<%=bookId%>">
                                <input name="booktitle" type="hidden" value="<%=booktitle%>">

                            </td>
                        </tr>
                        <tr>
                            <td align="center"><input type="button" class="btn btn-primary btn-sm" value="Go Back!" onclick="history.back(-1)" />
                            </td>
                            <td align="center">
                                <input class="form-control" type="Submit" value="Submit">
                            </td>
                        </tr>
                    </table>
                </form>  
            </div>
       </div>
    </body>
</html>