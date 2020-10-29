

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>

<%
String id = request.getParameter("companyId");
String companyName=request.getParameter("companyName");
String type=request.getParameter("type");
String typeLocation=request.getParameter("typeLocation");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Company set companyId=?,companyName=?,type=?,typeLocation=? where companyId="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, companyName);
ps.setString(3, type);
ps.setString(4, typeLocation);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Company updated successfully!");
response.sendRedirect("companies.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the location.");
response.sendRedirect("companies.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>

