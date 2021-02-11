<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
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
        <title>Companies</title>
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
            <h2>Locations:</h2>
            <br>
            <div class="row ml-2">
            <a href="add_company.jsp">
                <button class="btn btn-outline-success">Add location</button>
            </a>
        </div>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="table-responsive-sm">
                <table class="table table-bordered " >
                    <tr>
                        <th>Id</th>
                        <th>Location</th>
                        <th>Company</th>
                        <th>Actions</th>
                    </tr>
                    
                    
                    <%
                        CompanyDao cpDao = new CompanyDao(FactoryProvider.getFactory());
                        List<Company> cpList = cpDao.getCompanies();
                    %>
                    
                    <%
                        for(Company cp: cpList){
                    %>
                    
                    <tr>
                        <td><%= cp.getCompanyId()%></td>
                        <td><%= cp.getCompanyName()%></td>
                        <td><%= cp.getType()%></td>
                    <td>
                    <a href="delete_comp.jsp?id=<%= cp.getCompanyId()%>">
                        <button type="button" class="delete">Delete</button>
                    </a>
                    <a href="update_comp_page.jsp?id=<%= cp.getCompanyId()%>">
                        <button type="button" class="update">Edit</button>
                    </a> 
                </td>
            </tr>
            <%
            }
            %>
                    
                </table>
            </div>
        </div>
        </div>        
    </body>
</html>
