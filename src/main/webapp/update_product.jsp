
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>

<%
String id = request.getParameter("id");
String itemNumber=request.getParameter("itemNumber");
String price = request.getParameter("price");
String quantity = request.getParameter("quantity");
String unitOfMeasure=request.getParameter("unitOfMeasure");
String stat=request.getParameter("stat");
String discontinued = request.getParameter("discontinued");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Item set id=?,itemNumber=?,price=?,quantity=?,unitOfMeasure=?, stat=?, discontinued=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, itemNumber);
ps.setString(3, price);
ps.setString(4, quantity);
ps.setString(5, unitOfMeasure);
ps.setString(6, stat);
ps.setString(7, discontinued);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Item edited successfully!");
response.sendRedirect("item_list.jsp");
}
else
{
session.setAttribute("message", "There was a problem editing the item.");
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
