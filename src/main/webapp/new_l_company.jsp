<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String company = request.getParameter("company");


String query = "insert into L_Company(company)values(upper('"+company+"'))";

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate(query);
session.setAttribute("message", "Company added successfully!");
response.sendRedirect("l_company.jsp");
System.out.println(query);
}
catch(Exception e)
{
System.out.println(query);
session.setAttribute("message", "error adding company");
response.sendRedirect("l_company.jsp");
System.out.print(e);
e.printStackTrace();
}
%>



