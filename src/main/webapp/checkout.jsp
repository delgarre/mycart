
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
        <title>Checkout Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--card details-->
                    <div class="card">
                        <div class="card-body">
                            
                            <h3 class="text-center">Your Selected Items:</h3>
                            <div class="cart-body">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                        <div class="card-body">
                            
                            <h3 class="text-center">Order Details:</h3>
                            <form method="post">
                              <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                              </div>
                              <div class="form-group">
                                <label for="name">Name</label>
                                <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Florida" id="defaultCheck1" name="company">
                                <label class="form-check-label" for="defaultCheck1">
                                  Florida
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Georgia" name="company" id="defaultCheck2">
                                <label class="form-check-label" for="defaultCheck2">
                                  Georgia
                                </label>
                              </div>
                                <div class="container mt-3 text-center">
                                    <input type="submit" value="Submit" id="save_data">
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="components/common_modals.jsp" %> 
    </body>
   
</html>
