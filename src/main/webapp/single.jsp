<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%

String price=request.getParameter("price");
String quantity=request.getParameter("quantity");
String name = request.getParameter("name");
int user_id = Integer.parseInt(request.getParameter("user_id"));
String itemNumber = request.getParameter("itemNumber");
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy");
String ddMMyyyyToday = DATE_FORMAT.format(today);
String stat = "Not Approved";
String photo = request.getParameter("photo");
String uom = request.getParameter("unitOfMeasure");
String man = request.getParameter("manufacturer");
String manNum = request.getParameter("manufacturerNum");
String cTitle = request.getParameter("cTitle");
String vTitle = request.getParameter("vTitle");
String pDesc = request.getParameter("pDesc");
String alternateItem = request.getParameter("alternateItem");
String department = request.getParameter("department");
String oid = request.getParameter("oid");
String query = "insert into Orders(date,locations, itemNumber,aPPrice, quantity, user_id, status, name, photo, unitOfMeasure, manufacturer, manufacturerNum, pDesc, cTitle, vTitle, alternateItem, department, orderId)values('"+ddMMyyyyToday+"','"+locations+"','"+itemNumber+"','"+price+"','"+quantity+"','"+user_id+"', '"+stat+"', '"+name+"', '"+photo+"','"+uom+"', '"+man+"', '"+manNum+"', '"+pDesc+"','"+cTitle+"','"+vTitle+"','"+alternateItem+"','"+department+"', '"+oid+"')";
try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate(query);


response.sendRedirect("a_null_check.jsp?id="+locations);
session.setAttribute("message", "Item approved!");
System.out.println(query);
}
catch(Exception e)
{
System.out.println(query);
System.out.print(e);
e.printStackTrace();
}
%>
