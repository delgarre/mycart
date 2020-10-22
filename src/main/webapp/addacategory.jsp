<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>

<%
String category_title=request.getParameter("catTitle");
String categoryDesc=request.getParameter("catDescription");
String city_name=request.getParameter("city_name");
String email=request.getParameter("email");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "antoine567");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into category(catTitle,catDescription)values('"+category_title+"','"+categoryDesc+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>