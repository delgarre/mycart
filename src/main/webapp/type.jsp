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
String sql ="select * from Types order by locationType";
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
        <h2>Maintenance Location Types</h2>
        
        <div class="row ml-2">
            <a href="add_l_type.jsp">
                <button class="btn btn-outline-success">ADD NEW LOCATION TYPE</button>
            </a>
            
        <br>
        
        
            <a href="types.jsp">
                <button class="btn btn-outline-success">ASSIGNED LOCATION TYPES</button>
            </a>
            
        <br>
        
            <a href="l_company.jsp">
                <button class="btn btn-outline-primary">COMPANIES</button>
            </a>
        <br>
    
            <a href="companies.jsp">
                <button class="btn btn-outline-primary">LOCATIONS</button>
            </a>
       
        </div>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            <table class="table table-bordered">
               
                <tr>
              
                <th>NAMES</th>
                <th>ACTIONS</th>
                </tr>
                <tr>
                    <%
                    while(resultSet.next()){
                        
                        
                        String type = resultSet.getString("locationType");
                        String id = resultSet.getString("id");

                        
                    %>
                  
                    <td><%=type%></td>
                    <td>
                        
                        <a href="l_type_page.jsp?id=<%=id%>">
                            <button class="btn btn-outline-primary">EDIT NAME</button>
                        </a>
                        
                        <a href="delete_l_type.jsp?id=<%=id%>" onclick="return confirm('Are you sure?');">
                            <button class="btn btn-outline-danger">DELETE</button>
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
