<%-- 
    Document   : forgot_serv
    Created on : Feb 14, 2021, 2:16:31 PM
    Author     : garre
--%>
<%@page import="com.learn.mycart.mail.ForgotPassword"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String email = request.getParameter("email");
ForgotPassword.sendMail(email);
response.sendRedirect("index.jsp");
session.setAttribute("message", "Password Reset Email Sent!");
%>
