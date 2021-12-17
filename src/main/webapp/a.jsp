<%@page import="com.learn.mycart.dao.OrdersDao"%>
<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%
String id = request.getParameter("locations");
LocalDateTime ldt = LocalDateTime.now();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
String date = dtf.format(ldt);
String code = request.getParameter("code");
double o = Math.random()*200;

double orderId = Math.random() + (o * 500);
int x = (int) orderId;
String oid = code+x;
Date now = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss.SSS");
    String loginTime = sdf.format(now);

String query = "insert into OrderHistory(itemNumber, aPrice, date, locations, cName, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, log, orderId, alternateItem, department, address1, address2, city, state, postalcode, fax, phone, order_table_id) select itemNumber, aPPrice, '"+date+"', locations, name, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, '"+loginTime+"', '"+oid+"', alternateItem, department, address1, address2, city, state, postalcode, fax, phone, id from Orders where locations = '"+id+"'"
        + " and status = 'Not Approved'";

try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
String strQuery = "SELECT COUNT(*) FROM OrderHistory WHERE date='"+date+"' and locations = '"+id+"'";
ResultSet rs = st.executeQuery(strQuery);

rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);
if(Countrow.equals("0")){
    String count = Countrow;
int i=st.executeUpdate(query);

session.setAttribute("message", "Order approved successfully!");
OrdersDao.updateStatus(id);
response.sendRedirect("order_status_change.jsp?id="+id);
//query.replace('\'', ' ');
System.out.println(query);
}
else{
    //String count = Countrow;
response.sendRedirect("a_orders.jsp?id="+id);
session.setAttribute("message", "order already exist for this month!");
//out.println(count);
//out.println(ddMMyyyyToday);
//out.println(date);
//out.println(user_id);
System.out.println(query);
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
System.out.println(query);
}
%>
