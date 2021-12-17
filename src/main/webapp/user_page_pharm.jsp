
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


table.table-fit {
    width: auto !important;
    table-layout: auto !important;
}
table.table-fit thead th, table.table-fit tfoot th {
    width: auto !important;
}
table.table-fit tbody td, table.table-fit tfoot td {
    width: auto !important;
}
</style>

        <script>
  function downloadURI(uri, name) {
  var link = document.createElement("a");
  link.download = name;
  link.href = uri;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  delete link;
}

//this will hide message after 3 seconds
            setTimeout(function(){
            $("#error").hide();
            },3000)
        </script>
    </head>
    <body>
        
         <%@include file="components/user_navbar.jsp" %>
        <div class="container admin">
           
            <h1 class="center">Hello <%=user.getUserName()%></h1>
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="panel-heading col-md-8">
                <table class="table table-striped table-dark" table-bordered table-fit">
                        <%
                        NoticeDao ldao = new NoticeDao(FactoryProvider.getFactory());
                        List<Notice> notice = ldao.getStatus();
                        %>
                        
                        <tr>
                            <th>MESSAGE BOARD:</th>
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
                            
                    
                            <h3 class="text-muted">PROFILE</h3>
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
                     <a href="items_dropdown_pharm.jsp?id=<%= user.getUserId()%>" class="card-link">

                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                                
                            </div>
                            
                            <h3 class="text-muted">START ORDER</h3>
                        </div>
                    </div>
                        </a>
                </div>
                <!--fourth box-->
                 <div class="col-md-3">
                     <a href="u_cart_location.jsp?id=<%= user.getUserId()%>" class="card-link">
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
                <a href="n_location_pharm.jsp" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                            </div>
                       
                            <h3 class="text-muted">ORDERS PENDING APPROVAL</h3>
                        </div>
                    </div>
                </a>
                </div>
                
                
                                <!--sixth row -->
                <div class="col-md-3">
                  <a href="user_date_page.jsp" class="card-link">
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
                                
                          <!--seventh row -->
               <!--
                <div class="col-md-3">
                  <a href="#" onclick="downloadURI('http://172.20.29.68:8080/mycart/manuals/User Training Manual.docx','Order Portal Manual')" class="card-link">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendor.png" alt="user_icon">
                            </div>
                      
                            <h3 class="text-muted">USER MANUAL</h3>
                        </div>
                    </div>
                  </a>
                </div>
                -->
            </div>
            
        </div>
    </body>
</html>
