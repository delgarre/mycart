<%@page import="com.learn.mycart.entities.Orders"%>
<%@page import="com.learn.mycart.dao.OrdersDao"%>
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
    
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Admin level required!");
            response.sendRedirect("index.jsp");
            return;
        }
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
String sql ="select * from Approve where locations = '"+id+"' and stat= 'Not Approved'";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Items</title>
         
    <%@include file="components/common_css_js.jsp" %>
    
    
 <script src= 
    "https://smtpjs.com/v3/smtp.js"> 
  </script> 
  <style>
.center {
  margin: auto;
  width: 80%;
  border: navy;
  padding: 10px;
}
  </style>
  
<script type="text/javascript"> 
    function sendEmail(tableID) { 
        
        var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML;
      Email.send({ 
        Host: "east.EXCH092.serverdata.net", 
        Username: "ordering.portal@dseincorporated.com", 
        Password: "Rackspace123!!", 
        To: "diane.madonna@dseincorporated.com", 
        From: "ordering.portal@dseincorporated.com", 
        Subject: "Approved Order", 
        Body: tableHTML, 
        Link: "www.google.com",
      }) 
        .then(function (message) { 
          alert("mail sent successfully") 
        }); 
    } 
    
    function goBack(){
        window.history.back();
    } 
    
    //this will hide message after 3 seconds
            setTimeout(function(){
            $("#error").hide();
            },3000)
</script>
    </head>
    <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="center">
            <h1>ORDER FOR <%=id%>:</h1>
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
                
         
                <input type="hidden" name="user_id" value="<%=user.getUserId()%>"/>
                
                <br>
            <button class="btn btn-primary" onclick="goBack()">GO BACK</button>
            <br>
            <br>
           
            <form method="POST" action="A_OrderServlet">
                                <%

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections = null;
Statement statements = null;
ResultSet resultSets = null;
%>
<%
try{
connections = DriverManager.getConnection(connectionUrl+database, userid, password);
statements=connection.createStatement();
String sqlS ="select companyCode from Company where companyName = '"+id+"'";
resultSets = statements.executeQuery(sqlS);
while(resultSets.next()){
    String code = resultSets.getString("companyCode");
%>
<input type="hidden" name="code" value="<%=code%>">
                 <div>
              <input type="hidden" name="loc" value="<%=id%>"/>
                <input onclick="return confirm('Are you sure?');" type="submit" class="btn btn-info" value="SUBMIT CART FOR APPROVAL" onclick="mySub()"/>
                 </div>
            </form>
                
                
                
        <div>
            <br>
               <a href="open_items_list.jsp?location=<%=id%>">
                <button type="button" class="btn btn-warning">
                    ADD MORE ITEMS
                </button>
               </a><br>
               <br>
               <a href="delete_all_o_order.jsp?location=<%=id%>" onclick="return confirm('Are you sure?');">
                    <button class="btn btn-danger">DELETE ORDER</button>
                </a><br>
                <br>
        </div>
                <table class="table table-bordered " id="td">
                <tr>          
                    <th>IMAGE</th>
                    <th>ITEM #</th>
                    <th>DESCRIPTION</th>
                    <th>COST</th>
                    <th>ORDERED BY</th>
                    <th>DEPARTMENT</th>
                    <th>QTY ORDERED</th>
                    <th>UOM</th>
                    <th>ALTERNATE ITEM</th>
                    <th>VENDOR</th>
                    <th>CATEGORY</th>
                    <th>MANUFACTURER</th>
                    <th>MANUFACTURER NUMBER</th>
                    <th>ACTIONS</th>                    
                </tr>
                <tr>
                   <%
                    while(resultSet.next()){
                        
                        String item = resultSet.getString("itemNumber");
                        String price = resultSet.getString("price");
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
                        String department = resultSet.getString("department");
                        String alt = resultSet.getString("alternateItem");
                        
                    %>
                    

                    <td>
                        <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%=item%></td>
                    <td><%=pDesc%></td>
                    <td><span>$<%= price%></span></td>
                    <td><%=name%></td>
                    <td><%=department%></td>
                    <td><%=quantity%></td>
                    <td><%=uom%></td>
                    <td><%=alt%></td>
                    <td><%=vTitle%></td>
                    <td><%=cTitle%></td>
                    <td><%=man%></td>
                    <td><%=manNum%></td>

                    <td>
                        <a href="update_open_orders_page.jsp?id=<%=order_id%>">
                            <button class="btn btn-primary">EDIT</button>
                        </a><br>
                        <br>
                      
                        <a href="submit_o_approval.jsp?id=<%=order_id%>&loc=<%=id%>&alt=<%=alt%>&code=<%=code%>" onclick="return confirm('Are you sure?');">
                            <button class="btn btn-info">APPROVE</button>
                        </a><br>
                        
                        <br>
                        <a href="delete_o_orders.jsp?id=<%=order_id%>&loc=<%=id%>" onclick="return confirm('Are you sure?');">
                            <button class="btn btn-danger">DELETE</button>
                        </a>
                    </td>
                    
                </tr>
               <input type="hidden" name="oId" value="<%=order_id%>"/>
               <input type="hidden" name="itemNumber" value="<%=item%>"/>
        
               <input type="hidden" name="alt" value="<%=alt%>"/>
                <%
                  
                    }
                    session.setAttribute("single", id);
                    
                %>
               
            </table>
                
        </div>        
        <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
