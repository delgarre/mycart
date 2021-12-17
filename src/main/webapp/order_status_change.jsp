<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%
String name=request.getParameter("id");


try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("UPDATE Orders SET status = 'approved', active = 0 WHERE locations = '"+name+"'");

//response.sendRedirect("send_user_approval_email.jsp?id="+name);
response.sendRedirect("orders.jsp");
//response.sendRedirect("history_null_check.jsp");




}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
