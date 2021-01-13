
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>

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
        <title>Items List</title>
        <%@include file="components/common_css_js.jsp" %>
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}
</style>
    </head>
    <body>
        <%@include file="components/user_navbar.jsp" %>

    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search Item Number" onkeyup="searchFunction()" aria-label="Search" id="myInput">
    </form>

        <h1>List of Items</h1>
        <div class="center">
        <table class="table table-bordered" id="myTable">
            <tr>
                        
                        
                        <th>Price</th>
                        <th>Item Number</th>
                        <th>QTY Per UOM</th>
                        <th>Unit of Measure</th>
                        <th>Description</th>
                        <th>Vendor</th>
                        <th>CPT</th>
                        <th>NDC</th>
                        <th>Actions</th>
            </tr>
            <%
            ItemDao idao = new ItemDao(FactoryProvider.getFactory());
            List<Item> ilist = idao.getItems();
            %>
            <%
            for(Item i:ilist) {
            %>
            <tr>


                <td><%=i.getPrice()%></td>
                <td><%=i.getItemNumber()%></td>
                <td><%=i.getQuantity()%></td>
                <td><%=i.getUnitOfMeasure()%></td>
                <td><%=i.getpDesc()%></td>
                <td><%=i.getVendors()%></td>
                <td><%=i.getCpt()%></td>
                <td><%=i.getNdc()%></td>
                <td>
                    <a href="">
                        <button></button>
                    </a>
                    <a href="">
                        <button></button>
                    </a>
                </td>
                
            </tr>
            <%
                }
            %>
        </table>
        </div>
    </body>
</html>
