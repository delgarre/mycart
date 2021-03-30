<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>
<%
String id = request.getParameter("id");
String itemNumber = request.getParameter("itemNumber");
String price = request.getParameter("aPPrice");
String name=request.getParameter("name");
String quantity = request.getParameter("quantity");
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Orders set id=?,itemNumber=?,aPPrice=?,name=?,quantity=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, itemNumber);
ps.setString(3, price);
ps.setString(4, name);
ps.setString(5, quantity);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Order updated successfully!");
response.sendRedirect("a_orders.jsp?id="+locations);
}
else
{
session.setAttribute("message", "There was a problem updating the order.");
response.sendRedirect("a_orders.jsp?id="+locations);
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
