
<%@ page import="java.sql.*" %>

<%@page import="com.learn.mycart.entities.User"%>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>


<%
String id = request.getParameter("id");
String password=request.getParameter("password");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update User set user_id=?,user_password=? where user_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, password);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Password chnaged successfully!");
response.sendRedirect("index.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the user.");
response.sendRedirect("index.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
