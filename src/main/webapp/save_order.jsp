<%@page import="java.sql.*,java.util.*" %>

<%
String productName=request.getParameter("productName");
String productPrice=request.getParameter("productPrice");
String productQuantity=request.getParameter("productQuantity");
String totalPrice=request.getParameter("totalPrice");
int intPrice = Integer.parseInt(request.getParameter("productPrice"));
int intQuantity = Integer.parseInt(request.getParameter("productQuantity"));
int intTotalPrice = Integer.parseInt(request.getParameter("totalPrice"));
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycart", "root", "antoine567");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into orders(productName,productPrice,productQuantity,totalPrice)values('"+productName+"','"+intPrice+"','"+intQuantity+"','"+intTotalPrice+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
