<%@page import="uts.wsd.User"%>

    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String favcol = request.getParameter("favcol");
        
        User user = (User) session.getAttribute("user");
        
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setGender(gender);
        user.setFavouriteColour(favcol);
        //  session.setAttribute("user", user);
    %>
