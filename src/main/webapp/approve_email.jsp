<%@page import="com.learn.mycart.mail.Dummy"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="java.sql.*,java.util.*" %>
<%
  
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://172.20.29.70:3306/";
String database = "mycart";
String userid = "admin";
String password = "ordering";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql = "select User.user_email, OrderHistory.cName, User.user_name from OrderHistory inner join User on OrderHistory.cName=User.user_name where date= '04/12/2021'";

while(resultSet.next()){
 String email = resultSet.getString("user_email");
 
 
 Dummy.sendMail(email);
}

session.setAttribute("message", "Order approved successfully!");

response.sendRedirect("orders.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

    
%>
