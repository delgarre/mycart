<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String vendorName = request.getParameter("vendorName");




try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Vendor(vendorName)values('"+vendorName+"')");
session.setAttribute("message", "Vendor added successfully!");
response.sendRedirect("vendors.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



