<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.entities.Company"%>

<%
Company company = (Company)session.getAttribute("location");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        
        <div class="col-md-8">
            <div class="table-responsive-sm mt-3">
                <table class="table table-bordered " >
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    
                </tr>
                
                  <%
                      String name = company.getCompanyName();
                
                ItemDao iDao = new ItemDao(FactoryProvider.getFactory());
                List<Item> ilist = iDao.getAllItemsByName(name);
                
               
                
                
            %>
            
            <%
            for(Item i: ilist){
                
            
            %>
            
            
            <tr>
                <td><%= i.getId()%></td>
                <td><%= i.getName()%></td>
                
                
                <td><%=i.getPrice()%></td>
                
                <td><%= i.getQuantity()%></td>
                
            </tr>
            <%
            }
            %>
                </table>
            </div>
        </div>
        
    </body>
</html>
