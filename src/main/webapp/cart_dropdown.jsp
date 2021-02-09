<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Location</title>
<%@include file="components/common_css_js.jsp" %>
<style>

p {text-align: center;}
div {text-align: center;}
</style>

</head>
<body>
    <%@include file="components/user_navbar.jsp" %>
    
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>
<div class="container">
    <div class="row mt-5">
<div class="col-md-8">
    <div class="card">
        <div class="card-body">
<form method="post" action="CDropDownServlet">
<%
String id = request.getParameter("id");
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql = "SELECT * FROM Test where user_id = " +id;
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>


<p>Select Location :
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
</p>
<input type="submit" value="submit">

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