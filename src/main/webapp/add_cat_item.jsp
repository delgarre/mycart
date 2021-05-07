<%-- 
    Document   : add_category
    Created on : Jan 20, 2021, 1:31:06 PM
    Author     : garre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Title</title>
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
                                <h1>CATEGORY:</h1>
                          </div>
                          <div class="card-body">
        <form method="POST" action="new_cat_item.jsp">
            <div class="form-group">
            <label for="title">TITLE:</label>
            <input type="text" name="title" id="title">
            </div>
            <div class="container text-center">
                <input type="submit" class="btn btn-outline-success" value="Add Category">
            </div>
        </form>
                          </div>
                      </div>
                </div>
            </div>
        </div>
    </body>
</html>
