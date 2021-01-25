<%-- 
    Document   : reset_password
    Created on : Jan 24, 2021, 4:52:55 PM
    Author     : garre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = request.getParameter("id");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <%@include file="components/common_css_js.jsp" %>

<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}
</style>
    </head>
    <body>
        <%@include file="components/login_navbar.jsp" %>
        <div class="center">
        <h1>Reset Password</h1>
        <form method="post" action="update_password.jsp">
            <input type="hidden" name="id" value="<%=id%>"/>
            <input type="text" name="password"/>
            <input type="submit" value="Reset"/>
        </form>
        </div>
    </body>
</html>
