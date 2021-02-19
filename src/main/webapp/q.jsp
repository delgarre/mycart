<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%
String id=request.getParameter("id");


try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("UPDATE Approve SET stat = 'submitted' WHERE locations = '"+id+"'");

response.sendRedirect("open.jsp");





}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
