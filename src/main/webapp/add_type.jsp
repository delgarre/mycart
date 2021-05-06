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
         <%@include file="components/navbar.jsp" %>
  
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <br>
                  <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                      <br>
                      <div class="card">
                           <div class="card-header custom-bg text-white">
      <h1>ADD A TYPE:</h1>
                      </div>
                          <div class="card-body">
        <form method="POST" action="new_type.jsp">
             <!-- Location dropdown-->
                    <%
                        
                    CompanyDao cDao=new CompanyDao(FactoryProvider.getFactory());
                    List<Company> list = cDao.getCompanies();

                    %>
                    <div class="form-group">
                        <h6>Select Location:</h6>
                        <select name="comId" id="comId">
                            
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
                            
                            <select name="locationType" id="locationType">
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
                        <button class="btn btn-outline-success">ADD TYPE</button>
                        
                    </div>
        </form>
                          </div>
                      </div>
                </div>
            </div>
        </div>
              
    </body>
</html>
