<%@page import="uts.wsd.Users"%>
<%@page import="uts.wsd.User"%>
<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="page.xsl"?>

<%
    String filePath = application.getRealPath("WEB-INF/users.xml");
%>
<jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication" scope="application">
    <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Users users = diaryApp.getUsers();
    User user = users.login(email, password);

%>

<page title="View profile for <%= user.getName()%>">
    <profile id="<% user.getId(z %>">
        <name><%= user.getName()%></name>
        <gender><%= user.getGender()%></gender>
        <favouriteColour><%= user.getFavouriteColour%></favouriteColour>
    </profile>
</page>