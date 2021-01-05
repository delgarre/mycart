<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
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
String sql ="select * from Vendor where vendorId="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Vendor</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
      <%@include file="components/navbar.jsp" %>
      <div class="col-md-8">  
      <h1>Make Changes!</h1>
      <form method="POST" action="update_vendor.jsp">
          <input type="hidden" name="vendorId" value="<%=resultSet.getString("vendorId") %>">

            <br>
            Name:<br>
          <input type="text" name="vendorName" value="<%=resultSet.getString("vendorName") %>">
          <br><br>
          <input type="submit" value="Edit">
      </form>
    </div>
      
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>      
    </body>
</html>