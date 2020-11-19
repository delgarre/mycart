<%@page import="java.util.ArrayList"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-bordered ">
                    <tr>
         
                        <th>Item Number</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>QTY Per UOM</th>
                        <th>Unit of Measure</th>
                        <th>Description</th>
                        
                        <th>CPT</th>
                        <th>NDC</th>
                       
                        
                    </tr>
                    <%
             response.setContentType("application/vnd.ms-excel");
             response.setHeader("Content-Disposition", "inline; filename=items.xls");
                     ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
                    %>
                    
                    <%
                    for(Product p: products){
                    %>
                    
                    <tr>
                        
                        <td><%= p.getItemNumber()%></td>
                        <td><%=p.getpName() %></td>
                        <td><%=p.getpPrice() %></td>
                        <td><%=p.getpQuanity()%></td>
                        <td><%=p.getUnitOfMeasure() %></td>
                        <td><%=p.getpDesc()%></td>
                        <td><%=p.getCpt()%></td>
                        <td><%=p.getNdc()%></td>
                        
                    </tr>
                    <%
                    }
                    
                    %>
                </table>
    </body>
</html>
