<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String vendorName = request.getParameter("vendorName");


String query = "insert into Vendor(vendorName)values(upper('"+vendorName+"'))";

try
{


Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM Vendor where vendorName='"+vendorName+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);
if(Countrow.equals("0")){
int i=st.executeUpdate(query);
session.setAttribute("message", "Vendor added successfully!");
response.sendRedirect("replace_ven.jsp?ven"+vendorName);
System.out.println(query);
}

else{
session.setAttribute("message", "Vendor already exists!");
response.sendRedirect("vendors.jsp");
System.out.println(query);
}
}
catch(Exception e)
{
session.setAttribute("message", "error adding vendor");
response.sendRedirect("vendors.jsp");
System.out.println(query);
System.out.print(e);
e.printStackTrace();
}
%>



