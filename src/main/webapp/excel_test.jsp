<%-- 
    Document   : excel_test
    Created on : Dec 26, 2020, 6:29:11 PM
    Author     : garre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="POST" action="ImportToExcelServlet">
            <input type="hidden" name="id">
            <input type="submit" value="submit">
        </form>
    </body>
</html>
