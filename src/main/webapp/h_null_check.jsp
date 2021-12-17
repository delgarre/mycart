<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.time.LocalDateTime"%>
<%@page import= "java.time.format.DateTimeFormatter"%>
<%@include file="components/message.jsp" %>
<%

String locations = request.getParameter("locations");

try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("UPDATE mycart.OrderHistory INNER JOIN  mycart.Item ON mycart.OrderHistory.itemNumber = mycart.Item.itemNumber SET mycart.OrderHistory.unitOfMeasure = mycart.Item.unitOfMeasure, mycart.OrderHistory.alternateItem   = mycart.Item.alternateItem, mycart.OrderHistory.manufacturer  = mycart.Item.manufacturer, mycart.OrderHistory.manufacturerNum  = mycart.Item.manufacturerNum where (mycart.OrderHistory.unitOfMeasure = 'null' or mycart.OrderHistory.alternateItem = 'null' or mycart.OrderHistory.manufacturer = 'null' or mycart.OrderHistory.manufacturerNum  = 'null' )");
        
        
response.sendRedirect("past_orders_page.jsp?id="+locations);
session.setAttribute("message", "Item added!");



}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
