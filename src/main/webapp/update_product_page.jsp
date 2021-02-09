<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>

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
String sql ="select * from Item where id = "+id;
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
            
            <h1>Make Changes:</h1>
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row">
            <div class="container-fluid">
<form method="post" action="update_product.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<br>
Name:<br>
<input type="text" name="itemNumber" value="<%=resultSet.getString("itemNumber") %>">
<br>
Type:<br>
<input type="text" name="price" value="<%=resultSet.getString("price") %>">
<br>
Quantity Per UOM:<br>
<input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>">
<br>
Unit of Measure:<br>
<input type="text" name="unitOfMeasure" value="<%=resultSet.getString("unitOfMeasure") %>">
<br>
Active/Inactive:<br>
<select name="stat" id="stat">
    <option value="Active">Active</option>
    <option value="Inactive">Inactive</option>
</select>
<br>
Discontinued/Continued:<br>
<select name="discontinued" id="discontinued">
    <option value="discontinued">Discontinued</option>
    <option value="continued">Continued</option>
</select>
<br><br>
Edit Item<br>
<input type="submit" value="Edit">
</form>
        </div>
            </div>
<br>
<br>
<form action="uploadImage" method="post" enctype="multipart/form-data">
    
        <h5>Upload Photo:   </h5>
        
        <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
        
            <input type="file" name="image"/>
            
            <input type="submit"/>
    
        </form>

        </div>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
