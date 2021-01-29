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

int i=st.executeUpdate("insert into OrderHistory(itemNumber, aPrice, date, locations, cName, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle) select itemNumber, aPPrice, curdate(), locations, name, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle from Orders where locations = '"+id+"'");

session.setAttribute("message", "Order approved successfully!");
JavaMailUtil.sendMail("antoine.garrett@dseincorporated.com");
response.sendRedirect("l.jsp?id="+id);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
