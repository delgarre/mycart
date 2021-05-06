<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
String name = request.getParameter("name");
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
String sql ="select * from UserLocation where user_id =  "+id;
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Info</title>
        <%@include file="components/common_css_js.jsp" %>
<script>
function goBack(){
        window.history.back();
    } 
    
</script>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>LOCATIONS FOR <%=name%></h1>
        <div class="container-fluid">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
        <div class="col-md-2">
        <form action="add_location_type.jsp" method="POST">
            <%
            CompanyDao cDao = new CompanyDao(FactoryProvider.getFactory());
            List<Company> cList = cDao.getCompanies();
            %>
            <h6>ADD LOCATION:</h6>
            <select name="location" id="location">
                <%
                for(Company c: cList)
                {
                %>
                <option value="<%=c.getCompanyName()%>"><%=c.getCompanyName()%></option>
               <%
                   }
               %>
            </select>
            
            <input type="hidden" name="user" value ="<%=id%>">
            <button class="btn btn-warning" onclick="goBack()">GO BACK</button>
            <input type="submit" value="ADD LOCATION" class="btn btn-success">
        </form>
        </div>
        <div class="col-md-8">
       
        
        
        <table class="table table-bordered ">
            <tr>
              
                <th>LOCATIONS</th>
                <th>ACTION</th>
            </tr>
            <tr>
                 <%
                     
                     
                while(resultSet.next()){
                String t_id = resultSet.getString("id");
                String comp_name = resultSet.getString("comp_name");
                

                %>
              
                <td><%=comp_name%></td>
                <td>
                    
                    <a href="delete_location.jsp?id=<%=t_id%>&user=<%=id%>">
                        <button type="button" class="btn btn-outline-danger" onclick="return confirm('Are you sure?');">DELETE</button>
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
