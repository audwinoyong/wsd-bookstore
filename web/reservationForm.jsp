<%-- 
    Document   : reservationForm
    Created on : May 19, 2018, 4:40:56 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve book</title>
    <script>
    function goBack() {
        window.history.back();
    }
    </script>        
    </head>
    
    <jsp:include page="navbar.jsp"/>
    <body>
        <% 
              int bookId = Integer.parseInt(request.getParameter("bookId"));
              String booktitle = request.getParameter("booktitle");
              
        %>
        <form action="reservationComplete.jsp" method="POST">
            <table>
                <tr>
                    <td>
                    Your Full name: 
                    </td>
                    
                    <td>
                     <input name="fullName" type="text" style="margin-left:10px;margin-right:10px;">
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
                    <td></td>
                    <td align="center">
                        <button onclick="goBack()">Go Back</button>
                        <input class="form-control" type="Submit" value="Submit">
                    </td>
                </tr>
                
            </table>
        </form>  
    </body>
</html>