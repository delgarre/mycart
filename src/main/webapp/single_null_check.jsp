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


String locations = request.getParameter("id");

try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("UPDATE mycart.Orders INNER JOIN  mycart.Item ON mycart.Orders.itemNumber = mycart.Item.itemNumber SET mycart.Orders.unitOfMeasure = mycart.Item.unitOfMeasure, mycart.Orders.alternateItem   = mycart.Item.alternateItem, mycart.Orders.manufacturer  = mycart.Item.manufacturer, mycart.Orders.manufacturerNum  = mycart.Item.manufacturerNum where (mycart.Orders.unitOfMeasure = 'null' or mycart.Orders.alternateItem = 'null' or mycart.Orders.manufacturer = 'null' or mycart.Orders.manufacturerNum  = 'null' )");
        
        
response.sendRedirect("a_orders.jsp?id="+locations);
session.setAttribute("message", "Cart Item added!");



}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
