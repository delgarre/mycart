<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>
<%
String aPName=request.getParameter("aPName");
//String aPPrice=request.getParameter("aPPrice");
//String quantity=request.getParameter("quantity");
int intaPPrice = Integer.parseInt(request.getParameter("aPPrice"));
int intquantity = Integer.parseInt(request.getParameter("quantity"));

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into ApproveOrder(aPName,aPPrice,quantity)values('"+aPName+"','"+intaPPrice+"','"+intquantity+"')");
session.setAttribute("message", "Order updated successfully!");
response.sendRedirect("test_page.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
