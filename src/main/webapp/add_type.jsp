<%-- 
    Document   : add_type
    Created on : Feb 11, 2021, 12:39:48 PM
    Author     : garre
--%>

<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Type</title>
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
        <h2>Add a type:</h2>
        <div class="center">
        <form method="POST" action="new_type.jsp">
             <!-- Location dropdown-->
                    <%
                        
                    CompanyDao cDao=new CompanyDao(FactoryProvider.getFactory());
                    List<Company> list = cDao.getCompanies();

                    %>
                    <div class="form-group">
                        <h6>Select Location:</h6>
                        <select name="comId" class="form-control" id="comId">
                            
                            <%
                                for(Company c: list){
                            %>
                            <option value="<%= c.getCompanyName() %>"><%= c.getCompanyName() %> </option>
                            
                            <%
                                }
                            %>
                        </select>
                    </div>
                        <div class="form-group">
                            <h6>Type:</h6>
                            <select name="locationType" id="locationType">
                                <option value="OFFICE">OFFICE</option>
                                <option value="JACKSONVILLE ONLY">JACKSONVILLE ONLY</option>
                                <option value="OFFICE-ADMIN">OFFICE-ADMIN</option>
                                <option value="DIVERSIFIED SERVICE ENTERPRISES INC">DIVERSIFIED SERVICE ENTERPRISES INC</option>
                                <option value="FROG HOP">FROG HOP</option>
                                <option value="HOTELS">HOTELS</option>
                                <option value="PHARMACY">PHARMACY</option>
                                <option value="WEST COAST LAW">WEST COAST LAW</option>
                                <option value="1ST HEALTH INC">1ST HEALTH INC</option>
                                <option value="PHYSICIANS GROUP LLC">PHYSICIANS GROUP LLC</option>
                                <option value="PHYSICIANS GROUP(MN)LLC">PHYSICIANS GROUP(MN)LLC</option>
                                <option value="IT-SUPPLIES">IT-SUPPLIES</option>
                                <option value="HIMES-ONLY">HIMES-ONLY</option>
                                <option value="PHYSICIANS GROUP LLC-HAND SANITIZER">PHYSICIANS GROUP LLC-HAND SANITIZER</option>
                                <option value="PAIN MANAGEMENT">PAIN MANAGEMENT</option>
                                <option value="PALM INSURE">PALM INSURE</option>
                                <option value="ORTHOPEDIC">ORTHOPEDIC</option>
                                <option value="LUCKY SPOT">LUCKY SPOT</option>
                            </select>
                        </div>
                        
                                            <!--submit button-->
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add type</button>
                        
                    </div>
        </form>
        </div>
              
    </body>
</html>
