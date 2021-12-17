<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.UserDao"%>
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


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        
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
  
 table.table-fit {
    width: auto !important;
    table-layout: auto !important;
}
table.table-fit thead th, table.table-fit tfoot th {
    width: auto !important;
}
table.table-fit tbody td, table.table-fit tfoot td {
    width: auto !important;
}
</style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        
        <div class="center">
            <h2>USERS:</h2>
         <div class="row ml-2">
            <a href="add_user.jsp">
                <button class="btn btn-outline-success">ADD USER</button>
            </a>
        </div>
            <div class="row ml-2">
            <a href="inactive_users.jsp">
                <button class="btn btn-outline-success">INACTIVE USERS</button>
            </a>
        </div>
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
    
        <table class="table table-bordered table-fit" >
            <tr>
               
                <th>NAME</th>
                <th>PASSWORD</th>
                <th>EMAIL</th>
                <th>DEPARTMENT</th>
                <th>ACCESS LEVEL</th>
                <th>ACTIONS</th>
            </tr>
            
            
            <%
            
                
                UserDao uDao = new UserDao(FactoryProvider.getFactory());
                List<User> ulist = uDao.getActiveUsers();
                
               
                
                
            %>
            
            <%
            for(User u: ulist){
            %>
            
            <tr>
              
                <td><%= u.getUserName()%></td>
                
                <td><%=u.getUserPassword()%></td>
                <td><%=u.getUserEmail()%></td>
                <td><%=u.getDepartment()%></td>
                
                <td><%= u.getUserType()%></td>
                <td>
                    <a href="delete.jsp?id=<%= u.getUserId() %>" onclick="return confirm('Are you sure?');">
                        <button type="button" class="btn btn-outline-danger">DEACTIVATE</button>
                    </a>
                    <a href="update_user_page.jsp?id=<%=u.getUserId() %>">
                        <button type="button" class="btn btn-outline-warning">EDIT</button>
                    </a>
                        <a href="company_user.jsp?id=<%= u.getUserId()%>&name=<%=u.getUserName()%>">
                        <button type="button" class="btn btn-outline-success">LOCATIONS</button>    
                    </a>
                </td>
            </tr>
            <%
            }
            %>
        </table>
        
          
        </div>
      

    </body>
</html>
