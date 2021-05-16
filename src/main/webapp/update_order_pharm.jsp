
<%@page import="com.learn.mycart.mail.CartUpdate"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>

<%
 User user1 = (User)session.getAttribute("current-user");
 String email = user1.getUserEmail();
Integer Id = user1.getUserId();
String id = request.getParameter("id");
String itemNumber=request.getParameter("itemNumber");
String price = request.getParameter("price");
String name=request.getParameter("name");
String quantity = request.getParameter("quantity");
String locations = request.getParameter("locations");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Approve set id=?,itemNumber=?,price=?,name=?,quantity=?, locations=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, itemNumber);
ps.setString(3, price);
ps.setString(4, name);
ps.setString(5, quantity);
ps.setString(6, locations);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Order updated successfully!");

response.sendRedirect("l_pending_orders_pharm.jsp?id="+Id);
}
else
{
session.setAttribute("message", "There was a problem updating the order.");
response.sendRedirect("items_pharm.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
