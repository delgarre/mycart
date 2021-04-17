<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String codes = request.getParameter("codes");




try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into CPT(codes)values(upper('"+codes+"'))");
session.setAttribute("message", "CPT code added successfully!");
response.sendRedirect("cpt.jsp");
}
catch(Exception e)
{
session.setAttribute("message", "error adding CPT");
response.sendRedirect("cpt.jsp");
System.out.print(e);
e.printStackTrace();
}
%>







