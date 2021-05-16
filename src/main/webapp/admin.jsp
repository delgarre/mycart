<%@page import="com.learn.mycart.entities.Notice"%>
<%@page import="com.learn.mycart.dao.NoticeDao"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
<%@page import="com.learn.mycart.dao.VendorDao"%>
<%@page import="com.learn.mycart.entities.LocationType"%>
<%@page import="com.learn.mycart.dao.LocationTypeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
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
        <title>Admin Page</title>
        <style>
            
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
        </style>
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
           
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="panel-heading col-md-8">
                <table class="table table-striped table-dark table-bordered table-fit">
                        <%
                        NoticeDao ldao = new NoticeDao(FactoryProvider.getFactory());
                        List<Notice> notice = ldao.getStatus();
                        %>
                        
                        <tr>
                            <th>MESSAGE:</th>
                        </tr>
                        <%
                        for(Notice n: notice){
                        %>
                        
                        <tr>
                            
                            <td><%=n.getMessage()%></td>
                            
                        </tr>
                        <%
                            }
                        %>
                    </table>
            </div>
            
            <div class="row mt-3">
                
                <!--first column-->
                <div class="col-md-3">
                   <a href="users.jsp" class="card-link">
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                                
                            </div>
                            
                       
                            <h4 class="text-muted">USERS</h4>
                        </div>
                    </div>
                   </a>
                </div>
                <!--second column-->
                <div class="col-md-3">
                    <a href="categories.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                            </div>
                      
                            <h4 class="text-muted">CATEGORIES</h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--third column-->
                <div class="col-md-3">
                    <a href="item_list.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                            </div>
                         
                            <h4 class="text-muted">INVENTORY ITEMS</h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--fourth box-->
                <div class="col-md-3">
                    <a href="companies.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/location.png" alt="user_icon">
                            </div>
                           
                            <h4 class="text-muted">LOCATIONS</h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--fifth row -->
                <div class="col-md-3">
                    <a href="orders.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/category.png" alt="user_icon">
                            </div>
                          
                            <h4 class="text-muted">ORDERS PENDING APPROVAL </h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--SIXTH row -->
                <div class="col-md-3">
                    <a href="open.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/oo.png" alt="user_icon">
                            </div>
                          
                            <h4 class="text-muted">OPEN ORDERS </h4>
                        </div>
                    </div>
                    </a>
                </div>
                
                <!--seventh row -->
                <div class="col-md-3">
                    <a href="uom.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/ruler.png" alt="user_icon">
                            </div>
                          
                            <h4 class="text-muted">UOM LIST</h4>
                        </div>
                    </div>
                    </a>
                </div>

                <!--eighth row -->
                <div class="col-md-3">
                    <a href="notice.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/message_board.png" alt="user_icon">
                            </div>
                   
                            <h4 class="text-muted">MESSAGE BOARD</h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--ninth row -->
                <div class="col-md-3">
                    <a href="vendors.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendors.png" alt="user_icon">
                            </div>
                     
                            <h4 class="text-muted"> VENDORS</h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--tenth row -->
                <div class="col-md-3">
                    <a href="date_page.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/history.png" alt="user_icon">
                            </div>
                            
                            <h4 class="text-muted"> ORDER HISTORY</h4>
                        </div>
                    </div>
                    </a>
                </div>
              <!--eleventh row -->
                
               
                <div class="col-md-3">
                    <a href="manufacturers.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/manufacturer.png" alt="user_icon">
                            </div>
                            
                            <h4 class="text-muted">MANUFACTURERS</h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--thirteenth row -->
                <div class="col-md-3">
                    <a href="cpt.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/cpt.png" alt="user_icon">
                            </div>
                            
                            <h4 class="text-muted">CPT CODES</h4>
                        </div>
                    </div>
                    </a>
                </div>
                <!--fourthteenth row -->
                <div class="col-md-3">
                    <a href="#" class="card-link" data-toggle="modal" data-target="#exampleModal">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/reports.png" alt="user_icon">
                            </div>
                            
                            <h4 class="text-muted">REPORTS</h4>
                        </div>
                    </div>
                    </a>
                </div>
            </div>
            
        </div>
                    
  <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Choose a category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                
          <h3>Would like to print a download a report for items or orders?</h3>
       
             
      </div>
      
      <div class="modal-footer">
        <a href="items_1.jsp">
           <input type="button" class="btn btn-outline-info" value="ITEMS">
        </a>
        <a href="order_report_1_item.jsp">
           <input type="button" class="btn btn-outline-info" value="ORDERS">
        </a>
      </div>
    </div>
  </div>
</div>
      
    </body>
</html>
