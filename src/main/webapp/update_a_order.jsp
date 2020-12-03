<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>

<%
String aName = request.getParameter("aPName");
double intaPPrice = Double.parseDouble(request.getParameter("aPPrice"));
String name=request.getParameter("name");
int intquantity = Integer.parseInt(request.getParameter("quantity"));
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into OrderHistory(aName,aPrice,cName, quantity, locations, date)values('"+aName+"','"+intaPPrice+"','"+name+"','"+intquantity+"','"+locations+"','"+ddMMyyyyToday+"')");
session.setAttribute("message", "Order approved successfully!");
response.sendRedirect("admin.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



