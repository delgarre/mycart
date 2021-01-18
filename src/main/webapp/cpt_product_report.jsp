<%@page import="java.util.ArrayList"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>

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
                   
                        <th>CPT Code</th>
                       
                        
                    </tr>
                    <%
             response.setContentType("application/vnd.ms-excel");
             response.setHeader("Content-Disposition", "inline; filename=cpt.xls");
                     ArrayList<Item> items = (ArrayList<Item>) session.getAttribute("items");
                    %>
                    
                    <%
                    for(Item i: items){
                    %>
                    
                    <tr>
                        
                        <td><%= i.getItemNumber()%></td>
                       
                        <td><%=i.getCpt()%></td>
                        
                    </tr>
                    <%
                    }
                    
                    %>
                </table>
    </body>
</html>
