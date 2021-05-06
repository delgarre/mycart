
<%@page import="com.learn.mycart.mail.CartUpdate"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String name=request.getParameter("name");
String locations = request.getParameter("locations");
String itemNumber = request.getParameter("itemNumber");
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
String sql ="select user_email from User where user_name='"+name+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
String email = resultSet.getString("user_email");

session.setAttribute("message", "Order updated successfully!");
CartUpdate.sendMail(email, itemNumber, locations);
response.sendRedirect("a_orders.jsp?id="+locations);
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
