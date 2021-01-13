
<%@page import="com.learn.mycart.entities.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.NoticeDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
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
        <title>Message Board</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h3>Enter Message:</h3>
        <form method="post" action="NoticeServlet">
            
        <textarea style="height: 100px" name="notice" class="form-control" placeholder="Enter message"></textarea>
        <select name="status" id="status">
            <option value="active">active</option>
            <option value="not active"> not active</option>
        </select>
        <input type="submit"   value="Post Message">
        </form>
        <div class="col-md-8">
            <table class="table table-bordered">
                <tr>
                    <th>Messages:</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                <%
                NoticeDao nDao = new NoticeDao(FactoryProvider.getFactory());
                List<Notice> nList = nDao.getMessage();
                %>
                
                <%
                for(Notice n: nList){
                %>
                
                <tr>
                    <td><%=n.getMessage()%></td>
                    <td><%=n.getStatus()%></td>
                    <td>
                        <a href="delete_notice.jsp?id=<%= n.getId() %>">
                        <button type="button" class="delete">Delete</button>
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
