<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
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
String sql ="select * from L_Company where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Company</title>
        <%@include file="components/common_css_js.jsp" %>
        
<script>
function goBack(){
        window.history.back();
    } 
    
</script>
    </head>
    <body>
      <%@include file="components/navbar.jsp" %>
      <div class="container">  
          <div class="row">
              <div class="col-md-6 offset-md-3">
                  <br>
                  <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                      <br>
                  <div class="card">
                      
                      <div class="card-header custom-bg text-white">
      <h1>Make Changes!</h1>
                      </div>
      <div class="card-body">
      <form method="POST" action="update_l_comp.jsp">
          
          <input type="hidden" name="cId" value="<%=resultSet.getString("id") %>">

            <div class="form-group">
                       <label for="company">Company:</label>
          
            
          <input type="text" name="company" value="<%=resultSet.getString("company") %>" id="company">
            </div>
            <div class="container text-center">
          <input type="submit" value="SAVE CHANGES" class="btn btn-primary">
          
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
