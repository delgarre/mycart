<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String val = request.getParameter("measurement");


String query = "insert into UOM(val)values(upper('"+val+"'))";

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate(query);
session.setAttribute("message", "Measurement added successfully!");
response.sendRedirect("uom.jsp");
System.out.println(query);
}
catch(Exception e)
{
session.setAttribute("message", "error adding measurement");
response.sendRedirect("uom.jsp");
System.out.print(e);
System.out.println(query);
e.printStackTrace();
}
%>



