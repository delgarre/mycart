<%@page import="com.learn.mycart.mail.SingleSubmit"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%
String id= request.getParameter("id");
String item= request.getParameter("itemNumber");
String alt = request.getParameter("alt");
LocalDateTime ldt = LocalDateTime.now();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
String date = dtf.format(ldt);
String code = request.getParameter("code");
double o = Math.random()*200;

double orderId = Math.random() + (o * 500);
int x = (int) orderId;
String oid = code+x;

try
{
   
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into OrderHistory(itemNumber, aPrice, date, locations, cName, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, orderId, order_table_id) select itemNumber, price, '"+date+"', locations, name, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, '"+oid+"', id from Approve where id = '"+id+"'");

//SingleSubmit.sendMail("diane.madonna@dseincorporated.com", itemNumber, pDesc, vTitle, price, name, locations, alt, quantity);


response.sendRedirect("change_status.jsp?id="+id+"&itemNumber="+item+"&alt="+alt);
session.setAttribute("message", "Item approved!");
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%>

