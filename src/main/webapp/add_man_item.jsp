
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
        <title>Add Manufacturer</title>
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
                            <h1>MANUFACTURER INFO:</h1>
                          </div>
                          <div class="card-body">
        <form method="POST" action="new_man_item.jsp">
            <div class="form-group">
            <label for="name">NAME:</label>
            <input type="text" name="name" id="name">
            </div>
            <div class="container text-center">
            <input type="submit" class="btn btn-outline-success" value="Add Manufactuer">
            </div>
        </form>
                          </div>
                      </div>
                </div>
            </div>
        </div>
    </body>
</html>
