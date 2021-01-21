<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%
Integer id= Integer.parseInt(request.getParameter("id"));




try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into OrderHistory(itemNumber, aPrice, date, locations, cName, quantity, photo) select itemNumber, aPPrice, date, locations, name, quantity, photo from Orders where id = '"+id+"'");

JavaMailUtil.sendMail("antoine.garrett@dseincorporated.com");
response.sendRedirect("n.jsp?id="+id);
session.setAttribute("message", "Cart Item added!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
