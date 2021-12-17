<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%
Integer id= Integer.parseInt(request.getParameter("id"));
String alt = request.getParameter("alt");
String item= request.getParameter("itemNumber");
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("UPDATE Orders SET status = 'approved' WHERE id = '"+id+"'");

response.sendRedirect("change_status_a.jsp?id="+id+"&itemNumber="+item+"&alt="+alt);





}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
