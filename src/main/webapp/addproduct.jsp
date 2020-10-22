<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mycart";%>
<%!String user = "root";%>
<%!String psw = "antoine567";%>

<%
String pName=request.getParameter("pName");
String pDesc=request.getParameter("pDesc");
int pPrice = Integer.parseInt(request.getParameter("pPrice"));
int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
int catId = Integer.parseInt(request.getParameter("catId"));
Part part = request.getPart("pPhoto");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "antoine567");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into product(pName,pDesc,pPrice,pQuantity, pPhoto, category_category_Id)values('"+pName+"','"+pDesc+"','"+pPrice+"','"+pQuantity+"', '"+catId+"', '"+part+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
