<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%
String id = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);



try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into OrderHistory(itemNumber, aPrice, date, locations, cName, quantity) select itemNumber, aPPrice, date, locations, name, quantity from Orders where locations = '"+id+"'");
session.setAttribute("message", "Order updated successfully!");
JavaMailUtil.sendMail("antoine.garrett@dseincorporated.com");
response.sendRedirect("admin.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
