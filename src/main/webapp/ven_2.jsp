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
                            <div class="dropdown show">
                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                SEARCH OPTIONS
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="items_1.jsp">1 ITEM</a>
                                <a class="dropdown-item" href="items_1_ven_1.jsp">1 ITEM 1 VENDOR</a>
                                <a class="dropdown-item" href="items_1_ven_2.jsp">1 ITEMS 2 VENDORS</a>
                                <a class="dropdown-item" href="items_1_ven_3.jsp">1 ITEMS 3 VENDORS</a>
                                <a class="dropdown-item" href="items_2.jsp">2 ITEMS</a>
                                <a class="dropdown-item" href="items_2_ven_1.jsp">2 ITEMS 1 VENDOR</a>
                                <a class="dropdown-item" href="items_2_ven_2.jsp">2 ITEMS 2 VENDORS</a>
                                <a class="dropdown-item" href="items_2_ven_3.jsp">2 ITEMS 3 VENDORS</a>
                                <a class="dropdown-item" href="items_3.jsp">3 ITEMS</a>
                                <a class="dropdown-item" href="items_3_ven_1.jsp">3 ITEMS 1 VENDOR</a>
                                <a class="dropdown-item" href="items_3_ven_2.jsp">3 ITEMS 2 VENDORS</a>
                                <a class="dropdown-item" href="items_3_ven_3.jsp">3 ITEMS 3 VENDORS</a>
                                <a class="dropdown-item" href="ven_1.jsp">1 VENDOR</a>
                                <a class="dropdown-item" href="ven_2.jsp">2 VENDORS</a>
                                <a class="dropdown-item" href="ven_3.jsp">3 VENDORS</a>
                            </div>
                        </div>
                            <form action="ven_2_page.jsp" method="post">
                                
                                <div class="form-group">
                                  <label for="vendor1">Vendor 1:</label>
                                  <input name="vendor1" type="text" class="form-control" id="vendor1" placeholder="Enter vendor name">
                                </div>
                                
                                <div class="form-group">
                                  <label for="vendor2">Vendor 2:</label>
                                  <input name="vendor2" type="text" class="form-control" id="vendor2" placeholder="Enter vendor name">
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
