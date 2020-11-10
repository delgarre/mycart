<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>

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
        <title>Items</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="col-md-8">
            <div div class="table-responsive-sm mt-3">
                <table class="table table-bordered ">
                    <tr>
                        <th>Photo</th>
                        <th>Item Number</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Unit of Measure</th>
                        <th>Actions</th>
                        
                    </tr>
                    <%
                    ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = pDao.getAllProducts();
                    %>
                    
                    <%
                    for(Product p: list){
                    %>
                    
                    <tr>
                        <td><%=p.getpPhoto() %></td>
                        <td><%= p.getItemNumber()%></td>
                        <td><%=p.getpName() %></td>
                        <td><%=p.getpPrice() %></td>
                        <td><%=p.getpQuanity()%></td>
                        <td><%=p.getUnitOfMeasure() %></td>
                        <td>
                            <a href="update_product_page.jsp?id=<%= p.getpId()%>">
                                <button type="button" class="update">Update</button>
                            </a>
                            <a href="delete_prod.jsp?id=<%=p.getpId() %>">
                                <button type="button" class="delete">Delete</button>
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
