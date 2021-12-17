<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String codes = request.getParameter("codes");

String query = "insert into CPT(codes)values(upper('"+codes+"'))";


try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate(query);
session.setAttribute("message", "CPT code added successfully!");
response.sendRedirect("cpt.jsp");
System.out.println(query);
}
catch(Exception e)
{
session.setAttribute("message", "error adding CPT");
response.sendRedirect("cpt.jsp");
System.out.print(e);
System.out.println(query);
e.printStackTrace();
}
%>



