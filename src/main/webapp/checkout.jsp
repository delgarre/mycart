
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
                            <div class="cart-body" id="cart-body">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                        <div class="card-body">
                            
                            <h3 class="text-center">Order Details:</h3>
                            
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
                                <input class="form-check-input" type="checkbox" value="Florida" id="location" name="location">
                                <label class="form-check-label" for="location">
                                  Florida
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Georgia" name="location" id="location">
                                <label class="form-check-label" for="location">
                                  Georgia
                                </label>
                              </div>
                                <div class="container mt-3 text-center">
                                    <input type="submit" value="Submit" id="save_data" onclick="orderSubmit()">
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="components/common_modals.jsp" %> 
    </body>
    <script>
        function orderSubmit(UserName, UserEmail){
    
    let cart = localStorage.getItem("cart");
    let user = {name:UserName, email:UserEmail};
    
    
    console.log(cart);
    if(cart===null){
     
     let carts = [];
     carts.push(cart, user);
     localStorage.setItem("cart", JSON.stringify(carts));
     console.log(carts);
    }else
    {
        let pcarts = JSON.parse(carts);
        localStorage.setItem("cart", JSON.stringify(pcarts));
    }
    
    updateOrder();
}

    </script>
</html>
