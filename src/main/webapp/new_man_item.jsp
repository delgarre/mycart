<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String name = request.getParameter("name");




try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Manufacturers(name)values(upper('"+name+"'))");
session.setAttribute("message", "Manufacturer added successfully!");
response.sendRedirect("add_item_page.jsp");
}
catch(Exception e)
{
session.setAttribute("message", "error adding manufacturer");
response.sendRedirect("add_item_page.jsp");
System.out.print(e);
e.printStackTrace();
}
%>



