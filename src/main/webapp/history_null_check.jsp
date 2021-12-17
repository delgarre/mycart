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


try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("UPDATE mycart.OrderHistory INNER JOIN  mycart.Item ON mycart.OrderHistory.itemNumber = mycart.Item.itemNumber SET mycart.OrderHistory.unitOfMeasure = mycart.Item.unitOfMeasure, mycart.OrderHistory.alternateItem   = mycart.Item.alternateItem, mycart.OrderHistory.manufacturer = mycart.Item.manufacturer, mycart.OrderHistory.manufacturerNum  = mycart.Item.manufacturerNum, mycart.OrderHistory.cTitle = mycart.Item.cTitle, mycart.OrderHistory.vTitle = mycart.Item.vTitle, mycart.OrderHistory.photo = mycart.Item.photo where (mycart.OrderHistory.unitOfMeasure is null or mycart.OrderHistory.alternateItem is null or mycart.OrderHistory.manufacturer is null or mycart.OrderHistory.manufacturerNum  is null or mycart.OrderHistory.cTitle is null or mycart.OrderHistory.vTitle is null or mycart.OrderHistory.photo is null )");
        
        
response.sendRedirect("o_orders.jsp?id="+session.getAttribute("single"));
session.setAttribute("message", "Order approved successfully!");



}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
