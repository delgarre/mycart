<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String title = request.getParameter("title");




try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Category(categoryTitle)values('"+title+"')");
session.setAttribute("message", "Catgeory added successfully!");
response.sendRedirect("categories.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



