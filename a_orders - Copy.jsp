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
String oId = request.getParameter("oid");
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
String sql ="select * from Orders where locations = '"+id+"' and status= 'Not Approved'";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approval Page</title>
         
    <%@include file="components/common_css_js.jsp" %>
    
    
 <script src= 
    "https://smtpjs.com/v3/smtp.js"> 
  </script> 
  
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
        <h1>  CONFIRM ORDER FOR <%=id%>:</h1>
        <div class="col-md-8">
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

         
                <input type="hidden" name="user_id" value="<%=user.getUserId()%>"/>
                <input type="hidden" name="locations" value="<%=id%>"/>
                
                <a href="delete_all_order.jsp?location=<%=id%>" onclick="return confirm('Are you sure?');">
                    <button class="btn btn-danger">DELETE ORDER</button>
                </a><br>
                <br>
                                
                <a href="order_email.jsp?id=<%=id%>" >
                    <button class="btn btn-outline-success">CONFIRM</button>
                </a><br>
                <br>
          
            <div class="row ml-2">
            <a href="single_add.jsp?id=<%=id%>">
                <button class="btn btn-outline-warning">ADD ITEM</button>
            </a>
        </div>
                <table class="table table-bordered " id="td">
                <tr>
                
                    <th>PHOTO</th>
                    <th>ITEM NUMBER</th>
                    <th>DESCRIPTION</th>
                    <th>COST</th>
                    <th>ORDERED BY</th>
                    <th>DEPARTMENT</th>
                    <th>ALTERNATE ITEM</th>
                    <th>UOM</th>
                    <th>VENDOR</th>
                    <th>CATEGORY</th>
                    <th>MANUFACTURER</th>
                    <th>MANUFACTURER NUMBER</th>
                    <th>ORDER QTY</th>
                    
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
                        String order_id = resultSet.getString("id");
                        String photo = resultSet.getString("photo");
                        String pDesc = resultSet.getString("pDesc");
                        String vTitle = resultSet.getString("vTitle");
                        String cTitle = resultSet.getString("cTitle");
                        String man = resultSet.getString("manufacturer");
                        String manNum = resultSet.getString("manufacturerNum");
                        String uom = resultSet.getString("unitOfMeasure");
                        String alt = resultSet.getString("alternateItem");
                        String department = resultSet.getString("department");
          
                    %>
                    
                
                    <td>
                        <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%=item%></td>
                    <td><%=pDesc%></td>
                    <td><span>$<%= price%></span></td>
                    <td><%=name%></td>
                    <td><%=department%></td>
                    <td><%=alt%></td>
                    <td><%=uom%></td>
                    <td><%=vTitle%></td>
                    <td><%=cTitle%></td>
                    <td><%=man%></td>
                    <td><%=manNum%></td>
                    <td><%=quantity%></td>
                    
                    <td>
                        <a href="update_a_orders_page.jsp?id=<%=order_id%>">
                            <button class="btn btn-outline-primary">EDIT</button>
                        </a><br>
                        <br>
                            <a href="delete_a_orders.jsp?id=<%=order_id%>&location=<%=id%>" onclick="return confirm('Are you sure?');">
                                <button class="btn btn-outline-danger">DELETE</button>
                            </a><br>
                            <br>
                            <%

String drivers = "com.mysql.jdbc.Driver";
String connectionUrls = "jdbc:mysql://172.20.29.70:3306/";
String databases = "mycart";
String userids = "admin";
String passwords = "ordering";
try {
Class.forName(drivers);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections = null;
Statement statemenst = null;
ResultSet resultSets = null;
%>
<%
try{
connections = DriverManager.getConnection(connectionUrls+databases, userids, passwords);
statemenst=connection.createStatement();
String sqls ="select companyCode from Company where companyName = '"+id+"'";
resultSets = statemenst.executeQuery(sqls);

%>
<%
                    while(resultSets.next()){
                        String companyCode = resultSets.getString("companyCode");
                       
                        
                        
                    %>
                         <a onclick="return confirm('Are you sure?');" href="submit_single.jsp?id=<%=order_id%>&locations=<%=id%>&code=<%=companyCode%>">
                                <button class="btn btn-outline-success">APPROVE</button>
                         </a> 
                    </td>
                    <%
                        }
                    %>
                </tr>
                 <%

connections.close();
} catch (Exception e) {
e.printStackTrace();
}
%>   
               <input type="hidden" name="oId" value="<%=order_id%>"/>
               

              
                <%
                    }
                    session.setAttribute("single", id);
                    session.setAttribute("oid", oId);
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
