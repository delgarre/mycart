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
String oid = request.getParameter("oid");
String iid = request.getParameter("id");
String department = request.getParameter("department");
String quantity=request.getParameter("quantity");
String name = request.getParameter("name");
int user_id = Integer.parseInt(request.getParameter("user_id"));
String itemNumber = request.getParameter("itemNumber");
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);
LocalDateTime ldt = LocalDateTime.now();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
String date = dtf.format(ldt);
String stat = "Not Approved";




try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();






    
int i=st.executeUpdate("insert into OrderHistory(itemNumber, aPrice, date, locations, cName, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, department, orderId) select '"+itemNumber+"', price, '"+date+"', '"+locations+"', '"+name+"', "+quantity+", photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, '"+department+"', '"+oid+"' from Item where id ="+iid);
response.sendRedirect("h_null_check.jsp?locations="+locations);
session.setAttribute("message", "Cart Item added!");




response.sendRedirect("date_page.jsp");
session.setAttribute("message", "Cart Item already exist!");


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
