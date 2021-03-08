<%-- 
    Document   : add_type
    Created on : Feb 11, 2021, 12:39:48 PM
    Author     : garre
--%>

<%@page import="com.learn.mycart.entities.Types"%>
<%@page import="com.learn.mycart.dao.TypesDao"%>
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
                        <%
                        TypesDao tDao = new TypesDao(FactoryProvider.getFactory());
                        List<Types> tList = tDao.getTypes();
                        %>
                        <div class="form-group">
                            <h6>Type:</h6>
                            
                            <select class="form-control" name="locationType" id="locationType">
                                <%
                                for(Types t: tList){
                                %>
                                <option value="<%=t.getLocationType()%>"><%=t.getLocationType()%></option>
                              <%
                                  }
                              %>
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
