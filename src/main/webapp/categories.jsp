<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>

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
        <title>Categories</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="col-md-8">
            <div div class="table-responsive-sm mt-3">
                <table class="table table-bordered ">
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                    <%
                    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list = cDao.getCategories();
                    %>
                    
                    <%
                    for(Category c: list){
                    %>
                    
                    <tr>
                        <td><%= c.getCategoryTitle()%></td>
                        <td><%= c.getCategoryDesc()%></td>
                        <td>
                            <a href="update_category_page.jsp?id=<%=c.getCategoryId()%>">
                                <button type="button" class="update">Update</button>
                            </a>
                                <a href="delete_category.jsp?id=<%=c.getCategoryId()%>">
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
