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
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Companies</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="col-md-8">
            <div class="table-responsive-sm">
                <table class="table table-bordered " >
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Locatio</th>
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
                        <td><%= cp.getTypeLocation()%></td>
                    <td>
                    <a href="delete_comp.jsp?id=<%= cp.getCompanyId()%>">
                        <button type="button" class="delete">Delete</button>
                    </a>
                    <a href="update_comp.jsp?id=<%= cp.getCompanyId()%>">
                        <button type="button" class="update">Update</button>
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
