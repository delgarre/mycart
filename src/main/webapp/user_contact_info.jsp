<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>


<%
Company company1 = (Company)session.getAttribute("location");
    
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
        <title>Contact Info</title>
        <%@include file="components/common_css_js.jsp" %>
        <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    </head>
        <body>
           <%@include file="components/user_items_navbar.jsp" %>
           <div class="container">
               <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
        </div>
                        
               <div class="row">
           <div class="col-md-6 offset-md-3">
    
    <div class="card">
        <div class="card-header custom-bg text-white">
                            <h1>ENTER QUANTITY:</h1>
                                    
                    </div>
                <div class="card-body">
                    Date: <%=today%><br>
                    <br>
<form method="post" action="user_save_contact.jsp">
<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
<input type="hidden" name="date">
<input type="hidden" name="user_id" value="<%=user.getUserId()%>">

<input type="hidden" name="man" value="<%=request.getParameter("manufacturer")%>">

<input type="hidden" name="itemNumber" value="<%=request.getParameter("itemNumber")%>">
<input type="hidden" name="locations" value="<%=request.getParameter("locations")%>">
<input type="hidden" name="quantity" value="<%=request.getParameter("quantity")%>">

<input type="hidden" name="mannum" value="<%=request.getParameter("manufacturerNum")%>">
<input type="hidden" name="pDesc" value="<%=request.getParameter("pDesc")%>">

<input type="hidden" name="department" value="<%=user.getDepartment()%>">

                <div class="form-group">
                    <label for="address1">ADDRESS 1:</label>

                    <input type="text" name="address1"  class="input" id="address1">
                </div>
                    <div class="form-group">
                       <label for="address2">ADDRESS 2:</label>

<input type="text" name="address2"  id="address2" class="input" >
                    </div>

<input value="<%= user.getUserName()%>" type="hidden" name="name">

                <div class="form-group">
                       <label for="city">CITY:</label>

<input type="text" name="city"  id="city" required>
            </div>
                <div class="form-group">
                       <label for="postalcode">POSTAL CODE:</label>

<input name="postalcode" id="postalcode" class="input" >
                </div>

<div class="form-group">
                       <label for="state">STATE:</label>

<input name="state" id="state" class="input">
                </div>
<div class="form-group">
                       <label for="phone">PHONE:</label>

<input name="phone" id="phone" class="input">
                </div>
<div class="form-group">
                       <label for="fax">FAX :</label>

<input name="fax" id="fax" class="input">
                </div>
 <div class="container text-center">
     
     
<input type="submit" class="btn btn-primary" value="ADD ITEM">
<button class="btn btn-warning" onclick="goBack()">GO BACK</button>
 </div>
</form>
</html>
