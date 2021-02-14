<%-- 
    Document   : forgot_password
    Created on : Feb 14, 2021, 2:08:53 PM
    Author     : garre
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
String sql ="select * from User where user_email = '"+id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
int user_id = resultSet.getInt("user_id");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password</title>
    <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/login_navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h3>Enter Email Address:</h3>
                        </div>
                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            
                            
                            <form method="POST" action="update_password.jsp">
                                
                                <input type="hidden" name="id" value="<%=user_id%>"/>
                                
                                <div class="form-group">
                                  <label for="password">Enter Password:</label>
                                  <input name="password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="New password">
                                
                                </div>
                                <div class="container text-center">
                                 <button type="submit" class="btn btn-primary custom-bg border-0">Reset Password</button>
                                </div>
                            </form>
                        </div>
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
