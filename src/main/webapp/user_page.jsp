
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
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <%@include file="components/common_css_js.jsp" %>
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
  
  h1 {text-align: center;}
}
</style>
    </head>
    <body>
        
         <%@include file="components/navbar.jsp" %>
        <div class="container admin">
           
            <h1 class="center">Hello <%=user.getUserName()%></h1>
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="panel-heading col-md-8">
                    <table>
                        
                        
                        <tr>
                            <th>Message:</th>
                        </tr>
                        
                        
                        <tr>
                            <td><p>Please make sure you selection a location before
                                Clicking Items, Pending Orders, Cart, or Order History!!!</p></td>
                        </tr>

                    </table>
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
                            
                            <a href="profile.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Your Info</h3>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/location.png" alt="user_icon">
                            </div>
                            <a href="dropdown.jsp?id=<%= user.getUserId()%>" class="card-link">Click me!</a>
                            <h3 class="text-muted">Locations</h3>
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
                            <a href="items.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Items</h3>
                        </div>
                    </div>
                </div>
                <!--fourth box-->
                 <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                            </div>
                            <a href="pending_orders.jsp?id=<%=user.getUserId()%>" class="card-link">Click me!</a>
                            <h3 class="text-muted">Cart</h3>
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
                            <a href="n_a_orders.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Pending Orders</h3>
                        </div>
                    </div>
                </div>
                
                
                                <!--sixth row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendor.png" alt="user_icon">
                            </div>
                            <a href="user_orders.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted"> Order History</h3>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
    </body>
</html>
