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
        <title>List book</title>
        <script>
        function goBack() {
            window.history.back();
        }
        </script>        
    </head>
    
    <jsp:include page="navbar.jsp"/>
    <body>
        <form action="booklistComplete.jsp" method="POST">
            <table>
                <tr>
                    <td>
                    Book title: 
                    </td>
                    
                    <td>
                     <input name="booktitle" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                    Author:  
                    </td>
                    
                    <td>
                     <input name="author" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                    Category: 
                    </td>
                    
                    <td>
                     <input name="category" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                    Book condition 
                    </td>
                    
                    <td>
                     <input name="condition" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                    Book isbn: 
                    </td>
                    
                    <td>
                     <input name="isbn" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                    Book publish year: 
                    </td>
                    
                    <td>
                     <input name="publishYear" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                    Book publisher 
                    </td>
                    
                    <td>
                     <input name="publisher" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                    Book abstract:  
                    </td>
                    
                    <td>
                     <input name="abst" type="text" style="margin-left:10px;margin-right:10px;">
                    </td>
                </tr>
                <tr>

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