<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.dao.UserDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String email = request.getParameter("email");
            String password1= request.getParameter("password");
            
            UserDao userDao = new UserDao(FactoryProvider.getFactory()); 
            User user= userDao.getUserByEmailAndPassword(email, password1);
            session.setAttribute("current-user", user);
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
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select user_name from User where user_email = '"+email+"'";
resultSet = statement.executeQuery(sql);
 while(resultSet.next()){
 String name = resultSet.getString("user_name");
 
 response.sendRedirect("logLogin.jsp?name="+name+"&email="+email+"&password="+password1);
 }

connection.close();
} catch (Exception e) {
e.printStackTrace();

}

%>

