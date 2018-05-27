<%--
    Document   : bookForm
    Created on : May 19, 2018, 4:40:56 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List New Book</title>

        <style>
            table td, th { padding-right: 50px; }
        </style>
    </head>

    <jsp:include page="navbar.jsp"/>
    <%
        String isbnError = request.getParameter("isbnError");
    %>
    <body>
    <center>
        <div class="container">
            <!--Breadcrumb navigation bar-->
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="main.jsp">Main</a></li>
                    <li class="breadcrumb-item" active>List New Book</li>
                </ol>
            </nav>

            <div class="wrapper" style="width: 500px; text-align: left">
                <form action="booklistComplete.jsp" method="POST">
                    
                    <!-- Validation input error message, if exists -->
                    <c:if test="${isbnError != null}"> <p style="color: red; font-weight: bold; text-align: center"> <c:out value="${isbnError}"/></p> </c:if>
                    
                    <table align="center">
                        <tr>
                            <td>Book Title:</td>
                            <td>
                                <input name="booktitle" type="text" class="form-control" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Author:</td>
                            <td>
                                <input name="author" type="text" class="form-control" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Category:</td>
                            <td>
                                <input name="category" type="text" class="form-control" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Condition:</td>
                            <td>
                                <select class="form-control" name="condition" id="condition" required>
                                    <option value="" disabled selected>Choose condition</option>
                                    <option value="New">New</option>
                                    <option value="Good">Good</option>
                                    <option value="Fair">Fair</option>
                                    <option value="Poor">Poor</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>ISBN:</td>
                            <td>
                                <input name="isbn" type="text" maxlength="13" class="form-control" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Year of Publication:</td>
                            <td>
                                <select class="form-control" name="publishYear" id="publishYear" required>
                                    <option value="" disabled selected>Choose publication year</option>
                                    <!-- JavaScript to dynamically populate options with the last 100 years of the current year -->
                                    <script>
                                        var start = new Date().getFullYear() - 100;
                                        var end = new Date().getFullYear();
                                        for (var year = end; year >= start; year--) {
                                            document.write('<option value="' + year + '">' + year + '</option>');
                                        }
                                    </script>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Publisher:</td>
                            <td>
                                <input name="publisher" type="text" class="form-control" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Abstract:</td>
                            <td>
                                <input name="abst" type="text" class="form-control" required>
                            </td>
                        </tr>

                        <tr>
                            <td align="center"><input type="button" class="btn btn-warning btn-sm" value="Go Back!" onclick="history.back(-1)" />
                            </td>
                            <td align="center">
                                <input class="btn btn-primary btn-block" type="Submit" value="Submit">
                            </td>
                        </tr>

                    </table>
                </form>
            </div>
        </div>
    </center>
</body>
</html>