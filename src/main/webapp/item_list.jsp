
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
        <title>Items List</title>
        <%@include file="components/common_css_js.jsp" %>
        
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    

    
    
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


</script>
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}

table.table-fit {
    width: auto !important;
    table-layout: auto !important;
}
table.table-fit thead th, table.table-fit tfoot th {
    width: auto !important;
}
table.table-fit tbody td, table.table-fit tfoot td {
    width: auto !important;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #008080;}
</style>
    </head>
    <body>
<%@include file="components/navbar.jsp" %>
<br>

        <div class="row ml-2">
            <a href="add_item_page.jsp">
                <button>Add Item</button>
            </a>
        </div>
        
        <br>
        
     
        <input id="myInput"  name="ven" type="text" placeholder="Search All">
        
        <br><br>
      
        
        <a href="items_reports.jsp">
                
                
                <button class="btn btn-outline-success">Reports</button>
            </a>
            <br>
            <br>
    
        <!--
 <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <h3>Excel Reports</h3>
               </a>
<div class="dropdown-menu" aria-labelledby="navbarDropdown">
               <a class="dropdown-item" href="product_report.jsp">All</a>
               <a class="dropdown-item" href="vendor_product_report.jsp">Vendor</a>
               <a class="dropdown-item" href="man_product_report.jsp">Manufacturer</a>
               <a class="dropdown-item" href="mannum_product_report.jsp">Manufacturer Number</a>
               <a class="dropdown-item" href="inventory_product_report.jsp">Location Type</a>
               <a class="dropdown-item" href="alt_product_report.jsp">Alternate Item</a>
               <a class="dropdown-item" href="desc_product_report.jsp">Description</a>
               <a class="dropdown-item" href="cpt_product_report.jsp">CPT</a>
               <a class="dropdown-item" href="ndc_product_report.jsp">NDC</a>
               
                </div>
        -->
        <h1>List of Items</h1>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            <table class="table table-bordered table-fit" style="no-wrap">
            <thead>
            <tr>
                        
                        <th>IMAGE</th>
                        <th>ITEM NUMBER</th>
                        <th>DESCRIPTION</th>
                        <th>VENDOR</th>
                        <th>ALTERNATE ITEM</th>
                        <th>UOM</th>
                        <th>QTY PER UOM</th>

                        <th>COST</th>
                        
                        

                        
                        <th>CATEGORY</th>
                        <th>MANUFACTURER</th>
                        <th>MANUFACTURER NUMBER</th>
                        <th>CPT</th>
                        <th>NDC</th>
                     
                        <th>LOCATION TYPE</th>
                        <th>STATUS</th>
                    
                        <th>SDS</th>
                        <th>ACTIONS</th>
            </tr>
            </thead>
            <tbody id="myTable">
            <%
                
             ItemDao idao = new ItemDao(FactoryProvider.getFactory());
             List<Item> list = idao.getItems();   
                
                
             for(Item i: list){
            %>
            
            <tr>

                <td>
                    <img style="max-width: 125px" src="image/<%=i.getPhoto()%>" alt="user_icon">
                </td>
                <td><%=i.getItemNumber()%></td>
                <td><%=i.getpDesc()%></td>
                <td><%=i.getvTitle()%></td>
                <td><%=i.getAlternateItem()%></td>
                <td><%=i.getUnitOfMeasure()%></td>
                <td><%=i.getQuantity()%></td>
               
                <td><span>$<%=i.getPrice()%></span></td>

                
                
                
                <td><%=i.getcTitle()%></td>
                <td><%=i.getManufacturer()%></td>
                <td><%=i.getManufacturerNum()%></td>
                <td><%=i.getCpt()%></td>
                <td><%=i.getNdc()%></td>
                
                <td><%=i.getLocationType()%></td>
                <td><%=i.getStat()%></td>
             
                <td><%=i.getSds()%></td>
                <td>
                    <a href="update_product_page.jsp?id=<%= i.getId()%>">
                        <button>EDIT</button>
                    </a>
                    <a href="delete_prod.jsp?id=<%=i.getId()%>">
                        <button>DELETE</button>
                    </a>
                </td>
                
            </tr>
            <%
                }

                session.setAttribute("items", list);
            %>
            </tbody>
        </table>
        </div>
        

    </body>
</html>
