

<%@page import="com.learn.mycart.mail.AlternateItemsList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>

<%
String id = request.getParameter("id");
String alt = request.getParameter("alt");
String itemNumber = request.getParameter("itemNumber");
String stat="2";
AlternateItemsList list = new AlternateItemsList();

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Item set id=?,stat=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, stat);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Item number deactivated successfully!");
response.sendRedirect("item_list.jsp");
list.sendMail("diane.madonna@dseincorporated.com", itemNumber, alt);
}
else
{
session.setAttribute("message", "There was a problem deactivating the item.");
response.sendRedirect("item_list.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>

