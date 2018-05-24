<%--
    Document   : bookForm
    Created on : May 19, 2018, 4:40:56 PM
    Author     : sungrinrhee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List New Book</title>
    </head>

    <jsp:include page="navbar.jsp"/>
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

            <div class="wrapper" style="text-align: left;">
                <form action="booklistComplete.jsp" method="POST">
                    <table align="center">
                        <tr>
                            <td>Book title:</td>
                            <td>
                                <input name="booktitle" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>Author:</td>
                            <td>
                                <input name="author" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>Category:</td>
                            <td>
                                <input name="category" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>Book condition:</td>
                            <td>
                                <input name="condition" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>Book ISBN:</td>
                            <td>
                                <input name="isbn" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>Book publish year:</td>
                            <td>
                                <input name="publishYear" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>Book publisher:</td>
                            <td>
                                <input name="publisher" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>Book abstract:</td>
                            <td>
                                <input name="abst" type="text" style="margin-left:10px;margin-right:10px;">
                            </td>
                        </tr>
                        <tr>

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
    </center>
</body>
</html>