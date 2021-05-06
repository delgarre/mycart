<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.OrderHistoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.OrderHistory"%>
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
String sql ="select distinct locations from OrderHistory where date ='"+id+"';";

resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="col-md-8">
            <div class="table-responsive-sm mt-3">
                <table class="table table-bordered " >
                    <tr>
                        <th>Location</th>
                        
                        <th>Actions</th>
                    </tr>

                    
                    
                    
                    <tr>
                           <%
                    while(resultSet.next()){
                        ;
                        String locations = resultSet.getString("locations");
                        
                    %>
                        <td><%=locations%></td>
                        <td>
                            <a href="past_orders_page.jsp?id=<%= locations%>">
                                <button class="btn btn-primary">View</button>
                        </a>
                        </td>
                        
                    </tr>
                    <%
                        }
                        session.setAttribute("date", id);
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
