<%@page import="java.sql.*,java.util.*" %>

<%
String aPName=request.getParameter("aPName");
//String aPPrice=request.getParameter("aPPrice");
//String quantity=request.getParameter("quantity");
int intaPPrice = Integer.parseInt(request.getParameter("aPPrice"));
int intquantity = Integer.parseInt(request.getParameter("quantity"));

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycart", "root", "antoine567");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into approveorder(aPName,aPPrice,quantity)values('"+aPName+"','"+intaPPrice+"','"+intquantity+"')");
session.setAttribute("message", "User updated successfully!");
response.sendRedirect("test_page.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
