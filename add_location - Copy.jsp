<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%
String location = request.getParameter("location");
String user = request.getParameter("user");
String type = request.getParameter("type");
String name = request.getParameter("name");

            

try
{

Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");

Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM UserLocation where comp_name='"+location+"' and user_id='"+user+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1); 
Class.forName("com.mysql.jdbc.Driver");
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into UserLocation(comp_name,user_id, type)values('"+location+"','"+user+"', '"+type+"')");
session.setAttribute("message", "Location added!");
response.sendRedirect("company_user.jsp?id="+user+"&name="+name);
}
else{
session.setAttribute("message", "Location already exists!");
response.sendRedirect("company_user.jsp?id="+user+"&name="+name);
}
}
catch (Exception e){
e.printStackTrace();
}
%>