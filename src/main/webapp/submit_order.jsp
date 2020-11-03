<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>
<%
String aPName=request.getParameter("aPName");
//String aPPrice=request.getParameter("aPPrice");
//String quantity=request.getParameter("quantity");
double intaPPrice = Double.parseDouble(request.getParameter("aPPrice"));
int intquantity = Integer.parseInt(request.getParameter("quantity"));
String name = request.getParameter("name");

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into OrderHistory(aName,aPrice,quantity, cName)values('"+aPName+"','"+intaPPrice+"','"+intquantity+"','"+name+"')");
response.sendRedirect("admin_pending_orders.jsp");
session.setAttribute("message", "Order submitted successfully!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
