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
        <title>Add User</title>
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
                                <h1>Info:</h1>
                          </div>
                          <div class="card-body">
        <form method="post" action="new_company.jsp">
            <div class="form-group">
            <label for="companyName">LOCATION:</label>
            <input type="text" name="companyName" id="companyName">
            </div>
            <%
            TypesDao tDao = new TypesDao(FactoryProvider.getFactory());
            List<Types> tList = tDao.getTypes();
            %>
            <div class="form-group">
            <label for="type">COMPANY:</label>
            <select name="type" id="type">
                <%
                for(Types t: tList){
                %>
                <option value="<%=t.getLocationType()%>"><%=t.getLocationType()%></option>
                    <%
                        }
                    %>
            </select>
            </div>
            <div class="container text-center">
            <input type="submit" class="btn btn-outline-success" value="ADD COMPANY">
            </div>
        </form>
                          </div>
                      </div>
                </div>
            </div>
        </div>
    </body>
</html>
