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
Calendar cal = new GregorianCalendar();
		//cal.setTime(today);
		cal.add(Calendar.DAY_OF_MONTH, -30);
		Date today30 = cal.getTime();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy");
String ddMMyyyyToday = DATE_FORMAT.format(today30);
String name = request.getParameter("name");
String user_id = request.getParameter("user_id");

String locations = request.getParameter("loc");
int active = 1;



String query = "insert into Orders(itemNumber, aPPrice, date, locations, name, quantity, user_id, photo, status, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, department, address1, address2, city, state, postalcode, fax, phone, active) select itemNumber, price, date, locations, name, quantity, user_id, photo, stat, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, department, address1, address2, city, state, postalcode, fax, phone, "+active+" from Approve where locations = '"+locations+"' and stat='Not Approved'";
try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM Orders WHERE status ='Not Approved' and locations = '"+locations+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("0")){
    String count = Countrow;
int i = st.executeUpdate(query);
response.sendRedirect("m.jsp?id="+user_id);
session.setAttribute("message", "Order submitted successfully!");
//out.println(count);
//out.println("yay");
System.out.println(query);
}

else{
    //String count = Countrow;
response.sendRedirect("l_pending_orders.jsp?id="+user_id);
session.setAttribute("message", "order already exist for this month!");
System.out.println(query);
}


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
