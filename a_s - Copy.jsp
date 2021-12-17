
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.User"%>

<%@page import="com.learn.mycart.entities.Company"%>

<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>

<%
    Company company1 = (Company)session.getAttribute("location");
    
    User user = (User)session.getAttribute("current-user");
    Integer user_id = user.getUserId();
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
<script>
function goBack(){
        window.history.back();
    }    
</script>
    </head>
    <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    <body>
           <%@include file="components/navbar.jsp" %>
<div class="container">
     <div class="row">
           <div class="col-md-6 offset-md-3">
    <div class="card">
        <div class="card-body">
        <div class="card-header custom-bg text-white">
                            <h1>ENTER QUANTITY:</h1>
                          Date: <%=today%>          
                    </div>
        
        <form method="post" action="a_save.jsp">
                <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
                <input type="hidden" name="cTitle" value="<%=resultSet.getString("cTitle") %>">
                <input type="hidden" name="vTitle" value="<%=resultSet.getString("vTitle") %>">
                <input type="hidden" name="manufacturer" value="<%=resultSet.getString("manufacturer") %>">
                <input type="hidden" name="manufacturerNum" value="<%=resultSet.getString("manufacturerNum") %>">
                <input type="hidden" name="alternateItem" value="<%=resultSet.getString("alternateItem") %>">
                <input type="hidden" name="pDesc" value="<%=resultSet.getString("pDesc") %>">
                <input type="hidden" name="unitOfMeasure" value="<%=resultSet.getString("unitOfMeasure") %>">
                <input type="hidden" name="department" value="<%=user.getDepartment() %>">

<input type="hidden" name="date">
<input type="hidden" name="user_id" value="<%=user.getUserId()%>">

<input type="hidden" name="photo" value="<%=resultSet.getString("photo")%>">
    <div class="form-group">
                    <label for="itemNumber">ITEM NUMBER:</label>

                    <input type="text" name="itemNumber" value="<%=resultSet.getString("itemNumber") %>" class="input" id="itemNumber" readonly>
                </div>
                    <div class="form-group">
                       <label for="price">COST($):</label>

<input type="text" name="price" value="<%=resultSet.getString("price") %>" id="price" class="input" readonly>
                    </div>

<input value="<%= user.getUserName()%>" type="hidden" name="name">

                <div class="form-group">
                       <label for="quantity">QUANTITY:</label>

<input type="text" name="quantity" placeholder="Enter Amount" id="quantity" required>
            </div>
                <div class="form-group">
                       <label for="locations">LOCATION:</label>

<input value="<%=company1.getCompanyName()%>" name="locations" id="locations" class="input" readonly>
                </div>
<div class="container text-center">
<input type="submit" class="btn btn-primary" value="ADD ITEM">
<button class="btn btn-warning" onclick="goBack()">GO BACK</button>
 </div>
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

