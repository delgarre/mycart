<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String type = request.getParameter("type");




try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Types(locationType)values(upper('"+type+"'))");
session.setAttribute("message", "Location Type added successfully!");
response.sendRedirect("type.jsp");
}
catch(Exception e)
{
session.setAttribute("message", "error adding location type");
response.sendRedirect("type.jsp");
System.out.print(e);
e.printStackTrace();
}
%>



