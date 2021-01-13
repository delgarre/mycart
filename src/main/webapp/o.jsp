
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>

<%
    Company company = (Company)session.getAttribute("location");
    
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
        <title>Submit Order</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
h1 {text-align: center;}
div {text-align: center;}
</style>

    </head>
    <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    <body>
           <%@include file="components/navbar.jsp" %>
<div class="container">
    <div class="row mt-5">
<div class="col-md-8">
    <div class="card">
        <div class="card-body">
        <h1>Enter Amount</h1>
        Date: <%=today%>
<form method="post" action="save.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<input type="hidden" name="date">
<input type="hidden" name="user_id" value="<%=user.getUserId()%>">
<br>
Name:<br>
<input type="text" name="itemNumber" value="<%=resultSet.getString("itemNumber") %>">
<br>
Price:<br>
<input type="text" name="price" value="<%=resultSet.getString("price") %>">
<br>
Member Name:<br>
<input value="<%= user.getUserName()%>" type="text" name="name">
<br>
Quantity:<br>
<input type="text" name="quantity" placeholder="Enter Amount">
<br>
Location:<br>
<input value="<%=company.getCompanyName()%>" name="locations">
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
  </div>
</div>
</div>
</div>
</div>

    </body>
</html>

