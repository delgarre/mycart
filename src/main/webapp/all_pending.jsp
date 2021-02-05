<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%
    Company company1 = (Company)session.getAttribute("location");
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
String sql ="select * from Orders where status= 'Not Approved'";
resultSet = statement.executeQuery(sql);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Orders</title>
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
        <%@include file="components/user_navbar.jsp" %>
        <div class="center">
            
            <h1>Items Pending Approval:</h1><br>
            <br>
            <a href="pending_dropdown.jsp?id=<%= user.getUserId()%>">
                
                
                <button class="btn btn-outline-success">By Location</button>
            </a>
            <table class="table table-bordered ">
                <tr>
                    <th>Id</th>
                    <th>Photo</th>
                    <th>Item Number</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Ordered By</th>
                    <th>QTY Per UOM</th>
                    <th>Unit Of Measure</th>
                    <th>Vendor</th>
                    <th>Category</th>
                    <th>Manufacturer</th>
                    <th>Manufacturer Number</th>


                    
                </tr>
                <tr>
                   <%
                    while(resultSet.next()){
                        
                        String item = resultSet.getString("itemNumber");
                        String price = resultSet.getString("aPPrice");
                        String name = resultSet.getString("name");
                        String quantity = resultSet.getString("quantity");
                        String locations = resultSet.getString("locations");
                        String order_id = resultSet.getString("id");
                        String photo = resultSet.getString("photo");
                        String pDesc = resultSet.getString("pDesc");
                        String vTitle = resultSet.getString("vTitle");
                        String cTitle = resultSet.getString("cTitle");
                        String man = resultSet.getString("manufacturer");
                        String manNum = resultSet.getString("manufacturerNum");
                        String uom = resultSet.getString("unitOfMeasure");
                        
                    %>
                    
                    <td><%=order_id%></td>
                    <td>
                        <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%=item%></td>
                    <td><%=pDesc%></td>
                    <td><%= price%></td>
                    <td><%=name%></td>
                    <td><%=quantity%></td>
                    <td><%=uom%></td>
                    <td><%=vTitle%></td>
                    <td><%=cTitle%></td>
                    <td><%=man%></td>
                    <td><%=manNum%></td>
                    
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
