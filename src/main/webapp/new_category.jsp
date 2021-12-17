<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String title = request.getParameter("title");
String query = "insert into Category(categoryTitle)values(upper('"+title+"'))";
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM Category where categoryTitle='"+title+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("0")){

int i=st.executeUpdate(query);
session.setAttribute("message", "Catgeory added successfully!");
response.sendRedirect("replace_cat.jsp?cat"+title);
System.out.println(query);
}
else{
session.setAttribute("message", "Catgeory already exists!");
response.sendRedirect("categories.jsp");
}

}
catch(Exception e)
{
session.setAttribute("message", "error adding category");
response.sendRedirect("categories.jsp");
System.out.print(e);
e.printStackTrace();
}
%>



