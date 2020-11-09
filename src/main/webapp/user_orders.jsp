<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.OrderHistoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.OrderHistory"%>
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
        <title>Order History</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/user_navbar.jsp" %>
        <div class="col-md-8">
            <div class="table-responsive-sm mt-3">
                <table class="table table-bordered " >
                    <tr>
                        <th>Order Number</th>
                        <th>Item</th>
                        <th>Price</th>
                        <th>User</th>
                        <th>Amount Ordered</th>
                        <th>Order Date</th>
                    </tr>
                    <%
                    OrderHistoryDao oDao = new OrderHistoryDao(FactoryProvider.getFactory());
                    List<OrderHistory> olist = oDao.getOrders();
                    %>
                    
                    <%
                    for(OrderHistory o: olist){
                    %>
                    
                    <tr>
                        <td><%= o.getId()%></td>
                        <td><%= o.getaName()%></td>
                        <td><%= o.getaPrice()%></td>
                        <td><%= o.getcName()%></td>
                        <td><%= o.getQuantity()%></td>
                        <td><%= o.getDate()%></td>
                        
                    </tr>
                    <%
                    }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
