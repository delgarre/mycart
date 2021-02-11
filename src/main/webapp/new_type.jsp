<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String comId = request.getParameter("comId");

String locationType = request.getParameter("locationType");



try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into LocationType(location,locationType)values('"+comId+"','"+locationType+"')");
session.setAttribute("message", "Location Type added successfully!");
response.sendRedirect("types.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



