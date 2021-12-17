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
        <title>ADD USER</title>
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
      <h1>ADD USER</h1>
                      </div>
                          <div class="card-body">
        <form method="post" action="new_user.jsp">
            
            <div class="form-group">
            <label for="user_name">NAME:</label>
            <input type="text" name="user_name" id="user_name">
            </div>
            <div class="form-group">
            <label for="user_email">EMAIL:</label>
            <input type="text" name="user_email" id="user_email">
            </div>
            <div class="form-group">
            <label for="user_password">PASSWORD:</label>
            <input type="text" name="user_password" id="user_password">
            </div>
            
            <div class="form-group">
            <label for="department">DEPARTMENT:</label>
            <input type="text" name="department" id="department">
            </div>
            
            <div class="form-group">
            <label for="user_type">ACCESS LEVEL:</label>
            <select name="user_type" id="user_type">
                <option value="normal">NORM</option>
                <option value="admin">ADMIN</option>
            </select>
            </div> 
            
            <div class="container text-center">
                <input type="submit" value="ADD USER" class="btn btn-success">
            </div>
        </form>
                          </div>
                      </div>
                </div>
            </div>
        </div>
    </body>
</html>
