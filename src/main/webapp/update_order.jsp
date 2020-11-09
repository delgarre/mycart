
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>

<%
String id = request.getParameter("id");
String aPName=request.getParameter("aPName");
double intaPPrice = Double.parseDouble(request.getParameter("aPPrice"));
String name=request.getParameter("name");
int intquantity = Integer.parseInt(request.getParameter("quantity"));
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update ApproveOrder set id=?,aPName=?,aPPrice=?,name=?,quantity=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, aPName);
ps.setDouble(3, intaPPrice);
ps.setString(4, name);
ps.setInt(5, intquantity);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Order updated successfully!");
response.sendRedirect("home.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the order.");
response.sendRedirect("home.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
