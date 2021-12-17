<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%

    User user = (User)session.getAttribute("current-user");
    int id = user.getUserId();
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }

%>
<%

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
String sql ="select * from UserLocation where user_id = '"+id+"'";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locations</title>
        
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
        <div class="center">
            <h2>LOCATIONS:</h2>
            
            <button class="btn btn-warning" onclick="goBack()">GO BACK</button><br>
                <br>
        <div class="container-fluid">
            <table class="table table-bordered">
                <tr>
                    <th>Location</th>
                    <th>Company</th>
                </tr>
                <%
                while(resultSet.next()){
                    String loc = resultSet.getString("comp_name");
                    String comp = resultSet.getString("type");
                    %>
                <tr>
                    <td><%=loc%></td>
                    <td><%=comp%></td>
                </tr>
                <%
                    }
                %>
            </table>
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
