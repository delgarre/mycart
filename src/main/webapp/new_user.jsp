<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String user_name = request.getParameter("user_name");

String user_password = request.getParameter("user_password");
String user_type = request.getParameter("user_type");
String user_email = request.getParameter("user_email");


try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into User(user_name,user_password,user_type, user_email)values('"+user_name+"','"+user_password+"','"+user_type+"','"+user_email+"')");
session.setAttribute("message", "User added successfully!");
response.sendRedirect("new_password.jsp?id="+user_email+"&name="+user_name+"&password="+user_password);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



