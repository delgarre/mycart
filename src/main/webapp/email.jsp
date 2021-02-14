<%-- 
    Document   : email
    Created on : Feb 14, 2021, 1:58:38 PM
    Author     : garre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Provide Email</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/login_navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h3>Enter Email Address:</h3>
                        </div>
                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            
                            
                            <form method="POST" action="forgot_serv.jsp">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                
                                </div>
                                <div class="container text-center">
                                 <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      
    </body>
</html>
