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
                                <a class="dropdown-item" href="order_report_1_item.jsp">1 ITEM</a>
                                <a class="dropdown-item" href="order_report_2_items.jsp">2 ITEMS</a>
                                <a class="dropdown-item" href="order_report_3_items.jsp">3 ITEMS</a>
                                <a class="dropdown-item" href="order_report_1_item_1_ven.jsp">1 ITEM 1 VENDOR</a>
                                <a class="dropdown-item" href="order_report_1_item_2_ven.jsp">1 ITEM 2 VENDORS</a>
                                <a class="dropdown-item" href="order_report_1_item_3_ven.jsp">1 ITEM 3 VENDORS</a>
                                <a class="dropdown-item" href="order_report_2_items_1_ven.jsp">2 ITEM 1 VENDOR</a>
                                <a class="dropdown-item" href="order_report_2_items_2_ven.jsp">2 ITEM 2 VENDOR</a>
                                <a class="dropdown-item" href="order_report_2_items_3_ven.jsp">2 ITEM 3 VENDOR</a>
                                <a class="dropdown-item" href="order_report_3_item_1_ven.jsp">3 ITEMS 1 VENDOR</a>
                                <a class="dropdown-item" href="order_report_3_item_2_ven.jsp">3 ITEMS 2 VENDORS</a>
                                <a class="dropdown-item" href="order_report_3_item_3_ven.jsp">3 ITEMS 3 VENDORS</a>
                                <a class="dropdown-item" href="order_report_1_item_1_location.jsp">1 ITEM 1 LOCATION</a>
                                <a class="dropdown-item" href="order_report_1_item_2_locations.jsp">1 ITEM 2 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_1_item_3_locations.jsp">1 ITEM 3 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_2_items_1_location.jsp">2 ITEMS 1 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_2_items_2_locations.jsp">2 ITEMS 2 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_2_items_3_locations.jsp">2 ITEMS 3 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_3_items_1_location.jsp">3 ITEMS 1 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_3_items_2_locations.jsp">3 ITEMS 2 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_3_items_3_locations.jsp">3 ITEMS 3 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_1_location.jsp">1 LOCATION</a>
                                <a class="dropdown-item" href="order_report_2_locations.jsp">2 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_3_locations.jsp">3 LOCATIONS</a>
                                <a class="dropdown-item" href="order_report_1_loc_1_ven.jsp">1 LOCATION 1 VENDOR</a>
                                <a class="dropdown-item" href="order_report_1_loc_2_ven.jsp">1 LOCATION 2 VENDORS</a>
                                <a class="dropdown-item" href="order_report_1_loc_3_ven.jsp">1 LOCATION 3 VENDORS</a>
                                <a class="dropdown-item" href="order_report_2_loc_1_ven.jsp">2 LOCATIONS 1 VENDOR</a>
                                <a class="dropdown-item" href="order_report_2_loc_2_ven.jsp">2 LOCATIONS 2 VENDORS</a>
                                <a class="dropdown-item" href="order_report_2_loc_3_ven.jsp">2 LOCATIONS 3 VENDORS</a>
                                <a class="dropdown-item" href="order_report_3_loc_1_ven.jsp">3 LOCATIONS 1 VENDOR</a>
                                <a class="dropdown-item" href="order_report_3_loc_2_ven.jsp">3 LOCATIONS 2 VENDORS</a>
                                <a class="dropdown-item" href="order_report_3_loc_3_ven.jsp">3 LOCATIONS 3 VENDORS</a>
                                <a class="dropdown-item" href="order_report_1_ven.jsp">1 VENDOR</a>
                                <a class="dropdown-item" href="order_report_2_ven.jsp">2 VENDORS</a>
                                <a class="dropdown-item" href="order_report_3_ven.jsp">3 VENDORS</a>
                            </div>
                        </div>
                            <form action="order_report_1_loc_2_ven_page.jsp" method="post">
                                                                <div class="form-group">
                                  <label for="date1">DATE 1:</label>
                                  <input name="date1" type="text" class="form-control" id="date1" placeholder="Enter start date Ex. 01/01/2021">
                                </div>
                                
                                <div class="form-group">
                                  <label for="date2">DATE 2:</label>
                                  <input name="date2" type="text" class="form-control" id="date2" placeholder="Enter end date Ex.02/01/2021">
                                </div>
                                <div class="form-group">
                                  <label for="vendor1">Vendor:</label>
                                  <input name="vendor1" type="text" class="form-control" id="vendor1" placeholder="Enter item number">
                                </div>
                                
                                <div class="form-group">
                                  <label for="vendor2">Vendor:</label>
                                  <input name="vendor2" type="text" class="form-control" id="vendor2" placeholder="Enter item number">
                                </div>
                                

                                <div class="form-group">
                                  <label for="location">Location:</label>
                                  <input name="location" type="text" class="form-control" id="location" placeholder="Enter vendor name">
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
