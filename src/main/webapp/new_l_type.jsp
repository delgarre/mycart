<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String type = request.getParameter("type");


String query = "insert into Types(locationType)values(upper('"+type+"'))";

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate(query);
session.setAttribute("message", "Location Type added successfully!");
response.sendRedirect("type.jsp");
System.out.println(query);
}
catch(Exception e)
{
session.setAttribute("message", "error adding location type");
response.sendRedirect("type.jsp");
System.out.print(e);
e.printStackTrace();
System.out.println(query);
}
%>



