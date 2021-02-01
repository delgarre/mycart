<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>

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

%>
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Password</title>
        
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
        <%@include file="components/login_navbar.jsp" %>
        <div class="center">
        <h1>Change Password</h1>
        <form method="post" action="new_pass.jsp">
            <%
            while(resultSet.next()){
                
                        String user_id = resultSet.getString("user_id");
            %>
            <input type="hidden" name="email" value="<%=id%>"/>
            <input type="hidden" name="id" value="<%=user_id%>"/>
            <input type="text" name="password"/>
            <input type="submit" value="Change"/>
            <%
                }
            %>
        </form>
        </div>
            
            

<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
