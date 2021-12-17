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
String sql ="select * from Orders where status= 'Not Approved' and locations = '"+id+"'";
resultSet = statement.executeQuery(sql);
;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Orders</title>
                <%@include file="components/common_css_js.jsp" %>
        
        <script>
            //this will hide message after 3 seconds
            setTimeout(function(){
            $("#error").hide();
            },3000)
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
        <%@include file="components/orders_navbar.jsp" %>
        <div class="center">
            
          
            
            <a href="order_a_items_pharm.jsp?loc=<%=id%>">
                <button type="button" class="btn btn-warning">
                    ADD MORE ITEMS
                </button>
            </a>
                
                <div id="error" class="container-fluid mt-3">
                            <%@include file="components/message.jsp" %>
                </div>
                
                
            <br>
            <h1>ORDERS PENDING APPROVAL:</h1>
            <table class="table table-bordered ">
                <tr>
                    
                    <th>IMAGE</th>
                    <th>ITEM NUMBER</th>
                    <th>DESCRIPTION</th>
                    <th>COST</th>
                    <th>QUANTITY ORDERED</th>
                    <th>ORDERED BY</th>
                    <th>LOCATION</th>
                    <th>ACTIONS</th>


                    
                </tr>
                <tr>
                   <%
                    while(resultSet.next()){
                        
                        String item = resultSet.getString("itemNumber");
                        String price = resultSet.getString("aPPrice");
                        String name = resultSet.getString("name");
                        String quantity = resultSet.getString("quantity");
                        String locations = resultSet.getString("locations");
                        String photo = resultSet.getString("photo");
                        String pDesc = resultSet.getString("pDesc");
                        String oid = resultSet.getString("id");
                        
                    %>
                    
                  
                    <td>
                        <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%=item%></td>
                    <td><%=pDesc%></td>
                    <td><span>$<%= price%></span></td>
                    <td><%=quantity%></td>
                    <td><%=name%></td>
                    <td><%=locations%></td>
                    <td>
                    <a href="update_o_a_orders_pharm_page.jsp?id=<%=oid%>">
                            <button type="button" class="btn btn-info">
                                UPDATE
                            </button>
                    </a>
                    <a href="delete_o_a_order_pharm.jsp?id=<%=oid%>&location=<%=id%>" onclick="return confirm('Are you sure?');">
                            <button type="button" class="btn btn-danger">
                                DELETE ITEM
                            </button>
                    </a>
                    </td>
                    
                    
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
