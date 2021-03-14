<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String company = request.getParameter("company");




try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into L_Company(company)values('"+company+"')");
session.setAttribute("message", "Company added successfully!");
response.sendRedirect("l_company.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



