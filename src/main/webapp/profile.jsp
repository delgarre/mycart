<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    
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
String sql ="select * from User where user_id = '"+user.getUserId()+"'";
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
        <%@include file="components/user_navbar.jsp" %>
        <div class="center">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
        <h1>Your Profile:</h1>
        
<form method="post" action="update_user_profile.jsp">
<input type="hidden" name="user_id" value="<%=resultSet.getString("user_id") %>">

<br>
Name:<br>
<input type="text" name="user_name" value="<%=resultSet.getString("user_name") %>" readonly>
<br>

Password:<br>
<input type="text" name="user_password" value="<%=resultSet.getString("user_password") %>">
<br>
Email Id:<br>
<input type="email" name="user_email" value="<%=resultSet.getString("user_email") %>" readonly>
<br>
<br><br>
<input type="submit" value="Edit Password">
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
