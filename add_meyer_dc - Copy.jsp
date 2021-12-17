<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
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
        <title>Add Info</title>
        <%@include file="components/common_css_js.jsp" %>
        
<script>
function goBack(){
        window.history.back();
    } 
    
</script>
    </head>
    <body>
      <%@include file="components/navbar.jsp" %>
      <div class="container">  
          <div class="row">
              <div class="col-md-6 offset-md-3">
                  <br>
                  <button class="btn btn-warning" onclick="goBack()">GO BACK</button>
                      <br>
                  <div class="card">
                      
                      <div class="card-header custom-bg text-white">
      <h1>ADD INFO</h1>
                      </div>
      <div class="card-body">
      <form method="POST" action="new_meyer_dc.jsp">
          <div class="form-group">
                       <label for="report_id">REPORT ID:</label>

<input name="report_id" id="report_id" class="input">
                </div>
                
                <div class="form-group">
                       <label for="account_id">ACCOUNT ID:</label>

<input name="account_id" id="account_id" class="input">
                </div>
                
                <div class="form-group">
                       <label for="shipping_method">SHIPPING METHOD:</label>

<input name="shipping_method" id="shipping_method" class="input">
                </div>
                
                <div class="form-group">
                       <label for="operations_email_confirmation">OPERATIONS EMAIL CONFIRMATION:</label>

<input name="operations_email_confirmation" id="shipping_method" class="input">
                </div>
          <div class="form-group">
                       <label for="operations_confirm_order">OPERATIONS CONFIRM ORDER</label>

<input name="operations_confirm_order" id="shipping_method" class="input">
                </div>
                <div class="form-group">
                       <label for="first_name">FIRST NAME:</label>

<input name="first_name" id="first_name" class="input">
                </div>
          
                                <div class="form-group">
                       <label for="last_name">LAST NAME:</label>

<input name="last_name" id="last_name" class="input">
                </div>
                
                   <div class="form-group">
                       <label for="order_line_id">ORDER LINE ID:</label>

<input name="order_line_id" id="order_line_id" class="input">
                </div>
                
                <div class="form-group">
                       <label for="quantity">QUANTITY:</label>

<input name="quantity" id="quantity" class="input">
                </div>
          
         <div class="form-group">
                    <label for="address1">ADDRESS 1:</label>

                    <input type="text" name="address1"  class="input" id="address1">
                </div>
                    <div class="form-group">
                       <label for="address2">ADDRESS 2:</label>

<input type="text" name="address2" id="address2" class="input" >
                    </div>

                <div class="form-group">
                       <label for="city">CITY:</label>

<input type="text" name="city"  id="city" required>
            </div>
                <div class="form-group">
                       <label for="postalcode">POSTAL CODE:</label>

<input name="postalcode" id="postalcode" class="input" >
                </div>

<div class="form-group">
                       <label for="province_code">PROVINCE CODE</label>

<input name="province_code" id="province_code" class="input">
                </div>
          
          <div class="form-group">
                       <label for="country_code">COUNTRY CODE</label>

<input name="country_code" id="country_code" class="input">
                </div>
<div class="form-group">
                       <label for="phone">PHONE:</label>

<input name="phone" id="phone" class="input">
                </div>
<div class="form-group">
                       <label for="sku">SKU:</label>

<input name="sku" id="sku" class="input">
                </div>
                
               
                
 <div class="container text-center">
     
     
<input type="submit" class="btn btn-primary" value="SAVE ITEM">
<button class="btn btn-warning" onclick="goBack()">GO BACK</button>
 </div>
      </form>
      </div>
                  </div>
              </div>
          </div>
    </div>
      
<%

%>      
    </body>
</html>
