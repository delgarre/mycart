<%-- 
    Document   : l_company
    Created on : Mar 12, 2021, 2:57:28 PM
    Author     : garre
--%>

<%@page import="com.learn.mycart.entities.L_Company"%>
<%@page import="com.learn.mycart.dao.L_CompanyDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
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
            <h2>Companies:</h2>
            <br>
            <div class="row ml-2">
            <a href="add_l_company.jsp">
                <button class="btn btn-outline-success">ADD COMPANY</button>
            </a>
                <br>
                <a href="companies.jsp">
                <button class="btn btn-outline-primary">LOCATIONS</button>
            </a>
                <br>
            <a href="type.jsp">
                <button class="btn btn-outline-primary">MAINTAIN LOCATION TYPE</button>
            </a>
                <br>
                 <a href="types.jsp">
                <button class="btn btn-outline-success">ASSIGNED LOCATION TYPES</button>
            </a>
                
        </div>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="table-responsive-sm">
                <table class="table table-bordered " >
                    <tr>
                        
                        <th>COMPANY</th>
                        <th>ACTIONS</th>
                    </tr>
                    
                    
                    <%
                        L_CompanyDao cpDao = new L_CompanyDao(FactoryProvider.getFactory());
                        List<L_Company> cpList = cpDao.getCompanies();
                    %>
                    
                    <%
                        for(L_Company cp: cpList){
                    %>
                    
                    <tr>
                        
                        <td><%= cp.getCompany()%></td>
                        
                    <td>
                    <a href="delete_l_comp.jsp?id=<%= cp.getId()%>" onclick="return confirm('Are you sure?');">
                        <button type="button" class="btn btn-outline-danger">DELETE</button>
                    </a>
                    <a href="update_l_comp_page.jsp?id=<%= cp.getId()%>">
                        <button type="button" class="btn btn-outline-warning">EDIT</button>
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
