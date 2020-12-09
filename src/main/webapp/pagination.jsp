<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>

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
        
         <%
                      String name = company.getCompanyName();
                      String cat=request.getParameter("category");
                
                ItemDao iDao = new ItemDao(FactoryProvider.getFactory());
                //List<Item> ilist = iDao.getAllItemsByName(name);
                List<Item> ilist = null;
                
                if(cat==null || cat.trim().equals("all"))
            {
                 ilist = iDao.getItems();
            }else{
                int cid =Integer.parseInt(cat.trim());
                ilist = iDao.getAllItemsById(cid);
            }
               
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist= cdao.getAllItemsByName(name);
            %>
        
        <!--show categories-->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                  
                    <div class="list-group mt-4">
                  
                     <a href="pagination.jsp?category=all" class="list-group-item list-group-item-action active">
                     All products
                     </a>

                
                
                <%
                for(Category c: clist){
                %>   
                
                        
                
                
                    <a href="pagination.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                   
                <%  }
                
                %>
                
                </div>
            </div>
        
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
