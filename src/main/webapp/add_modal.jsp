<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String name = request.getParameter("name");

String age = request.getParameter("quantity");
String user_type = request.getParameter("user_type");
String user_email = request.getParameter("user_email");


try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Modal(name, age)values('"+name+"','"+age+"')");
session.setAttribute("message", "User added successfully!");
response.sendRedirect("modal.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



