<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%
String itemName=request.getParameter("itemName");
String price=request.getParameter("price");
String quantity=request.getParameter("quantity");

int user_id = Integer.parseInt(request.getParameter("user_id"));
String name = request.getParameter("name");
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);
String stat = "Not Approved";



try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Approve(date,locations, name,price, quantity, itemName, user_id, stat)values('"+ddMMyyyyToday+"','"+locations+"','"+name+"','"+price+"','"+quantity+"','"+itemName+"','"+user_id+"', '"+stat+"')");

JavaMailUtil.sendMail("antoine.garrett@dseincorporated.com");
response.sendRedirect("items.jsp");
session.setAttribute("message", "Cart Item added!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
