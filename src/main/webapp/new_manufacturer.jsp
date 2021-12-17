<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String name = request.getParameter("name");


String query = "insert into Manufacturers(name)values(upper('"+name+"'))";

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM Manufacturers where name = '"+name+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("0")){

int i=st.executeUpdate(query);
session.setAttribute("message", "Manufacturer added successfully!");
response.sendRedirect("manufacturers.jsp");
System.out.println(query);
}
else{
session.setAttribute("message", "Manufacturer already exists!");
response.sendRedirect("manufacturers.jsp");
System.out.println(query);
}

}
catch(Exception e)
{
session.setAttribute("message", "error adding manufacturer");
response.sendRedirect("manufacturers.jsp");
System.out.print(e);
e.printStackTrace();
System.out.println(query);
}
%>



