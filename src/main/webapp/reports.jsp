<%-- 
    Document   : reports
    Created on : Jan 26, 2021, 7:01:14 PM
    Author     : garre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
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
        <h1>Reports</h1>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card-header custom-bg text-white">
                            <h3>Report Info:</h3>
                    </div>
                    
                    <div class="card-body">
                        <%@include file="components/message.jsp" %>
                            
                            <form action="reports_page.jsp" method="post">

                                  

                                <div class="form-group">
                                  <label for="date1">Date 1:</label>
                                  <input name="date1" type="text" class="form-control" id="date1" placeholder="Enter date">
                                </div>
                                
                                <div class="form-group">
                                  <label for="date2">Date 2:</label>
                                  <input name="date2" type="text" class="form-control" id="date2" placeholder="Enter date">
                                </div>
                                
                                
                                <div class="form-group">
                                  <label for="vendor1">Vendor 1:</label>
                                  <input name="vendor1" type="text" class="form-control" id="vendor1" placeholder="Enter vendor name">
                                </div>
                                
                                <div class="form-group">
                                  <label for="vendor2">Vendor 2:</label>
                                  <input name="vendor2" type="text" class="form-control" id="vendor2" placeholder="Enter vendor name">
                                </div>
                                   
                                
                                
                             

                                <div class="form-group">
                                  <label for="location1">Location 1:</label>
                                  <input name="location1" type="text" class="form-control" id="location1" placeholder="Enter location">
                                </div>
                                
                                <div class="form-group">
                                  <label for="location2">Location 2:</label>
                                  <input name="location2" type="text" class="form-control" id="location2" placeholder="Enter location">
                                </div>
                                 
                             
                                <div class="form-group">
                                  <label for="itemNumber1">Item Number 1:</label>
                                  <input name="itemNumber1" type="text" class="form-control" id="itemNumber1" placeholder="Enter item number">
                                </div>
                                
                                <div class="form-group">
                                  <label for="itemNumber2">Item Number 2:</label>
                                  <input name="itemNumber2" type="text" class="form-control" id="itemNumber2" placeholder="Enter item number">
                                </div>

                                 <div class="container text-center">
                                    
                                    
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Generate Report</button>
                                    
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
