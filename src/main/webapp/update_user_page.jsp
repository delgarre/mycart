<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
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
String sql ="select * from User where user_id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
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
        <%@include file="components/navbar.jsp" %>
        <div class="center">
        <h1>Make changes!</h1>
        <div>
            <form method="post" action="password.jsp">
                
        <input type="hidden" name="id" value="<%=resultSet.getString("user_id") %>">
        <input type="hidden" name="user_email" value="<%=resultSet.getString("user_email") %>">        
               <input type="submit" value="Password Reset Email"/>
            </form>
        </div>
<form method="post" action="update_user.jsp">
<input type="hidden" name="user_id" value="<%=resultSet.getString("user_id") %>">

<br>
Name:<br>
<input type="text" name="user_name" value="<%=resultSet.getString("user_name") %>">
<br>

Password:<br>
<input type="text" name="user_password" value="<%=resultSet.getString("user_password") %>">
<br>
Email Id:<br>
<input type="email" name="user_email" value="<%=resultSet.getString("user_email") %>">
<br>
Type:<br>
<select name="user_type" id="user_type">
    <option value="admin">Admin</option>
    <option value="normal">Normal</option>
</select>
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