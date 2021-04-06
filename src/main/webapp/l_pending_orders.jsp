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

<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%
    Company company1 = (Company)session.getAttribute("location");
    String com = company1.getCompanyName();
    
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
String sql ="select * from Approve where user_id ='"+user.getUserId()+"' and stat = 'Not Approved' and locations = '"+com+"' ";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Orders</title>
        <%@include file="components/common_css_js.jsp" %>
<script>
function goBack(){
        window.history.back();
    } 
    
</script>
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}

#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}
</style>
    </head>
    <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    <body>
           <%@include file="components/user_navbar.jsp" %>
           <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <h1>Cart Items:</h1>
        <div class="center">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <br>
            <button class="btn btn-primary" onclick="goBack()">Go Back</button>
            <br>
            <form method="post" action="L_OrderServlet">
                <input type="hidden" name="user_id" value="<%=user.getUserId()%>"/>
                <input type="hidden" name="loc" value="<%=com%>"/>
                <br>
                <input type="submit" class="btn btn-info" value="Submit Cart For Approval" onclick="mySub()"/>
            </form>
                <br>
                <a href="items.jsp">
                <button type="button" class="btn btn-warning">
    Add More Items
  </button>
                </a>
            <table class="table table-bordered ">
                <tr>
                    <th>Image</th>
                    <th>Item Number</th>
                    <th>Description</th>
                    <th>Vendor</th>
                    <th>Cost</th>
                    <th>Quantity</th>
                    <th>User Name</th>
                    <th>Location</th>
                    <th>Actions</th>
                    
                </tr>
                <tr>
                   <%
                    while(resultSet.next()){
                        String aPName = resultSet.getString("itemNumber");
                        String aPPrice = resultSet.getString("price");
                        String quantity = resultSet.getString("quantity");
                        String name = resultSet.getString("name");
                        String locations = resultSet.getString("locations");
                        String Id = resultSet.getString("id");
                        String photo = resultSet.getString("photo");
                        String pDesc = resultSet.getString("pDesc");
                        String vendor = resultSet.getString("vTitle");
                    %>
                    
                    <td>
                        <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%=aPName%></td>
                    <td><%=pDesc%></td>
                    <td><%=vendor%></td>
                    <td><span>$<%=aPPrice%></span></td>
                    <td><%=quantity%></td>
                    <td><%=name%></td>
                    <td><%=locations%></td>
                    <td>
                        <a href="update_order_page.jsp?id=<%= Id%>">
                            <button>Update</button>
                        </a>
                            <a href="delete_order.jsp?id=<%= Id%>">
                                <button onclick="myFunction()">Delete</button>
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

<script>
function myFunction() {
  var txt;
  var r = confirm("Are you sure?");
  if (r == true) {
    window.location.href = "pending_orders.jsp";
  } else {
    window.location.href = "pending_orders.jsp";
  }
  document.getElementById("demo").innerHTML = txt;
}


function mySub() {
  alert("Order submitted for approval!");
}

//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>

    </body>
</html>
