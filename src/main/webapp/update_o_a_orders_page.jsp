<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.UserDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
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
String sql ="select * from Orders where id = "+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    String name = resultSet.getString("name");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve Order</title>
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
      
         <div class="container">
             <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <br>
                    <button type="button" class="btn btn-warning" onclick="goBack()">GO BACK</button>
                    <br>
                    <div class="card-header custom-bg text-white">
                            <h3>UPDATE ITEM QUANTITY:</h3>
                    </div>
                    <div class="card-body">
    <form method="post" action="update_o_a_order.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">

                            <%
                            UserDao uDao = new UserDao(FactoryProvider.getFactory());
                            List<User> uList = uDao.getUserByName(name);
                            %>
                            
                            <%
                            for(User u: uList){
                            %>
                            <input type="hidden" name="email" value="<%=u.getUserEmail() %>">
                            <input type="hidden" name="username" value="<%=u.getUserName() %>">
                            <%
                                }
                            %>
                            
                <div class="form-group">
                            <label for="itemNumber"><b>ITEM NUMBER:</b></label>
                                <input type="text" name="itemNumber" value="<%=resultSet.getString("itemNumber") %>" id="itemNumber" readonly>
                </div>
                <div class="form-group">
                            <label for="aPPrice"><b>COST($):</b></label>
                                <input type="text" name="aPPrice" value="<%=resultSet.getString("aPPrice") %>" id="aPPrice" readonly>
                </div>
                <div class="form-group">
                            <label for="name"><b>ORDERED BY:</b></label>

<input type="text" name="name" value="<%=name %>" id="name" readonly>
                </div>
                <div class="form-group">
                            <label for="quantity"><b>QUANTITY:</b></label>

<input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>" id="quantity">
                            
                </div>


<input type="hidden" name="locations" value="<%=resultSet.getString("locations")%>" readonly>
<br><br>
<input onclick="return confirm('Are you sure?');" class="btn btn-primary" type="submit" value="SAVE CHANGES">
</form>
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

