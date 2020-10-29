
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>

<%
String id = request.getParameter("pId");
String pName=request.getParameter("pName");
int intpPrice = Integer.parseInt(request.getParameter("pPrice"));
int intpQuantity = Integer.parseInt(request.getParameter("pQuantity"));
String unitOfMeasure=request.getParameter("unitOfMeasure");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Product set pId=?,pName=?,pPrice=?,pQuanity=?,unitOfMeasure=? where pId="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, pName);
ps.setInt(3, intpPrice);
ps.setInt(4, intpQuantity);
ps.setString(5, unitOfMeasure);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Product updated successfully!");
response.sendRedirect("products.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the product.");
response.sendRedirect("products.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
