<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://172.20.29.70:3306/";
String database = "mycart";
String userid = "admin";
String password = "ordering";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Product where pId = "+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
           <%@include file="components/navbar.jsp" %>
        <h1>Make Changes</h1>
<form method="post" action="update_product.jsp">
<input type="hidden" name="pId" value="<%=resultSet.getString("pId") %>">
<br>
Name:<br>
<input type="text" name="pName" value="<%=resultSet.getString("pName") %>">
<br>
Type:<br>
<input type="text" name="pPrice" value="<%=resultSet.getString("pPrice") %>">
<br>
Quantity:<br>
<input type="text" name="pQuantity" value="<%=resultSet.getString("pQuanity") %>">
<br>
Unit of Measure:<br>
<input type="text" name="unitOfMeasure" value="<%=resultSet.getString("unitOfMeasure") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
