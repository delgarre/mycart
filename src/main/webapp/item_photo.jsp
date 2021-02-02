
<%@ page import="java.sql.*" %>

<%@page import="com.learn.mycart.entities.User"%>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>


<%
String id = request.getParameter("ids");
String photo= request.getParameter("fileName");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Item set photo=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,photo);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Photo added successfully!");
response.sendRedirect("item_list.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the user.");
response.sendRedirect("list.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
