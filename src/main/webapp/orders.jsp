<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.OrdersDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Orders"%>
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
        <title>Pending Orders</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
        <div class="col-md-8">
            <div class="row mt-3 mx-2">
                    <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <h3>Locations</h3>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="#">Fort Myers-Phys</a>
                      <a class="dropdown-item" href="#">ST Pete</a>
                      <a class="dropdown-item" href="#">Beach</a>
                      <a class="dropdown-item" href="#">Billing</a>
                      <a class="dropdown-item" href="#">Bosque</a>
                      <a class="dropdown-item" href="#">Bradenton South</a>
                      <a class="dropdown-item" href="#">Brandon</a>
                      <a class="dropdown-item" href="#">Brooklyn Park</a>
                      <a class="dropdown-item" href="#">Captiva Beach Resort</a>
                      <a class="dropdown-item" href="#">Dunn</a>
                      <a class="dropdown-item" href="#">Ellenton</a>
                      <a class="dropdown-item" href="#">Emerson</a>
                      <a class="dropdown-item" href="#">Hibiscus Inn & Suites</a>
                      <a class="dropdown-item" href="#">Himes</a>
                      <a class="dropdown-item" href="#">Kasota</a>
                      <a class="dropdown-item" href="#">Lakeland</a>
                      <a class="dropdown-item" href="#">Largo</a>
                      <a class="dropdown-item" href="#">New Port Richey</a>
                      <a class="dropdown-item" href="#">Normandy</a>
                      <a class="dropdown-item" href="#">Orange Park</a>
                      <a class="dropdown-item" href="#">Palm Insure</a>
                      <a class="dropdown-item" href="#">Pharmacy</a>
                      <a class="dropdown-item" href="#">Physicians Group Inc</a>
                      <a class="dropdown-item" href="#">Port Charlotte</a>
                      <a class="dropdown-item" href="#">Ramada</a>
                      <a class="dropdown-item" href="#">Robbinsdale</a>
                      <a class="dropdown-item" href="#">San Mateo</a>
                      <a class="dropdown-item" href="#">Sarasota Group</a>
                      <a class="dropdown-item" href="#">Sawyer</a>
                      <a class="dropdown-item" href="#">SCOC</a>
                      <a class="dropdown-item" href="#">SCOD</a>
                      <a class="dropdown-item" href="#">SCOJ</a>
                      <a class="dropdown-item" href="#">SCOP</a>
                      <a class="dropdown-item" href="#">SCOS</a>
                      <a class="dropdown-item" href="#">SCOT</a>
                      <a class="dropdown-item" href="#">Sebring</a>
                      <a class="dropdown-item" href="#">Spring Hill</a>
                      <a class="dropdown-item" href="#">Spruce Tree</a>
                      <a class="dropdown-item" href="#">Tampa North</a>
                      <a class="dropdown-item" href="#">Temple Terrace</a>
                      <a class="dropdown-item" href="#">West Coast Law</a>
                      <a class="dropdown-item" href="#">Winter Haven</a>
                    </div>
            </div>
            <div class="table-responsive-sm mt-3">
                <table class="table table-bordered " >
                    <tr>
                        <th>Order Number</th>
                        <th>Item</th>
                        <th>Price</th>
                        <th>User</th>
                        <th>Amount Ordered</th>
                        <th>Order Date</th>
                        <th>Location</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    <%
                    OrdersDao oDao = new OrdersDao(FactoryProvider.getFactory());
                    List<Orders> olist = oDao.getOrders();
                    %>
                    
                    <%
                    for(Orders o: olist){
                    %>
                    
                    <tr>
                        <td><%= o.getId()%></td>
                        <td><%= o.getaPName()%></td>
                        <td><%= o.getaPPrice()%></td>
                        <td><%= o.getName()%></td>
                        <td><%= o.getQuantity()%></td>
                        <td><%= o.getDate()%></td>
                        <td><%= o.getLocations()%></td>
                        <td><%= o.getStatus()%></td>
                        <td></td>
                        
                    </tr>
                    <%
                    }
                    %>
                </table>
            </div>
        </div>
        </div>
    </body>
</html>
