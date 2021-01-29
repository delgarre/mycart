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
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
           
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            
            <div class="row mt-3">
                
                <!--first column-->
                <div class="col-md-3">
                   
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                                
                            </div>
                            
                            <a href="users.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Users</h3>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                            </div>
                            <a href="categories.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Categories</h3>
                        </div>
                    </div>
                </div>
                <!--third column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                            </div>
                            <a href="item_list.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Items</h3>
                        </div>
                    </div>
                </div>
                <!--fourth box-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/location.png" alt="user_icon">
                            </div>
                            <a href="companies.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Locations</h3>
                        </div>
                    </div>
                </div>
                <!--fifth row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/orders.png" alt="user_icon">
                            </div>
                            <a href="orders.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Pending Orders</h3>
                        </div>
                    </div>
                </div>
                <!--sixth row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/message.png" alt="user_icon">
                            </div>
                            <a href="notice.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Admin Notice</h3>
                        </div>
                    </div>
                </div>
                <!--seventh row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendor.png" alt="user_icon">
                            </div>
                            <a href="vendors.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted"> Vendors</h3>
                        </div>
                    </div>
                </div>
                                <!--eighth row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendor.png" alt="user_icon">
                            </div>
                            <a href="date_page.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted"> Order History</h3>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
      
    </body>
</html>
