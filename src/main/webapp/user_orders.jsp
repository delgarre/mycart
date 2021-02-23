<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.OrderHistoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.OrderHistory"%>
<%
    User user = (User)session.getAttribute("current-user");
    
    Company company1 = (Company)session.getAttribute("location");
    
    String c = company1.getCompanyName();
    
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%
String name = user.getUserName();
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
ResultSet resultSet2 = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from OrderHistory where locations = '"+c+"' order by date desc";

resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/user_navbar.jsp" %>
        <div class="col-md-8">
            <div class="table-responsive-sm mt-3">
                <h2>Orders for <%=c%></h2>
                <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
                </div>
                <table class="table table-bordered " >
                    <tr>
                     
                        <th>Item</th>
                        <th>Description</th>
                        <th>Vendor</th>
                        <th>Ordered By</th>
                        <th>Location</th>
                        
                        <th>Amount Ordered</th>
                    
                    </tr>
                    <%
                     
                     while(resultSet.next()){
                         
                     Integer id = resultSet.getInt("id");
                     String names = resultSet.getString("itemNumber");
                     String price = resultSet.getString("aPrice");
                     String quantity = resultSet.getString("quantity");
                     String date = resultSet.getString("date");
                     String desc = resultSet.getString("pDesc");
                     String location = resultSet.getString("locations");
                     String cName = resultSet.getString("cName");
                     String vendor = resultSet.getString("vTitle");
                    %>
                    
                    
                    
                    <tr>
                 
                        <td><%= names%></td>
                        <td><%=desc%></td>
                        <td><%=vendor%></td>
                        <td><%=cName%></td>
                        <td><%= location%></td>
                        
                        <td><%=quantity%></td>
                       
                        
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
                

<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
