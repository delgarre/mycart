<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.ApproveOrder"%>
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
String sql ="select * from Approve where id = "+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve Order</title>
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
        
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <br>
                  <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                      <br>
                      <div class="card">
                           <div class="card-header custom-bg text-white">
      <h1>MAKE CHANGES!</h1>
                      </div>
              <div class="card-body">
    <form method="post" action="update_order.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">

<div class="form-group">
<label for="itemNumber">ITEM NUMBER:</label>
<input type="text" name="itemNumber" value="<%=resultSet.getString("itemNumber") %>" id="itemNumber" readonly>
</div>

<div class="form-group">
<label for="price">PRICE:</label>
<input type="text" name="price" value="<%=resultSet.getString("price") %>" id="price" readonly>
</div>

<div class="form-group">
<label for="name">MEMBER NAME:</label>
<input type="text" name="name" value="<%=resultSet.getString("name") %>" id="name" readonly>
</div>
<div class="form-group">
<label for="quantity">QUANTITY:</label>
<input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>" id="quantity">
</div>

<div class="form-group">
<label for="locations">LOCATION:</label>
<input type="text" name="locations" value="<%=resultSet.getString("locations")%>" id="locations" readonly>
</div>
                       <!--submit button-->
                    <div class="container text-center">
<input onclick="return confirm('Are you sure?');" class="btn btn-outline-warning" type="submit" value="SAVE CHANGES">
                    </div>
</form>
              </div>
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

