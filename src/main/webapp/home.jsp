
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
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
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
       
        <%@include file="components/user_navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
            
            String cat=request.getParameter("category");
            //out.println(cat);
            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = null;
            
            if(cat==null || cat.trim().equals("all"))
            {
                 list = dao.getAllProducts();
            }else{
                int cid =Integer.parseInt(cat.trim());
                list = dao.getAllProductsById(cid);
            }
            
            
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist= cdao.getCategories();
           
            %>
            
            <!--show categories-->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    
                     <a href="home.jsp?category=all" class="list-group-item list-group-item-action active">
                     All products
                     </a>
                
                
                <%
                for(Category c: clist){
                %>   
                    <a href="home.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                    
                <%  }
                
                %>
                
                </div>
            </div>
            
            
            
            
        <div class="col-md-8">
            <div class="table-responsive-sm">
                <table class="table table-bordered " id="myTable">
                    <tr>
                <th>Pic</th>
                <th>Id</th>
                <th>Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            
            <%
                            
            for(Product p: list){
                            
            %>
            
            <tr>
                <td>
                    <a href="view.jsp?id=<%= p.getpId()%>">
                        <button class="btn btn-outline-success">View</button>
                    </a>
                </td>
                <td><%= p.getpId()%></td>
                <td><%= p.getpName()%></td>
                <td><%= p.getpPrice()%></td>
                <td>
                    <a href="approve_order.jsp?id=<%= p.getpId()%>">
                    <button class="btn btn-outline-success">Add Quantity</button>
                    </a>
                </td>
            </tr>
            <%
            }
            %>
                </table>
            </div>
        </div>
        </div>
        </div>
         <%@include file="components/common_modals.jsp" %>
    </body>
</html>
