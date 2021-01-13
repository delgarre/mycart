<%@page import="com.learn.mycart.entities.Notice"%>
<%@page import="com.learn.mycart.dao.NoticeDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.dao.LocationTypeDao"%>
<%@page import="com.learn.mycart.entities.LocationType"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
        User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
Company companys = (Company)session.getAttribute("location");
%>
<%
String name = companys.getCompanyName();
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
String sql ="select * from Item inner join  LocationType as LT on LT.locationType = Item.locationType where LT.location = '"+name+"' and stat = 'Active'";

resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
          <%@include file="components/user_navbar.jsp" %>
          <div class="panel panel-primary">
            <div>
                <div class="panel-heading col-md-8">
                    <table>
                        
                        <%
                        NoticeDao ldao = new NoticeDao(FactoryProvider.getFactory());
                        List<Notice> notice = ldao.getStatus();
                        %>
                        <tr>
                            <th>Message:</th>
                        </tr>
                        
                        <%
                        for(Notice n: notice){
                        %>
                        <tr>
                            <td><%=n.getMessage()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div div class="table-responsive-sm mt-3">
        
                <div>
                    <a href="dropdown.jsp?id=<%= user.getUserId()%>"><h3>Select Location</h3></a>
                </div>
        
            <table class="table table-bordered " id="myTable">
                <tr>
                

                <th>Photo</th>
                <th>Price</th>
                <th>Item Number</th>
                <th>Quantity</th>
                
                <th>Vendor</th>
                

                
                
                <th>Actions</th>
                </tr>
                <%
                    while(resultSet.next()){
                        ;
                        Integer id = resultSet.getInt("id");
                        
                        String price = resultSet.getString("price");
                        String quantity = resultSet.getString("quantity");
                        String photo = resultSet.getString("photo");
                        String itemNumber = resultSet.getString("ItemNumber");
                        String vendor = resultSet.getString("vendorName");
                        
                    %>
                
                <tr>
                    <td>
                        <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%= price%></td>
                    <td><%= itemNumber%></td>
                    <td><%= quantity%></td>
                    <td><%=vendor%></td>
                    
                    
                   
                    <td>
                        <a href="o.jsp?id=<%= id%>">
                    <button class="btn btn-outline-success">Add To Cart</button>
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
