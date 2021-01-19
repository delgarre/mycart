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
        <h1>Make Changes</h1>
<div class="center">
    <form method="post" action="update_order.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">

<br>
Name:<br>
<input type="text" name="itemNumber" value="<%=resultSet.getString("itemNumber") %>">
<br>
Price:<br>
<input type="text" name="price" value="<%=resultSet.getString("price") %>">
<br>
Member Name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
Quantity:<br>
<input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>">
<br>

Location:<br>
<input type="text" name="locations" value="<%=resultSet.getString("locations")%>">
<br><br>
<input type="submit" value="Edit">
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

