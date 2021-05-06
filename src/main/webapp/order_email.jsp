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
String sql ="select * from Orders where locations = '"+id+"' and status= 'Not Approved' order by vTitle";
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
        <h1>APPROVE ORDER:</h1>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

            <form method="post" action="a.jsp">
                <input type="hidden" name="user_id" value="<%=user.getUserId()%>"/>
                <input type="text" name="locations" value="<%=id%>"/>
                                
               <input type="submit" class="btn btn-success" value="Approve Order" onclick="sendEmail('td')"/>
             
            </form>
            <div class="row ml-2">
            <a href="single_add.jsp?id=<%=id%>">
                <button class="btn btn-primary">Add Item</button>
            </a>
        </div>
                <br>
                <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                <br>
                <table class="table table-bordered " id="td">
                <tr>
                   
                
                    <th>Item Number</th>
                    <th>Description</th>
                    <th>Vendor</th>
                    <th>Cost</th>
                    <th>Alternate Item Number</th>
                    <th>Ordered By</th>
                    
                    <th>Location</th>
                    
                    <th>QTY Ordered</th>
                    


                 
                    
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
                        String alt = resultSet.getString("alternateItem");
                        String pDesc = resultSet.getString("pDesc");
                        String vTitle = resultSet.getString("vTitle");
                       
                        
                    %>
                    
                    
                    <td><%=item%></td>
                    <td><%=pDesc%></td>
                    <td><%=vTitle%></td>
                    <td><%= price%></td>
                    <td><%=alt%></td>
                    
                    <td><%=name%></td>
                    
                    <td><%=id%></td>
                    <td><%=quantity%></td>
                    
                    



                    
                </tr>
               <input type="hidden" name="oId" value="<%=order_id%>"/>

              
                <%
                    }
                    session.setAttribute("single", id);
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
