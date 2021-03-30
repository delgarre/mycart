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
String sql ="select * from LocationType";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location Types</title>
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
        
        <h2>Location Types</h2>
        <br>
        <div class="row ml-2">
            <a href="add_type.jsp">
                <button class="btn btn-outline-success">Assign Location Type</button>
            </a>
            <br>
            <a href="type.jsp">
                <button class="btn btn-outline-primary">Maintain Location Type</button>
            </a>
        </div>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            <table class="table table-bordered">
               
                <tr>
                <th>Location</th>
                <th>Type</th>
                <th>Action</th>
                </tr>
                <tr>
                    <%
                    while(resultSet.next()){
                        
                        String loc = resultSet.getString("location");
                        String type = resultSet.getString("locationType");
                        String id = resultSet.getString("id");

                        
                    %>
                    <td><%=loc%></td>
                    <td><%=type%></td>
                    <td>
                        
                        <a href="delete_type.jsp?id=<%=id%>">
                            <button class="btn btn-outline-danger">Delete</button>
                        </a>
                    </td>
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
