<%@page import="com.learn.mycart.entities.UserLocation"%>
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
String location=request.getParameter("location");
String password=request.getParameter("password");
String email=request.getParameter("email");
String name = request.getParameter("name");
String user_id = request.getParameter("user_id");


try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM UserLocation where comp_name = 'PHARMACY' and user_id='"+user_id+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("1")){
    

response.sendRedirect("logLogin.jsp?email="+email+"&password="+password+"&location=PHARMACY");


}

else{
response.sendRedirect("logLogin.jsp?email="+email+"&password="+password+"&location=NA");
session.setAttribute("message", "Welcome!");
}


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
