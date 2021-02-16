
<%@page import="com.learn.mycart.entities.Notice"%>
<%@page import="com.learn.mycart.dao.NoticeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>

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
        <title>User Page</title>
        <%@include file="components/common_css_js.jsp" %>
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
  
  h1 {text-align: center;}
}
</style>
    </head>
    <body>
        
         <%@include file="components/user_navbar.jsp" %>
        <div class="container admin">
           
            <h1 class="center">Hello <%=user.getUserName()%></h1>
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="panel-heading col-md-8">
                <table style="width:100%">
                        <%
                        NoticeDao ldao = new NoticeDao(FactoryProvider.getFactory());
                        List<Notice> notice = ldao.getStatus();
                        %>
                        
                        <tr>
                            <th>MESSAGE:</th>
                        </tr>
                        <%
                        for(Notice n: notice){
                        %>
                        
                        <tr>
                            
                            <td><%=n.getMessage()%></td>
                            
                        </tr>
                        <%
                            }
                        %>
                    </table>
            </div>
            
            <div class="row mt-3">
                
                <!--first column-->
                <div class="col-md-3">
                   <a href="profile.jsp" class="card-link">
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                                
                            </div>
                            
                    
                            <h3 class="text-muted">YOUR INFO</h3>
                        </div>
                    </div>
                   </a>
                </div>
                <!--second column-->
                <div class="col-md-3">
                    <a href="locations.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/location.png" alt="user_icon">
                            </div>
                           
                            <h3 class="text-muted">LOCATIONS</h3>
                        </div>
                    </div>
                    </a>
                </div>
               
                <!--third column-->
                <div class="col-md-3">
                     <a href="items_dropdown.jsp?id=<%= user.getUserId()%>" class="card-link">

                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                                
                            </div>
                            
                            <h3 class="text-muted">ITEMS</h3>
                        </div>
                    </div>
                        </a>
                </div>
                <!--fourth box-->
                 <div class="col-md-3">
                     <a href="cart_dropdown.jsp?id=<%= user.getUserId()%>" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/orders.png" alt="user_icon">
                            </div>
                            
                            <h3 class="text-muted">CART</h3>
                        </div>
                    </div>
                     </a>
                </div>
                <!--fifth row -->
                <div class="col-md-3">
                <a href="pending_dropdown.jsp?id=<%= user.getUserId()%>" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                            </div>
                       
                            <h3 class="text-muted">PENDING ORDERS</h3>
                        </div>
                    </div>
                </a>
                </div>
                
                
                                <!--sixth row -->
                <div class="col-md-3">
                  <a href="approved_pending.jsp?id=<%= user.getUserId()%>" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendor.png" alt="user_icon">
                            </div>
                      
                            <h3 class="text-muted"> ORDER HISTORY</h3>
                        </div>
                    </div>
                  </a>
                </div>
                
            </div>
            
        </div>
    </body>
</html>
