


<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.time.LocalDateTime"%>
<%@page import= "java.time.format.DateTimeFormatter"%>
<%@include file="components/message.jsp" %>
<%

String itemNumber = request.getParameter("itemNumber");
String locations = request.getParameter("locations");
String stat = "Not Approved";
String id = request.getParameter("id");



try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM Approve where itemNumber='"+itemNumber+"' and stat ='"+stat+"' and locations='"+locations+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("0")){
    

response.sendRedirect("o_pharm.jsp?id="+id);
session.setAttribute("message", "Item number: "+itemNumber);

}

else{
response.sendRedirect("update_order_pharm_page.jsp?id="+id);
session.setAttribute("message", "Cart Item already exist! Please update quantity");
}


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

%>
