<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String user_name = request.getParameter("user_name");
int comId = Integer.parseInt(request.getParameter("comId"));
String user_password = request.getParameter("user_password");
String user_type = request.getParameter("user_type");
String user_email = request.getParameter("user_email");
int locations = Integer.parseInt(request.getParameter("locations"));

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into User(user_name,user_password,user_type, user_email, companies_companyId, locations)values('"+user_name+"','"+user_password+"','"+user_type+"','"+user_email+"','"+comId+"','"+locations+"')");
session.setAttribute("message", "User added successfully!");
response.sendRedirect("admin.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



