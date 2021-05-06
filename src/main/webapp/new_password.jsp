<%-- 
    Document   : new_password
    Created on : Feb 1, 2021, 8:46:21 AM
    Author     : garre
--%>

<%@page import="com.learn.mycart.mail.NewUser"%>
<%@include file="components/message.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%


String email = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");
session.setAttribute("message", "New User created and email sent successfully!");
NewUser.sendMail(email, name, password);
response.sendRedirect("users.jsp");
%>
