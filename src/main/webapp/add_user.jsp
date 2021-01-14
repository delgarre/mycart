<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.util.List"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Admin level required!");
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <form method="post" action="new_user.jsp">
            Name:<br>
            <input type="text" name="user_name"/>
            <br>
            Email:<br>
            <input type="text" name="user_email"/>
            <br>
            Password:<br>
            <input type="text" name="user_password"/>
            <br>
            Authority:<br>
            <select name="user_type" id="user_type">
                <option value="admin">Admin</option>
                <option value="normal">Normal</option>
            </select>
            <br> <br> 
            
            
            <input type="submit" value="submit">
        </form>
    </body>
</html>
