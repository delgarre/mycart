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
        
<script>
function goBack(){
        window.history.back();
    } 
    
</script>
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
        
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <br>
                    <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                    <br>
                    <div class="card-header custom-bg text-white">
            <h1>Make Changes:</h1>
                    </div>
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
          <div class="card-body">
           
<form method="post" action="update_product.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<div class="form-group">
                       <label for="itemNumber">Item Number:</label>

<input type="text" name="itemNumber" value="<%=resultSet.getString("itemNumber") %>" id="itemNumber">
</div>

<div class="form-group">
           <label for="price">Cost:</label>

      <input type="text" name="price" value="<%=resultSet.getString("price") %>" id="price">
</div>
<div class="form-group">
           <label for="quantity">Quantity Per UOM:</label>
<input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>" id="quantity">
</div>
<div class="form-group">
           <label for="unitOfMeasure">Unit of Measure:</label>

<input type="text" name="unitOfMeasure" value="<%=resultSet.getString("unitOfMeasure") %>" id="unitOfMeasure">
</div>
<div class="form-group">
           <label for="unitOfMeasure">Unit of Measure:</label>
Active/Discontinued:<br>
<select name="stat" id="stat">
    <option value="Active">Active</option>
    <option value="discontinued">Discontinued</option>
</select>
</div>

<div class="container text-center">

<input type="submit" value="Edit" class="btn btn-primary">
</div>
</form>
        
        
<br>
<br>
<form action="uploadImage" method="post" enctype="multipart/form-data">
    
        <h5>Upload Photo:   </h5>
        
        <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
        
            <input type="file" name="image"/>
            <div class="container text-center">
            <input type="submit" value="Add Photo" class="btn btn-primary"/>
         
            </div>
    
        </form>
          </div>
                </div>
            </div>

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
