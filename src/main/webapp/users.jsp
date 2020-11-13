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
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="row ml-2">
            <a href="add_user.jsp">
                <button>Add user</button>
            </a>
        </div>
        
        <div class="col-md-8">
        <div class="table-responsive-sm mt-3">
        <table class="table table-bordered " >
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Location</th>
                <th>Authority</th>
                <th>Actions</th>
            </tr>
            
            
            <%
            
                
                UserDao uDao = new UserDao(FactoryProvider.getFactory());
                List<User> ulist = uDao.getUsers();
                
               
                
                
            %>
            
            <%
            for(User u: ulist){
                
            
            %>
            
            
            <tr>
                <td><%= u.getUserId()%></td>
                <td><%= u.getUserName()%></td>
                
                
                <td><%=u.getCompanies()%></td>
                
                <td><%= u.getUserType()%></td>
                <td>
                    <a href="delete.jsp?id=<%= u.getUserId() %>">
                        <button type="button" class="delete">Delete</button>
                    </a>
                    <a href="update_user_page.jsp?id=<%=u.getUserId() %>">
                        <button type="button" class="update">Update</button>
                    </a>
                        <a href="company_user.jsp?id=<%= u.getUserId()%>">
                        <button type="">Companies</button>    
                    </a>
                </td>
            </tr>
            <%
            }
            %>
        </table>
        
          
        </div>
      
    </div>
        
        
    </body>
</html>
