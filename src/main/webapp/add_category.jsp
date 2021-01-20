<%-- 
    Document   : add_category
    Created on : Jan 20, 2021, 1:31:06 PM
    Author     : garre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Title</title>
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
        <%@include file="components/navbar.jsp" %>

        <div class="center">
            <h1>Info:</h1>
        <form method="POST" action="new_category.jsp">
            Title:<br>
            <input type="text" name="title"/>
            <br><br>
            <input type="submit" value="Add Category">
        </form>
        </div>
    </body>
</html>
