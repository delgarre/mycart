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
String itemName=request.getParameter("itemName");
String price=request.getParameter("price");
String quantity=request.getParameter("quantity");
String name = "Delenis Garrett";
String scrub = request.getParameter("itemNumber");

String date = request.getParameter("date");

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
//String dates = dtf.format();

Date today = new Date();
		Calendar cal = new GregorianCalendar();
		cal.setTime(today);
		cal.add(Calendar.DAY_OF_MONTH, 1);
		Date today30 = cal.getTime();




try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM mytable where name='"+name+"' and create_date BETWEEN '"+today30+"' and '"+date+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("0")){
    
int i=st.executeUpdate("insert into mytable(name)values('"+scrub+"')");
response.sendRedirect("search.jsp");
session.setAttribute("message", "Cart Item added!");

}

else{
response.sendRedirect("search.jsp");
out.println("Order already placed for the month");
}


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
