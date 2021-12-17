<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Company"%>
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
String sql ="select * from Company where companyId="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Site</title>
        <%@include file="components/common_css_js.jsp" %>
        
<script>
function goBack(){
        window.history.back();
    } 
    
</script>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Make Changes!</h1>
        <div class="container"> 
            <div class="row">
                 <div class="col-md-6 offset-md-3">
                  <br>
                  <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                      <br>
                      <div class="card">
                        <div class="card-header custom-bg text-white">
      
                      </div>
            <div class="card-body">
                <h1>MAKE CHANGES!</h1>
        <form method="post" action="update_comp.jsp">
            <input type="hidden" name="companyId" value="<%=resultSet.getString("companyId") %>">
            <br>
            <div class="form-group">
                       <label for="companyName">Location:</label>
           
            <input type="text" name="companyName" value="<%=resultSet.getString("companyName")%>" id="companyName" spellcheck="true">
            </div>
              <div class="form-group">
                       <label for="type">Company:</label>
        
            <input type="text" name="type" value="<%=resultSet.getString("type")%>" id="type">
              </div>
              <div class="form-group">
                       <label for="address1">ADDRESS 1:</label>
        
            <input type="text" name="address1" value="<%=resultSet.getString("address1")%>" id="address1">
              </div>
              
              <div class="form-group">
                       <label for="address2">ADDRESS 2:</label>
        
            <input type="text" name="address2" value="<%=resultSet.getString("address2")%>" id="address2">
              </div>
              
              <div class="form-group">
                       <label for="city">CITY:</label>
        
            <input type="text" name="city" value="<%=resultSet.getString("city")%>" id="address2">
              </div>
              
            <div class="form-group">
                       <label for="states">STATES:</label>
            <input type="text" name="states" value="<%=resultSet.getString("states")%>" id="states">
            </div>
            
            <div class="form-group">
                       <label for="zip">ZIP:</label>
            <input type="text" name="zip" value="<%=resultSet.getString("zip")%>" id="zip">
            </div>
              
                          <div class="container text-center">
              <input type="submit" onclick="return confirm('Are you sure?');" class="btn btn-outline-primary" value="SAVE CHANGES">
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
