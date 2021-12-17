<%@page import="com.learn.mycart.entities.L_Company"%>
<%@page import="com.learn.mycart.dao.L_CompanyDao"%>
<%@page import="com.learn.mycart.entities.Types"%>
<%@page import="com.learn.mycart.dao.TypesDao"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.util.List"%>
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
        <title>Add COMPANY</title>
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
                  <button class="btn btn-warning" onclick="goBack()">GO BACK</button>
                      <br>
                      <div class="card">
            <div class="card-header custom-bg text-white">
                                <h1>ADD COMPANY</h1>
                          </div>
                          <div class="card-body">
        <form method="post" action="new_company.jsp">
            <div class="form-group">
            <label for="companyName">LOCATION:</label>
            <input type="text" name="companyName" id="companyName">
            </div>
            <%
            L_CompanyDao lDao = new L_CompanyDao(FactoryProvider.getFactory());
            List<L_Company> tList = lDao.getCompanies();
            %>
            <div class="form-group">
            <label for="type">COMPANY:</label>
            <select name="type" id="type">
                <%
                for(L_Company l: tList){
                %>
                <option value="<%=l.getCompany()%>"><%=l.getCompany()%></option>
                    <%
                        }
                    %>
            </select>
            </div>
            <div class="form-group">
                <label for="code">CODE:</label>
                <input type="text" name ="code" id="code" required> 
            </div>
            <div class="form-group">
                <label for="address1">ADDRESS 1:</label>
                <input type="text" name ="address1" id="address1"> 
            </div>
            <div class="form-group">
                <label for="address2">ADDRESS 2:</label>
                <input type="text" name ="address2" id="address2"> 
            </div>
            <div class="form-group">
                <label for="city">CITY:</label>
                <input type="text" name ="city" id="city"> 
            </div>
            <div class="form-group">
                <label for="states">STATES:</label>
                <input type="text" name ="states" id="states"> 
            </div>
            <div class="form-group">
                <label for="zip">ZIP:</label>
                <input type="text" name ="zip" id="zip"> 
            </div>
            <div class="form-group">
                <label for="account_id">ACCOUNT ID:</label>
                <input type="text" name ="account_id" id="account_id"> 
            </div>
            <div class="form-group">
                <label for="phone">PHONE:</label>
                <input type="text" name ="phone" id="phone"> 
            </div>
            <div class="container text-center">
            <input type="submit" class="btn btn-outline-success" value="SAVE">
            </div>
        </form>
                          </div>
                      </div>
                </div>
            </div>
        </div>
    </body>
</html>
