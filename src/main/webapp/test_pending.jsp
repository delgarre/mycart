<%@page import="com.learn.mycart.entities.ApproveOrder"%>
<%@page import="com.learn.mycart.dao.ApproveOrderDao"%>
<%@page import="com.learn.mycart.entities.Test"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%
    Company company = (Company)session.getAttribute("location");
    ApproveOrder a = new ApproveOrder();
    Test test = (Test)session.getAttribute("locations");
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
String sql ="select * from ApproveOrder where user_id = "+id;
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Order</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    <body>
           <%@include file="components/navbar.jsp" %>
        <h1>Pending Orders</h1>
        <div class="col-md-8">
            
            <table class="table table-bordered ">
                <tr>
                     
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>User Name</th>
                    <th>Location</th>
                    
                </tr>
                <tr>
                   <%
                    while(resultSet.next()){
                        String aPName = resultSet.getString("aPName");
                        String aPPrice = resultSet.getString("aPPrice");
                        String quantity = resultSet.getString("quantity");
                        String name = resultSet.getString("name");
                        String locations = resultSet.getString("locations");
                    %>
                    
                    <td><%=aPName%></td>
                    <td><%=aPPrice%></td>
                    <td><%=quantity%></td>
                    <td><%=name%></td>
                    <td><%=locations%></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
        
        </div>
<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>