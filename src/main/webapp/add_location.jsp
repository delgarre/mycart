<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%
String location = request.getParameter("location");
String user = request.getParameter("user");



try
{

Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");

Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM Test where comp_name='"+location+"' and user_id='"+user+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1); 
Class.forName("com.mysql.jdbc.Driver");
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into Test(comp_name,user_id)values('"+location+"','"+user+"')");
response.sendRedirect("company_user.jsp?id="+user);
}
else{
out.println("Location already exists !");
}
}
catch (Exception e){
e.printStackTrace();
}
%>