<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%
String aPName=request.getParameter("aPName");
//String aPPrice=request.getParameter("aPPrice");
//String quantity=request.getParameter("quantity");
double intaPPrice = Double.parseDouble(request.getParameter("aPPrice"));
int intquantity = Integer.parseInt(request.getParameter("quantity"));
String name = request.getParameter("name");
String comId = request.getParameter("comId");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);



try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into ApproveOrder(aPName,aPPrice,quantity, name, companies_companyId, date)values('"+aPName+"','"+intaPPrice+"','"+intquantity+"','"+name+"','"+comId+"','"+ddMMyyyyToday+"')");
session.setAttribute("message", "Order updated successfully!");
response.sendRedirect("home.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
