<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.learn.mycart.entities.User"%>

<%

    User users = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Location</title>
<%@include file="components/common_css_js.jsp" %>


</head>
<body>
    <%@include file="components/user_navbar.jsp" %>
    
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>
<div class="container">
    <div class="row">
<div class="col-md-6 offset-md-3">
    <div class="card">
         <div class="card-header custom-bg text-white">
      <h1>SELECT LOCATION:</h1>
                      </div>
        <div class="card-body">
<form method="post" action="IDropDownServlet">
<%
String id = request.getParameter("id");
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql = "SELECT * FROM UserLocation where user_id = " +id;
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>

<div class="form-group">
<p>LOCATIONS:
<select name="comId" id="comId">
<%
while(rs.next())
{
String cname = rs.getString("comp_name"); 
%>
<option value="<%=cname %>"><%=cname %></option>
<%
}
%>
</select>
<input type="hidden" name="department" value="<%=users.getDepartment()%>">
</p>
</div>
<div class="container text-center">
<input class="btn btn-outline-success" type="submit" value="SELECT LOCATION">
</div>

<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
</form>
        </div>
</div>
</div>
</div>
</div>
</body>
</html>