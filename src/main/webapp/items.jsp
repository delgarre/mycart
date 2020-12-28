<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
Company company = (Company)session.getAttribute("location");
%>
<%
String name = company.getCompanyName();
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
String sql ="select * from Item inner join  LocationType as LT on LT.locationType = Item.locationType where LT.location = '"+name+"'";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
          <%@include file="components/navbar.jsp" %>
        <div class="col-md-8">
            <div div class="table-responsive-sm mt-3">
        <h1>Hello World!</h1>
        
        
            <table class="table table-bordered ">
                <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                </tr>
                <%
                    while(resultSet.next()){
                        ;
                        Integer id = resultSet.getInt("id");
                        String names = resultSet.getString("name");
                        String price = resultSet.getString("price");
                        String quantity = resultSet.getString("quantity");
                        
                    %>
                
                <tr>
                    <td><%= names%></td>
                    <td><%= price%></td>
                    <td><%= quantity%></td>
                    <td>
                        <a href="o.jsp?id=<%= id%>">
                    <button class="btn btn-outline-success">Add Quantity</button>
                    </a>
                    </td>
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
