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
</style>
    </head>
    <body>
        <%@include file="components/user_navbar.jsp" %>
        <div class="container">
             <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row"> 
                <div class="col-md-6 offset-md-3">
                    <br>
                    <button type="button" class="btn btn-warning" onclick="goBack()">Go Back</button>
                    <br>
                    <div class="card-header custom-bg text-white">
                            <h3>Your Info:</h3>
                    </div>
        <div class="card-body">
<form method="post" action="update_user_profile.jsp">
<input type="hidden" name="user_id" value="<%=resultSet.getString("user_id") %>">
                        <div class="form-group">
                            <label for="user_name"><b>NAME:</b></label>
                    
                    <input type="text" name="user_name" value="<%=resultSet.getString("user_name") %>" class="form-control" id="user_name" readonly>
                        </div>
                    <div class="form-group">
                        <label for="user_password"><b>PASSWORD:</b></label>
                    
                    <input type="text" name="user_password" value="<%=resultSet.getString("user_password") %>" class="form-control" id="user_password">
                    </div>
                    <div class="form-group">
                        <label for="user_email"><b>EMAIL ID:</b></label>
                    
                    <input type="email" name="user_email" value="<%=resultSet.getString("user_email") %>" class="form-control" id="user_email" readonly>
                    </div>
                    <div class="container text-center">
                    <input type="submit" class="btn btn-primary" value="SAVE CHANGES">
                    </div>
</form>
                    </div>
                </div>
            </div>
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
