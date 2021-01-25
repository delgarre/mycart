

<%@page import="com.learn.mycart.mail.PasswordReset"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

Integer id = Integer.parseInt(request.getParameter("id"));
String email = request.getParameter("user_email");
PasswordReset.sendMail(email, id);
response.sendRedirect("update_user_page.jsp?id="+id);
%>

