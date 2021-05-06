
<%@page import="com.learn.mycart.entities.SubmitDate"%>
<%@page import="com.learn.mycart.dao.SubmitDateDao"%>
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
        <div class="container"> 
            <div class="row">
                            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
                <div class="col-md-6 offset-md-3">
        <form method="post" action="NoticeServlet">
            <div class="form-group">  
        <textarea style="height: 100px" name="notice" class="form-control" placeholder="Enter message" spellcheck="true"></textarea>
                </div>
            <div class="form-group">
                SET STATUS:
        <select name="status" id="status">
            <option value="active">ACTIVE</option>
            <option value="not active"> NOT ACTIVE</option>
        </select>
            </div>
        <input type="submit" class="btn btn-outline-primary"  value="POST MESSAGE">
        </form>
        
            <form method="post" action="order_date_deadline.jsp">
                  <%
        SubmitDateDao sDao = new SubmitDateDao(FactoryProvider.getFactory());
        List<SubmitDate> sList = sDao.getDate();
        for(SubmitDate s: sList){
            s.getSubmitDate();
        
        %>
        <div class="form-group">
        Current Deadline
        <input type="text" value="<%=s.getSubmitDate()%>" readonly/><br>
       <input type="hidden" name="id" value="<%=s.getId()%>"/>
        <%
            }
        %>
        
                <input name="date" type="text" placeholder="Example: 01/01/2021">
            <input type="submit" class="btn btn-outline-warning" value="SET ORDER DEADLINE"/>
        </div>
            </form>
      
            <table class="table table-bordered">
                <tr>
                    <th>Messages:</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                <%
                NoticeDao nDao = new NoticeDao(FactoryProvider.getFactory());
                List<Notice> nList = nDao.getMessage();
                String active = "active";
                String inactive = "inactive";
                %>
                
                <%
                for(Notice n: nList){
                %>
                
                <tr>
                    <td><%=n.getMessage()%></td>
                    <td><%=n.getStatus()%></td>
                    <td>
                        <a href="delete_notice.jsp?id=<%= n.getId() %>" onclick="return confirm('Are you sure?');">
                        <button type="button" class="btn btn-outline-danger">DELETE</button>
                    </a>
                        
                        <a href="update_notice.jsp?id=<%= n.getId() %>&status=<%=inactive%>">
                        <button type="button" class="btn btn-outline-warning">INACTIVE</button>
                    </a>
                        <a href="update_notice.jsp?id=<%= n.getId() %>&status=<%=active%>">
                        <button type="button" class="btn btn-outline-primary">ACTIVE</button>
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
    </body>
</html>
