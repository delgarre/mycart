<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@include file="components/message.jsp" %>
<%
String aPName=request.getParameter("aPName");
//String aPPrice=request.getParameter("aPPrice");
//String quantity=request.getParameter("quantity");
String intaPPrice = request.getParameter("aPPrice");
String intquantity = request.getParameter("quantity");
String name = request.getParameter("name");
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into OrderHistory(aName,aPrice,quantity, cName, date, locations)values('"+aPName+"','"+intaPPrice+"','"+intquantity+"','"+name+"','"+ddMMyyyyToday+"','"+locations+"')");
response.sendRedirect("admin_pending_orders.jsp");
session.setAttribute("message", "Order submitted successfully!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
