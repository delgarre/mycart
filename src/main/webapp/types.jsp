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
        <script>
            //this will hide message after 3 seconds
            setTimeout(function(){
            $("#error").hide();
            },3000)
        </script>       
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}

th, td {
  text-align: left;
  padding: 8px;
}

th {
  background: white;
  position: sticky;
  top: 0;
}

tr:nth-child(even) {background-color: #008080;}
</style>        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="center">
        
        <h2>LOCATION TYPES</h2>
        <br>
        <div class="row ml-2">
            <a href="add_type.jsp">
                <button class="btn btn-success">ASSIGN LOCATION TYPE</button>
            </a>
            <br>
            <a href="type.jsp">
                <button class="btn btn-warning">MAINTAIN LOCATION TYPE</button>
            </a>
            <br>
            <a href="l_company.jsp">
                <button class="btn btn-primary">COMPANIES</button>
            </a>
            <br>
            <a href="companies.jsp">
                <button class="btn btn-info">LOCATIONS</button>
            </a>
        </div>
        <div class="col-md-8">
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            <table class="table table-bordered">
               
                <tr>
                <th>LOCATION</th>
                <th>TYPE</th>
                <th>ACTION</th>
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
                        
                        <a href="delete_type.jsp?id=<%=id%>" onclick="return confirm('Are you sure?');">
                            <button class="btn btn-danger">DELETE</button>
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
