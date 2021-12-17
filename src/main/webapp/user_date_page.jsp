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
String sql ="select distinct date from OrderHistory where cName = '"+user.getUserName()+"' order by date desc";

resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <%@include file="components/common_css_js.jsp" %>
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}

div.solid {border-style: solid;}

flo {
  display: inline-block;
}
</style>
    </head>
    <body>
        <%@include file="components/user_navbar.jsp" %>
        <div class="center">
            
            <br>
            <br>
               <div class="col-md-8">
            
                
                        <h6>DATES AND LOCATIONS:</h6>
<%
String drivers4 = "com.mysql.jdbc.Driver";
String connectionUrls4 = "jdbc:mysql://172.20.29.70:3306/";
String databases4 = "mycart";
String userids4 = "admin";
String passwords4 = "ordering";
try {
Class.forName(drivers4);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections4 = null;
Statement statements4 = null;
ResultSet resultSets4 = null;

try{
  connections4 = DriverManager.getConnection(connectionUrls4+databases4, userids4, passwords4);
statements4=connections4.createStatement();                             
                    while(resultSet.next()){
                        String date = resultSet.getString("date");

String sqls ="select distinct locations from OrderHistory where date='"+date+"'";
resultSets4 = statements4.executeQuery(sqls);
                        
                        
                    %>
                    <div class="solid">
                        <p><b><%=date%></b></p>
                        
                           
                        <ol>
                           <%
                           while(resultSets4.next()){
                               
                           %>
                           <li><%=resultSets4.getString("locations")%></li> 
                          
                           <%
                               }
                           %>
                        </ol>
                        <div class="container text-center">
                         <a href="user_location_page.jsp?id=<%= date%>">
                                <button class="btn btn-secondary">VIEW LOCATIONS</button>
                        </a>
                        </div>
                       </div>
                                <br>
                        <%
                            }
                        %>
                
                    <%
                        
connections4.close();
} catch (Exception e) {
e.printStackTrace();
}
                     
                    %>
                
           
         </div>
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
