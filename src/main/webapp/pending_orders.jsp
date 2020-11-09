
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.ApproveOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ApproveOrderDao"%>
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
        <title>Pending Orders</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/user_navbar.jsp" %>
        <div class="col-md-8">
            <div class="table-responsive-sm mt-3">
               
                    <table class="table table-bordered ">
                        <tr>
                            <th>Item Name</th>
                            <th>Item Price</th>
                            <th>Quantity Requested</th>
                            <th>Order date</th>
                            <th>User</th>
                            <th>Actions</th>
                        </tr>
                        
                        <%
                        ApproveOrderDao aDao = new ApproveOrderDao(FactoryProvider.getFactory());
                        List<ApproveOrder> aList = aDao.getOrders();
                        %>
                        
                        <%
                        for(ApproveOrder a: aList){
                        %>
                        <tr>
                            <td><%=a.getaPName()%></td>
                            <td><%=a.getaPPrice()%></td>
                            <td><%=a.getQuantity()%></td>
                            <td><%=a.getDate()%></td>
                            <td><%=a.getName()%></td>
                            <td>
                                <a href="update_order_page.jsp?id=<%= a.getId()%>">
                                    <button type="button">Update</button>
                                </a>
                                <a href="delete_order.jsp?id=<%= a.getId()%>">
                                    <button type="button">Delete</button>
                                </a>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </table>
              
            </div>
            
        </div>
    </body>
    
</html>
