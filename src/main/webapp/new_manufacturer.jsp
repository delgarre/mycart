<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String val = request.getParameter("measurement");




try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into UOM(val)values(upper('"+val+"'))");
session.setAttribute("message", "Measurement added successfully!");
response.sendRedirect("uom.jsp");
}
catch(Exception e)
{
session.setAttribute("message", "error adding measurement");
response.sendRedirect("uom.jsp");
System.out.print(e);
e.printStackTrace();
}
%>



